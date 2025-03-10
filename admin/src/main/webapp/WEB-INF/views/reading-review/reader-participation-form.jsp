<%@ page import="java.util.ResourceBundle" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    ResourceBundle resourceBundle = ResourceBundle.getBundle("application");
    String froalaKey = resourceBundle.getString("froala.key");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="/WEB-INF/views/common/inc/PageHeaderINC.jsp" %>
</head>
<body id="kt_body" class="header-fixed header-tablet-and-mobile-fixed toolbar-enabled toolbar-fixed toolbar-tablet-and-mobile-fixed aside-enabled aside-fixed" style="--kt-toolbar-height:55px;--kt-toolbar-height-tablet-and-mobile:55px">
<div class="d-flex flex-column flex-root">
    <div class="page d-flex flex-row flex-column-fluid">
        <%@ include file="/WEB-INF/views/common/inc/BodyAsideINC.jsp" %>
        <div class="wrapper d-flex flex-column flex-row-fluid">
            <%@ include file="/WEB-INF/views/common/inc/BodyHeaderINC.jsp" %>
            <div class="content d-flex flex-column flex-column-fluid">
                <c:set value="샘플 등록/수정" var="menuTitle"/>
                <%@ include file="/WEB-INF/views/common/inc/ToolbarINC.jsp" %>
                <div class="post d-flex flex-column-fluid">
                    <div class="container-fluid">
                        <!-- 본문 내용 START -->
                        <form  id="readerParticipationForm">
                            <input type="hidden" id="uid" value="<c:out value="${uid}"/>">
                            <input type="hidden" id="readerParticipationBoardIndex" value="<c:out value="${readerParticipationBoard != null ? readerParticipationBoard.readerParticipationBoardIndex : null}"/>">
                            <input type="hidden" id="isBoard" value="<c:out value="${readerParticipationBoard eq null? '':readerParticipationBoard.isBoard}"/>">
                            <input type="hidden" id="isReply" value="<c:out value="${readerParticipationBoard eq null? '':readerParticipationBoard.isReply}"/>">
                            <input type="hidden" id="isHiddenReply" value="<c:out value="${readerParticipationBoard eq null? '':readerParticipationBoard.isHiddenReply}"/>">
                            <input type="hidden" id="isVoting" value="<c:out value="${readerParticipationBoard eq null? '':readerParticipationBoard.isVoting}"/>">
                            <input type="hidden" id="isPeriod" value="<c:out value="${readerParticipationBoard eq null? '':readerParticipationBoard.isPeriod}"/>">
                            <div class="card mb-5 mb-xl-10">
                                <div class="card-header border-0 pt-5">
                                    <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                        <c:if test="${school eq 'first-step'}">첫걸음</c:if>
                                        <c:if test="${school eq 'elementary'}">초등</c:if>
                                        <c:if test="${school eq 'middle'}">중학</c:if>
                                        <c:if test="${school eq 'high'}">고교</c:if>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <input type="hidden" id="school" value="<c:out value="${school}"/>">
                                    <div class="row mb-8">
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-12 row">
                                                        <div class="col-lg-1 d-flex justify-content-center align-items-center ">
                                                            <label class="col-lg-12 form-label fw-bolder text-dark pt-3">작성자</label>
                                                        </div>
                                                        <div class="col-lg-8">
                                                            <div class="col-lg-12 form-label text-dark pt-3">
                                                                <c:out value="${readerParticipationBoard eq null? admin.getAdminNameWithDept(): readerParticipationBoard.adminBoard}"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-12 row">
                                                        <div class="col-lg-1 d-flex justify-content-center align-items-center ">
                                                            <label class="col-lg-12 form-label fw-bolder text-dark pt-3 <c:out value="${readerParticipationBoard ne null? '' : 'required'}"/>">구분</label>
                                                        </div>
                                                        <div class="col-lg-8 fv-row fv-plugins-icon-container">
                                                            <c:choose>
                                                                <c:when test="${readerParticipationBoard ne null}">
                                                                    <input type="hidden" id="categoryIndex" value="<c:out value="${readerParticipationBoard.categoryIndex}"/>"/>
                                                                    <div class="col-lg-12 form-label text-dark pt-3">
                                                                        ${readerParticipationBoard.categoryName}
                                                                    </div>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <select
                                                                            class="form-select form-select-transparent"
                                                                            id="categoryIndex"
                                                                            name="categoryIndex"
                                                                            data-control="select2"
                                                                            data-hide-search="true">
                                                                        <option value="">선택</option>
                                                                        <c:forEach var="list" items="${categoryList}">
                                                                            <option data-is-board="${list.isBoard}" data-is-reply="${list.isReply}" data-is-hidden-reply="${list.isHiddenReply}" data-is-voting="${list.isVoting}" data-is-period="${list.isPeriod}" value="${list.categoryIndex}" <c:if test="${(readerParticipationBoard ne null) and (readerParticipationBoard.categoryIndex eq list.categoryIndex)}">selected</c:if>>${list.categoryName}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="titleArea" class="row mb-1" style="display: none">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-12 row">
                                                        <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                            <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">제목</label>
                                                        </div>
                                                        <div class="col-lg-10">
                                                            <div class="col-lg-12 form-label text-dark pt-3 fv-row fv-plugins-icon-container">
                                                                <input class="col-lg-12 form-control" type="text" id="title" name="title" maxlength="50" <c:if test="${readerParticipationBoard ne null}"> value="<c:out value="${readerParticipationBoard.title}"/>"</c:if> />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="noticeOption" <c:if test="${readerParticipationBoard eq null}">style="display: none"</c:if>>
                                                <div class="row mb-8">
                                                    <div class="col-lg-12 row">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">내용</label>
                                                            </div>
                                                            <div class="col-lg-10">
                                                                <div class="col-lg-12 form-label text-dark pt-3 fv-row fv-plugins-icon-container">
                                                                    <textarea class="col-lg-12 form-control form-control-solid contentArea"
                                                                        minlength="1"
                                                                        id="content"
                                                                        name="content"
                                                                        placeholder="Content">
                                                                        <c:if test="${readerParticipationBoard ne null}"><c:out value="${readerParticipationBoard.content}"/></c:if>
                                                                    </textarea>
                                                                    <div class="fv-plugins-message-container invalid-feedback content-empty-msg" style="display: none;"><div data-field="content" data-validator="notEmpty">* 내용을 입력해주세요.</div></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row mb-8">
                                                    <div class="col-lg-12 row">
                                                        <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                            <label class="col-lg-12 form-label fw-bolder text-dark pt-3">첨부파일</label>
                                                        </div>
                                                        <div class="fv-plugins-icon-container col-lg-11">
                                                            <div class="col-lg-12 row">
                                                                <div class="fv-plugins-icon-container col-lg-11" id="dz0Container">
                                                                    <jsp:include page="/FileFormINC" flush="false">
                                                                        <jsp:param name="fileFormType" value="Y" />
                                                                        <jsp:param name="viewType" value="${viewType}" />
                                                                        <jsp:param name="isImage" value="false" />
                                                                        <jsp:param name="hasOrder" value="false" />
                                                                        <jsp:param name="parentTable" value="READER_PARTICIPATION_BOARD"/>
                                                                        <jsp:param name="parentIndex" value="${readerParticipationBoard == null ? '' : readerParticipationBoard.readerParticipationBoardIndex}"/>
                                                                        <jsp:param name="parentUid" value="${readerParticipationBoard == null ? uid : readerParticipationBoard.uid}"/>
                                                                        <jsp:param name="parentType" value="FILE"/>
                                                                        <jsp:param name="maxFileCount" value="2"/>
                                                                        <jsp:param name="isSecure" value="N"/>
                                                                        <jsp:param name="dropzoneIndex" value="0"/>
                                                                        <jsp:param name="DZID" value="dz0"/>
                                                                        <jsp:param name="description" value="파일 크기는 300mb 이하, mp3, mp4, pdf, jpg, jpeg, png, hwp, hwpx, ppt, pptx, dox, doxc, zip 형식의 파일만 가능합니다."/>
                                                                    </jsp:include>
                                                                    <!--end::Dropzone-->
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="articleOption" <c:if test="${readerParticipationBoard eq null}">style="display: none"</c:if>>
                                                <div class="row mb-8">
                                                    <div class="col-lg-12 row">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-1 d-flex justify-content-center align-items-center ">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 <c:out value="${(readerParticipationBoard ne null) and (readerParticipationBoard.isOpen eq 'Y')? '' : 'required'}"/>">발행월호</label>
                                                            </div>
                                                            <div class="col-lg-6 row">
                                                                <div class="col-lg-6">
                                                                    <select
                                                                            class="form-select form-select-transparent"
                                                                            id="year"
                                                                            name="year"
                                                                            data-control="select2"
                                                                            data-hide-search="true"
                                                                            onchange="loadYearAndMonth(this.value)"
                                                                            <c:if test="${(readerParticipationBoard ne null) and (readerParticipationBoard.isOpen eq 'Y')}">disabled</c:if>>
                                                                        <option value="">선택</option>
                                                                    </select>
                                                                    <div id="yearCheck" style="font-size: 0.925rem; color: #F1416C; display: none">* 발행월호를 선택헤주세요.</div>
                                                                </div>
                                                                <div class="col-lg-6 fv-row">
                                                                    <select
                                                                            class="form-select form-select-transparent"
                                                                            id="month"
                                                                            name="month"
                                                                            data-control="select2"
                                                                            data-hide-search="true"
                                                                            <c:if test="${(readerParticipationBoard ne null) and (readerParticipationBoard.isOpen eq 'Y')}">disabled</c:if>>
                                                                        <option value="">선택</option>
                                                                    </select>
                                                                    <div id="monthCheck" style="font-size: 0.925rem; color: #F1416C; display: none">* 발행월호를 선택헤주세요.</div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-1 d-flex justify-content-center align-items-center ">
                                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3 <c:out value="${(readerParticipationBoard ne null) and (readerParticipationBoard.isOpen eq 'Y')? '' : 'required'}"/>">투표 선택 수</label>
                                                            </div>
                                                            <div class="col-lg-3 fv-row fv-plugins-icon-container">
                                                                <select
                                                                        class="form-select form-select-transparent"
                                                                        id="voteCount"
                                                                        name="voteCount"
                                                                        data-control="select2"
                                                                        data-hide-search="true"
                                                                        <c:if test="${(readerParticipationBoard ne null) and (readerParticipationBoard.isOpen eq 'Y')}">disabled</c:if>>
                                                                    <option value="">선택</option>
                                                                    <option value="1" <c:if test="${(readerParticipationBoard ne null) and (readerParticipationBoard.voteCount eq '1')}">selected</c:if>>1</option>
                                                                    <option value="2" <c:if test="${(readerParticipationBoard ne null) and (readerParticipationBoard.voteCount eq '2')}">selected</c:if>>2</option>
                                                                    <option value="3" <c:if test="${(readerParticipationBoard ne null) and (readerParticipationBoard.voteCount eq '3')}">selected</c:if>>3</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row mb-8">
                                                    <div class="col-lg-12 row">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">투표 목록</label>
                                                            </div>
                                                            <div class="col-lg-10">
                                                                <div class="col-lg-12 form-label text-dark pt-3" id="contentsDetailForVoting">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="contextOption" <c:if test="${readerParticipationBoard eq null}">style="display: none"</c:if>>
                                                <div class="row mb-8" id="exposurePeriod">
                                                    <div class="col-lg-12 row">
                                                        <div class="col-lg-1 d-flex justify-content-center align-items-center ">
                                                            <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">노출기간</label>
                                                        </div>
                                                        <div class="col-lg-6 row">
                                                            <div class="col-lg-6 fv-row">
                                                                <select
                                                                        class="form-select form-select-transparent"
                                                                        id="openYear"
                                                                        name="year"
                                                                        data-control="select2"
                                                                        data-hide-search="true"
                                                                        onchange="loadYearAndMonth(this.value)"
                                                                        <c:if test="${(readerParticipationBoard ne null) and (readerParticipationBoard.isOpen eq 'Y')}">disabled</c:if>>
                                                                    <option value="">선택</option>
                                                                </select>
                                                                <div id="openYearCheck" style="font-size: 0.925rem; color: #F1416C; display: none">* 노출기간을 선택헤주세요.</div>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <select
                                                                        class="form-select form-select-transparent"
                                                                        id="openMonth"
                                                                        name="month"
                                                                        data-control="select2"
                                                                        data-hide-search="true"
                                                                        <c:if test="${(readerParticipationBoard ne null) and (readerParticipationBoard.isOpen eq 'Y')}">disabled</c:if>>
                                                                    <option value="">선택</option>
                                                                </select>
                                                                <div id="openMonthCheck" style="font-size: 0.925rem; color: #F1416C; display: none">* 노출기간을 선택헤주세요.</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row mb-8">
                                                    <div class="col-lg-12 row">
                                                        <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                            <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">상세내용</label>
                                                        </div>
                                                        <div class="col-lg-10">
                                                            <div class="col-lg-12 form-label text-dark pt-3 fv-row fv-plugins-icon-container">
                                                                <textarea class="col-lg-12 form-control form-control-solid contentArea"
                                                                    minlength="1"
                                                                    id="detailContent"
                                                                    name="content"
                                                                    placeholder="Content">
                                                                    <c:if test="${readerParticipationBoard ne null}"><c:out value="${readerParticipationBoard.content}"/></c:if>
                                                                </textarea>
                                                                <div class="fv-plugins-message-container invalid-feedback content-empty-msg" style="display: none;"><div data-field="content" data-validator="notEmpty">상세내용을 입력해주세요.</div></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-8" id="isOpenOption" style="display: none">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 ">
                                                        <label class="col-lg-10 form-label fw-bolder text-dark pt-3 required">노출여부</label>
                                                    </div>
                                                    <div class="col-lg-11 pt-3 row">
                                                        <div class="col-lg-12">
                                                            <label class="form-check-label me-10">
                                                                <input
                                                                        class="form-check-input"
                                                                        type="radio"
                                                                        name="isOpen"
                                                                        value="N"
                                                                ${(readerParticipationBoard eq null) || (readerParticipationBoard.isOpen == 'N')?'checked' : ''}
                                                                />
                                                                <span>N</span>
                                                            </label>
                                                            <label class="form-check-label">
                                                                <input
                                                                        class="form-check-input"
                                                                        type="radio"
                                                                        name="isOpen"
                                                                        value="Y"
                                                                ${readerParticipationBoard.isOpen eq 'Y'?'checked' : ''}
                                                                />
                                                                <span>Y</span>
                                                            </label>
                                                            <div id="isopenCheck" style="font-size: 0.925rem; color: #F1416C; display: none">노출은 필수로 1개는 등록되어 있어야 합니다.</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                    </div>
                                </div>
                                <div class="card-footer" id="footerIdx">
                                    <div class="row">
                                        <div id="saveGroup" class="col-12 d-flex justify-content-end">
                                            <button type="button" id="cancelBtn" class="btn btn-light-primary me-2" style="background-color: #fff3cd; color: #181C32" onclick="history.back()">
                                                취소
                                            </button>
                                            <button
                                                    type="button"
                                                    class="btn btn-warning"
                                                    id="saveBtn"
                                                    style="background-color: #ffcd39; color: #181C32"
                                                    <c:if test="${readerParticipationBoard eq null}">disabled</c:if>
                                                    onclick="beforeSave()"
                                            >
                                                저장
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <!-- 본문 내용 END -->
                    </div>
                </div>
            </div>
            <%@ include file="/WEB-INF/views/common/inc/FooterINC.jsp" %>
        </div>
    </div>
</div>

</body>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script src="/assets/js/jihak.common.js"></script>
<script src="/assets/js/file.js"></script>
<script type="text/javascript">
    /***************************************************** INIT ***************************************/
    let school = document.getElementById('school').value;
    let isBoard = document.getElementById('isBoard').value;
    let isReply = document.getElementById('isReply').value;
    let isHiddenReply = document.getElementById('isHiddenReply').value;
    let isPeriod = document.getElementById('isPeriod').value;
    let isVoting = document.getElementById('isVoting').value;
    let uid = document.getElementById('uid').value;
    let readerParticipationBoardIndex = document.getElementById('readerParticipationBoardIndex').value;
    let readerParticipationFv = null;
    const VALID_CLASS = '';
    const INVALID_CLASS = 'is-invalid';
    const voteCountValidators = {
        validators: {
            notEmpty: {
                message: '* 투표 선택 수를 선택해주세요.'
            }
        }
    };
    let ntdrop = [];
    ntdrop[0]= global.genDropzone("#dz0",
        { params :
                {
                    'ParentTable' : 'READER_PARTICIPATION_BOARD',
                    'ParentUid' : '${readerParticipationBoard == null ? uid : readerParticipationBoard.uid}',
                    'ParentIndex' : '${readerParticipationBoard == null ? '' : readerParticipationBoard.readerParticipationBoardIndex}',
                    'ParentType' : 'FILE',
                },
            hasOrder: false, isSecure: 'N', required: 'N',
            acceptedExt : ['.mp3', '.mp4', '.pdf', '.jpg', '.jpeg', '.png', '.hwp', '.hwpx', '.ppt', '.pptx', '.dox', '.doxc', '.zip'],
            maxFileCount: 2,
            dropzoneIdx: 'dz0',
            containerId : 'dz0Container',
            maxFileSize : 300,
            dropzoneIndex : 0,
            messages : {
                accept: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.',
                count: '',
                size: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.'
            }
        });

    //발행월호, 노출기간 로드
    //초기에 년도가 선택되어있지 않으면 월 비활성화

    if(readerParticipationBoardIndex == null || readerParticipationBoardIndex == ''){
        if($('#year').val() == ''){
            $('#month').prop('disabled', true);
        }

        if($('#openYear').val() == ''){
            $('#openMonth').prop('disabled', true);
        }
    }
    async function loadYearAndMonth(year) {
        let data = {
            school: school,
            year: year
        }
        try {
            const response = await fetch('/api/v1/reading-review/select-reading-review-year-month', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            });

            const result = await response.json();
            if (result.data != null) {
                let yearArea = null;
                let monthArea = null;
                if(isVoting == 'Y'){
                    yearArea = document.getElementById('year');
                    monthArea = document.getElementById('month');
                }

                if(isReply == 'Y'){
                    yearArea = document.getElementById('openYear');
                    monthArea = document.getElementById('openMonth');
                }

                let readingReviewList = result.data.readingReviewList;
                //월호 선택시
                if(year == ''){
                    yearArea.innerHTML = '';
                    let defaultOpt = document.createElement('option');
                    defaultOpt.value = '';
                    defaultOpt.text = '선택';
                    yearArea.appendChild(defaultOpt);
                }else{
                    monthArea.innerHTML = '';
                    let defaultOption = document.createElement('option');
                    defaultOption.value = '';
                    defaultOption.text = '선택';
                    monthArea.appendChild(defaultOption);
                }
                for (let i = 0; i < readingReviewList.length; i++) {
                    //월호 선택시
                    if(year == ''){
                        let yearOption = document.createElement('option');
                        yearOption.value = readingReviewList[i].year;
                        yearOption.text = readingReviewList[i].year;
                        yearArea.appendChild(yearOption);
                    }else{
                        let monthOption = document.createElement('option');
                        monthOption.value = readingReviewList[i].month;
                        monthOption.text = readingReviewList[i].month;
                        monthArea.appendChild(monthOption);
                    }
                }
                if(readerParticipationBoardIndex != ''){
                    if(isVoting == 'Y'){
                        if(year == ''){
                            let yearValue = '<c:out value="${readerParticipationBoard.year}"/>';
                            $('#year').val(yearValue).trigger('change');
                        }else{
                            let monthValue = '<c:out value="${readerParticipationBoard.month}"/>';
                            $('#month').val(monthValue).trigger('change');
                            detailContents(monthValue);
                        }
                    }
                    if(isReply == 'Y'){
                        if(year == ''){
                            let yearValue = '<c:out value="${readerParticipationBoard.year}"/>';
                            $('#openYear').val(yearValue).trigger('change');
                        }else{
                            let monthValue = '<c:out value="${readerParticipationBoard.month}"/>';
                            $('#openMonth').val(monthValue).trigger('change');
                        }
                    }
                }
            }
        } catch (Exception) {
            console.error(Exception);
        }
    }

    document.addEventListener('DOMContentLoaded', function(){
        //옵션 초기화
        document.getElementById('noticeOption').style.display = 'none';
        document.getElementById('articleOption').style.display = 'none';
        document.getElementById('contextOption').style.display = 'none';
        if(readerParticipationBoardIndex != ''){
            document.getElementById('titleArea').style.display = 'block';
            document.getElementById('isOpenOption').style.display = 'block';

            loadOption(isBoard, isReply, isHiddenReply, isVoting, isPeriod);

            document.getElementById('titleArea').style.display = 'block';
            document.getElementById('isOpenOption').style.display = 'block';
        }
        //수정 페이지 > 선택된 구분값 -> 폼 구성
        $('#categoryIndex').on('select2:select', function (e){
            document.querySelector('#saveBtn').disabled = true;
            document.getElementById('noticeOption').style.display = 'none';
            document.getElementById('articleOption').style.display = 'none';
            document.getElementById('contextOption').style.display = 'none';
            let value = $(e.params.data.element).val();
            if(value != '') {
                isBoard = $(e.params.data.element).data('is-board');
                isReply = $(e.params.data.element).data('is-reply');
                isHiddenReply = $(e.params.data.element).data('is-hidden-reply');
                isVoting = $(e.params.data.element).data('is-voting');
                isPeriod = $(e.params.data.element).data('is-period');
                //공통 옵션 노출
                document.getElementById('titleArea').style.display = 'block';
                document.getElementById('isOpenOption').style.display = 'block';
                //나머지 옵션 분기 처리
                loadOption(isBoard, isReply, isHiddenReply, isVoting, isPeriod);

                document.getElementById('isBoard').value = isBoard;
                document.getElementById('isReply').value = isReply;
                document.getElementById('isHiddenReply').value = isHiddenReply;
                document.getElementById('isVoting').value = isVoting;
                document.getElementById('isPeriod').value = isPeriod;
                document.querySelector('#saveBtn').disabled = false;
            }
        })

        function loadOption(isBoard, isReply, isHiddenReply, isVoting, isPeriod){
            document.getElementById('isopenCheck').style.display = 'none';
            document.getElementById('title').classList.remove('is-invalid');
            removeValidationMessages('title');
            document.querySelectorAll('.content-empty-msg').forEach((eachContent)=>{
                eachContent.style.display = 'none';
            })
            let options = {};
            options = {
                title: {
                    validators: {
                        notEmpty: {
                            message: '* 제목을 입력해주세요.'
                        }
                    }
                }
            }
            readerParticipationFv = FormValidation.formValidation(document.getElementById('readerParticipationForm'), {
                fields: {
                    ...options
                },
                plugins: {
                    trigger: new FormValidation.plugins.Trigger(),
                    bootstrap: new FormValidation.plugins.Bootstrap5({
                        rowSelector: ".fv-row",
                        eleInvalidClass: "is-invalid",
                        eleValidClass: ""
                    })
                }
            });
            if (isBoard == 'N' && isReply == 'N' && isVoting == 'N') {
                document.getElementById('noticeOption').style.display = 'block';
            } else if (isBoard == 'N' && isReply == 'N' && isVoting == 'Y') {
                document.getElementById('articleOption').style.display = 'block';
                loadYearAndMonth('');
            } else if (isBoard == 'N' && isReply == 'Y' && isVoting == 'N') {
                document.getElementById('contextOption').style.display = 'block';
                document.getElementById('exposurePeriod').style.display = 'none';
                if(isPeriod == 'Y'){
                    document.getElementById('exposurePeriod').style.display = 'block';
                    loadYearAndMonth('');
                }
            }
            // 참여형 > 투표인 경우 투표 선택 수 추가
            if (isVoting == 'Y') {
                readerParticipationFv.addField('voteCount', voteCountValidators);
                /**
                 * form validator valid event select2 인 경우 처리
                 */
                readerParticipationFv.on('core.field.valid', function (name) {
                    try {
                        const el = document.querySelector('[name=' + name + ']');
                        if (el.dataset.control === 'select2') {
                            if (INVALID_CLASS) {
                                el.nextSibling.querySelector('span.select2-selection').classList.remove(INVALID_CLASS);
                            }
                            if (VALID_CLASS) {
                                el.nextSibling.querySelector('span.select2-selection').classList.add(VALID_CLASS);
                            }
                        }
                    } catch (e) {
                        console.log('Cannot find element: ' + name);
                    }
                });
            }
        }
    })
    //작성할 때 유효성 검증 문구를 가린다.
    $('#year').on('select2:select', async function (e) {
        $('#month').prop('disabled', false);
        document.querySelector('[aria-labelledby = select2-year-container]').style.borderColor = '';
        document.querySelector('#yearCheck').style.display = 'none';
    })

    $('#month').on('select2:select', async function (e) {
        document.querySelector('[aria-labelledby = select2-month-container]').style.borderColor = '';
        document.querySelector('#monthCheck').style.display = 'none';
        let month = $(e.params.data.element).val();
        detailContents(month)
    })

    $('#voteCount').on('select2:select', async function (e) {
        const voteCountEl = document.querySelector('#voteCount');
        voteCountEl.nextSibling.querySelector('span.select2-selection').classList.remove(INVALID_CLASS);
        document.querySelector('[aria-labelledby = select2-voteCount-container]').style.borderColor = '';
        const fvContainer = voteCountEl.parentNode.querySelector('div.fv-plugins-message-container');
        if(fvContainer !== null) {
            fvContainer.remove();
        }
    })

    $('#openYear').on('select2:select', async function (e) {
        $('#openMonth').prop('disabled', false);
        document.querySelector('[aria-labelledby = select2-openYear-container]').style.borderColor = '';
        document.querySelector('#openYearCheck').style.display = 'none';
        document.querySelector('#yearCheck').style.display = 'none';
    })

    $('#openMonth').on('select2:select', async function (e) {
        document.querySelector('[aria-labelledby = select2-openMonth-container]').style.borderColor = '';
        document.querySelector('#openMonthCheck').style.display = 'none';
        let month = $(e.params.data.element).val();
    })

    async function detailContents(value) {
        let year = $('#year').val();

        let month = value;
        let data = {
            school: school,
            year: year,
            month: month
        }
        try {
            const response = await fetch('/api/v1/reading-review/select-reading-review-contents-detail', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            });

            const result = await response.json();
            let contentsDetailForVoting = document.getElementById('contentsDetailForVoting');
            contentsDetailForVoting.innerHTML = '';
            if (result.data != null) {
                let contentsDetailList = result.data.contentsDetailList;
                for (let i = 0; i < contentsDetailList.length; i++) {
                    let contentsUl = document.createElement('ul');
                    let contentsTitle = document.createElement('h2');
                    contentsTitle.textContent = contentsDetailList[i].contentsTitle;

                    let detailList = contentsDetailList[i].detailList;
                    for(let j = 0; j < detailList.length; j++){
                        let listItem = document.createElement("li");
                        listItem.innerText = detailList[j].contentsDetail + ' : ' + detailList[j].contentsDetailTitle;
                        contentsUl.appendChild(listItem);
                    }
                    contentsDetailForVoting.appendChild(contentsTitle);
                    contentsDetailForVoting.appendChild(contentsUl);
                }
            }
        } catch (Exception) {
            console.error(Exception);
        }
    }

    let froalaKey = <%= froalaKey %>;
    $('.contentArea').each(function(index, element){
        $(element).froalaEditor({
            key: froalaKey,
            toolbarButtons: ['fullscreen', 'bold', 'italic', 'underline', 'strikeThrough', 'subscript', 'superscript', '|', 'fontFamily', 'fontSize', 'color', 'inlineClass', 'inlineStyle', 'paragraphStyle', 'lineHeight', '|', 'paragraphFormat', 'align', 'formatOL', 'formatUL', 'outdent', 'indent', 'quote', '-', 'insertLink', 'insertImage', 'insertTable', '|', 'specialCharacters', 'insertHR', 'selectAll', 'clearFormatting', '|', 'print', 'getPDF', 'spellChecker', 'help', 'html', '|', 'undo', 'redo'],
            imageUploadURL: '/froalaeditor/upload/Image',
            imageUploadParams: {editorUploadPath: '${editorUploadPath}'},
            imageDefaultWidth: 0,
            language: 'en',
            videoUpload: false,
            fileUpload: false,
            height: 300,
            requestHeaders: {
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
            }
        });
        $(element).on('froalaEditor.keydown', function (e, editor, keydownEvent) {
            if (editor.html.get() !== '') {
                document.querySelectorAll('.content-empty-msg')[index].style.display = 'none';
            }
        });
        $(element).on('froalaEditor.image.uploaded', function (e, editor, keydownEvent) {
            if (editor.html.get() !== '') {
                document.querySelectorAll('.content-empty-msg')[index].style.display = 'none';
            }
        });
    })

    /********************************************************************** POST ************************************************/
    async function beforeSave(){
        let isOpen = '';
        let isOpens = document.getElementsByName('isOpen');
        let boardIndex = '${readerParticipationBoard.readerParticipationBoardIndex}';
        let categoryIndex = $('#categoryIndex').val();
        if(boardIndex != '') {
            categoryIndex = document.getElementById('categoryIndex').value;
        }
        for(let i = 0; i < isOpens.length; i++){
            if(isOpens[i].checked){
                isOpen = isOpens[i].value;
                break;
            }
        }
        //참여형 > 투표, 댓글인 경우에는 노출 상태에 따라 저장을 달리해야함
        if(isReply == 'Y' || isVoting == 'Y'){
            readerParticipationFv.validate().then(async function (status) {
                if(!validateVotingReplyOption()){
                    return;
                }

                if (status == 'Valid') {
                    let data = {
                        categoryIndex : categoryIndex,
                        isOpen : isOpen
                    }
                    const response = await fetch('/api/v1/reading-review/select-reading-review-is-open', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                        body: JSON.stringify(data)
                    });

                    const result = await response.json();
                    if(result.code == 'SUCCESS') {
                        if(result.resultCode == 'CHECK_RESULT'){
                            if(isOpen == 'Y') {
                                Swal.fire({
                                    title: '노출여부 확인',
                                    text: result.msg,
                                    icon: 'warning',
                                    showCancelButton: true,
                                    confirmButtonColor: '#3085d6',
                                    cancelButtonColor: '#d33',
                                    confirmButtonText: '예',
                                    cancelButtonText: '아니요'
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        if (dropzoneCheck()) {
                                            uploadByDropzone(0);
                                        }
                                    }
                                })
                            }else{
                                Swal.fire({
                                    title: '노출여부 안내',
                                    text: result.msg,
                                    icon: 'success',
                                    confirmButtonText: '확인'
                                })
                            }
                        }else if(result.resultCode == 'NO_OPENED_BOARD'){
                            document.getElementById('isopenCheck').style.display = 'block';
                        }else{
                            if (dropzoneCheck()) {
                                uploadByDropzone(0);
                            }
                        }
                    }
                }
            })
        }else{
            //공지사항인 경우
            readerParticipationFv.validate().then(async function (status) {
                if(document.querySelector('#content').value == ''){
                    document.querySelector('.content-empty-msg').style.display = '';
                    return;
                }
                if(status === 'Valid'){
                    if (dropzoneCheck()) {
                        uploadByDropzone(0);
                    }
                }
            })
        }
    }

    let isSubmit = false;

    async function save(method) {

        if (isSubmit) {
            return;
        }

        isSubmit = true;
        let school = document.getElementById('school').value;
        let title = document.getElementById('title').value;
        let isOpens = document.getElementsByName('isOpen');
        let category = $('#categoryIndex').find(':selected').text();
        let year = '';
        let month = '';
        let content = '';
        let voteCount = '';

        let isOpen = '';
        let isTop = 'N';
        for(let i = 0; i < isOpens.length; i++){
            if(isOpens[i].checked){
                isOpen = isOpens[i].value;
                break;
            }
        }

        if(isVoting == 'Y'){
            year = $('#year').val();
            month = $('#month').val();
            voteCount = $('#voteCount').val();
        }

        if(isPeriod == 'Y'){
            year = $('#openYear').val();
            month = $('#openMonth').val();
        }

        if(isReply == 'Y'){
            content = document.getElementById('detailContent').value;
        }

        if(isReply == 'N' && isVoting == 'N'){
            content = document.getElementById('content').value;
        }

        if(category == '공지사항') {
            isTop = 'Y';
        }

        let categoryIndex = $('#categoryIndex').val();
        let data = {
            uid: uid,
            school: school,
            title: title,
            content: content,
            isOpen: isOpen,
            isTop: isTop,
            isReply: isReply,
            isVoting: isVoting,
            categoryIndex: categoryIndex,
            year : year,
            month : month,
            voteCount : voteCount
        }
        try {
                const response = await fetch('/api/v1/reading-review/reader-participation-board', {
                    method: method,
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(data)
                });

                const result = await response.json();
                if(result.readerParticipationBoardIndex != ''){
                    Swal.fire({
                        title: '등록 완료',
                        text: '등록되었습니다.',
                        icon: 'success',
                        confirmButtonText: '확인'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            location.href='/reading-review/reader-participation/<c:out value="${school}"/>';
                        }
                    })
                }
        } catch (Exception) {
            console.error(Exception);
        } finally {
            isSubmit = false;
        }
    }

    function removeValidationMessages(fieldName) {
        const validationMessages = document.querySelectorAll(`[data-field="` + fieldName + `"]`);
        validationMessages.forEach(message => message.remove());
    }
    function validateVotingReplyOption(){
        let isPass = true;
        //기간이 존재하는 옵션
        if (isVoting == 'Y') {
            if(isExist(document.querySelector('#year')) && isExist(document.querySelector('#month')))
                if (document.querySelector('#year').value == '' || document.querySelector('#month').value == '') {
                    document.querySelector('#yearCheck').style.display = '';
                    document.querySelector('[aria-labelledby = select2-year-container]').style.borderColor = '#F1416C';
                    document.querySelector('#monthCheck').style.display = '';
                    document.querySelector('[aria-labelledby = select2-month-container]').style.borderColor = '#F1416C';
                    isPass = false;
                }
                if (document.querySelector('#voteCount').value == '') {
                    document.querySelector('[aria-labelledby = select2-voteCount-container]').style.borderColor = '#F1416C';
                }
        }
        if (isPeriod == 'Y') {
            if(isExist(document.querySelector('#openYear')) && isExist(document.querySelector('#openMonth'))){
                if (document.querySelector('#openYear').value == '' || document.querySelector('#openMonth').value == '') {
                    document.querySelector('#openYearCheck').style.display = '';
                    document.querySelector('[aria-labelledby = select2-openYear-container]').style.borderColor = '#F1416C';
                    document.querySelector('#openMonthCheck').style.display = '';
                    document.querySelector('[aria-labelledby = select2-openMonth-container]').style.borderColor = '#F1416C';
                    isPass = false;
                }
            }
        }

        //상세내용이 존재하는 옵션
        if (isReply == 'Y') {
            if (document.querySelector('#detailContent').value == '') {
                document.querySelectorAll('.content-empty-msg')[1].style.display = '';
                isPass = false;
            }
        }
        return isPass;
    }
    const saveFormData = () => {
        let chk = document.getElementById('readerParticipationBoardIndex').value;
        chk ? save('PUT') : save('POST');
    }
</script>
<style>
    @keyframes slide-in {
        from {
            transform: translateX(-100%);
            opacity: 0;
        }
        to {
            transform: translateX(0);
            opacity: 1;
        }
    }

    .slide-in-animation {
        animation: slide-in 0.5s forwards;
    }

</style>
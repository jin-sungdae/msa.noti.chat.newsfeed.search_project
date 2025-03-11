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

    <style>
        .recruitment_content > p > img {
            width: 100%;
        }
    </style>
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
                        <form id="saveForm">
                            <input type="hidden" name="uid" id="uid" value="${uid}"/>
                            <div class="card mb-5 mb-xl-10">
                                <div class="card-header border-0 pt-5 card-header-stretch">
                                    <div class="card-title text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                        기본 정보
                                    </div>
                                    <div class="card-toolbar">
                                        <ul class="nav nav-tabs nav-line-tabs nav-stretch fs-6 border-0">
                                            <li class="nav-item">
                                                <a class="nav-link fw-bolder text-dark active" href="/user/recruitment/${recruitment.uid}">인재채용 상세</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link fw-bolder text-dark" href="${pageContext.request.contextPath}/user/recruitment/applicant-list?uid=${recruitment.uid}">지원자 정보</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade show active" id="tab1" role="tabpanel">
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3">작성자</label>
                                                    </div>
                                                    <div class="col-lg-4 row">

                                                        <div class="col-lg-4 form-label fw-bold text-dark pt-3">
                                                            ${recruitment.adminName}
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3">작성일시</label>
                                                    </div>
                                                    <div class="col-lg-4 row">

                                                        <div class="col-lg-4 form-label fw-bold text-dark pt-3">
                                                            ${recruitment.regDate}
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row fv-row">
                                                    <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3">채용공고명</label>
                                                    </div>
                                                    <div class="col-lg-8">

                                                        <div class="col-lg-12 form-label text-dark fw-bold pt-3">
                                                            <c:out value="${recruitment.title}"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">지원자격</label>
                                                    </div>
                                                    <div class="col-lg-8">
                                                        <div class="col-lg-4 form-label text-dark fw-bold pt-3">
                                                            <c:out value="${recruitment.applicationEligibility}"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">모집기간</label>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="col-lg-12 form-label text-dark fw-bold pt-3">
                                                            <c:out value="${recruitment.startDate}"/> ~ <c:out value="${recruitment.endDate}"/>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <div class="form-check form-check-custom form-check-warning form-check-solid mb-3">
                                                            <input class="form-check-input" type="checkbox" value="Y" id="textBook" name="isTest" ${recruitment.isTest eq 'Y' ? 'checked' : ''} disabled>
                                                            <label class="form-check-label form-label fw-bolder text-dark pt-3" for="textBook" >
                                                                테스트 전용
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">채용공고 상단 이미지</label>
                                                    </div>
                                                    <div class="col-lg-10 row">
                                                        <div class="col-lg-12 form-label text-dark fw-bold pt-3">
                                                                <a href="javascript:void(0);" onclick="window.open('/upload/${recruitment.imageFile.getSaveFilePath()}')">
                                                                    <c:out value="${recruitment.imageFile.fileName}"/>
                                                                </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">모집부문 및 자격요건
                                                        </label>
                                                    </div>
                                                    <div class="col-lg-10 table-responsive">
                                                        <table class="table table-row-bordered gy-5 detail_table">
                                                            <thead class="thead-light">
                                                            <tr>
                                                                <th class="text-center">모집부서</th>
                                                                <th class="text-center">업무</th>
                                                                <th class="text-center">학력</th>
                                                                <th class="text-center">자격요건</th>
                                                                <th class="text-center">구분</th>
                                                                <th class="text-center">급여</th>
                                                                <th class="text-center">인원</th>
                                                                <th class="text-center">근무지</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody id="detailBody">
                                                                <c:forEach var="item" items="${recruitment.recruitmentRequirements}">
                                                                    <tr>
                                                                        <td class="align-middle text-center" width="11.2%">
                                                                            <span><c:out value="${item.department}" /></span>
                                                                            <input type="hidden" class="detail_input department" data-name="department" value="${item.department}">
                                                                        </td>
                                                                        <td class="align-middle text-center" width="11.2%">
                                                                            <span><c:out value="${item.work}" /></span>
                                                                            <input type="hidden" class="detail_input work" data-name="work" value="${item.work}">
                                                                        </td>
                                                                        <td class="align-middle text-center" width="11.2%">
                                                                            <span><c:out value="${item.education}" /></span>
                                                                            <input type="hidden" class="detail_input education" data-name="work" value="${item.education}">
                                                                        </td>
                                                                        <td class="align-middle text-center" width="11.2%">
                                                                            <span><c:out value="${item.applicationEligibility}" /></span>
                                                                            <input type="hidden" class="detail_input applicationEligibility" data-name="applicationEligibility" value="${item.applicationEligibility}">
                                                                        </td>
                                                                        <td class="align-middle text-center" width="11.2%">
                                                                            <span><c:out value="${item.workersClassification}" /></span>
                                                                            <input type="hidden" class="detail_input workersClassification" data-name="workersClassification" value="${item.workersClassification}">
                                                                        </td>
                                                                        <td class="align-middle text-center" width="11.2%">
                                                                            <span><c:out value="${item.salary}" /></span>
                                                                            <input type="hidden" class="detail_input salary" data-name="salary" value="${item.salary}">
                                                                        </td>
                                                                        <td class="align-middle text-center" width="11.2%">
                                                                            <span><c:out value="${item.personnel}" /></span>
                                                                            <input type="hidden" class="detail_input personnel" data-name="personnel" value="${item.personnel}">
                                                                        </td>
                                                                        <td class="align-middle text-center" width="11.2%">
                                                                            <span><c:out value="${item.workPlace}" /></span>
                                                                            <input type="hidden" class="detail_input workPlace" data-name="workPlace" value="${item.workPlace}">
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                        <div class="fv-plugins-message-container invalid-feedback" id="detail-empty-msg" style="display: none;"><div data-field="content" data-validator="notEmpty">모집부분 및 자격요건을 입력해주세요.</div></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row fv-row">
                                                    <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">채용 내용</label>
                                                    </div>
                                                    <div class="col-lg-10">
                                                        <div class="col-lg-12 form-label text-dark fw-bold pt-3 recruitment_content">
                                                            ${recruitment.content}
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3">입사지원서<br/>(다운로드)</label>
                                                    </div>
                                                    <div class="col-lg-10 row">
                                                        <div class="col-lg-12 form-label text-dark fw-bold pt-3">
                                                            <c:if test="${not empty recruitment.appFile.uid}">
                                                                <c:if test="${recruitment.appFile.fileType eq 'image'}">
                                                                    <a href="javascript:void(0);" onclick="window.open('/upload/${recruitment.appFile.getSaveFilePath()}')">
                                                                        <c:out value="${recruitment.appFile.fileName}"/>
                                                                    </a>
                                                                </c:if>
                                                                <c:if test="${recruitment.appFile.fileType ne 'image'}">
                                                                    <a href="/api/v1/file/file-download/${recruitment.appFile.uid}">
                                                                        <c:out value="${recruitment.appFile.fileName}"/>
                                                                    </a>
                                                                </c:if>
                                                            </c:if>
                                                            <c:if test="${empty recruitment.appFile.uid}">
                                                                -
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">노출여부</label>
                                                    </div>

                                                    <div class="col-lg-4">
                                                        <div class="col-lg-12 form-label text-dark fw-bold pt-3">
                                                            <c:out value="${recruitment.isOpen}"/>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer" id="footerIdx">
                                    <div class="row">
                                        <div id="listGroup" class="col-3">
                                            <button type="button" class="btn btn-light-dark" style="background-color: #343a40; color: #FFFFFF" onclick="goList()">목록</button>
                                        </div>
                                        <div id="editGroup" class="col-9 d-flex justify-content-end">
                                            <button
                                                    data-uid="${recruitment.uid}"
                                                    type="button"
                                                    id="deleteBtn"
                                                    class="btn btn-light-warning me-2"
                                                    style="background-color: #fff3cd; color: #181C32"
                                                    onclick="deleteRecruitment()">
                                                삭제
                                            </button>
                                            <button type="button" class="btn btn-light-warning" style="background-color: #ffcd39; color: #181C32" onclick="goModify()">
                                                수정
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

<form name="searchForm" id="searchForm">
    <input type="hidden" name="sdate" value="${reqMap.sdate}" />
    <input type="hidden" name="edate" value="${reqMap.edate}" />
    <input type="hidden" name="processingType" value="${reqMap.processingType}" />
    <input type="hidden" name="applicationEligibility" value="${reqMap.applicationEligibility}" />
    <input type="hidden" name="isOpen" value="${reqMap.isOpen}" />
    <input type="hidden" name="search" value="${reqMap.search}" />
    <input type="hidden" name="perPage" value="${reqMap.perPage}" />
    <input type="hidden" name="page" value="${reqMap.page}" />
    <input type="hidden" name="uid" value="${recruitment.uid}" />
</form>

</body>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script src="/assets/js/file.js"></script>
<script type="text/javascript">

    const goModify = () => {
        const form = document.querySelector('#searchForm');
        form.action = '/user/recruitment-mod-form';
        form.method = 'GET';
        form.submit();
    }

    const deleteRecruitment = async () => {


        Swal.fire({
            title: '게시물 삭제',
            text: '등록하신 게시물을 삭제 하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '확인',
            cancelButtonText: '취소'
        }).then(async (result) => {
            if (result.isConfirmed) {
                let url = '/api/v1/recruitment/' + '${recruitment.uid}';
                let method = 'DELETE';

                const response = await fetch(url, {
                    method: method,
                    headers: {
                        'Content-Type': 'application/json',
                    }
                });

                const res = await response.json();
                if (res) {
                    window.location.href = '/user/recruit-list';
                }
            } else {

            }
        })
    }

    function goList() {
        const form = document.querySelector('#searchForm');
        form.action = '/user/recruit-list';
        form.method = 'GET';
        form.submit();
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
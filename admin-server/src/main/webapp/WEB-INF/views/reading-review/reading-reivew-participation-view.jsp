<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                            <div class="card mb-5 mb-xl-10">
                                <c:choose>
                                    <c:when test="${readerParticipationBoard.isBoard eq 'N' and readerParticipationBoard.isReply eq 'N' and readerParticipationBoard.isHiddenReply eq 'N' and readerParticipationBoard.isVoting eq 'N'}">
                                        <c:set var="noticeYN" value="Y" />
                                    </c:when>
                                    <c:when test="${readerParticipationBoard.isBoard eq 'N' and readerParticipationBoard.isReply eq 'N' and readerParticipationBoard.isHiddenReply eq 'N' and readerParticipationBoard.isVoting eq 'Y'}">
                                        <c:set var="articleYN" value="Y" />
                                    </c:when>
                                    <c:when test="${readerParticipationBoard.isBoard eq 'N' and readerParticipationBoard.isReply eq 'Y' and readerParticipationBoard.isVoting eq 'N'}">
                                        <c:set var="contextYN" value="Y" />
                                    </c:when>
                                </c:choose>
                                <div class="card-header card-header-stretch border-0 pt-5">
                                    <h3 class="card-title text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                        <c:if test="${school eq 'first-step'}">첫걸음</c:if>
                                        <c:if test="${school eq 'elementary'}">초등</c:if>
                                        <c:if test="${school eq 'middle'}">중학</c:if>
                                        <c:if test="${school eq 'high'}">고교</c:if>
                                    </h3>
                                    <c:if test="${(readerParticipationBoard != null) and ((articleYN eq 'Y') or (contextYN eq 'Y') or (readerParticipationBoard.isBoard eq 'Y'))}">
                                        <div class="card-toolbar">
                                            <ul class="nav nav-tabs nav-line-tabs nav-stretch fs-6 border-0">
                                                <li class="nav-item">
                                                    <a class="nav-link fw-bolder text-dark detailTab active" data-bs-toggle="tab" data-page-type="detail">상세정보</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link fw-bolder detailTab text-dark" data-bs-toggle="tab" data-page-type="participation">참여현황</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </c:if>
                                </div>
                                <div class="card-body">
                                    <input type="hidden" id="school" value="<c:out value="${school}"/>">
                                    <input type="hidden" id="uid" value="<c:out value="${readerParticipationBoard.uid}"/>">
                                    <input type="hidden" id="year" value="<c:out value="${readerParticipationBoard.year}"/>">
                                    <input type="hidden" id="month" value="<c:out value="${readerParticipationBoard.month}"/>">
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="card-body">
                                                <div class="row mb-8">
                                                    <div class="col-lg-12 row">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">작성자</label>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                                    <c:out value="${admin.getAdminNameWithDept()}"/>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">작성일시</label>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                                    <c:out value="${readerParticipationBoard.regDate}"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <c:if test="${readerParticipationBoard.isBoard eq 'Y'}">
                                                    <div class="row mb-8">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-12 row">
                                                                <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">공개여부</label>
                                                                </div>
                                                                <div class="col-lg-8">
                                                                    <div class="col-lg-12 form-label text-dark pt-3">
                                                                        <c:out value="${readerParticipationBoard.isOpen}"/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                                <div class="row mb-8">
                                                    <div class="col-lg-12 row">
                                                        <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                            <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">구분</label>
                                                        </div>
                                                        <div class="col-lg-8">
                                                            <div class="col-lg-12 form-label text-dark pt-3">
                                                                <c:out value="${readerParticipationBoard.categoryName}"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row mb-8">
                                                    <div class="col-lg-12 row">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 validate required">제목</label>
                                                            </div>
                                                            <div class="col-lg-10">
                                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                                    <c:out value="${readerParticipationBoard.title}"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <c:if test="${contextYN eq 'Y'}">
                                                    <c:if test="${readerParticipationBoard.isHiddenReply eq 'N'}">
                                                        <div class="row mb-8">
                                                            <div class="col-lg-12 row">
                                                                <div class="col-lg-1 d-flex justify-content-center align-items-center ">
                                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">노출기간</label>
                                                                </div>
                                                                <div class="col-lg-10">
                                                                    <div class="col-lg-12 form-label text-dark pt-3">
                                                                        <c:out value="${readerParticipationBoard.year}"/>년
                                                                        <c:out value="${readerParticipationBoard.month}"/>월
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${(noticeYN eq 'Y') or (contextYN eq 'Y') or (readerParticipationBoard.isBoard eq 'Y')}">
                                                    <div class="row mb-8">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-12 row">
                                                                <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required"><c:out value="${noticeYN ne 'Y'? '상세': ''}"/>내용</label>
                                                                </div>
                                                                <div class="col-lg-10">
                                                                    <div class="col-lg-12 form-label text-dark pt-3">
                                                                          <c:out value="${readerParticipationBoard.content}" escapeXml="false"/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                                <c:if test="${articleYN eq 'Y'}">
                                                    <div class="row mb-8">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-12 row">
                                                                <div class="col-lg-1 d-flex justify-content-center align-items-center ">
                                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">발행월호</label>
                                                                </div>
                                                                <div class="col-lg-6 row">
                                                                    <div class="col-lg-6">
                                                                        <div class="col-lg-12 form-label text-dark pt-3">
                                                                            <c:out value="${readerParticipationBoard.year}"/>년
                                                                             <c:out value="${readerParticipationBoard.month}"/>월 호
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-1 d-flex justify-content-center align-items-center ">
                                                                    <label class="col-lg-10 form-label fw-bolder text-dark pt-3 required">투표 선택 수</label>
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <div class="col-lg-12 form-label text-dark pt-3">
                                                                        <c:out value="${readerParticipationBoard.voteCount}"/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-8">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-12 row">
                                                                <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 validate required">투표 목록</label>
                                                                </div>
                                                                <div class="col-lg-10">
                                                                    <div class="col-lg-12 form-label text-dark pt-3" id="contentsDetailForVoting">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                                <div class="row mb-8">
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
                                                                            <c:if test="${readerParticipationBoard.isOpen eq 'N'}">checked</c:if>
                                                                            disabled
                                                                    />
                                                                    <span>N</span>
                                                                </label>
                                                                <label class="form-check-label">
                                                                    <input
                                                                            class="form-check-input"
                                                                            type="radio"
                                                                            <c:if test="${readerParticipationBoard.isOpen eq 'Y'}">checked</c:if>
                                                                            disabled
                                                                    />
                                                                    <span>Y</span>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <c:if test="${noticeYN eq 'Y'}">
                                                    <div class="row mb-8">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">첨부파일</label>
                                                            </div>
                                                            <div class="fv-row fv-plugins-icon-container col-lg-11">
                                                                <div class="col-lg-12 row">
                                                                    <div class="fv-row fv-plugins-icon-container col-lg-11" id="dropzoneContainer">
                                                                        <!-- 파일 업로드 섹션 -->
                                                                        <jsp:include page="/FileFormINC" flush="false">
                                                                            <jsp:param name="viewType" value="view" />
                                                                            <jsp:param name="isImage" value="false" />
                                                                            <jsp:param name="hasOrder" value="false" />
                                                                            <jsp:param name="parentTable" value="READER_PARTICIPATION_BOARD"/>
                                                                            <jsp:param name="parentIndex" value="${readerParticipationBoard.readerParticipationBoardIndex}"/>
                                                                            <jsp:param name="parentUid" value="${readerParticipationBoard.uid}"/>
                                                                            <jsp:param name="parentType" value="FILE"/>
                                                                            <jsp:param name="maxFileCount" value="1"/>
                                                                            <jsp:param name="isSecure" value="N"/>
                                                                            <jsp:param name="DZID" value="dz0"/>
                                                                        </jsp:include>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                                <c:if test="${readerParticipationBoard.isBoard eq 'Y'}">
                                                    <div class="row mb-8">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">첨부파일</label>
                                                            </div>
                                                            <div class="fv-row fv-plugins-icon-container col-lg-11">
                                                                <div class="col-lg-12 row">
                                                                    <c:forEach var="fileList" items="${readerParticipationBoard.fileList}">
                                                                        <!-- 이미지 -->
                                                                        <img src="<c:out value="${fileList.fileUrl}"/>"/>
                                                                    </c:forEach>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                        <div class="card mb-5 mb-xl-10">
                                            <div id="option">
                                                <div class="card-footer" id="footerIdx">
                                                    <div class="row">
                                                        <div id="saveGroup" class="col-12 d-flex justify-content-end">
                                                            <c:choose>
                                                                <c:when test="${readerParticipationBoard.isBoard eq 'N'}">
                                                                    <button type="button" id="cancelBtn" class="btn btn-light-primary me-2" style="background-color: #fff3cd; color: #181C32" onclick="deleteParticipation()">
                                                                        삭제
                                                                    </button>
                                                                    <button
                                                                            type="button"
                                                                            class="btn btn-warning"
                                                                            id="saveBtn"
                                                                            style="background-color: #ffcd39; color: #181C32"
                                                                            onclick="modify()"
                                                                    >
                                                                        수정
                                                                    </button>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <button type="button" id="changeOpenBtn" class="btn btn-light-primary me-2" style="background-color: #fff3cd; color: #181C32" value="<c:out value="${readerParticipationBoard.isOpen eq 'N'? 'Y' : 'N'}"/>">
                                                                        <c:out value="${readerParticipationBoard.isOpen eq 'N'? '공개' : '비공개'}"/>
                                                                    </button>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 본문 내용 END -->
                            </div>
                        </div>
                    </div>
                <%@ include file="/WEB-INF/views/common/inc/FooterINC.jsp" %>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script src="/assets/js/file.js"></script>
<script type="text/javascript">
    let school = document.getElementById('school').value;
    let uid = document.getElementById('uid').value;
    let year = document.getElementById('year').value;
    let month = document.getElementById('month').value;
    let isVoting = '<c:out value="${readerParticipationBoard.isVoting}"/>';
    let isReply = '<c:out value="${readerParticipationBoard.isReply}"/>';
    /******************************************************************* INIT ************************************************/
    document.addEventListener('DOMContentLoaded', async function () {
        if(isVoting == 'Y') {
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
                        for (let j = 0; j < detailList.length; j++) {
                            let listItem = document.createElement("li");
                            listItem.innerText = detailList[j].contentsDetail + ' : ' + detailList[j].title;
                            let userVotingCount = document.createElement("span");
                            userVotingCount.style.float = 'right';
                            userVotingCount.innerText = detailList[j].voteCount + '표';
                            listItem.appendChild(userVotingCount);
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

        let detailTabs = document.getElementsByClassName('detailTab');
        detailTabs.forEach(function (eachTab){
            eachTab.addEventListener('click', function(){
                let pageType = eachTab.dataset.pageType;
                let url = '';
                if(pageType == 'detail') {
                    url = '/reading-review/reader-participation/' + school + '/' + uid;
                }else {
                    if (isVoting == 'Y') {
                        url = '/reading-review/reader-participation/' + school + '/' + uid + '/voting';
                    }
                    if (isReply == 'Y') {
                        url = '/reading-review/reader-participation/' + school + '/' + uid + '/reply';
                    }
                }
                location.href = url;
            })
        })

        if(document.getElementById('changeOpenBtn') != undefined){
            let changeOpenBtn = document.getElementById('changeOpenBtn');
            changeOpenBtn.addEventListener('click', function(){
                let isOpen = changeOpenBtn.value;
                let textContent = changeOpenBtn.textContent;

                Swal.fire({
                    title: '공개여부 확인',
                    text: '해당 게시글을 ' + textContent + '로 전환 하시겠습니까??',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '예',
                    cancelButtonText: '아니요'
                }).then(async (result) => {
                    if (result.isConfirmed) {
                        let data = {
                            uid : uid,
                            isOpen : isOpen
                        }
                        try {
                            const response = await fetch('/api/v1/reading-review/update-reading-review-is-open', {
                                method: 'PUT',
                                headers: {
                                    'Content-Type': 'application/json',
                                },
                                body: JSON.stringify(data)
                            });

                            const result = await response.json();

                            if (result.resultCode == 'SUCCESS') {
                                Swal.fire({
                                    title: '공개여부 변경 완료',
                                    text: '변경 완료되었습니다.',
                                    icon: 'success',
                                    confirmButtonText: '확인'
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        location.href = '/reading-review/reader-participation/' + school;
                                    }
                                })
                            }
                        } catch (Exception) {
                            console.error(Exception);
                        }
                    }
                });
            })
        }
    })

    /******************************************************************* PUT ************************************************/
    function modify() {
        location.href = '/reading-review/reader-participation/'+ school +'/mod-form/'+ uid;
    }

    /******************************************************************* DELETE ************************************************/
    function deleteParticipation() {
        let isOpen = '<c:out value="${readerParticipationBoard.isOpen}"/>';
        if(isOpen == 'Y'){
            Swal.fire({
                title: '이미 노출되고 있는 게시물은 삭제가 불가능합니다.',
                icon: 'error',
                confirmButtonText: '확인'
            })
        }


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
                let data = {
                    uid: uid
                }
                try {
                    const response = await fetch('/api/v1/reading-review/reader-participation-board', {
                        method: 'DELETE',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                        body: JSON.stringify(data)
                    });

                    const result = await response.json();

                    if (result.resultCode == 'SUCCESS') {
                        Swal.fire({
                            title: '삭제 완료',
                            text: '삭제가 완료되었습니다.',
                            icon: 'success',
                            confirmButtonText: '확인'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                location.href = '/reading-review/reader-participation/' + school;
                            }
                        })
                    } else {
                        Swal.fire({
                            title: '삭제 실패',
                            text: '삭체 처리에 실패되었습니다. \n다시 시도해주세요.',
                            icon: 'error',
                            confirmButtonText: '확인'
                        })
                    }
                } catch (Exception) {
                    console.error(Exception);
                }
            }
        });
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
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
                    <input type="hidden" name="uid" id="uid" value="<c:out value="${referenceBookInquiry.uid}"/>"/>
                    <div class="container-fluid">
                        <!-- 본문 내용 START -->
                            <div class="card mb-5 mb-xl-10">
                                <div class="card-header border-0 pt-5">
                                    <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                        참고서 문의 관리
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">작성자</label>
                                            </div>
                                            <div class="col-lg-3 row ">
                                                <div class="col-lg-12 form-label pt-3">
                                                    <c:out value="${referenceBookInquiry.userName}"/>
                                                </div>
                                            </div>
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">작성일시</label>
                                            </div>
                                            <div class="col-lg-2 row">
                                                <div class="col-lg-12 form-label pt-3">
                                                    <c:out value="${referenceBookInquiry.regDate}"/>
                                                </div>
                                            </div>
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">공개여부</label>
                                            </div>
                                            <div class="col-lg-2 row">
                                                <div class="col-lg-12 form-label pt-3">
                                                    <c:out value="${referenceBookInquiry.isOpen}"/>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">구분</label>
                                            </div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-12 form-label fw-bolder pt-3">
                                                    <c:out value="${referenceBookInquiry.inquiryKind eq 'REFERENCE-BOOK'? '참고서 문의':'선생님 참고서 문의'}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">문의구분</label>
                                            </div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-12 form-label fw-bolder pt-3">
                                                    <c:out value="${referenceBookInquiry.inquiryCategory}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <c:if test="${referenceBookInquiry.inquiryKind eq 'REFERENCE-BOOK'}">
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">학급</label>
                                                </div>
                                                <div class="col-lg-3 row">
                                                    <div class="col-lg-12 form-label pt-3">
                                                        <c:out value="${referenceBookInquiry.school}"/>
                                                    </div>
                                                </div>
                                                <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">과목</label>
                                                </div>
                                                <div class="col-lg-3 row">
                                                    <div class="col-lg-12 form-label pt-3">
                                                        <c:out value="${referenceBookInquiry.subject}"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">교재명</label>
                                            </div>

                                            <div class="col-lg-3 row">
                                                <div class="col-lg-12 form-label pt-3">
                                                    <c:out value="${((referenceBookInquiry.referenceBookTitle ne null) and (referenceBookInquiry.referenceBookTitle ne ''))? referenceBookInquiry.referenceBookTitle : '-'}"/>
                                                </div>
                                            </div>
                                            <c:if test="${(referenceBookInquiry.inquiryCategory ne '교재서평') and (referenceBookInquiry.inquiryKind eq 'REFERENCE-BOOK')}">
                                                <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">페이지</label>
                                                </div>
                                                <div class="col-lg-3 row">
                                                    <div class="col-lg-12 form-label  pt-3">
                                                        <c:out value="${((referenceBookInquiry.referenceBookPage ne '') and (referenceBookInquiry.referenceBookPage ne null))? referenceBookInquiry.referenceBookPage : '-'}"/>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                    <c:if test="${referenceBookInquiry.inquiryCategory ne '교재서평'}">
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">제목</label>
                                                </div>

                                                <div class="col-lg-8">
                                                    <div class="col-lg-12 form-label pt-3">
                                                        <c:out value="${referenceBookInquiry.title}"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">상세내용</label>
                                            </div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-12 form-label pt-3" id="inquiryContent">
                                                    <%--<c:out value="${referenceBookInquiry.inquiryCategory eq '교재서평'? referenceBookInquiry.reviewContent : referenceBookInquiry.content}"/>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <c:if test="${referenceBookInquiry.inquiryCategory ne '교재서평'}">
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
                                                                <jsp:param name="parentTable" value="CUSTOMER_INQUIRY"/>
                                                                <jsp:param name="parentIndex" value="${referenceBookInquiry == null ? '' : referenceBookInquiry.customerInquiryIndex}"/>
                                                                <jsp:param name="parentUid" value="${referenceBookInquiry == null ? uid : referenceBookInquiry.uid}"/>
                                                                <jsp:param name="parentType" value="FILE"/>
                                                                <jsp:param name="maxFileCount" value="1"/>
                                                                <jsp:param name="isSecure" value="N"/>
                                                                <jsp:param name="DZID" value="dz0"/>
                                                            </jsp:include>
                                                            <!--end::Dropzone-->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                                <c:if test="${referenceBookInquiry.inquiryCategory eq '교재서평'}">
                                    <div class="card-footer">
                                        <div class="row">
                                            <div id="list" class="col-3">
                                                <button type="button" class="btn btn-light-primary" style="background-color: #343a40; color: #FFFFFF" onclick="goList()">목록</button>
                                            </div>
                                            <div class="col-9 d-flex justify-content-end">
                                                <button
                                                        data-review-index="${referenceBookInquiry.referenceBookReviewIndex}"
                                                        data-is-Open="${referenceBookInquiry.isOpen}"
                                                        type="button"
                                                        class="btn btn-light-primary me-2"
                                                        style="background-color: #fff3cd; color: #181C32"
                                                        onclick="editIsOpen(this)">
                                                    <c:out value="${referenceBookInquiry.isOpen eq 'Y'? '비공개': '공개'}"/>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                            <c:if test="${referenceBookInquiry.inquiryCategory ne '교재서평'}">
                                <div class="card mb-5 mb-xl-10">
                                    <div id=info">
                                        <div class="card-header card-header border-0 pt-5">
                                            <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                                답변 정보
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3">답변자</label>
                                                    </div>

                                                    <div class="col-lg-3 row">
                                                        <div class="col-lg-12 form-label pt-3">
                                                            <c:out value="${referenceBookInquiry.isAnswer eq 'Y'? referenceBookInquiry.answerAdmin : admin.getAdminNameWithDept()}"/>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3">답변일시</label>
                                                    </div>
                                                    <div class="col-lg-2 row">
                                                        <div class="col-lg-12 form-label pt-3">
                                                            <c:choose>
                                                                <c:when test="${referenceBookInquiry.isAnswer eq 'Y'}">
                                                                    <c:out value="${referenceBookInquiry.answerRegDate}"/>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    -
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1">
                                                        <label class="col-lg-10 form-label fw-bolder text-dark pt-3">답변내용</label>
                                                    </div>
                                                    <div class="col-lg-11">
                                                        <c:choose>
                                                            <c:when test="${referenceBookInquiry.isAnswer eq 'Y'}">
                                                                <div class="col-lg-12 form-label text-dark pt-3 cell-contents">
                                                                    <c:out value="${referenceBookInquiry.answer}" escapeXml="false"/>
                                                                </div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                                    문의글 확인 중입니다.
                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer" id="footerIdx">
                                        <div class="row">
                                            <div id="listGroup" class="col-3">
                                                <button type="button" class="btn btn-light-primary" style="background-color: #343a40; color: #FFFFFF" onclick="goList()">목록</button>
                                            </div>
                                            <c:choose>
                                                <c:when test="${referenceBookInquiry.isAnswer eq 'Y'}">
                                                    <div id="editGroup" class="col-9 d-flex justify-content-end">
                                                        <button
                                                                data-uid="${referenceBookInquiry.customerInquiryIndex}"
                                                                type="button"
                                                                id="deleteBtn"
                                                                class="btn btn-light-primary me-2"
                                                                style="background-color: #fff3cd; color: #181C32"
                                                                onclick="deleteAnswer()">
                                                            답변삭제
                                                        </button>
                                                        <button
                                                                data-uid="${referenceBookInquiry.uid}"
                                                                type="button"
                                                                class="btn btn-warning goAnswer"
                                                                style="background-color: #ffcd39; color: #181C32"
                                                        >
                                                            답변수정
                                                        </button>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="col-9 d-flex justify-content-end">
                                                        <button
                                                                data-uid="${referenceBookInquiry.uid}"
                                                                type="button"
                                                                class="btn btn-warning goAnswer"
                                                                style="background-color: #ffcd39; color: #181C32"
                                                        >
                                                            답변등록
                                                        </button>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
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
<script src="/assets/js/file.js"></script>
<script type="text/javascript">
    let inquiryCategory = `${referenceBookInquiry.inquiryCategory}`;
    let inquiryContent = `${referenceBookInquiry.content}`;
    let reviewContent = `${referenceBookInquiry.reviewContent}`;
    if(inquiryContent != '' || reviewContent != ''){
        let replaceContent = inquiryContent;
        if(inquiryCategory == '교재서평'){
            replaceContent = reviewContent;
        }
        replaceContent = replaceContent.replace(/\n/g, '<br>');
        document.getElementById('inquiryContent').innerHTML = replaceContent;
    }
    document.addEventListener('DOMContentLoaded', function (){
        let uid = document.getElementById('uid').value;
        let goAnswer = document.querySelectorAll('.goAnswer');
        let param = new URLSearchParams(location.search);
        goAnswer.forEach((el) => {
            el.addEventListener('click', function(){
                location.href = '/reference-book/inquiry-answer-form/' + uid + '?' + param;
            })
        })
    })

    function editIsOpen(element){
        let isOpen = element.dataset.isOpen;
        let textContent = '비공개';
        if(isOpen == 'N'){
            textContent = '공개';
        }
        Swal.fire({
            title: '해당 게시글을 '+ textContent + '로 전환하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '확인',
            cancelButtonText: '취소'
        })
        .then(async (result) => {
            if (result.isConfirmed) {
                let referenceBookReviewIndex = element.dataset.reviewIndex;
                let isOpen = element.dataset.isOpen;
                if(isOpen == 'Y'){
                    isOpen = 'N';
                }else{
                    isOpen = 'Y';
                }
                let data = {
                    referenceBookReviewIndex: referenceBookReviewIndex,
                    isOpen: isOpen
                }

                try {
                    const response = await fetch('/api/v1/customer/inquiry/reference-book-answer', {
                        method: 'PUT',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                        body: JSON.stringify(data)
                    });

                    const result = await response.json();

                    if (result) {
                        if (result.resultCode == 0) {
                            Swal.fire({
                                title: '등록 실패',
                                text: '등록 처리에 실패되었습니다. \n다시 시도해주세요.',
                                icon: 'error',
                                confirmButtonText: '확인'
                            })
                        }
                        Swal.fire({
                            title: '등록 완료',
                            text: '등록되었습니다.',
                            icon: 'success',
                            confirmButtonText: '확인'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                location.href = '/reference-book/inquiry-review/' + referenceBookReviewIndex;
                            }
                        })
                    }
                } catch (Exception) {
                    console.error(Exception);
                }
            }
        })
    }
    const deleteAnswer = async() => {
        Swal.fire({
            title: '게시물 삭제',
            text: '등록하신 게시물을 삭제 하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '확인',
            cancelButtonText: '취소'
        })
            .then(async (result) => {
                if (result.isConfirmed) {
                    let uid = document.getElementById('uid').value;
                    let data = {
                        uid: uid,
                        answer: 'delete answer'
                    }

                    let kind = 'reference-book';
                    try {
                        const response = await fetch('/api/v1/customer/inquiry/' + kind + '-answer', {
                            method: 'PUT',
                            headers: {
                                'Content-Type': 'application/json',
                            },
                            body: JSON.stringify(data)
                        });

                        const result = await response.json();

                        if (result) {
                            if (result.resultCode == 0) {
                                Swal.fire({
                                    title: '삭제 실패',
                                    text: '삭체 처리에 실패되었습니다. \n다시 시도해주세요.',
                                    icon: 'error',
                                    confirmButtonText: '확인'
                                })
                            }

                            let url = '/reference-book/inquiry/' + uid;
                            location.href = url;
                        }
                    } catch (Exception) {
                        console.error(Exception);
                    }
                }
            })
    }
    function goList(){
        location.href = `/reference-book/inquiry?inquiryKind=${search.inquiryKind}&inquiryCategory=${search.inquiryCategory}&school=${search.school}&subject=${search.subject}&isAnswer=${search.isAnswer}&searchValue=${search.searchValue}&pageNo=${pageNo}`;
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



</style>
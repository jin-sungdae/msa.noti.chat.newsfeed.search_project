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
                    <input type="hidden" name="uid" id="uid" value="<c:out value="${customerInquiry.uid}"/>"/>
                    <input type="hidden" name="kind" id="kind" value="<c:out value="${kind}"/>"/>
                    <input type="hidden" name="pageNo" id="pageNo" value="<c:out value="${pageNo}"/>"/>
                    <input type="hidden" name="startDate" id="startDate" value="<c:out value="${startDate}"/>"/>
                    <input type="hidden" name="endDate" id="endDate" value="<c:out value="${endDate}"/>"/>
                    <input type="hidden" name="inquiryCategory" id="inquiryCategory" value="<c:out value="${inquiryCategory}"/>"/>
                    <input type="hidden" name="searchValue" id="searchValue" value="<c:out value="${searchValue}"/>"/>
                    <div class="container-fluid">
                        <!-- 본문 내용 START -->
                        <form>
                            <div class="card mb-5 mb-xl-10">
                                <div class="card-header border-0 pt-5">
                                    <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                        <c:choose>
                                            <c:when test="${kind ne ''}">
                                                <c:out value="${customerInquiry.inquiryKindTitle}"/> 문의
                                            </c:when>
                                            <c:otherwise>
                                                문의내역 관리
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="row mb-8">
                                        <div class="col-lg-4 row">
                                            <div class="col-lg-3">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3">작성자</label>
                                            </div>
                                            <div class="col-lg-9 row">
                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                    <c:out value="${customerInquiry.userName}"/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 row">
                                            <div class="col-lg-3">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3">작성일시</label>
                                            </div>
                                            <div class="col-lg-9 row">

                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                    <c:out value="${customerInquiry.regDate}"/>
                                                </div>
                                            </div>
                                        </div>
                                        <c:if test="${kind ne ''}">
                                            <div class="col-lg-4 row">
                                                <div class="col-lg-3">
                                                    <label class="col-lg-10 form-label fw-bolder text-dark pt-3">문의구분</label>
                                                </div>
                                                <div class="col-lg-9 row">

                                                    <div class="col-lg-4 form-label text-dark pt-3">
                                                        <c:out value="${customerInquiry.inquiryCategory}"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                    <c:if test="${kind eq ''}">
                                        <div class="row mb-8">
                                            <div class="col-lg-4 row">
                                                <div class="col-lg-3">
                                                    <label class="col-lg-10 form-label fw-bolder text-dark pt-3">구분</label>
                                                </div>
                                                <div class="col-lg-9 row">
                                                    <div class="col-lg-12 form-label text-dark pt-3">
                                                        <c:choose>
                                                            <c:when test="${customerInquiry.inquiryCategory eq '첫걸음'}">
                                                                독서평설첫걸음
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:out value="${customerInquiry.inquiryCategory}"/>독서평설
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">제목</label>
                                            </div>
                                            <div class="col-lg-11">
                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                    <c:out value="${customerInquiry.title}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3">문의내용</label>
                                            </div>
                                            <div class="col-lg-11">
                                                <div class="col-lg-12 form-label text-dark pt-3" id="inquiryContent">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3">첨부파일</label>
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
                                                            <jsp:param name="parentIndex" value="${customerInquiry == null ? '' : customerInquiry.customerInquiryIndex}"/>
                                                            <jsp:param name="parentUid" value="${customerInquiry == null ? uid : customerInquiry.uid}"/>
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
                                    <c:if test="${kind eq ''}">
                                        <div class="row mb-8">
                                            <div class="col-lg-4 row">
                                                <div class="col-lg-3">
                                                    <label class="col-lg-10 form-label fw-bolder text-dark pt-3">SNS 수신여부</label>
                                                </div>
                                                <div class="col-lg-9 row">
                                                    <div class="col-lg-4 form-label text-dark pt-3">
                                                        <c:out value="${customerInquiry.isSms eq 'Y'? '예':'아니오'}"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-4 row">
                                                <div class="col-lg-3">
                                                    <label class="col-lg-10 form-label fw-bolder text-dark pt-3">휴대폰 번호</label>
                                                </div>
                                                <div class="col-lg-9 row text-dark pt-3">
                                                    <c:out value="${customerInquiry.phoneNo}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                            <div class="card mb-5 mb-xl-10">
                                <div id=info">
                                    <div class="card-header border-0 pt-5">
                                        <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                            답변 정보
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="row mb-8">
                                            <div class="col-lg-4 row">
                                                <div class="col-lg-3">
                                                    <label class="col-lg-10 form-label fw-bolder text-dark pt-3">답변자</label>
                                                </div>
                                                <div class="col-lg-8">
                                                    <div class="col-lg-12 form-label text-dark pt-3">
                                                        <c:out value="${customerInquiry.isAnswer eq 'Y'? customerInquiry.answerAdmin:admin.getAdminNameWithDept()}"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 row">
                                                <div class="col-lg-3">
                                                    <label class="col-lg-10 form-label fw-bolder text-dark pt-3">답변일시</label>
                                                </div>
                                                <div class="col-lg-9 row">
                                                    <div class="col-lg-12 form-label text-dark pt-3">
                                                        <c:choose>
                                                            <c:when test="${customerInquiry.isAnswer eq 'Y'}">
                                                                <c:out value="${customerInquiry.answerRegDate}"/>
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
                                                        <c:when test="${customerInquiry.isAnswer eq 'Y'}">
                                                            <div class="col-lg-12 form-label text-dark pt-3 cell-contents">
                                                                <c:out value="${customerInquiry.answer}" escapeXml="false"/>
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
                                    <div class="card-footer" id="footerIdx">
                                        <div class="row">
                                            <div id="listGroup" class="col-3">
                                                <c:if test="${empty kind}">
                                                    <a type="button" class="btn btn-light-primary" style="background-color: #343a40; color: #FFFFFF" href="/reading-review/inquiry?pageNo=${pageNo}&startDate=${startDate}&endDate=${endDate}&inquiryCategory=${inquiryCategory}&searchValue=${searchValue}">목록</a>
                                                </c:if>
                                                <c:if test="${not empty kind}">
                                                    <a type="button" class="btn btn-light-primary" style="background-color: #343a40; color: #FFFFFF" href="/customer/inquiry/${kind}?pageNo=${pageNo}&startDate=${startDate}&endDate=${endDate}&inquiryCategory=${inquiryCategory}&searchValue=${searchValue}">목록</a>
                                                </c:if>
                                            </div>
                                            <c:choose>
                                                <c:when test="${customerInquiry.isAnswer eq 'Y'}">
                                                    <div id="editGroup" class="col-9 d-flex justify-content-end">
                                                        <button
                                                                data-uid="${customerInquiry.customerInquiryIndex}"
                                                                type="button"
                                                                id="deleteBtn"
                                                                class="btn btn-light-primary me-2"
                                                                style="background-color: #fff3cd; color: #181C32">
                                                            답변삭제
                                                        </button>
                                                        <button
                                                                data-uid="${customerInquiry.uid}"
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
                                                                data-uid="${customerInquiry.uid}"
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
<script src="/assets/js/file.js"></script>
<script type="text/javascript">
    let inquiryContent = `${customerInquiry.content}`;
    let pageNo = document.getElementById('pageNo').value;
    let startDate = document.getElementById('startDate').value;
    let endDate = document.getElementById('endDate').value;
    let inquiryCategory = document.getElementById('inquiryCategory').value;
    let searchValue = document.getElementById('searchValue').value;
    let kind = document.getElementById('kind').value;
    if(inquiryContent != ''){
        inquiryContent = inquiryContent.replace(/\n/g, '<br>');
        document.getElementById('inquiryContent').innerHTML = inquiryContent;
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

                    let kind = document.getElementById('kind').value;
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

                            let url = '/customer/inquiry/' + kind + '/' + uid;
                            if(kind == ''){
                                url = '/reading-review/inquiry/' + document.getElementById('uid').value;
                            }
                            location.href = url;
                        }
                    } catch (Exception) {
                        console.error(Exception);
                    }
                }
            })
    }

    document.addEventListener('DOMContentLoaded', function (){
        let uid = document.getElementById('uid').value;
        let kind = document.getElementById('kind').value;
        let goAnswer = document.querySelectorAll('.goAnswer');
        goAnswer.forEach((el) => {
            el.addEventListener('click', function(){
                let url = '/customer/inquiry/' + kind + '-answer-form/' + uid;
                if(kind == ''){
                    url = '/reading-review/inquiry-answer-form/' + uid;
                }
                location.href = url + '?pageNo=' + pageNo + '&startDate=' + startDate + '&endDate=' + endDate + '&inquiryCategory=' + inquiryCategory + '&searchValue=' + searchValue;;
            })
        })
        if(document.getElementById('deleteBtn')) {
            document.getElementById('deleteBtn').addEventListener('click', () => deleteAnswer());
        }
    })
    function goList(){
        let url = '/customer/inquiry/' + kind;
        if(kind == ''){
            url = '/reading-review/inquiry';
        }
        location.href = url + '?pageNo=' + pageNo + '&startDate=' + startDate + '&endDate=' + endDate + '&inquiryCategory=' + inquiryCategory + '&searchValue=' + searchValue;
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
    .cell-contents p img {
        max-width: 100%;
    }
</style>
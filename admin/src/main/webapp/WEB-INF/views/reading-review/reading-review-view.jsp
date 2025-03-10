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
                        <form id="readingReviewForm" name="readingReviewForm">
                            <input type="hidden" name="uid" value="${uid}"/>
                            <div class="card shadow-sm">
                                <div class="card-header">
                                    <h3 class="card-title fw-bolder">기본정보</h3>
                                </div>
                                <div class="card-body">
                                    <div class="row mb-6">
                                        <label class="col-2 fw-bolder fs-6 w-sm-175px">구분</label>
                                        <div class="col-lg-6">
                                            <c:out value="${readingReview.readingReviewType.value}"/>
                                        </div>
                                    </div>
                                    <div class="row mb-6">
                                        <label class="col-2 fw-bolder w-sm-175px">발행월호</label>
                                        <div class="col-lg-6">
                                            <c:out value="${readingReview.year}"/>년&nbsp;<c:out value="${readingReview.month}"/>월호
                                        </div>
                                    </div>
                                    <div class="row mb-6">
                                        <label class="col-2 col-form-label fw-bolder w-sm-175px">썸네일</label>
                                        <div class="col">
                                            <div class="fv-row fv-plugins-icon-container col-lg-10 flex-column" id="thumbnailDropzone">
                                                <!-- 파일 업로드 섹션 -->
                                                <jsp:include page="/FileFormINC" flush="false">
                                                    <jsp:param name="fileFormType" value="Y" />
                                                    <jsp:param name="viewType" value="view" />
                                                    <jsp:param name="isImage" value="true" />
                                                    <jsp:param name="hasOrder" value="false" />
                                                    <jsp:param name="parentTable" value="READING_REVIEW"/>
                                                    <jsp:param name="parentUid" value="${uid}"/>
                                                    <jsp:param name="parentType" value="THUMBNAIL"/>
                                                    <jsp:param name="maxFileCount" value="2"/>
                                                    <jsp:param name="isSecure" value="N"/>
                                                    <jsp:param name="DZID" value="dz0"/>
                                                    <jsp:param name="dropzoneIndex" value="0"/>
                                                    <jsp:param name="description" value="파일 크기는 1mb 이하, jpg, jpeg, bmp, gif, png, webp 형식의 파일만 가능합니다."/>
                                                </jsp:include>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-6">
                                        <label class="col-2 fw-bolder w-sm-175px">품절여부</label>
                                        <div class="col-lg-3">
                                            <c:out value="${readingReview.isSoldOut}"/>
                                        </div>
                                    </div>
                                    <div class="row mb-6">
                                        <label class="col-2 fw-bolder w-sm-175px">노출여부</label>
                                        <div class="col-lg-3">
                                            <c:out value="${readingReview.isOpen}"/>
                                        </div>
                                    </div>
                                    <div class="row mb-6">
                                        <label class="col-2 fw-bolder w-sm-175px">인트로 노출여부</label>
                                        <div class="col-lg-3">
                                            <c:out value="${readingReview.isIntro}"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <!-- begin :: 목차 정보 카드 -->
                            <div class="card shadow-sm">
                                <div class="card-header">
                                    <h3 class="card-title fw-bolder">목차정보</h3>
                                </div>
                                <div class="card-body" id="readingReviewContentsCard">
                                    <c:forEach items="${readingReview.readingReviewContentsList}" var="readingReviewContents" varStatus="status">
                                    <div data-section="contents">
                                        <div class="row mb-6">
                                            <label class="col-2 fw-bolder fs-6 w-sm-175px">목차명</label>
                                            <div class="col-lg-8">
                                                <c:out value="${readingReviewContents.contentsTitle}"/>
                                            </div>
                                        </div>
                                        <div class="row mb-6">
                                            <label class="col-2 fw-bolder fs-6 w-sm-175px">미리보기</label>
                                            <div class="col-lg-10">
                                                <a href="<c:out value="${readingReviewContents.previewUrl}"/>" target="_blank"><c:out value="${readingReviewContents.previewUrl}"/></a>
                                            </div>
                                        </div>
                                        <div class="row mb-6">
                                            <label class="col-2 fw-bolder fs-6 w-sm-175px">세부목차</label>
                                            <div class="col-lg-10" data-name="contentsDetail">
                                                <div data-section="contentsDetail">
                                                    <c:forEach items="${readingReviewContents.readingReviewContentsDetailList}" var="item" varStatus="status">
                                                    <div class="row align-items-center">
                                                        &#8226;
                                                        <div class="col-lg-7 fv-row fv-plugins-icon-container">
                                                            <c:out value="${item.contentsDetail}"/> : <c:out value="${item.contentsDetailTitle}"/>
                                                        </div>
                                                    </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="separator my-10"></div>
                                    </c:forEach>
                                </div>
                            </div>
                            <!-- end :: 목차 정보 카드 -->
                            <br>
                            <!-- begin :: 작성자 정보 카드 및 버튼 영역 -->
                            <div class="card shadow-sm">
                                <div class="card-body">
                                    <div class="row mb-6">
                                        <label class="col-2 fw-bolder fs-6 w-sm-175px">최초 작성자</label>
                                        <div class="col-lg-4">
                                            <c:out value="${readingReview.adminName}"/>
                                        </div>
                                        <label class="col-2 fw-bolder fs-6 w-sm-175px">최초 작성일시</label>
                                        <div class="col-lg-4">
                                            <c:out value="${readingReview.regDate}"/>
                                        </div>
                                    </div>
                                    <div class="row mb-6">
                                        <label class="col-2 fw-bolder fs-6 w-sm-175px">수정자</label>
                                        <div class="col-lg-4">
                                            <c:out value="${readingReview.modAdminName}"/>
                                        </div>
                                        <label class="col-2 fw-bolder fs-6 w-sm-175px">수정일시</label>
                                        <div class="col-lg-4">
                                            <c:out value="${readingReview.modDate}"/>
                                        </div>
                                    </div>

                                </div>
                                <div class="card-footer d-flex justify-content-end">
                                    <div class="col d-flex justify-content-start">
                                        <button type="button" class="btn btn-dark" onclick="location.href='/reading-review/reading-review' + location.search">목록</button>
                                    </div>
                                    <div class="col d-flex justify-content-end">
                                        <button type="button" class="btn btn-danger me-3" onclick="deleteReadingReview('<c:out value="${readingReview.uid}"/>');" <c:if test="${readingReview.isIntro eq 'Y'}">disabled</c:if>>삭제</button>
                                        <button type="button" class="btn btn-warning" onclick="modifyReadingReview('<c:out value="${readingReview.uid}"/>')">수정</button>
                                    </div>
                                </div>
                            </div>
                            <!-- end :: 작성자 정보 카드 및 버튼 영역 -->
                        </form>
                    </div>
                </div>
            </div>
            <%@ include file="/WEB-INF/views/common/inc/FooterINC.jsp" %>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
async function deleteReadingReview(uid) {
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
            const response = await fetch('/api/v1/reading-review/' + uid, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                },
            });
            const res = await response.json();
            if(res.result) {
                Swal.fire({
                    text: '삭제되었습니다.',
                    icon: 'success',
                    buttonsStyling: !1,
                    confirmButtonText: '확인',
                    customClass: {confirmButton: 'btn btn-primary'}
                }).then(() => {
                    window.location.href = '/reading-review/reading-review' + location.search;
                });
            }
        }
    });
}

function modifyReadingReview(uid) {
    location.href = '/reading-review/reading-review-mod-form/' + uid + location.search;
}
</script>
</html>

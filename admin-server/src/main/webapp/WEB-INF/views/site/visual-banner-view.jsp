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
                        <input type="hidden" name="menu" id="menu" value="${menu}">
                        <form id="bannerForm">
                            <input type="hidden" name="uid" id="uid" value="${uid}"/>
                            <input type="hidden" name="disabledUid" id="disabledUid">
                            <input type="hidden" name="visualBannerLocation" value="${fn:toUpperCase(menu)}">
                            <div class="card mb-5 mb-xl-10">
                                <div class="card-header border-0 pt-5">
                                    <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                        메인 배너 관리
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="row mb-8">
                                        <div class="col-lg-6 row">
                                            <div class="col-lg-2 d-flex justify-content-center align-items-center">
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3">작성자</label>
                                            </div>
                                            <div class="col-lg-10 row">
                                                <div id="userType" class="col-lg-4 form-label text-dark pt-3">
                                                    <c:out value="${data.adminName}"/>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="col-lg-6 row">
                                            <div class="col-lg-2 d-flex justify-content-center align-items-center">
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3">작성일시</label>
                                            </div>
                                            <div class="col-lg-10 row">
                                                <div class="col-lg-4 form-label text-dark pt-3">
<%--                                                    <c:out value="${data.modDate eq null ? data.regDate : data.modDate}"/>--%>
                                                    <c:out value="${data.regDate}"/>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3 ">제목</label>
                                            </div>

                                            <div class="col-lg-10 d-flex align-items-center">
                                                <span><c:out value="${data.title}"/></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8" id="floatingBanner">
                                        <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                            <!-- 상위 라벨 "배너 이미지" -->
                                            <label class="form-label fw-bolder text-dark ">배너 이미지</label>
                                        </div>
                                        <div class="col-lg-11">
                                            <!-- "PC" 섹션 -->
                                            <div class="row">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                        <label class="col-lg-10 form-label fw-bolder text-dark ">PC</label>
                                                    </div>

                                                    <div class="col-lg-11" id="dropzoneContainer">
                                                        <!-- 파일 업로드 섹션 -->
                                                        <jsp:include page="/FileFormINC" flush="false">
                                                            <jsp:param name="fileFormType" value="Y" />
                                                            <jsp:param name="viewType" value="${viewType}" />
                                                            <jsp:param name="isImage" value="false" />
                                                            <jsp:param name="hasOrder" value="false" />
                                                            <jsp:param name="parentTable" value="VISUAL_BANNER"/>
                                                            <jsp:param name="parentUid" value="${uid}"/>
                                                            <jsp:param name="parentType" value="PC"/>
                                                            <jsp:param name="maxFileCount" value="1"/>
                                                            <jsp:param name="isSecure" value="N"/>
                                                            <jsp:param name="DZID" value="dz1"/>
                                                            <jsp:param name="description" value="섬네일 이미지는 2560px x 1040px로 업로드해 주세요. (파일명 띄어쓰기 금지) <br>* 파일 크기는 1Mb이하, jpg 형식의 파일만 가능합니다."/>
                                                        </jsp:include>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- "Mobile" 섹션 -->
                                            <div class="row">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                        <label class="col-lg-10 form-label fw-bolder text-dark ">Mobile</label>
                                                    </div>
                                                    <div class="col-lg-11" id="dropzoneContainer2">
                                                        <!-- 파일 업로드 섹션 -->
                                                        <jsp:include page="/FileFormINC" flush="false">
                                                            <jsp:param name="fileFormType" value="Y" />
                                                            <jsp:param name="viewType" value="${viewType}" />
                                                            <jsp:param name="isImage" value="false" />
                                                            <jsp:param name="hasOrder" value="false" />
                                                            <jsp:param name="parentTable" value="VISUAL_BANNER"/>
                                                            <jsp:param name="parentUid" value="${uid}"/>
                                                            <jsp:param name="parentType" value="MOBILE"/>
                                                            <jsp:param name="maxFileCount" value="1"/>
                                                            <jsp:param name="isSecure" value="N"/>
                                                            <jsp:param name="DZID" value="dz2"/>
                                                            <jsp:param name="description" value="섬네일 이미지는 2560px x 1040px로 업로드해 주세요. (파일명 띄어쓰기 금지) <br>* 파일 크기는 1Mb이하, jpg 형식의 파일만 가능합니다."/>
                                                        </jsp:include>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3">배너 이미지 링크</label>
                                            </div>

                                            <div class="col-lg-10 d-flex align-items-center">
                                                <a href="<c:out value="${data.linkUrl}"/>" target="_blank"><c:out value="${data.linkUrl}"/></a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3">노출여부</label>
                                            </div>
                                            <div class="col-lg-1 d-flex align-items-center">
                                                <span>${data.isOpen}</span>
                                            </div>
                                            <c:if test="${menu ne 'reading-review'}">
                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                <label class="form-label fw-bolder text-dark pt-3">노출순서</label>
                                            </div>
                                            <div class="col-lg-1 d-flex align-items-center">
                                                <span>${empty data.sortOrder ? '-' : data.sortOrder}</span>
                                            </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>

                                <c:if test="${menu ne 'reading-review'}">
                                <div class="card-footer" id="footerIdx">
                                    <div class="row">
                                        <div id="listGroup" class="col-3">
                                            <button type="button" data-nt-action="goList" href="/${menu}/visual-banner" class="btn btn-light-primary" style="background-color: #343a40; color: #FFFFFF">목록</button>
                                        </div>
                                        <div id="editGroup" class="col-9 d-flex justify-content-end">
                                            <button
                                                    type="button"
                                                    class="btn btn-light-primary me-2"
                                                    style="background-color: #fff3cd; color: #181C32"
                                                    onclick="deleteBannerData()"
                                            ${data.sortOrder ne null ? 'disabled' : ''}
                                            >
                                                삭제
                                            </button>
                                            <button id="saveButton" type="button" class="btn btn-warning" style="background-color: #ffcd39; color: #181C32">
                                                수정
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                </c:if>
                            </div>

                        </form>
                        <!-- 본문 내용 END -->
                        <c:if test="${menu eq 'reading-review'}">
                            <form id="bannerForm2">
                                <input type="hidden" id="readingReviewUid" name="uid" value="${readingReview.uid}">
                                <div class="card mb-5 mb-xl-10">
                                    <div class="card-header border-0 pt-5">
                                        <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                            후기로 입증된 독서평설
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                    <label class="col-lg-9 form-label fw-bolder text-dark pt-3 ">동영상 URL</label>
                                                </div>

                                                <div class="col-lg-10 d-flex align-items-center">
                                                    <a target="_blank" href="<c:out value="${readingReview.videoUrl}"/>"><c:out value="${readingReview.videoUrl}"/></a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-8">
                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                <!-- 상위 라벨 "배너 이미지" -->
                                                <label class="form-label fw-bolder text-dark ">인터뷰 이미지</label>
                                            </div>
                                            <div class="col-lg-11">
                                                <!-- "PC" 섹션 -->
                                                <div class="row">
                                                    <div class="col-lg-12 row">
                                                        <!-- 파일 업로드 섹션 -->
                                                        <jsp:include page="/FileFormINC" flush="false">
                                                            <jsp:param name="fileFormType" value="Y" />
                                                            <jsp:param name="viewType" value="${viewType}" />
                                                            <jsp:param name="isImage" value="false" />
                                                            <jsp:param name="hasOrder" value="false" />
                                                            <jsp:param name="parentTable" value="READING_REVIEW_MAIN"/>
                                                            <jsp:param name="parentUid" value="${readingReview.uid}"/>
                                                            <jsp:param name="parentType" value="INTERVIEW"/>
                                                            <jsp:param name="maxFileCount" value="2"/>
                                                            <jsp:param name="isSecure" value="N"/>
                                                            <jsp:param name="DZID" value="dz3"/>
                                                            <jsp:param name="description" value="이미지는 280px x 400px로 업로드해 주세요. (파일명 띄어쓰기 금지) <br>* 파일 크기는 1Mb이하, jpg 형식의 파일만 가능합니다."/>
                                                        </jsp:include>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-8">
                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                <!-- 상위 라벨 "배너 이미지" -->
                                                <label class="form-label fw-bolder text-dark ">인터뷰 Q/A</label>
                                            </div>
                                            <div class="col-lg-11">
                                                <!-- "PC" 섹션 -->
                                                <div class="row">
                                                    <div class="col-lg-12 row">
                                                        <div class="col-lg-11 fv-row fv-plugins-icon-container">
                                                            <span class="fw-bolder text-dark">Q. </span><span><c:out value="${readingReview.question1}"/></span>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12 row">
                                                        <div class="col-lg-11 fv-row fv-plugins-icon-container">
                                                            <span class="fw-bolder text-dark">A. </span><span><c:out value="${readingReview.answer1}"/></span>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-12 row mt-5">
                                                        <div class="col-lg-11 fv-row fv-plugins-icon-container">
                                                            <span class="fw-bolder text-dark">Q. </span><span><c:out value="${readingReview.question2}"/></span>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12 row">
                                                        <div class="col-lg-11 fv-row fv-plugins-icon-container">
                                                            <span class="fw-bolder text-dark">A. </span><span><c:out value="${readingReview.answer2}"/></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="card mb-5 mb-xl-10">
                                    <div class="card-header border-0 pt-5">
                                        <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                            생생 독자 후기
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="row mb-8" id="floatingBanner">
                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                <!-- 상위 라벨 "배너 이미지" -->
                                                <label class="form-label fw-bolder text-dark ">후기 배너</label>
                                            </div>
                                            <div class="col-lg-11">
                                                <!-- "PC" 섹션 -->
                                                <div class="row">
                                                    <div class="col-lg-12 row">
                                                        <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                            <label class="col-lg-10 form-label fw-bolder text-dark ">1.</label>
                                                        </div>
                                                        <div class="col-lg-11">
                                                            <div class="row">
                                                                <div class="col-lg-12 row">
                                                                    <!-- 파일 업로드 섹션 -->
                                                                    <jsp:include page="/FileFormINC" flush="false">
                                                                        <jsp:param name="fileFormType" value="Y" />
                                                                        <jsp:param name="viewType" value="${viewType}" />
                                                                        <jsp:param name="isImage" value="false" />
                                                                        <jsp:param name="hasOrder" value="false" />
                                                                        <jsp:param name="parentTable" value="READING_REVIEW_MAIN"/>
                                                                        <jsp:param name="parentUid" value="${readingReview.uid}"/>
                                                                        <jsp:param name="parentType" value="REVIEW1"/>
                                                                        <jsp:param name="maxFileCount" value="2"/>
                                                                        <jsp:param name="isSecure" value="N"/>
                                                                        <jsp:param name="DZID" value="dz4"/>
                                                                        <jsp:param name="description" value="이미지는 480px x 604px로 업로드해 주세요. (파일명 띄어쓰기 금지) <br>* 파일 크기는 1Mb이하, jpg 형식의 파일만 가능합니다."/>
                                                                    </jsp:include>
                                                                </div>
                                                                <div class="col-lg-12 fv-row fv-plugins-icon-container">
                                                                    <a target="_blank" href="<c:out value="${readingReview.reviewUrl1}"/>"<span><c:out value="${readingReview.reviewUrl1}"/></span></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12 row mt-5">
                                                        <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                            <label class="col-lg-10 form-label fw-bolder text-dark ">2.</label>
                                                        </div>
                                                        <div class="col-lg-11">
                                                            <div class="row">
                                                                <div class="col-lg-12 row">
                                                                    <!-- 파일 업로드 섹션 -->
                                                                    <jsp:include page="/FileFormINC" flush="false">
                                                                        <jsp:param name="fileFormType" value="Y" />
                                                                        <jsp:param name="viewType" value="${viewType}" />
                                                                        <jsp:param name="isImage" value="false" />
                                                                        <jsp:param name="hasOrder" value="false" />
                                                                        <jsp:param name="parentTable" value="READING_REVIEW_MAIN"/>
                                                                        <jsp:param name="parentUid" value="${readingReview.uid}"/>
                                                                        <jsp:param name="parentType" value="REVIEW2"/>
                                                                        <jsp:param name="maxFileCount" value="2"/>
                                                                        <jsp:param name="isSecure" value="N"/>
                                                                        <jsp:param name="DZID" value="dz5"/>
                                                                        <jsp:param name="description" value="이미지는 480px x 604px로 업로드해 주세요. (파일명 띄어쓰기 금지) <br>* 파일 크기는 1Mb이하, jpg 형식의 파일만 가능합니다."/>
                                                                    </jsp:include>
                                                                </div>
                                                                <div class="col-lg-12 fv-row fv-plugins-icon-container">
                                                                    <a target="_blank" href="<c:out value="${readingReview.reviewUrl2}"/>"<span><c:out value="${readingReview.reviewUrl2}"/></span></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-12 row mt-5">
                                                        <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                            <label class="col-lg-10 form-label fw-bolder text-dark ">3.</label>
                                                        </div>
                                                        <div class="col-lg-11">
                                                            <div class="row">
                                                                <div class="col-lg-12 row">
                                                                    <!-- 파일 업로드 섹션 -->
                                                                    <jsp:include page="/FileFormINC" flush="false">
                                                                        <jsp:param name="fileFormType" value="Y" />
                                                                        <jsp:param name="viewType" value="${viewType}" />
                                                                        <jsp:param name="isImage" value="false" />
                                                                        <jsp:param name="hasOrder" value="false" />
                                                                        <jsp:param name="parentTable" value="READING_REVIEW_MAIN"/>
                                                                        <jsp:param name="parentUid" value="${readingReview.uid}"/>
                                                                        <jsp:param name="parentType" value="REVIEW3"/>
                                                                        <jsp:param name="maxFileCount" value="2"/>
                                                                        <jsp:param name="isSecure" value="N"/>
                                                                        <jsp:param name="DZID" value="dz6"/>
                                                                        <jsp:param name="description" value="이미지는 480px x 604px로 업로드해 주세요. (파일명 띄어쓰기 금지) <br>* 파일 크기는 1Mb이하, jpg 형식의 파일만 가능합니다."/>
                                                                    </jsp:include>
                                                                </div>
                                                                <div class="col-lg-12 fv-row fv-plugins-icon-container">
                                                                    <a target="_blank" href="<c:out value="${readingReview.reviewUrl3}"/>"<span><c:out value="${readingReview.reviewUrl3}"/></span></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12 row mt-5">
                                                        <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                            <label class="col-lg-10 form-label fw-bolder text-dark ">4.</label>
                                                        </div>
                                                        <div class="col-lg-11">
                                                            <div class="row">
                                                                <div class="col-lg-12 row">
                                                                    <!-- 파일 업로드 섹션 -->
                                                                    <jsp:include page="/FileFormINC" flush="false">
                                                                        <jsp:param name="fileFormType" value="Y" />
                                                                        <jsp:param name="viewType" value="${viewType}" />
                                                                        <jsp:param name="isImage" value="false" />
                                                                        <jsp:param name="hasOrder" value="false" />
                                                                        <jsp:param name="parentTable" value="READING_REVIEW_MAIN"/>
                                                                        <jsp:param name="parentUid" value="${readingReview.uid}"/>
                                                                        <jsp:param name="parentType" value="REVIEW4"/>
                                                                        <jsp:param name="maxFileCount" value="2"/>
                                                                        <jsp:param name="isSecure" value="N"/>
                                                                        <jsp:param name="DZID" value="dz7"/>
                                                                        <jsp:param name="description" value="이미지는 480px x 604px로 업로드해 주세요. (파일명 띄어쓰기 금지) <br>* 파일 크기는 1Mb이하, jpg 형식의 파일만 가능합니다."/>
                                                                    </jsp:include>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-12 fv-row fv-plugins-icon-container">
                                                                <a target="_blank" href="<c:out value="${readingReview.reviewUrl4}"/>"<span><c:out value="${readingReview.reviewUrl4}"/></span></a>
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
                                                <button type="button" data-nt-action="goList" href="/${menu}/visual-banner" class="btn btn-light-primary" style="background-color: #343a40; color: #FFFFFF">목록</button>
                                            </div>
                                            <div id="editGroup" class="col-9 d-flex justify-content-end">
                                                <button
                                                        type="button"
                                                        class="btn btn-light-primary me-2"
                                                        style="background-color: #fff3cd; color: #181C32"
                                                        onclick="deleteBannerData()"
                                                    ${data.isOpen eq 'Y' ? 'disabled' : ''}
                                                >
                                                    삭제
                                                </button>
                                                <button id="saveButton" type="button" class="btn btn-warning" style="background-color: #ffcd39; color: #181C32">
                                                    수정
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </c:if>
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

    const uid = document.getElementById('uid').value;
    const menu = document.getElementById('menu').value;

    const deleteBannerData = async () => {
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
                const response = await fetch(`/api/v1/site/visual-banner/\${uid}`, {
                    method: 'DELETE',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                });
                const res = await response.json();
                if(res.result) {
                    const url = `/\${menu}/visual-banner`;
                    window.location.href = url;
                }
            }
        });
    }

    document.getElementById('saveButton').addEventListener('click', () => {
        const url = `/\${menu}/visual-banner-mod-form?uid=\${uid}`;
        window.location.href = url;
    });

    document.querySelectorAll('[data-nt-action="goList"]').forEach(el => {
        el.addEventListener('click', function() {
            const url = '/${menu}/visual-banner' + location.search;
            location.href = url;
        })
    })

</script>
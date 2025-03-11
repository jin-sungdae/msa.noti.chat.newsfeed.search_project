<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nt" uri="tld/NTUtil.tld" %>
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
                                                    <c:out value="${adminName}"/>
                                                </div>

                                            </div>
                                        </div>
                                        <c:if test="${not empty data}">
                                            <div class="col-lg-6 row">
                                                <div class="col-lg-2 d-flex justify-content-center align-items-center ">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">작성일시</label>
                                                </div>
                                                <div class="col-lg-10 d-flex align-items-center">
                                                    <c:out value="${data.regDate}"/>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3 required">제목</label>
                                            </div>

                                            <div class="col-lg-10 fv-row fv-plugins-icon-container">
                                                <input type="text" class="form-control" placeholder="제목 입력" id="title" name="title" maxlength="50" value="${data.title}"  >
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                            <!-- 상위 라벨 "배너 이미지" -->
                                            <label class="form-label fw-bolder text-dark required">배너 이미지</label>
                                        </div>
                                        <div class="col-lg-11">
                                            <!-- "PC" 섹션 -->
                                            <div class="row">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                        <label class="col-lg-10 form-label fw-bolder text-dark ">PC</label>
                                                    </div>

                                                    <div class="col-lg-11" id="dz1Container">
                                                        <!-- 파일 업로드 섹션 -->
                                                        <jsp:include page="/FileFormINC" flush="false">
                                                            <jsp:param name="fileFormType" value="Y" />
                                                            <jsp:param name="isImage" value="false" />
                                                            <jsp:param name="hasOrder" value="false" />
                                                            <jsp:param name="parentTable" value="VISUAL_BANNER"/>
                                                            <jsp:param name="parentUid" value="${uid}"/>
                                                            <jsp:param name="parentType" value="PC"/>
                                                            <jsp:param name="maxFileCount" value="2"/>
                                                            <jsp:param name="isSecure" value="N"/>
                                                            <jsp:param name="DZID" value="dz1"/>
                                                            <jsp:param name="dropzoneIndex" value="0"/>
                                                            <jsp:param name="description" value="섬네일 이미지는 ${nt:getPcDpi(menu)}로 업로드해 주세요. (파일명 띄어쓰기 금지) <br>* 파일 크기는 1Mb이하, jpg, jpeg, png 형식의 파일만 가능합니다."/>
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
                                                    <div class="col-lg-11" id="dz2Container">
                                                        <!-- 파일 업로드 섹션 -->
                                                        <jsp:include page="/FileFormINC" flush="false">
                                                            <jsp:param name="fileFormType" value="Y" />
                                                            <jsp:param name="viewType" value="${viewType}" />
                                                            <jsp:param name="isImage" value="false" />
                                                            <jsp:param name="hasOrder" value="false" />
                                                            <jsp:param name="parentTable" value="VISUAL_BANNER"/>
                                                            <jsp:param name="parentUid" value="${uid}"/>
                                                            <jsp:param name="parentType" value="MOBILE"/>
                                                            <jsp:param name="maxFileCount" value="2"/>
                                                            <jsp:param name="isSecure" value="N"/>
                                                            <jsp:param name="DZID" value="dz2"/>
                                                            <jsp:param name="dropzoneIndex" value="1"/>
                                                            <jsp:param name="description" value="섬네일 이미지는 ${nt:getMobileDpi(menu)}로 업로드해 주세요. (파일명 띄어쓰기 금지) <br>* 파일 크기는 1Mb이하, jpg, jpeg, png 형식의 파일만 가능합니다."/>
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

                                            <div class="col-lg-10">
                                                <input type="text" class="form-control" name="linkUrl" placeholder="URL 경로 입력" maxlength="100" value="<c:out value="${data.linkUrl}"/>" >
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3 required">노출여부</label>
                                            </div>
                                            <div class="col-lg-2 row">
                                                <div class="col">
                                                    <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                        <input class="form-check-input" type="radio" name="isOpen" value="N" ${empty data ? 'checked' : data.isOpen eq 'N' ? 'checked' : ''}  id="isN" />
                                                        <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isN">
                                                            N
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                        <input class="form-check-input" type="radio" name="isOpen" value="Y" id="isY" ${data.isOpen eq 'Y' ? 'checked' : ''} />
                                                        <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isY">
                                                            Y
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 d-flex justify-content-center align-items-center">
                                                <span class="ms-2" style="color: gray;">* 노출여부 설정은 ${menu ne 'reading-review' ? 3 : 1}개만 등록 가능합니다.</span>
                                            </div>
                                            <c:if test="${menu ne 'reading-review'}">
                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                <label class="form-label fw-bolder text-dark pt-3">노출순서</label>
                                            </div>

                                            <div class="col-lg-2 fv-row fv-plugins-icon-container">
                                                <select
                                                        id="sortOrder"
                                                        name="sortOrder"
                                                        class="form-select form-select-solid"
                                                        data-control="select2"
                                                        data-hide-search="true"
                                                        data-placeholder="-"
                                                        ${empty data ? 'disabled' : data.isOpen eq 'N' ? 'disabled' : ''}
                                                >
                                                    <option value="">-</option>
                                                    <option value="1" ${data.sortOrder eq 1 ? 'selected' : ''} >1</option>
                                                    <option value="2" ${data.sortOrder eq 2 ? 'selected' : ''} >2</option>
                                                    <option value="3" ${data.sortOrder eq 3 ? 'selected' : ''} >3</option>
                                                </select>
                                            </div>
                                            </c:if>

                                        </div>
                                    </div>
                                </div>

                                <c:if test="${menu ne 'reading-review'}">
                                    <div class="card-footer" id="footerIdx">
                                        <div class="row">
                                            <div class="col-12 d-flex justify-content-end">
                                                <c:choose>
                                                    <c:when test="${viewType eq 'edit'}">
                                                        <button type="button" onclick="history.back()" class="btn btn-light-warning me-2" style="background-color: #fff3cd; color: #181C32" >
                                                            취소
                                                        </button>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="/${menu}/visual-banner" class="btn btn-light-warning me-2" style="background-color: #fff3cd; color: #181C32">
                                                            취소
                                                        </a>
                                                    </c:otherwise>
                                                </c:choose>
                                                <button
                                                        id="saveButton"
                                                        type="button"
                                                        class="btn btn-warning"
                                                        style="background-color: #ffcd39; color: #181C32"
                                                >
                                                    저장
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </form>
                        <c:if test="${menu eq 'reading-review'}">
                        <form id="bannerForm2">
                            <input type="hidden" id="readingReviewUid" name="uid" value="${readingReviewUid}">
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
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3 required">동영상 URL</label>
                                            </div>

                                            <div class="col-lg-10 fv-row fv-plugins-icon-container">
                                                <input type="text" class="form-control" placeholder="URL 경로 입력" name="videoUrl" maxlength="200" value="${readingReview.videoUrl}"  >
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                            <!-- 상위 라벨 "배너 이미지" -->
                                            <label class="form-label fw-bolder text-dark required">인터뷰 이미지</label>
                                        </div>
                                        <div class="col-lg-11">
                                            <!-- "PC" 섹션 -->
                                            <div class="row">
                                                <div class="col-lg-12 row" id="dz3Container">
                                                    <!-- 파일 업로드 섹션 -->
                                                        <jsp:include page="/FileFormINC" flush="false">
                                                            <jsp:param name="fileFormType" value="Y" />
                                                            <jsp:param name="isImage" value="false" />
                                                            <jsp:param name="hasOrder" value="false" />
                                                            <jsp:param name="parentTable" value="READING_REVIEW_MAIN"/>
                                                            <jsp:param name="parentUid" value="${readingReviewUid}"/>
                                                            <jsp:param name="parentType" value="INTERVIEW"/>
                                                            <jsp:param name="maxFileCount" value="2"/>
                                                            <jsp:param name="isSecure" value="N"/>
                                                            <jsp:param name="DZID" value="dz3"/>
                                                            <jsp:param name="dropzoneIndex" value="2"/>
                                                            <jsp:param name="description" value="이미지는 280px x 400px로 업로드해 주세요. (파일명 띄어쓰기 금지) <br>* 파일 크기는 1Mb이하, jpg, jpeg, png 형식의 파일만 가능합니다."/>
                                                        </jsp:include>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                            <!-- 상위 라벨 "배너 이미지" -->
                                            <label class="form-label fw-bolder text-dark required">인터뷰 Q/A</label>
                                        </div>
                                        <div class="col-lg-11">
                                            <!-- "PC" 섹션 -->
                                            <div class="row">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                        <label class="col-lg-10 form-label fw-bolder text-dark ">Q.</label>
                                                    </div>
                                                    <div class="col-lg-11 fv-row fv-plugins-icon-container">
                                                        <input type="text" class="form-control" placeholder="제목 입력" name="question1" maxlength="200" value="<c:out value="${readingReview.question1}"/>"  >
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                        <label class="col-lg-10 form-label fw-bolder text-dark ">A.</label>
                                                    </div>
                                                    <div class="col-lg-11 fv-row fv-plugins-icon-container">
                                                        <input type="text" class="form-control" placeholder="답변 입력" name="answer1" maxlength="200" value="<c:out value="${readingReview.answer1}"/>"  >
                                                    </div>
                                                </div>

                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                        <label class="col-lg-10 form-label fw-bolder text-dark ">Q.</label>
                                                    </div>
                                                    <div class="col-lg-11 fv-row fv-plugins-icon-container">
                                                        <input type="text" class="form-control" placeholder="제목 입력" name="question2" maxlength="200" value="<c:out value="${readingReview.question2}"/>" >
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                        <label class="col-lg-10 form-label fw-bolder text-dark ">A.</label>
                                                    </div>
                                                    <div class="col-lg-11 fv-row fv-plugins-icon-container">
                                                        <input type="text" class="form-control" placeholder="답변 입력" name="answer2" maxlength="200" value="<c:out value="${readingReview.answer2}"/>" >
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
                                            <label class="form-label fw-bolder text-dark required">후기 배너</label>
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
                                                            <div class="col-lg-12 row" id="dz4Container">
                                                                <!-- 파일 업로드 섹션 -->
                                                                    <jsp:include page="/FileFormINC" flush="false">
                                                                        <jsp:param name="fileFormType" value="Y" />
                                                                        <jsp:param name="isImage" value="false" />
                                                                        <jsp:param name="hasOrder" value="false" />
                                                                        <jsp:param name="parentTable" value="READING_REVIEW_MAIN"/>
                                                                        <jsp:param name="parentUid" value="${readingReviewUid}"/>
                                                                        <jsp:param name="parentType" value="REVIEW1"/>
                                                                        <jsp:param name="maxFileCount" value="2"/>
                                                                        <jsp:param name="isSecure" value="N"/>
                                                                        <jsp:param name="dropzoneIndex" value="3"/>
                                                                        <jsp:param name="DZID" value="dz4"/>
                                                                        <jsp:param name="description" value="이미지는 480px x 604px로 업로드해 주세요. (파일명 띄어쓰기 금지) <br>* 파일 크기는 1Mb이하, jpg, jpeg, png 형식의 파일만 가능합니다."/>
                                                                    </jsp:include>
                                                            </div>
                                                            <div class="col-lg-12 fv-row fv-plugins-icon-container">
                                                                <input type="text" class="form-control" placeholder="URL 경로 입력" name="reviewUrl1" maxlength="200" value="<c:out value="${readingReview.reviewUrl1}"/>" >
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                        <label class="col-lg-10 form-label fw-bolder text-dark ">2.</label>
                                                    </div>
                                                    <div class="col-lg-11">
                                                        <div class="row">
                                                            <div class="col-lg-12 row" id="dz5Container">
                                                                <!-- 파일 업로드 섹션 -->
                                                                    <jsp:include page="/FileFormINC" flush="false">
                                                                        <jsp:param name="fileFormType" value="Y" />
                                                                        <jsp:param name="isImage" value="false" />
                                                                        <jsp:param name="hasOrder" value="false" />
                                                                        <jsp:param name="parentTable" value="READING_REVIEW_MAIN"/>
                                                                        <jsp:param name="parentUid" value="${readingReviewUid}"/>
                                                                        <jsp:param name="parentType" value="REVIEW2"/>
                                                                        <jsp:param name="maxFileCount" value="2"/>
                                                                        <jsp:param name="isSecure" value="N"/>
                                                                        <jsp:param name="dropzoneIndex" value="4"/>
                                                                        <jsp:param name="DZID" value="dz5"/>
                                                                        <jsp:param name="description" value="이미지는 480px x 604px로 업로드해 주세요. (파일명 띄어쓰기 금지) <br>* 파일 크기는 1Mb이하, jpg, jpeg, png 형식의 파일만 가능합니다."/>
                                                                    </jsp:include>
                                                            </div>
                                                            <div class="col-lg-12 fv-row fv-plugins-icon-container">
                                                                <input type="text" class="form-control" placeholder="URL 경로 입력" name="reviewUrl2" maxlength="200" value="<c:out value="${readingReview.reviewUrl2}"/>"  >
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                        <label class="col-lg-10 form-label fw-bolder text-dark ">3.</label>
                                                    </div>
                                                    <div class="col-lg-11">
                                                        <div class="row">
                                                            <div class="col-lg-12 row" id="dz6Container">
                                                                <!-- 파일 업로드 섹션 -->
                                                                    <jsp:include page="/FileFormINC" flush="false">
                                                                        <jsp:param name="fileFormType" value="Y" />
                                                                        <jsp:param name="isImage" value="false" />
                                                                        <jsp:param name="hasOrder" value="false" />
                                                                        <jsp:param name="parentTable" value="READING_REVIEW_MAIN"/>
                                                                        <jsp:param name="parentUid" value="${readingReviewUid}"/>
                                                                        <jsp:param name="parentType" value="REVIEW3"/>
                                                                        <jsp:param name="maxFileCount" value="2"/>
                                                                        <jsp:param name="isSecure" value="N"/>
                                                                        <jsp:param name="dropzoneIndex" value="5"/>
                                                                        <jsp:param name="DZID" value="dz6"/>
                                                                        <jsp:param name="description" value="이미지는 480px x 604px로 업로드해 주세요. (파일명 띄어쓰기 금지) <br>* 파일 크기는 1Mb이하, jpg, jpeg, png 형식의 파일만 가능합니다."/>
                                                                    </jsp:include>
                                                            </div>

                                                            <div class="col-lg-12 fv-row fv-plugins-icon-container">
                                                                <input type="text" class="form-control" placeholder="URL 경로 입력" name="reviewUrl3" maxlength="200" value="<c:out value="${readingReview.reviewUrl3}"/>" >
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                        <label class="col-lg-10 form-label fw-bolder text-dark ">4.</label>
                                                    </div>
                                                    <div class="col-lg-11">
                                                        <div class="row">
                                                            <div class="col-lg-12 row" id="dz7Container">
                                                                <!-- 파일 업로드 섹션 -->
                                                                    <jsp:include page="/FileFormINC" flush="false">
                                                                        <jsp:param name="fileFormType" value="Y" />
                                                                        <jsp:param name="isImage" value="false" />
                                                                        <jsp:param name="hasOrder" value="false" />
                                                                        <jsp:param name="parentTable" value="READING_REVIEW_MAIN"/>
                                                                        <jsp:param name="parentUid" value="${readingReviewUid}"/>
                                                                        <jsp:param name="parentType" value="REVIEW4"/>
                                                                        <jsp:param name="maxFileCount" value="2"/>
                                                                        <jsp:param name="isSecure" value="N"/>
                                                                        <jsp:param name="dropzoneIndex" value="6"/>
                                                                        <jsp:param name="DZID" value="dz7"/>
                                                                        <jsp:param name="description" value="이미지는 480px x 604px로 업로드해 주세요. (파일명 띄어쓰기 금지) <br>* 파일 크기는 1Mb이하, jpg, jpeg, png 형식의 파일만 가능합니다."/>
                                                                    </jsp:include>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-12 fv-row fv-plugins-icon-container">
                                                            <input type="text" class="form-control" placeholder="URL 경로 입력" name="reviewUrl4" maxlength="200" value="<c:out value="${readingReview.reviewUrl4}"/>" >
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-footer" id="footerIdx">
                                    <div class="row">
                                        <div class="col-12 d-flex justify-content-end">
                                            <c:choose>
                                                <c:when test="${viewType eq 'edit'}">
                                                    <button type="button" onclick="history.back()" class="btn btn-light-warning me-2" style="background-color: #fff3cd; color: #181C32" >
                                                        취소
                                                    </button>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="/${menu}/visual-banner" class="btn btn-light-warning me-2" style="background-color: #fff3cd; color: #181C32">
                                                        취소
                                                    </a>
                                                </c:otherwise>
                                            </c:choose>
                                            <button
                                                    id="saveButton"
                                                    type="button"
                                                    class="btn btn-warning"
                                                    style="background-color: #ffcd39; color: #181C32"
                                            >
                                                저장
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
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

    const VALID_CLASS = '';
    const INVALID_CLASS = 'is-invalid';
    let ntdrop = [];
    let viewType = "${viewType}";
    const uid = document.getElementById('uid').value;
    let readingReviewUid = '';
    const menu = document.getElementById('menu').value;
    let visualBannerFv = null;
    let visualBannerFv2 = null;
    const sortOrderValidators = {
        validators: {
            notEmpty: {
                message: '노출순서를 선택해주세요.'
            }
        }
    };

    $('#sortOrder').on('select2:selecting', function(e) {
        const el = document.querySelector('[name="sortOrder"]');
        el.nextSibling.querySelector('span.select2-selection').classList.remove(INVALID_CLASS);
        const fvContainer = el.parentNode.querySelector('div.fv-plugins-message-container');
        if(fvContainer !== null) {
            fvContainer.remove();
        }
    });

    window.onload = function() {

        visualBannerFv = FormValidation.formValidation(document.getElementById('bannerForm'), {
            fields: {
                title: {
                    validators: {
                        notEmpty: {
                            message: '제목을 입력해주세요.'
                        }
                    }
                },
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
        if('reading-review' === menu) {

            visualBannerFv2 = FormValidation.formValidation(document.getElementById('bannerForm2'),{
                plugins: {
                    trigger: new FormValidation.plugins.Trigger(),
                    bootstrap: new FormValidation.plugins.Bootstrap5({
                        rowSelector: ".fv-row",
                        eleInvalidClass: "is-invalid",
                        eleValidClass: ""
                    })
                }
            });

            visualBannerFv2.addField('videoUrl', {
                validators: {
                    notEmpty: {
                        message: '동영상URL을 입력해주세요.'
                    }
                }
            });

            visualBannerFv2.addField('question1', {
                validators: {
                    notEmpty: {
                        message: '인터뷰 Q/A를 입력해주세요.'
                    }
                }
            });

            visualBannerFv2.addField('answer1', {
                validators: {
                    notEmpty: {
                        message: '인터뷰 Q/A를 입력해주세요.'
                    }
                }
            });

            visualBannerFv2.addField('question2', {
                validators: {
                    notEmpty: {
                        message: '인터뷰 Q/A를 입력해주세요.'
                    }
                }
            });

            visualBannerFv2.addField('answer2', {
                validators: {
                    notEmpty: {
                        message: '인터뷰 Q/A를 입력해주세요.'
                    }
                }
            });

            visualBannerFv2.addField('reviewUrl1', {
                validators: {
                    notEmpty: {
                        message: '배너 URL을 입력해주세요.'
                    }
                }
            });

            visualBannerFv2.addField('reviewUrl2', {
                validators: {
                    notEmpty: {
                        message: '배너 URL을 입력해주세요.'
                    }
                }
            });

            visualBannerFv2.addField('reviewUrl3', {
                validators: {
                    notEmpty: {
                        message: '배너 URL을 입력해주세요.'
                    }
                }
            });

            visualBannerFv2.addField('reviewUrl4', {
                validators: {
                    notEmpty: {
                        message: '배너 URL을 입력해주세요.'
                    }
                }
            });
        }

        /**
         * form validator invalid event
         * 여기서 select2 인 경우 처리
         */

        visualBannerFv.on('core.field.invalid', function(name) {
            try {
                const el = document.querySelector('[name=' + name + ']');
                if (el.dataset.control === 'select2') {
                    if (VALID_CLASS) el.nextSibling.querySelector('span.select2-selection').classList.remove(VALID_CLASS);
                    if (INVALID_CLASS) el.nextSibling.querySelector('span.select2-selection').classList.add(INVALID_CLASS);
                    el.nextSibling.querySelector('span.select2-selection').focus();
                } else {
                    el.focus();
                }
            } catch(e) {
                console.log('Cannot find element: ' + name);
            }
        });

        /**
         * form validator valid event
         * 여기서 select2 인 경우 처리
         */
        visualBannerFv.on('core.field.valid', function(name) {
            try {
                const el = document.querySelector('[name=' + name + ']');

                if (el.dataset.control === 'select2') {
                    if (INVALID_CLASS) el.nextSibling.querySelector('span.select2-selection').classList.remove(INVALID_CLASS);
                    if (VALID_CLASS) el.nextSibling.querySelector('span.select2-selection').classList.add(VALID_CLASS);
                }
            } catch(e) {
                console.log('Cannot find element: ' + name);
            }
        });

        ntdrop[0] = global.genDropzone("#dz1",
            {
                params: {
                    'ParentTable': 'VISUAL_BANNER',
                    'ParentType': 'PC',
                    'ParentUid': uid,
                }, hasOrder: false, isSecure: 'N', required: 'Y',maxFileCount: 2, dropzoneIdx: 'dz1',
                acceptedExt : ['.jpg', '.jpeg', '.png'],
                containerId : 'dz1Container',
                maxFileSize : 1,
                dropzoneIndex : 0,
                messages : {
                    empty : '배너 이미지(PC)를 등록해주세요.',
                    accept: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.',
                    count: '',
                    size: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.'
                }
            });

        ntdrop[1] = global.genDropzone("#dz2",
            {
                params: {
                    'ParentTable': 'VISUAL_BANNER',
                    'ParentType': 'MOBILE',
                    'ParentUid': uid,
                }, hasOrder: false, isSecure: 'N', maxFileCount: 2, required: 'Y', dropzoneIdx: 'dz2',
                acceptedExt : ['.jpg', '.jpeg', '.png'],
                containerId : 'dz2Container',
                maxFileSize : 1,
                dropzoneIndex : 1,
                messages : {
                    empty : '배너 이미지(Mobile)를 등록해주세요.',
                    accept: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.',
                    count: '',
                    size: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.'
                }
            });

        if('reading-review' === menu) {
            readingReviewUid = document.getElementById('readingReviewUid').value;
            ntdrop[2] = global.genDropzone("#dz3",
                {
                    params: {
                        'ParentTable': 'READING_REVIEW_MAIN',
                        'ParentType': 'INTERVIEW',
                        'ParentUid': readingReviewUid,
                    }, hasOrder: false, isSecure: 'N', maxFileCount: 2, required: 'Y', dropzoneIdx: 'dz3',
                    acceptedExt : ['.jpg', '.jpeg', '.png'],
                    containerId : 'dz3Container',
                    maxFileSize : 1,
                    dropzoneIndex : 2,
                    messages : {
                        empty : '인터뷰 이미지를 등록해주세요.',
                        accept: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.',
                        count: '',
                        size: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.'
                    }
                });
            ntdrop[3] = global.genDropzone("#dz4",
                {
                    params: {
                        'ParentTable': 'READING_REVIEW_MAIN',
                        'ParentType': 'REVIEW1',
                        'ParentUid': readingReviewUid,
                    }, hasOrder: false, isSecure: 'N', maxFileCount: 2, required: 'Y', dropzoneIdx: 'dz4',
                    acceptedExt : ['.jpg', '.jpeg', '.png'],
                    containerId : 'dz4Container',
                    maxFileSize : 1,
                    dropzoneIndex : 3,
                    messages : {
                        empty : '배너를 등록해주세요.',
                        accept: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.',
                        count: '',
                        size: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.'
                    }
                });
            ntdrop[4] = global.genDropzone("#dz5",
                {
                    params: {
                        'ParentTable': 'READING_REVIEW_MAIN',
                        'ParentType': 'REVIEW2',
                        'ParentUid': readingReviewUid,
                    }, hasOrder: false, isSecure: 'N', maxFileCount: 2, required: 'Y', dropzoneIdx: 'dz5',
                    acceptedExt : ['.jpg', '.jpeg', '.png'],
                    containerId : 'dz5Container',
                    maxFileSize : 1,
                    dropzoneIndex : 4,
                    messages : {
                        empty : '배너를 등록해주세요.',
                        accept: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.',
                        count: '',
                        size: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.'
                    }
                });
            ntdrop[5] = global.genDropzone("#dz6",
                {
                    params: {
                        'ParentTable': 'READING_REVIEW_MAIN',
                        'ParentType': 'REVIEW3',
                        'ParentUid': readingReviewUid,
                    }, hasOrder: false, isSecure: 'N', maxFileCount: 2, required: 'Y', dropzoneIdx: 'dz6',
                    acceptedExt : ['.jpg', '.jpeg', '.png'],
                    containerId : 'dz6Container',
                    maxFileSize : 1,
                    dropzoneIndex : 5,
                    messages : {
                        empty : '배너를 등록해주세요.',
                        accept: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.',
                        count: '',
                        size: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.'
                    }
                });
            ntdrop[6] = global.genDropzone("#dz7",
                {
                    params: {
                        'ParentTable': 'READING_REVIEW_MAIN',
                        'ParentType': 'REVIEW4',
                        'ParentUid': readingReviewUid,
                    }, hasOrder: false, isSecure: 'N', maxFileCount: 2, required: 'Y', dropzoneIdx: 'dz7',
                    acceptedExt : ['.jpg', '.jpeg', '.png'],
                    containerId : 'dz7Container',
                    maxFileSize : 1,
                    dropzoneIndex : 6,
                    messages : {
                        empty : '배너를 등록해주세요.',
                        accept: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.',
                        count: '',
                        size: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.'
                    }
                });
        }
    };

    if('reading-review' !== menu) {
        let isUseRadios = document.querySelectorAll('input[type="radio"][name="isOpen"]');
        isUseRadios.forEach( el => {
            el.addEventListener('change', () => {
                if(el.value === 'N') {
                    $('#sortOrder').val('').trigger('change');
                    document.querySelector('#sortOrder').disabled = true;
                    const fields = visualBannerFv.getFields();
                    // if(fields.sortOrder) {
                    //     visualBannerFv.removeField('sortOrder');
                    // }
                } else {
                    // visualBannerFv.addField('sortOrder', sortOrderValidators);
                    document.querySelector('#sortOrder').disabled = false;
                }
            })
        });
    }

    document.getElementById('saveButton').addEventListener('click', () => {
        visualBannerFv.validate().then(async function (status) {
            if (status === 'Valid') {
                if('reading-review' === menu) {
                    visualBannerFv2.validate().then(async function (status) {
                        if (status === 'Valid') {
                            let isConfirm = await checkSortOrder();
                            if(!isConfirm) {
                                isConfirm = true;
                                await Swal.fire({
                                    title: '노출순서 중복',
                                    text: '해당 노출순서에 등록된 메인 배너 이미지가 있습니다. 해당 이미지로 변경 하시겠습니까? ',
                                    icon: 'warning',
                                    showCancelButton: true,
                                    confirmButtonColor: '#3085d6',
                                    cancelButtonColor: '#d33',
                                    confirmButtonText: '확인',
                                    cancelButtonText: '취소'
                                }).then(async (result) => {
                                    if (result.isConfirmed) {
                                        isConfirm = true;
                                    } else {
                                        isConfirm = false;
                                    }
                                });
                            }

                            if(isConfirm) {
                                if(dropzoneCheck()) {
                                    uploadByDropzone(0);
                                }
                            }
                        } else {
                            dropzoneCheck();
                        }
                    });
                } else {
                    let isConfirm = await checkSortOrder();
                    if(!isConfirm) {
                        isConfirm = true;
                        await Swal.fire({
                            title: '노출순서 중복',
                            text: '해당 노출순서에 등록된 메인 배너 이미지가 있습니다. 해당 이미지로 변경 하시겠습니까? ',
                            icon: 'warning',
                            showCancelButton: true,
                            confirmButtonColor: '#3085d6',
                            cancelButtonColor: '#d33',
                            confirmButtonText: '확인',
                            cancelButtonText: '취소'
                        }).then(async (result) => {
                            if (result.isConfirmed) {
                                isConfirm = true;
                            } else {
                                isConfirm = false;
                            }
                        });
                    }

                    if(isConfirm) {
                        if(dropzoneCheck()) {
                            uploadByDropzone(0);
                        }
                    }
                }
            } else {
                if('reading-review' === menu) {
                    visualBannerFv2.validate();
                }
                dropzoneCheck();
                console.log(status);
            }
        });
    });

    const checkSortOrder = async () => {
        const formData = makeJsonData('bannerForm');
        if(formData.visualBannerLocation === 'READING-REVIEW' && formData.isOpen === 'N') {
            return true;
        }
        const response = await fetch('/api/v1/site/check-sort-order', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(formData)
        });
        const res = await response.json();
        document.getElementById('disabledUid').value = res.data.disabledUid;
        return res.data.result;
    }

    async function saveFormData() {
        let formData = makeJsonData('bannerForm');
        if('reading-review' === menu) {
            const formData2 = makeJsonData('bannerForm2');
            formData.readingReviewMain = formData2;
        }
        let url = '/api/v1/site/visual-banner';
        let method = 'POST';
        let regMsg = '등록되었습니다.';
        let successUrl = `/\${menu}/visual-banner`;

        if(viewType === 'edit') {
            method = 'PUT';
            url = `/api/v1/site/visual-banner/\${uid}`;
            successUrl = `/\${menu}/visual-banner/\${uid}`;
        }

        const response = await fetch(url, {
            method: method,
            headers: {
             'Content-Type': 'application/json',
            },
            body: JSON.stringify(formData)
        });


        const res = await response.json();
        if(res.data) {
            Swal.fire({
                title: '등록 완료',
                text: regMsg,
                icon: 'success',
                buttonsStyling: !1,
                confirmButtonText: '확인',
                customClass: {confirmButton: 'btn btn-primary'}
            }).then(() => {
                window.location.href = successUrl;
            });
        }
    }

    const makeJsonData = (formId) => {
        const bannerData = new FormData(document.getElementById(formId));
        let jsonObject = {};
        bannerData.forEach(function (value, key) {
            jsonObject[key] = value;
        });
        return jsonObject;
    }

    function deleteFile (element) {
        console.log('hih')
        let idx = element.getAttribute('data-id');

        let replaceImageIdx = idx.replace('dropzone', 'dropzoneImage');
        const test = document.getElementById(replaceImageIdx);
        test.remove();

        test.style.display = 'none';

        let replaceIdx = idx.replace('dropzone', '');
        console.log(idx);
        var parentElement = document.getElementById(replaceIdx);

        if (parentElement) {
            var dropzone = parentElement.querySelector('#' + idx);
            console.log(dropzone);
            if (dropzone) {
                // 'display' 속성을 토글합니다.
                if (dropzone.style.display === 'none') {
                    dropzone.style.display = 'block';
                } else {
                    dropzone.style.display = 'none';
                }

            } else {

            }
        }

    }

</script>
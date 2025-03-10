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
                        <form>
                            <div class="card mb-5 mb-xl-10">
                                <div class="card-header border-0 pt-5">
                                    <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                        기본정보
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="row mb-12">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">북코드</label>
                                            </div>
                                            <div class="col-lg-11">
                                                <div class="row">
                                                    <div class="col-lg-3">
                                                        <div class="row">
                                                            <div class="col-lg-4 form-label text-dark pt-3">코드번호</div>
                                                            <div class="col-lg-8 form-label text-primary pt-3">
                                                                <c:out value="${list.bookCode}"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-9">
                                                        <div class="row">
                                                            <div class="col-lg-2 form-label text-dark pt-3">교과서명</div>
                                                            <div class="col-lg-9 form-label text-primary pt-3">
                                                                <c:out value="${list.bookCodeName}"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row mb-12">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark">학급</label>
                                            </div>
                                            <div class="col-lg-11">
                                                <div class="row">
                                                    <div class="col-lg-3">
                                                        <div class="row">
                                                            <div class="col-lg-4 form-label text-dark">
                                                                <c:out value="${list.school}"/>
                                                            </div>
                                                            <div class="col-lg-8 form-label text-primary">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-9">
                                                        <div class="row">
                                                            <div class="col-lg-2">
                                                                <label class="col-lg-10 form-label fw-bolder text-dark">과목</label>
                                                            </div>
                                                            <div class="col-lg-9">
                                                                <div class="col-lg-12 form-label text-dark">
                                                                    <c:out value="${list.subject}"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-12">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark">학년</label>
                                            </div>
                                            <div class="col-lg-11">
                                                <div class="row">
                                                    <div class="col-lg-3">
                                                        <div class="row">
                                                            <div class="col-lg-4 form-label text-dark">
                                                                <c:out value="${list.grade}"/>
                                                            </div>
                                                            <div class="col-lg-8 form-label text-primary">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-9">
                                                        <div class="row">
                                                            <div class="col-lg-2">
                                                                <label class="col-lg-10 form-label fw-bolder text-dark">학기</label>
                                                            </div>
                                                            <div class="col-lg-9">
                                                                <div class="col-lg-12 form-label text-dark">
                                                                    <c:out value="${list.semester}"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row mb-12">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">시리즈코드</label>
                                            </div>
                                            <div class="col-lg-11">
                                                <div class="row">
                                                    <div class="col-lg-3">
                                                        <div class="row">
                                                            <div class="col-lg-4 form-label text-dark pt-3">
                                                                코드번호
                                                            </div>
                                                            <div class="col-lg-8 form-label text-primary pt-3">
                                                                <c:out value="${list.seriesCode}"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-9">
                                                        <div class="row">
                                                            <div class="col-lg-2 form-label text-dark pt-3">
                                                                시리즈명
                                                            </div>
                                                            <div class="col-lg-4 form-label text-primary pt-3">
                                                                <c:out value="${list.seriesCodeName}"/>
                                                            </div>
                                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3 d-flex align-items-center justify-content-center">년도</label>
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <div class="col-lg-12 form-label text-dark pt-3" id="showIsYearY">
                                                                    <c:out value="${list.year}"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>




                                        </div>
                                    </div>

                                    <div class="row mb-12">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required-check">개정 교육과정</label>
                                            </div>
                                            <div class="col-lg-10" id="showIsRevisionCurriculumY">
                                                <div class="col-lg-4">
                                                    <div class="col-lg-12 form-label text-dark pt-3">
                                                        <c:out value="${list.revisionCurriculum}"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required-check">참고서명</label>
                                            </div>
                                            <div class="col-lg-10" id="showIsReferenceBookTitleY">
                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                    <c:out value="${list.referenceBookTitle}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8" id="floatingBanner">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required-check">섬네일</label>
                                            </div>
                                            <div class="fv-row fv-plugins-icon-container col-lg-10" id="dropzoneContainer">
                                                <!-- 파일 업로드 섹션 -->
                                                <jsp:include page="/FileFormINC" flush="false">
                                                    <jsp:param name="isImage" value="false" />
                                                    <jsp:param name="hasOrder" value="false" />
                                                    <jsp:param name="parentTable" value="REFERENCE_BOOK"/>
                                                    <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                    <jsp:param name="parentType" value="THUMBNAIL"/>
                                                    <jsp:param name="maxFileCount" value="1"/>
                                                    <jsp:param name="isSecure" value="N"/>
                                                    <jsp:param name="DZID" value="dz0"/>
                                                    <jsp:param name="viewType" value="view"/>
                                                    <jsp:param name="description" value="이미지 파일명은 북코드+연도+0.jpg(예: 10101320150.jpg)로 첨부해 주세요.__파일 크기는 1Mb이하, jpg 형식의 파일만 가능합니다.__ 섬네일 이미지는 400px * 435px로 업로드 해주세요."/>
                                                </jsp:include>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check pt-3">성격</label>
                                            </div>
                                            <div class="col-lg-10" id="showIsBookCharacterY">
                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                    <c:out value="${list.bookCharacter}"/>
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check pt-3">집필진 정보</label>
                                            </div>
                                            <div class="col-lg-10" id="showIsAuthorY">
                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                    <c:out value="${list.author}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">구성</label>
                                            </div>
                                            <div class="col-lg-4 pt-3" id="showIsBookStructureY">
                                                <div class="col-lg-12 form-label text-dark">
                                                    <c:out value="${list.bookStructure}"/>
                                                </div>
                                            </div>
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3  d-flex align-items-center justify-content-center">사이즈</label>
                                            </div>
                                            <div class="col-lg-4 pt-3" id="showIsWidthY">
                                                <div class="row">
                                                    <div class="col-lg-2 form-label text-dark pt-1">
                                                        <c:out value="${list.width}"/>
                                                    </div>
                                                    <label class="col-lg-1  d-flex align-items-center justify-content-center">
                                                        <i class="fas bi-asterisk me-2 d-flex align-items-center justify-content-center pb-3"></i>
                                                    </label>
                                                    <div class="col-lg-4 form-label text-dark pt-1">
                                                        <c:out value="${list.height}"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">색도</label>
                                            </div>
                                            <div class="col-lg-4 pt-3" id="showIsChromacityY" style="display: ${not empty list ? 'block' : 'none'}">
                                                <div class="col-lg-12 form-label text-dark">
                                                    <c:out value="${list.chromacity} 도"/>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 pt-3 row" id="showIsChromacityN" style="display: ${empty list ? 'flex' : 'none'}">
                                                <div class="col-lg-4 form-label text-dark">
                                                    <input type="text"  class="form-control" id="chromacity" name="chromacity" placeholder="색도" value="${list.chromacity}">
                                                </div>
                                                <label class="col-lg-1  d-flex align-items-center justify-content-center">
                                                    도
                                                </label>
                                            </div>
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 d-flex align-items-center justify-content-center">정가</label>
                                            </div>
                                            <div class="col-lg-3 pt-3" id="showIsPriceY">
                                                <div class="col-lg-12 form-label text-dark">
                                                    <c:out value="${list.formatPrice} 원"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                            <label class="col-lg-12 form-label fw-bolder text-dark pt-3">미리보기</label>
                                        </div>
                                        <div class="col-lg-10" id="showIsPreviewUrlY" style="display: ${(not empty list && list.previewUrl ne '') ? 'block' : 'none'}">
                                            <c:if test="${not empty list.previewUrl}">
                                                <a class="col-lg-12 form-label text-dark pt-3" href="${list.previewUrl}" target="_blank">
                                                    <c:out value="URL 경로 : ${list.previewUrl}"/>
                                                </a>
                                            </c:if>
                                        </div>
                                        <div class="col-lg-10" id="showIsPreviewUrlN" style="display: ${(not empty list && list.previewUrl eq '') ? 'block' : 'none'}">
                                            <div class="row">
                                                <div id="pdf" class="col-lg-12 form-label text-dark" style="display:  ${list.previewUrl ne '' ? 'none' : 'block'}">
                                                    <jsp:include page="/FileFormINC" flush="false">
                                                        <jsp:param name="isImage" value="false" />
                                                        <jsp:param name="hasOrder" value="false" />
                                                        <jsp:param name="parentTable" value="REFERENCE_BOOK"/>
                                                        <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                        <jsp:param name="parentType" value="PDF"/>
                                                        <jsp:param name="maxFileCount" value="1"/>
                                                        <jsp:param name="isSecure" value="N"/>
                                                        <jsp:param name="viewType" value="view"/>
                                                        <jsp:param name="DZID" value="dz1"/>

                                                    </jsp:include>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check ${empty list ? 'required' : ''} pt-3">견본신청 노출여부</label>
                                            </div>
                                            <div class="col-lg-7" id="showIsRequestSampleY" style="display: ${not empty list ? 'block' : 'none'}">
                                                <div class="${list.isRequestSample eq 'N' ? 'col-lg-12 form-label text-primary pt-3' : 'col-lg-12 form-label text-danger pt-3'}">
                                                    <c:out value="${list.isRequestSample eq 'N' ? 'N' : 'Y'}"/>
                                                </div>
                                            </div>
                                            <div class="col-lg-7 pt-3 row" id="showIsRequestSampleN" style="display: ${empty list ? 'block' : 'none'}">
                                                <div class="col-lg-2 row pt-0">
                                                    <div class="col">
                                                        <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                            <input class="form-check-input" type="radio" name="isRequestSample" value="N" ${list.isRequestSample eq 'N' || empty list ? 'checked' : ''} id="isSampleApplicationN"/>
                                                            <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isSampleApplicationN">
                                                                N
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                            <input class="form-check-input" type="radio" name="isRequestSample" value="Y" ${list.isRequestSample eq 'Y' ? 'checked' : ''} id="isSampleApplicationY"/>
                                                            <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isSampleApplicationY">
                                                                Y
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check ${empty list ? 'required' : ''} pt-3">노출여부</label>
                                            </div>
                                            <div class="col-lg-7" id="showIsOpenY" style="display: ${not empty list ? 'block' : 'none'}">
                                                <div class="${list.isOpen eq 'N' ? 'col-lg-12 form-label text-primary pt-3' : 'col-lg-12 form-label text-danger pt-3'}">
                                                    <c:out value="${list.isOpen eq 'N' ? 'N' : 'Y'}"/>
                                                </div>
                                            </div>
                                            <div class="col-lg-7 pt-3 row" id="showIsOpenN" style="display: ${empty list ? 'block' : 'none'}">
                                                <div class="col-lg-2 row pt-0">
                                                    <div class="col">
                                                        <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                            <input class="form-check-input" type="radio" name="isOpen" value="N" ${list.isOpen eq 'N' || empty list ? 'checked' : ''} id="isN"/>
                                                            <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isN">
                                                                N
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                            <input class="form-check-input" type="radio" name="isOpen" value="Y" ${list.isOpen eq 'Y' ? 'checked' : ''} id="isY"/>
                                                            <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isY">
                                                                Y
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check ${empty list ? 'required' : ''} pt-3">인트로 노출여부</label>
                                            </div>
                                            <div class="col-lg-7" id="showIsIntroY" style="display: ${not empty list ? 'block' : 'none'}">
                                                <div class="${list.isIntro eq 'N' ? 'col-lg-12 form-label text-primary pt-3' : 'col-lg-12 form-label text-danger pt-3'}">
                                                    <c:out value="${list.isIntro eq 'N' ? 'N' : 'Y'}"/>
                                                </div>
                                            </div>
                                            <div class="col-lg-7 pt-3 row" id="showIsIntroN" style="display: ${empty list ? 'block' : 'none'}">
                                                <div class="col-lg-2 row">
                                                    <div class="col">
                                                        <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                            <input class="form-check-input" type="radio" name="isIntro" value="N" ${list.isIntro eq 'N' || empty list ? 'checked' : ''} id="isIntroN"/>
                                                            <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isIntroN">
                                                                N
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                            <input class="form-check-input" type="radio" name="isIntro" value="Y" ${list.isIntro eq 'Y' ? 'checked' : ''} id="isIntroY"/>
                                                            <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isIntroY">
                                                                Y
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-10 pt-3">
                                                    <span class="ms-2" style="color: gray;">* 인트로 노출여부 설정은 초등/중학/고등 각 10개씩 총 30개 등록이 가능합니다.</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>

                            <div class="card mb-5 mb-xl-10">
                                <div id=info">
                                    <div class="card-header card-header border-0 pt-5">
                                        <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                            학습자료
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">학습자료<br>(학생용)</label>
                                                </div>

                                                <div class="col-lg-10">
                                                    <!-- "PC" 섹션 -->
                                                    <div class="row mb-3">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-2 d-flex align-items-center justify-content-center ">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check ${empty list ? 'required' : ''}">정오표</label>
                                                            </div>

                                                            <div class="fv-row fv-plugins-icon-container col-lg-10 pb-5">
                                                                <!-- 파일 업로드 섹션 -->
                                                                <jsp:include page="/FileFormINC" flush="false">
                                                                    <jsp:param name="isImage" value="false" />
                                                                    <jsp:param name="hasOrder" value="false" />
                                                                    <jsp:param name="parentTable" value="REFERENCE_BOOK"/>
                                                                    <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                                    <jsp:param name="parentType" value="STUDENT-CORRIGENDUM"/>
                                                                    <jsp:param name="maxFileCount" value="1"/>
                                                                    <jsp:param name="isSecure" value="N"/>
                                                                    <jsp:param name="DZID" value="dz2"/>
                                                                    <jsp:param name="viewType" value="view"/>
                                                                    <jsp:param name="description" value="파일 크기는 300Mb이하, MP4/MP3/PDF/jpg/jpeg/png/hwp/hwpx/ppt/pptx/doc/docx/zip/egg 형식의 파일만 가능합니다."/>
                                                                </jsp:include>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- "Mobile" 섹션 -->
                                                    <div class="row mb-3">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-2 d-flex align-items-center justify-content-center ">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check ${empty list ? 'required' : ''}">정답 및 해설</label>
                                                            </div>
                                                            <div class="fv-row fv-plugins-icon-container col-lg-10 pb-5">
                                                                <!-- 파일 업로드 섹션 -->
                                                                <jsp:include page="/FileFormINC" flush="false">
                                                                    <jsp:param name="isImage" value="false" />
                                                                    <jsp:param name="hasOrder" value="false" />
                                                                    <jsp:param name="parentTable" value="REFERENCE_BOOK"/>
                                                                    <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                                    <jsp:param name="parentType" value="STUDENT-ANSWER"/>
                                                                    <jsp:param name="maxFileCount" value="1"/>
                                                                    <jsp:param name="isSecure" value="N"/>
                                                                    <jsp:param name="DZID" value="dz3"/>
                                                                    <jsp:param name="viewType" value="view"/>
                                                                    <jsp:param name="description" value="파일 크기는 300Mb이하, MP4/MP3/PDF/jpg/jpeg/png/hwp/hwpx/ppt/pptx/doc/docx/zip/egg 형식의 파일만 가능합니다."/>
                                                                </jsp:include>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-2 d-flex align-items-center justify-content-center ">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check ${empty list ? 'required' : ''}">듣기MP3</label>
                                                            </div>

                                                            <div class="fv-row fv-plugins-icon-container col-lg-10 pb-5">
                                                                <!-- 파일 업로드 섹션 -->
                                                                <jsp:include page="/FileFormINC" flush="false">
                                                                    <jsp:param name="isImage" value="false" />
                                                                    <jsp:param name="hasOrder" value="false" />
                                                                    <jsp:param name="parentTable" value="REFERENCE_BOOK"/>
                                                                    <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                                    <jsp:param name="parentType" value="STUDENT-MP3"/>
                                                                    <jsp:param name="maxFileCount" value="1"/>
                                                                    <jsp:param name="isSecure" value="N"/>
                                                                    <jsp:param name="DZID" value="dz4"/>
                                                                    <jsp:param name="viewType" value="view"/>
                                                                    <jsp:param name="description" value="파일 크기는 300Mb이하, MP4/MP3/PDF/jpg/jpeg/png/hwp/hwpx/ppt/pptx/doc/docx/zip/egg 형식의 파일만 가능합니다."/>
                                                                </jsp:include>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-2 d-flex align-items-center justify-content-center ">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check">강남구청 인터넷<br>수능방송</label>
                                                            </div>
                                                            <div class="fv-row fv-plugins-icon-container col-lg-10">
                                                                <c:if test="${not empty list.gangnamBroadcastUrl}">
                                                                    <a class="col-lg-12 form-label text-dark pt-3" href="${list.gangnamBroadcastUrl}" target="_blank">
                                                                        <c:out value="${list.gangnamBroadcastUrl}"/>
                                                                    </a>
                                                                </c:if>
                                                                <c:if test="${empty list.gangnamBroadcastUrl}">
                                                                    <div class="col-lg-12 form-label text-dark pt-3">
                                                                        -
                                                                    </div>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-2 d-flex align-items-center justify-content-center ">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check ${empty list ? 'required' : ''}">오답용노트 문제</label>
                                                            </div>

                                                            <div class="fv-row fv-plugins-icon-container col-lg-10 pb-5">
                                                                <!-- 파일 업로드 섹션 -->
                                                                <jsp:include page="/FileFormINC" flush="false">
                                                                    <jsp:param name="isImage" value="false" />
                                                                    <jsp:param name="hasOrder" value="false" />
                                                                    <jsp:param name="parentTable" value="REFERENCE_BOOK"/>
                                                                    <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                                    <jsp:param name="parentType" value="STUDENT-WRONG-ANSWER"/>
                                                                    <jsp:param name="maxFileCount" value="1"/>
                                                                    <jsp:param name="isSecure" value="N"/>
                                                                    <jsp:param name="DZID" value="dz5"/>
                                                                    <jsp:param name="viewType" value="view"/>
                                                                    <jsp:param name="description" value="파일 크기는 300Mb이하, MP4/MP3/PDF/jpg/jpeg/png/hwp/hwpx/ppt/pptx/doc/docx/zip/egg 형식의 파일만 가능합니다."/>
                                                                </jsp:include>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-2 d-flex align-items-center justify-content-center ">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check ${empty list ? 'required' : ''}">빈 정리노트</label>
                                                            </div>

                                                            <div class="fv-row fv-plugins-icon-container col-lg-10 pb-5">
                                                                <!-- 파일 업로드 섹션 -->
                                                                <jsp:include page="/FileFormINC" flush="false">
                                                                    <jsp:param name="isImage" value="false" />
                                                                    <jsp:param name="hasOrder" value="false" />
                                                                    <jsp:param name="parentTable" value="REFERENCE_BOOK"/>
                                                                    <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                                    <jsp:param name="parentType" value="STUDENT-BLANK-NOTE"/>
                                                                    <jsp:param name="maxFileCount" value="1"/>
                                                                    <jsp:param name="isSecure" value="N"/>
                                                                    <jsp:param name="DZID" value="dz6"/>
                                                                    <jsp:param name="viewType" value="view"/>
                                                                    <jsp:param name="description" value="파일 크기는 300Mb이하, MP4/MP3/PDF/jpg/jpeg/png/hwp/hwpx/ppt/pptx/doc/docx/zip/egg 형식의 파일만 가능합니다."/>
                                                                </jsp:include>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-2 d-flex align-items-center justify-content-center ">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check ${empty list ? 'required' : ''}">선배들의 정리노트</label>
                                                            </div>

                                                            <div class="fv-row fv-plugins-icon-container col-lg-10 pb-5">
                                                                <!-- 파일 업로드 섹션 -->
                                                                <jsp:include page="/FileFormINC" flush="false">
                                                                    <jsp:param name="isImage" value="false" />
                                                                    <jsp:param name="hasOrder" value="false" />
                                                                    <jsp:param name="parentTable" value="REFERENCE_BOOK"/>
                                                                    <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                                    <jsp:param name="parentType" value="STUDENT-SENIOR-NOTE"/>
                                                                    <jsp:param name="maxFileCount" value="1"/>
                                                                    <jsp:param name="isSecure" value="N"/>
                                                                    <jsp:param name="DZID" value="dz7"/>
                                                                    <jsp:param name="viewType" value="view"/>
                                                                    <jsp:param name="description" value="파일 크기는 300Mb이하, MP4/MP3/PDF/jpg/jpeg/png/hwp/hwpx/ppt/pptx/doc/docx/zip/egg 형식의 파일만 가능합니다."/>
                                                                </jsp:include>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-2 d-flex align-items-center justify-content-center ">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check ${empty list ? 'required' : ''}">학생용자료 1</label>
                                                            </div>

                                                            <div class="fv-row fv-plugins-icon-container col-lg-10 pb-5">
                                                                <!-- 파일 업로드 섹션 -->
                                                                <jsp:include page="/FileFormINC" flush="false">
                                                                    <jsp:param name="isImage" value="false" />
                                                                    <jsp:param name="hasOrder" value="false" />
                                                                    <jsp:param name="parentTable" value="REFERENCE_BOOK"/>
                                                                    <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                                    <jsp:param name="parentType" value="STUDENT-DATA1"/>
                                                                    <jsp:param name="maxFileCount" value="1"/>
                                                                    <jsp:param name="isSecure" value="N"/>
                                                                    <jsp:param name="DZID" value="dz8"/>
                                                                    <jsp:param name="viewType" value="view"/>
                                                                    <jsp:param name="description" value="파일 크기는 300Mb이하, MP4/MP3/PDF/jpg/jpeg/png/hwp/hwpx/ppt/pptx/doc/docx/zip/egg 형식의 파일만 가능합니다."/>
                                                                </jsp:include>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-2 d-flex align-items-center justify-content-center ">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check ${empty list ? 'required' : ''}">학생용자료 2</label>
                                                            </div>

                                                            <div class="fv-row fv-plugins-icon-container col-lg-10 pb-5">
                                                                <!-- 파일 업로드 섹션 -->
                                                                <jsp:include page="/FileFormINC" flush="false">
                                                                    <jsp:param name="isImage" value="false" />
                                                                    <jsp:param name="hasOrder" value="false" />
                                                                    <jsp:param name="parentTable" value="REFERENCE_BOOK"/>
                                                                    <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                                    <jsp:param name="parentType" value="STUDENT-DATA2"/>
                                                                    <jsp:param name="maxFileCount" value="1"/>
                                                                    <jsp:param name="isSecure" value="N"/>
                                                                    <jsp:param name="DZID" value="dz9"/>
                                                                    <jsp:param name="viewType" value="view"/>
                                                                    <jsp:param name="description" value="파일 크기는 300Mb이하, MP4/MP3/PDF/jpg/jpeg/png/hwp/hwpx/ppt/pptx/doc/docx/zip/egg 형식의 파일만 가능합니다."/>
                                                                </jsp:include>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-12">
                                            <hr class="my-4">
                                        </div>

                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-1  d-flex align-items-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">학습자료<br>(학원선생님 전용)</label>
                                                </div>

                                                <div class="col-lg-10">
                                                    <!-- "PC" 섹션 -->
                                                    <div class="row mb-3">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-2 d-flex align-items-center ">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check ${empty list ? 'required' : ''}">HWP지문</label>
                                                            </div>

                                                            <div class="fv-row fv-plugins-icon-container col-lg-10 pb-5">
                                                                <!-- 파일 업로드 섹션 -->
                                                                <jsp:include page="/FileFormINC" flush="false">
                                                                    <jsp:param name="isImage" value="false" />
                                                                    <jsp:param name="hasOrder" value="false" />
                                                                    <jsp:param name="parentTable" value="REFERENCE_BOOK"/>
                                                                    <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                                    <jsp:param name="parentType" value="TEACHER-HWP"/>
                                                                    <jsp:param name="maxFileCount" value="1"/>
                                                                    <jsp:param name="isSecure" value="N"/>
                                                                    <jsp:param name="DZID" value="dz10"/>
                                                                    <jsp:param name="viewType" value="view"/>
                                                                    <jsp:param name="description" value="파일 크기는 300Mb이하, MP4/MP3/PDF/jpg/jpeg/png/hwp/hwpx/ppt/pptx/doc/docx/zip/egg 형식의 파일만 가능합니다."/>
                                                                </jsp:include>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- "Mobile" 섹션 -->
                                                    <div class="row mb-3">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-2 d-flex align-items-center">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check ${empty list ? 'required' : ''}">PDF지문<br>(강의용 PDF)</label>
                                                            </div>
                                                            <div class="fv-row fv-plugins-icon-container col-lg-10 pb-5" id="dropzoneContainer2">
                                                                <!-- 파일 업로드 섹션 -->
                                                                <jsp:include page="/FileFormINC" flush="false">
                                                                    <jsp:param name="isImage" value="false" />
                                                                    <jsp:param name="hasOrder" value="false" />
                                                                    <jsp:param name="parentTable" value="REFERENCE_BOOK"/>
                                                                    <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                                    <jsp:param name="parentType" value="TEACHER-PDF"/>
                                                                    <jsp:param name="maxFileCount" value="1"/>
                                                                    <jsp:param name="isSecure" value="N"/>
                                                                    <jsp:param name="DZID" value="dz11"/>
                                                                    <jsp:param name="viewType" value="view"/>
                                                                    <jsp:param name="description" value="파일 크기는 300Mb이하, MP4/MP3/PDF/jpg/jpeg/png/hwp/hwpx/ppt/pptx/doc/docx/zip/egg 형식의 파일만 가능합니다."/>
                                                                </jsp:include>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-2 d-flex align-items-center ">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check ${empty list ? 'required' : ''}">기타자료 1<br>(학생용 PDF)</label>
                                                            </div>

                                                            <div class="fv-row fv-plugins-icon-container col-lg-10 pb-5">
                                                                <!-- 파일 업로드 섹션 -->
                                                                <jsp:include page="/FileFormINC" flush="false">
                                                                    <jsp:param name="isImage" value="false" />
                                                                    <jsp:param name="hasOrder" value="false" />
                                                                    <jsp:param name="parentTable" value="REFERENCE_BOOK"/>
                                                                    <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                                    <jsp:param name="parentType" value="TEACHER-ETC1"/>
                                                                    <jsp:param name="maxFileCount" value="1"/>
                                                                    <jsp:param name="isSecure" value="N"/>
                                                                    <jsp:param name="DZID" value="dz12"/>
                                                                    <jsp:param name="viewType" value="view"/>
                                                                    <jsp:param name="description" value="파일 크기는 300Mb이하, MP4/MP3/PDF/jpg/jpeg/png/hwp/hwpx/ppt/pptx/doc/docx/zip/egg 형식의 파일만 가능합니다."/>
                                                                </jsp:include>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-2 d-flex align-items-center ">
                                                                <div class="col-lg-12">
                                                                    <label class="col-lg-12 form-label fw-bolder text-dark">${list.etcData2}</label>
                                                                </div>
                                                            </div>

                                                            <div class="fv-row fv-plugins-icon-container col-lg-10 pb-5">
                                                                <!-- 파일 업로드 섹션 -->
                                                                <jsp:include page="/FileFormINC" flush="false">
                                                                    <jsp:param name="isImage" value="false" />
                                                                    <jsp:param name="hasOrder" value="false" />
                                                                    <jsp:param name="parentTable" value="REFERENCE_BOOK"/>
                                                                    <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                                    <jsp:param name="parentType" value="TEACHER-ETC2"/>
                                                                    <jsp:param name="maxFileCount" value="1"/>
                                                                    <jsp:param name="isSecure" value="N"/>
                                                                    <jsp:param name="DZID" value="dz13"/>
                                                                    <jsp:param name="viewType" value="view"/>
                                                                    <jsp:param name="description" value="파일 크기는 300Mb이하, MP4/MP3/PDF/jpg/jpeg/png/hwp/hwpx/ppt/pptx/doc/docx/zip/egg 형식의 파일만 가능합니다."/>
                                                                </jsp:include>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-2 d-flex align-items-center ">
                                                                <div class="col-lg-12">
                                                                    <label class="col-lg-12 form-label fw-bolder text-dark">${list.etcData3}</label>
                                                                </div>
                                                            </div>

                                                            <div class="fv-row fv-plugins-icon-container col-lg-10 pb-5">
                                                                <!-- 파일 업로드 섹션 -->
                                                                <jsp:include page="/FileFormINC" flush="false">
                                                                    <jsp:param name="isImage" value="false" />
                                                                    <jsp:param name="hasOrder" value="false" />
                                                                    <jsp:param name="parentTable" value="REFERENCE_BOOK"/>
                                                                    <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                                    <jsp:param name="parentType" value="TEACHER-ETC3"/>
                                                                    <jsp:param name="maxFileCount" value="1"/>
                                                                    <jsp:param name="isSecure" value="N"/>
                                                                    <jsp:param name="DZID" value="dz14"/>
                                                                    <jsp:param name="viewType" value="view"/>
                                                                    <jsp:param name="description" value="파일 크기는 300Mb이하, MP4/MP3/PDF/jpg/jpeg/png/hwp/hwpx/ppt/pptx/doc/docx/zip/egg 형식의 파일만 가능합니다."/>
                                                                </jsp:include>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="card mb-5 mb-xl-10">
                                <div id=info">
                                    <div class="card-header card-header border-0 pt-5">
                                        <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                            상세정보
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-2  d-flex align-items-start justify-content-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required-check">교재소개</label>
                                                </div>
                                                <div class="col-lg-10">
                                                    <div class="fr-element fr-view scroll-froala" style="display: ${empty list ? 'none' : ''}; padding: 16px; border-radius:20px 20px 20px 20px ; background-clip: padding-box; border: 1px solid #E4E6EF">
                                                            ${list.referenceBookDetail[0].detailContent}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-2  d-flex align-items-center justify-content-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 textDetail">
                                                        <c:if test="${list.referenceBookDetail[1].isUse eq 'N'}">
                                                            교재서평
                                                        </c:if>
                                                        <c:if test="${list.referenceBookDetail[1].isUse eq 'Y'}">
                                                            ${list.referenceBookDetail[1].detailTitle}
                                                        </c:if>
                                                    </label>
                                                </div>
                                                <div class="col-lg-10">
                                                    <div class="row mb-4">
                                                        <div class="col-lg-10 row">
                                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">사용 여부</label>
                                                            </div>
                                                            <div class="col-lg-2 row">
                                                                <div class="col">
                                                                    <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                        <input
                                                                                class="form-check-input"
                                                                                type="radio"
                                                                                name="isUse1"
                                                                                value="N"
                                                                                data-froalaIdx="referenceBookDetailFroalaEditor1"
                                                                                data-title="detailTitle1"
                                                                                onclick="changeEditor(this)"
                                                                        ${list.referenceBookDetail[1].isUse eq 'N' || empty list ? 'checked' : ''}
                                                                                id="isNField1"
                                                                                disabled
                                                                        />
                                                                        <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isNField1">
                                                                            N
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col">
                                                                    <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                        <input
                                                                                class="form-check-input"
                                                                                type="radio"
                                                                                name="isUse1"
                                                                                value="Y"
                                                                                data-froalaIdx="referenceBookDetailFroalaEditor1"
                                                                                data-title="detailTitle1"
                                                                                onclick="changeEditor(this)"
                                                                        ${list.referenceBookDetail[1].isUse eq 'Y' ? 'checked' : ''}
                                                                                id="isYField1"
                                                                                disabled
                                                                        />
                                                                        <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isYField1">
                                                                            Y
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-2  d-flex align-items-center">
                                                    <div class="col-lg-12">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 textDetail" style="display: ${not empty list ? '' : 'none'}">${list.referenceBookDetail[2].detailTitle}</label>
                                                        <input
                                                                type="text"
                                                                id="detailTitle2"
                                                                name="detailTitle2"
                                                                class="form-control ${list.referenceBookDetail[2].isUse eq 'Y' ? '' : 'form-control-solid'} textModifyDetail"
                                                                placeholder="내용문의"
                                                                maxlength="100"
                                                                <c:if test="${list.referenceBookDetail[2].detailTitle eq ''}">
                                                                    value="<c:out value="내용문의"/>"
                                                                </c:if>
                                                                <c:if test="${list.referenceBookDetail[2].detailTitle ne ''}">
                                                                    value="<c:out value="${list.referenceBookDetail[2].detailTitle}"/>"
                                                                </c:if>
                                                                style="display: ${empty list ? '' : 'none'}"
                                                        ${list.referenceBookDetail[2].isUse eq 'Y' ? '' : 'disabled'}
                                                        />
                                                    </div>
                                                </div>
                                                <div class="col-lg-10">
                                                    <div class="row mb-4">
                                                        <div class="col-lg-10 row">
                                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">사용 여부</label>
                                                            </div>
                                                            <div class="col-lg-2 row">
                                                                <div class="col">
                                                                    <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                        <input

                                                                                class="form-check-input"
                                                                                type="radio"
                                                                                name="isUse2"
                                                                                data-title="detailTitle2"
                                                                                value="N"
                                                                        ${list.referenceBookDetail[2].isUse eq 'N' || empty list ? 'checked' : ''}
                                                                                id="isNField2"
                                                                                onclick="changeEditor(this)"
                                                                        ${empty list ? '' : 'disabled'}
                                                                        />
                                                                        <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isNField2">
                                                                            N
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col">
                                                                    <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                        <input
                                                                                class="form-check-input"
                                                                                type="radio"
                                                                                name="isUse2"
                                                                                value="Y"
                                                                                data-title="detailTitle2"
                                                                        ${list.referenceBookDetail[2].isUse eq 'Y' ? 'checked' : ''}
                                                                                id="isYField2"
                                                                                onclick="changeEditor(this)"
                                                                        ${empty list ? '' : 'disabled'}
                                                                        />
                                                                        <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isYField2">
                                                                            Y
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-2  d-flex align-items-start justify-content-center" id="textDetail3">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 textDetail">
                                                        <c:if test="${list.referenceBookDetail[3].isUse eq 'N'}">
                                                            오류신고
                                                        </c:if>
                                                        <c:if test="${list.referenceBookDetail[3].isUse eq 'Y'}">
                                                            ${list.referenceBookDetail[3].detailTitle}
                                                        </c:if>
                                                    </label>
                                                </div>
                                                <div class="col-lg-10">
                                                    <div class="row mb-4">
                                                        <div class="col-lg-10 row">
                                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">사용 여부</label>
                                                            </div>
                                                            <div class="col-lg-2 row">
                                                                <div class="col">
                                                                    <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                        <input
                                                                                class="form-check-input"
                                                                                type="radio"
                                                                                name="isUse3"
                                                                                value="N"
                                                                                data-title="detailTitle3"
                                                                                onclick="changeEditor(this)"
                                                                        ${list.referenceBookDetail[3].isUse eq 'N'  ? 'checked' : ''}
                                                                                id="isNField3"
                                                                                disabled

                                                                        />
                                                                        <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isNField3">
                                                                            N
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col">
                                                                    <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                        <input
                                                                                class="form-check-input"
                                                                                type="radio"
                                                                                name="isUse3"
                                                                                value="Y"
                                                                                data-title="detailTitle3"
                                                                                onclick="changeEditor(this)"
                                                                        ${list.referenceBookDetail[3].isUse eq 'Y' ? 'checked' : ''}
                                                                                id="isYField3"
                                                                                disabled
                                                                        />
                                                                        <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isYField3">
                                                                            Y
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>



                            <div class="card mb-5 mb-xl-10">
                                <div class="card-body">
                                    <div class="row mb-8">
                                        <div class="col-lg-6 row">
                                            <div class="col-lg-4  d-flex align-items-center">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3">최초 작성자</label>
                                            </div>

                                            <div class="col-lg-8">
                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                    <c:out value="${list.adminName}(${list.adminDepartment})"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 row">
                                            <div class="col-lg-4  d-flex align-items-center">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3">최초 작성일시</label>
                                            </div>

                                            <div class="col-lg-8">
                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                    <c:out value="${list.regDate}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-6 row">
                                            <div class="col-lg-4  d-flex align-items-center">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3">수정자</label>
                                            </div>

                                            <div class="col-lg-8">
                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                    <c:out value="${list.modAdminName}(${list.modAdminDepartment})"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 row">
                                            <div class="col-lg-4  d-flex align-items-center">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3">작성일시</label>
                                            </div>

                                            <div class="col-lg-8">
                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                    <c:out value="${list.modDate}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <div class="row" id="modifyButton">
                                        <div class="col-3">
                                            <a type="button" class="btn btn-light-dark" style="background-color: #343a40; color: #FFFFFF" href="/reference-book/reference-book-list?page=${reqParam.page}&perPage=${reqParam.perPage}&sdate=${reqParam.sdate}&edate=${reqParam.edate}&clazz=${reqParam.clazz}&subject=${reqParam.subject}&grade=${reqParam.grade}&semester=${reqParam.semester}&isOpen=${reqParam.isOpen}&isIntro=${reqParam.isIntro}&searchKey=${reqParam.searchKey}&search=${reqParam.search}">목록</a>
                                        </div>
                                        <div  class="col-9 d-flex justify-content-end">
                                            <button
                                                    data-idx="${list.idx}"
                                                    data-uid="${list.uid}"
                                                    type="button"
                                                    id="deleteBtn"
                                                    class="btn btn-light-warning me-2"
                                                    onclick="deleteReferenceBook(this)"
                                                    <c:if test="${list.isOpen eq 'Y'}">
                                                        disabled
                                                        style="background-color: #3F4254; color: #FFFFFF"
                                                    </c:if>
                                                    <c:if test="${list.isOpen eq 'N'}">
                                                        style="background-color: #fff3cd; color: #181C32"
                                                    </c:if>
                                            >
                                                삭제
                                            </button>
                                            <a type="button" class="btn btn-light-warning" style="background-color: #ffcd39; color: #181C32" href="/reference-book/reference-book-mod-form?uid=${list.uid}">
                                                수정
                                            </a>
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

<div class="modal fade" id="modalLayout" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered mw-900px" id="modalContent">

    </div>
</div>

<div id="loadingBar" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5); z-index: 1000;">
    <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
        <div class="loader"></div>
        <p style="color: white; text-align: center;">파일 업로드 중...</p>
    </div>
</div>

<div id="modalLoading" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5); z-index: 1000;">
    <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
        <div class="loader"></div>
        <p style="color: white; text-align: center;">창 띄우는중...</p>
    </div>
</div>


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.5.0/jszip.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script type="text/javascript">


    /**************************************************************** DELETE ***************************************************************/

    let isSubmitting = false;
    async function deleteReferenceBook(element) {
        if (isSubmitting) {
            return;
        }
        isSubmitting = true;

        const isOpen = document.querySelector('input[name="isOpen"]:checked').value;

        if (isOpen === 'Y') {
            Swal.fire({
                title: '삭제 불가',
                text: '공개된 교과서는 삭제할 수 없습니다.',
                icon: 'error',
                confirmButtonText: '확인'
            });
            isSubmitting = false;
            return;
        } else {
            // 탈퇴 처리 전에 사용자에게 확인 요청
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
                    let idx = element.getAttribute('data-idx');
                    let uid = element.getAttribute('data-uid');
                    try {
                        const response = await fetch('/api/v1/reference/' + idx + '/' + uid, {
                            method: 'DELETE',
                            headers: {
                                'Content-Type': 'application/json',
                            }
                        });

                        const result = await response.json();

                        if (result.result == true) {
                            Swal.fire({
                                title: '삭제 처리 완료',
                                text: '삭제 처리가 완료되었습니다.',
                                icon: 'success',
                                confirmButtonText: '확인'
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    location.href = '/reference-book/reference-book-list';
                                }
                            })
                        } else {
                            Swal.fire({
                                title: '삭제 실패',
                                text: '삭체 처리에 실패되었습니다. \n다시 시도해주세요.',
                                icon: 'error',
                                confirmButtonText: '확인'
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    location.reload();
                                }
                            })
                        }

                    } catch (Exception) {
                        console.error(Exception);
                    } finally {
                        isSubmitting = false;
                    }
                } else {
                    isSubmitting = false;
                }
            });
        }


    }



</script>
</body>

</html>
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

    .loader {
        border: 16px solid #f3f3f3; /* Light grey */
        border-top: 16px solid #ffff00; /* Yellow */
        border-radius: 50%;
        width: 120px;
        height: 120px;
        animation: spin 2s linear infinite;
    }

    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }


    /* Froala 전체 에디터의 너비 확장 */
    .fr-box, .fr-wrapper {
        width: 100%; /* 전체 화면에 맞추기 */
        max-width: 1500px; /* 원하는 최대 너비 설정 */

    }


    .fr-view {
        max-width: 820px; /* 콘텐츠 가로 길이 제한 */
        margin: 0 auto; /* 가운데 정렬 */
    }

</style>
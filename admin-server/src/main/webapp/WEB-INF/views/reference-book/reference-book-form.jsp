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
                    <input type="hidden" name="uid" id="uid" value="${uid}"/>
                    <div class="container-fluid">
                        <!-- 본문 내용 START -->
                        <form id="referenceBookForm" name="referenceBookForm">
                            <div class="card mb-5 mb-xl-10">
                                <div class="card-header border-0 pt-5">
                                    <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                        기본정보
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark required">북코드</label>
                                            </div>
                                            <div class="col-lg-11" style="display: ${not empty list ? 'block' : 'none'}">
                                                <div class="row">
                                                    <div class="col-lg-1 form-label text-dark">
                                                        코드번호
                                                    </div>
                                                    <div class="col-lg-2 form-label text-primary">
                                                        <c:out value="${list.bookCode}"/>
                                                    </div>
                                                    <div class="col-lg-1 form-label text-dark">
                                                        교과서명
                                                    </div>
                                                    <div class="col-lg-5 form-label text-primary">
                                                        <c:out value="${list.bookCodeName}"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-8 row" style="display: ${empty list ? 'flex' : 'none'}">
                                                <div class="col-lg-5 row">
                                                    <div class="col-lg-4 pt-4 ">
                                                        <a class="btn btn-sm btn-dark bookCodeModal pt-3">북코드 검색</a>
                                                    </div>
                                                    <div class="col-lg-8 d-flex flex-column align-items-center justify-content-start pt-3 flex-column fv-row">
                                                        <input type="text"  class="form-control" id="bookCode" name="bookCode" value="${list.bookCode}" disabled>
                                                        <span class="base-input__error" id="bookCodeError"></span>
                                                    </div>
                                                </div>
                                                <div class="col-lg-7 d-flex flex-column align-items-center  pt-3">
                                                    <input type="text"  class="form-control" id="bookCodeName" name="bookCodeName" value="${list.bookCodeName}" disabled>
                                                    <span class="base-input__error" id="bookCodeNameError"></span>
                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">학급</label>
                                            </div>

                                            <div class="col-lg-5 row">
                                                <div class="col-lg-12 form-label text-dark pt-3" style="display: ${not empty list ? 'block' : 'none'}">
                                                    <c:out value="${list.school}"/>
                                                </div>
                                                <div class="col-lg-12 form-label text-dark fv-row" style="display: ${empty list ? 'block' : 'none'}">
                                                    <input type="text"  class="form-control" id="school" name="school" value="${list.school}" disabled>
                                                </div>
                                            </div>
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3 d-flex align-items-center justify-content-center">과목</label>
                                            </div>

                                            <div class="col-lg-5">
                                                <div class="col-lg-12 form-label text-dark pt-3" style="display: ${not empty list ? 'block' : 'none'}">
                                                    <c:out value="${list.subject}"/>
                                                </div>
                                                <div class="col-lg-12 form-label text-dark" style="display: ${empty list ? 'block' : 'none'}">
                                                    <input type="text"  class="form-control" id="subject" name="subject" value="${list.subject}" disabled>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">학년</label>
                                            </div>

                                            <div class="col-lg-5 row">
                                                <div class="col-lg-12 form-label text-dark pt-3" id="showIsGradeY" style="display: ${not empty list ? 'block' : 'none'}">
                                                    <c:out value="${list.grade}"/>
                                                </div>
                                                <div class="col-lg-12 form-label text-dark fv-row" id="showIsGradeN" style="display: ${empty list ? 'block' : 'none'}">
                                                    <input type="text"  class="form-control" id="grade" name="grade" value="${list.grade}" disabled>
                                                </div>
                                            </div>

                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3 d-flex align-items-center justify-content-center">학기</label>
                                            </div>

                                            <div class="col-lg-5">
                                                <div class="col-lg-12 form-label text-dark pt-3 fv-row" id="showIsSemesterY" style="display: ${not empty list ? 'block' : 'none'}">
                                                    <c:out value="${list.semester}"/>
                                                </div>
                                                <div class="col-lg-12 form-label text-dark" id="showIsSemesterN" style="display: ${empty list ? 'block' : 'none'};">
                                                    <input type="text"  class="form-control" id="semester" name="semester" value="${list.semester}" disabled>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 row">

                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">시리즈코드</label>
                                            </div>
                                            <div class="col-lg-5 row" style="display: ${not empty list ? 'block' : 'none'}">
                                                <div class="row">
                                                    <div class="col-lg-5 row pt-3">
                                                        <div class="col-lg-5 form-label text-dark pt-3">
                                                            코드번호
                                                        </div>
                                                        <div class="col-lg-7 form-label text-primary pt-3">
                                                            <c:out value="${list.seriesCode}"/>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-7 row pt-3">
                                                        <div class="col-lg-5 form-label text-dark pt-3">
                                                            시리즈명
                                                        </div>
                                                        <div class="col-lg-7 form-label text-primary pt-3">
                                                            <c:out value="${list.seriesCodeName}"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <input type="hidden" id="seriesDescription" value="${list.seriesDescription}"/>

                                            <div class="col-lg-5 row" style="display: ${empty list ? 'flex' : 'none'}">

                                                <div class="col-lg-4 row">
                                                    <div class="col-lg-12 form-label text-dark pt-3">
                                                        <div class="col-lg-12 form-label text-dark pt-3" style="display : ${not empty list ? 'block' : 'none'}">
                                                            <c:out value="${list.seriesCode}"/>
                                                        </div>

                                                        <input type="text"  class="form-control" id="seriesCode" name="seriesCode" value="${list.seriesCode}" disabled style="display: ${empty list ? 'block' : 'none'}">
                                                    </div>
                                                </div>

                                                <div class="col-lg-8 form-label text-dark pt-3">
                                                    <div class="col-lg-12 form-label text-dark pt-3" style="display : ${not empty list ? 'block' : 'none'}">
                                                        <c:out value="${list.seriesCodeName}"/>
                                                    </div>
                                                    <input type="text"  class="form-control" id="seriesCodeName" name="seriesCodeName" value="${list.seriesCodeName}" disabled style="display: ${empty list ? 'block' : 'none'}">
                                                </div>
                                            </div>

                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3 d-flex align-items-center justify-content-center required">년도</label>
                                            </div>

                                            <div class="col-lg-5">
                                                <div class="col-lg-12 form-label text-dark pt-3 fv-row">
                                                    <input type="text"  class="form-control" maxlength="4" id="year" name="year" value="${list.year}" ${empty list ? 'disabled' : ''} >
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required-check ${empty list ? 'required' : ''}">개정 교육과정</label>
                                            </div>
                                            <div class="col-lg-10" id="showIsRevisionCurriculumN">
                                                <div class="col-lg-4 d-flex flex-column align-items-start justify-content-start fv-row" id="revisionCurriculumSelect2">
                                                    <select
                                                            id="revisionCurriculum"
                                                            name="revisionCurriculum"
                                                            class="form-select form-select-solid unselect-form"
                                                            data-control="select2"
                                                            data-hide-search="true"
                                                            data-placeholder="선택"
                                                            onchange="formSelect2()"
                                                    >
                                                        <option></option>
                                                        <option value="2009" ${list.revisionCurriculum eq '2009' ? 'selected' : ''}>2009년 개정 교육과정</option>
                                                        <option value="2015" ${list.revisionCurriculum eq '2015' ? 'selected' : ''}>2015년 개정 교육과정</option>
                                                        <option value="2022" ${list.revisionCurriculum eq '2022' ? 'selected' : ''}>2022년 개정 교육과정</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required-check ${empty list ? 'required' : ''}">참고서명</label>
                                            </div>

                                            <div class="col-lg-10" id="showIsReferenceBookTitleN">
                                                <div class="col-lg-12 form-label text-dark flex-column fv-row">
                                                    <input
                                                            type="text"
                                                            class="form-control"
                                                            id="referenceBookTitle"
                                                            minlength="2"
                                                            maxlength="50"
                                                            name="referenceBookTitle"
                                                            placeholder="참고서명 입력"
                                                            value="${list.referenceBookTitle}"
                                                    >
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8" id="floatingBanner">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required-check ${empty list ? 'required' : ''}">섬네일</label>
                                            </div>
                                            <div class="fv-row fv-plugins-icon-container flex-column col-lg-10" id="dz0Container">
                                                <!-- 파일 업로드 섹션 -->
                                                <jsp:include page="/FileFormINC" flush="false">
                                                    <jsp:param name="fileFormType" value="Y" />
                                                    <jsp:param name="isImage" value="false" />
                                                    <jsp:param name="hasOrder" value="false" />
                                                    <jsp:param name="parentTable" value="REFERENCE_BOOK"/>
                                                    <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                    <jsp:param name="parentType" value="THUMBNAIL"/>
                                                    <jsp:param name="maxFileCount" value="1"/>
                                                    <jsp:param name="isSecure" value="N"/>
                                                    <jsp:param name="DZID" value="dz0"/>
                                                    <jsp:param name="dropzoneIndex" value="0"/>
                                                    <jsp:param name="description" value="이미지 파일명은 북코드+연도+0.jpg(예: 10101320150.jpg)로 첨부해 주세요.__파일 크기는 1Mb이하, jpg, jpeg, png 형식의 파일만 가능합니다.__ 섬네일 이미지는 440px * 600px 업로드 해주세요."/>
                                                </jsp:include>
                                                <span class="base-input__error" id="thumbnailFileError"></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check ${empty list ? 'required' : ''} pt-3">성격</label>
                                            </div>
                                            <div class="col-lg-10" id="showIsBookCharacterN" >
                                                <div class="col-lg-12 form-label text-dark flex-column fv-row">
                                                    <input type="text"  class="form-control" id="bookCharacter" maxlength="50" placeholder="성격 입력" name="bookCharacter" value="${list.bookCharacter}">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check ${empty list ? 'required' : ''} pt-3">집필진 정보</label>
                                            </div>
                                            <div class="col-lg-10" id="showIsAuthorN">
                                                <div class="col-lg-12 form-label text-dark flex-column fv-row">
                                                    <input type="text"  class="form-control" id="author" maxlength="1000" placeholder="집필진 입력" name="author" value="${list.author}" required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">구성</label>
                                            </div>

                                            <div class="col-lg-4 pt-3 row" id="showIsBookStructureN">
                                                <div class="col-lg-12 form-label text-dark flex-column fv-row">
                                                    <input type="text"  class="form-control" id="bookStructure" maxlength="50" name="bookStructure" placeholder="본문, 해설 쪽수 입력" value="${list.bookStructure}">
                                                </div>
                                            </div>
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3  d-flex align-items-center justify-content-center">사이즈</label>
                                            </div>

                                            <div class="col-lg-4 pt-3 row" id="showIsWidthN">
                                                <div class="col-lg-5 form-label text-dark flex-column fv-row">
                                                    <input type="text"  class="form-control numberCheck" id="width" maxlength="4" name="width" placeholder="가로" value="${list.width}">
                                                </div>
                                                <label class="col-lg-1  d-flex align-items-center justify-content-center">
                                                    <i class="fas bi-asterisk me-2 d-flex align-items-center justify-content-center pb-3"></i>
                                                </label>
                                                <div class="col-lg-5 form-label text-dark flex-column fv-row">
                                                    <input type="text"  class="form-control numberCheck" id="height" maxlength="4" name="height"  placeholder="세로" value="${list.height}">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">색도</label>
                                            </div>
                                            <div class="col-lg-4 pt-3 row" id="showIsChromacityN">
                                                <div class="col-lg-4 form-label text-dark flex-column fv-row">
                                                    <input type="text"  class="form-control" id="chromacity" name="chromacity" maxlength="20" placeholder="색도" value="${list.chromacity}">
                                                </div>
                                                <label class="col-lg-1  d-flex align-items-center justify-content-center">
                                                    도
                                                </label>
                                            </div>
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 d-flex align-items-center justify-content-center">정가</label>
                                            </div>
                                            <div class="col-lg-4 pt-3 row" id="showIsPriceN">
                                                <div class="col-lg-5 form-label text-dark flex-column fv-row">
                                                    <input type="text"  class="form-control numberCheck" id="price" name="price" maxlength="5" placeholder="정가" value="${list.price}">
                                                </div>
                                                <label class="col-lg-1  d-flex align-items-center justify-content-center">
                                                    원
                                                </label>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check ${empty list ? 'required' : ''} pt-3">미리보기</label>
                                            </div>
                                            <div class="col-lg-10" id="showIsPreviewUrlN">
                                                <div class="row mb-4">
                                                    <div class="col-lg-2 row">
                                                        <div class="col">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                <input class="form-check-input" type="radio" name="preview" value="URL" ${not empty list.previewUrl || empty list ? 'checked' : ''} id="isUSE" onclick="showPdf()"/>
                                                                <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isUSE">
                                                                    URL 경로
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                <input class="form-check-input" type="radio" name="preview" value="PDF" ${list.previewUrl eq ''  ? 'checked' : ''} id="isPDF" onclick="showPdf()"/>
                                                                <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isPDF">
                                                                    PDF 등록
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div id="url" class="col-lg-12 form-label text-dark flex-column fv-row" style="display:  ${list.previewUrl ne '' ? 'block' : 'none'}">
                                                        <input type="text"  class="form-control" placeholder="URL 경로 입력" maxlength="1500" id="previewUrl" name="previewUrl" value="${list.previewUrl}">
                                                    </div>
                                                    <div id="dz1Container" class="col-lg-12 form-label text-dark" style="display:  ${list.previewUrl eq '' ? 'block' : 'none'}">
                                                        <jsp:include page="/FileFormINC" flush="false">
                                                            <jsp:param name="fileFormType" value="Y" />
                                                            <jsp:param name="isImage" value="false" />
                                                            <jsp:param name="hasOrder" value="false" />
                                                            <jsp:param name="parentTable" value="REFERENCE_BOOK"/>
                                                            <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                            <jsp:param name="parentType" value="PDF"/>
                                                            <jsp:param name="maxFileCount" value="1"/>
                                                            <jsp:param name="isSecure" value="N"/>
                                                            <jsp:param name="DZID" value="dz1"/>
                                                            <jsp:param name="dropzoneIndex" value="1"/>
                                                            <jsp:param name="description" value="파일 크기는 300mb 이하, pdf 형식의 파일만 가능합니다."/>
                                                        </jsp:include>
                                                        <span class="base-input__error" id="pdfError"></span>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check ${empty list ? 'required' : ''} pt-3">견본신청 노출여부</label>
                                            </div>
                                            <div class="col-lg-7 pt-3 row" id="showIsRequestSampleN">
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
                                            <div class="col-lg-7 pt-3 row" id="showIsOpenN">
                                                <div class="col-lg-2 row pt-0">
                                                    <div class="col">
                                                        <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                            <input class="form-check-input" type="radio" name="isOpen" value="N" ${list.isOpen eq 'N' || empty list ? 'checked' : ''} id="isN" onclick="isIntroShowRadio(this)"/>
                                                            <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isN">
                                                                N
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                            <input class="form-check-input" type="radio" name="isOpen" value="Y" ${list.isOpen eq 'Y' ? 'checked' : ''} id="isY"  onclick="isIntroShowRadio(this)"/>
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
                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check pt-3">인트로 노출여부</label>
                                            </div>
                                            <div class="col-lg-7 pt-3 row" id="showIsIntroN">
                                                <div class="col-lg-2 row">
                                                    <div class="col">
                                                        <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                            <input class="form-check-input" type="radio" name="isIntro" value="N" ${list.isIntro eq 'N' || empty list ? 'checked' : ''} id="isIntroN" ${list.isOpen eq 'N' || empty list ? 'disabled' : ''} onclick="validateIsIntro()"/>
                                                            <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isIntroN">
                                                                N
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                            <input class="form-check-input" type="radio" name="isIntro" value="Y"  ${list.isIntro eq 'Y' ? 'checked' : ''} id="isIntroY" ${list.isOpen eq 'N' || empty list ? 'disabled' : ''} onclick="validateIsIntro()"/>
                                                            <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isIntroY">
                                                                Y
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-10 pt-3">
                                                    <span class="ms-2" style="color: gray;">* 인트로 노출여부 설정은 초등/중학/고등 각 10개씩 총 30개 등록이 가능합니다.</span>
                                                </div>
                                                <span class="base-input__error" id="showIsIntroNError"></span>
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

                                                <div class="col-lg-9">
                                                    <!-- "PC" 섹션 -->
                                                    <div class="row mb-3">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-2 d-flex align-items-center justify-content-center ">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check">정오표</label>
                                                            </div>

                                                            <div class="fv-row fv-plugins-icon-container col-lg-10 pb-5 flex-column" id="dz2Container">
                                                                <!-- 파일 업로드 섹션 -->
                                                                <jsp:include page="/FileFormINC" flush="false">
                                                                    <jsp:param name="fileFormType" value="Y" />
                                                                    <jsp:param name="isImage" value="false" />
                                                                    <jsp:param name="hasOrder" value="false" />
                                                                    <jsp:param name="parentTable" value="REFERENCE_BOOK"/>
                                                                    <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                                    <jsp:param name="parentType" value="STUDENT-CORRIGENDUM"/>
                                                                    <jsp:param name="maxFileCount" value="1"/>
                                                                    <jsp:param name="isSecure" value="N"/>
                                                                    <jsp:param name="DZID" value="dz2"/>
                                                                    <jsp:param name="dropzoneIndex" value="2"/>
                                                                    <jsp:param name="description" value="파일 크기는 300mb 이하, mp3, mp4, pdf, jpg, jpeg, png, hwp, hwpx, ppt, pptx, dox, doxc, zip 형식의 파일만 가능합니다."/>
                                                                </jsp:include>
                                                                <span class="base-input__error" id="studentCorrigendumError"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- "Mobile" 섹션 -->
                                                    <div class="row mb-3">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-2 d-flex align-items-center justify-content-center ">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check">정답 및 해설</label>
                                                            </div>
                                                            <div class="fv-row fv-plugins-icon-container col-lg-10 pb-5 flex-column" id="dz3Container">
                                                                <!-- 파일 업로드 섹션 -->
                                                                <jsp:include page="/FileFormINC" flush="false">
                                                                    <jsp:param name="fileFormType" value="Y" />
                                                                    <jsp:param name="isImage" value="false" />
                                                                    <jsp:param name="hasOrder" value="false" />
                                                                    <jsp:param name="parentTable" value="REFERENCE_BOOK"/>
                                                                    <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                                    <jsp:param name="parentType" value="STUDENT-ANSWER"/>
                                                                    <jsp:param name="maxFileCount" value="1"/>
                                                                    <jsp:param name="isSecure" value="N"/>
                                                                    <jsp:param name="DZID" value="dz3"/>
                                                                    <jsp:param name="dropzoneIndex" value="3"/>
                                                                    <jsp:param name="description" value="파일 크기는 300mb 이하, mp3, mp4, pdf, jpg, jpeg, png, hwp, hwpx, ppt, pptx, dox, doxc, zip 형식의 파일만 가능합니다."/>
                                                                </jsp:include>
                                                                <span class="base-input__error" id="studentAnswerError"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-2 d-flex align-items-center justify-content-center ">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check">듣기MP3</label>
                                                            </div>

                                                            <div class="fv-row fv-plugins-icon-container col-lg-10 pb-5 flex-column" id="dz4Container">
                                                                <!-- 파일 업로드 섹션 -->
                                                                <jsp:include page="/FileFormINC" flush="false">
                                                                    <jsp:param name="fileFormType" value="Y" />
                                                                    <jsp:param name="isImage" value="false" />
                                                                    <jsp:param name="hasOrder" value="false" />
                                                                    <jsp:param name="parentTable" value="REFERENCE_BOOK"/>
                                                                    <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                                    <jsp:param name="parentType" value="STUDENT-MP3"/>
                                                                    <jsp:param name="maxFileCount" value="1"/>
                                                                    <jsp:param name="isSecure" value="N"/>
                                                                    <jsp:param name="DZID" value="dz4"/>
                                                                    <jsp:param name="dropzoneIndex" value="4"/>
                                                                    <jsp:param name="description" value="파일 크기는 300mb 이하, mp3, mp4, pdf, jpg, jpeg, png, hwp, hwpx, ppt, pptx, dox, doxc, zip 형식의 파일만 가능합니다."/>
                                                                </jsp:include>
                                                                <span class="base-input__error" id="studentMp3Error"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-2 d-flex align-items-center justify-content-center ">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check">강남구청 인터넷<br>수능방송</label>
                                                            </div>
                                                            <div class="fv-row fv-plugins-icon-container col-lg-10 view">
                                                                <input
                                                                        type="text"
                                                                        id="gangnamBroadcastUrl"
                                                                        name="gangnamBroadcastUrl"
                                                                        class="form-control"
                                                                        placeholder="URL 경로 입력"
                                                                        maxlength="100"
                                                                        value="${list.gangnamBroadcastUrl}"
                                                                />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-2 d-flex align-items-center justify-content-center ">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check">오답용노트 문제</label>
                                                            </div>

                                                            <div class="fv-row fv-plugins-icon-container col-lg-10 pb-5 flex-column" id="dz5Container">
                                                                <!-- 파일 업로드 섹션 -->
                                                                <jsp:include page="/FileFormINC" flush="false">
                                                                    <jsp:param name="fileFormType" value="Y" />
                                                                    <jsp:param name="isImage" value="false" />
                                                                    <jsp:param name="hasOrder" value="false" />
                                                                    <jsp:param name="parentTable" value="REFERENCE_BOOK"/>
                                                                    <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                                    <jsp:param name="parentType" value="STUDENT-WRONG-ANSWER"/>
                                                                    <jsp:param name="maxFileCount" value="1"/>
                                                                    <jsp:param name="isSecure" value="N"/>
                                                                    <jsp:param name="DZID" value="dz5"/>
                                                                    <jsp:param name="dropzoneIndex" value="5"/>
                                                                    <jsp:param name="description" value="파일 크기는 300mb 이하, mp3, mp4, pdf, jpg, jpeg, png, hwp, hwpx, ppt, pptx, dox, doxc, zip 형식의 파일만 가능합니다."/>
                                                                </jsp:include>
                                                                <span class="base-input__error" id="studentWrongAnswerError"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-2 d-flex align-items-center justify-content-center ">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check">빈 정리노트</label>
                                                            </div>

                                                            <div class="fv-row fv-plugins-icon-container col-lg-10 pb-5 flex-column" id="dz6Container">
                                                                <!-- 파일 업로드 섹션 -->
                                                                <jsp:include page="/FileFormINC" flush="false">
                                                                    <jsp:param name="fileFormType" value="Y" />
                                                                    <jsp:param name="isImage" value="false" />
                                                                    <jsp:param name="hasOrder" value="false" />
                                                                    <jsp:param name="parentTable" value="REFERENCE_BOOK"/>
                                                                    <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                                    <jsp:param name="parentType" value="STUDENT-BLANK-NOTE"/>
                                                                    <jsp:param name="maxFileCount" value="1"/>
                                                                    <jsp:param name="isSecure" value="N"/>
                                                                    <jsp:param name="DZID" value="dz6"/>
                                                                    <jsp:param name="dropzoneIndex" value="6"/>
                                                                    <jsp:param name="description" value="파일 크기는 300mb 이하, mp3, mp4, pdf, jpg, jpeg, png, hwp, hwpx, ppt, pptx, dox, doxc, zip 형식의 파일만 가능합니다."/>
                                                                </jsp:include>
                                                                <span class="base-input__error" id="studentBlankNoteError"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-2 d-flex align-items-center justify-content-center ">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check">선배들의 정리노트</label>
                                                            </div>

                                                            <div class="fv-row fv-plugins-icon-container col-lg-10 pb-5 flex-column" id="dz7Container">
                                                                <!-- 파일 업로드 섹션 -->
                                                                <jsp:include page="/FileFormINC" flush="false">
                                                                    <jsp:param name="fileFormType" value="Y" />
                                                                    <jsp:param name="isImage" value="false" />
                                                                    <jsp:param name="hasOrder" value="false" />
                                                                    <jsp:param name="parentTable" value="REFERENCE_BOOK"/>
                                                                    <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                                    <jsp:param name="parentType" value="STUDENT-SENIOR-NOTE"/>
                                                                    <jsp:param name="maxFileCount" value="1"/>
                                                                    <jsp:param name="isSecure" value="N"/>
                                                                    <jsp:param name="DZID" value="dz7"/>
                                                                    <jsp:param name="dropzoneIndex" value="7"/>
                                                                    <jsp:param name="description" value="파일 크기는 300mb 이하, mp3, mp4, pdf, jpg, jpeg, png, hwp, hwpx, ppt, pptx, dox, doxc, zip 형식의 파일만 가능합니다."/>
                                                                </jsp:include>
                                                                <span class="base-input__error" id="studentSeniorNoteError"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-2 d-flex align-items-center justify-content-center ">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check">학생용자료 1</label>
                                                            </div>

                                                            <div class="fv-row fv-plugins-icon-container col-lg-10 pb-5 flex-column" id="dz8Container">
                                                                <!-- 파일 업로드 섹션 -->
                                                                <jsp:include page="/FileFormINC" flush="false">
                                                                    <jsp:param name="fileFormType" value="Y" />
                                                                    <jsp:param name="isImage" value="false" />
                                                                    <jsp:param name="hasOrder" value="false" />
                                                                    <jsp:param name="parentTable" value="REFERENCE_BOOK"/>
                                                                    <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                                    <jsp:param name="parentType" value="STUDENT-DATA1"/>
                                                                    <jsp:param name="maxFileCount" value="1"/>
                                                                    <jsp:param name="isSecure" value="N"/>
                                                                    <jsp:param name="DZID" value="dz8"/>
                                                                    <jsp:param name="dropzoneIndex" value="8"/>
                                                                    <jsp:param name="description" value="파일 크기는 300mb 이하, mp3, mp4, pdf, jpg, jpeg, png, hwp, hwpx, ppt, pptx, dox, doxc, zip 형식의 파일만 가능합니다."/>
                                                                </jsp:include>
                                                                <span class="base-input__error" id="studentData1Error"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-2 d-flex align-items-center justify-content-center ">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check">학생용자료 2</label>
                                                            </div>

                                                            <div class="fv-row fv-plugins-icon-container col-lg-10 pb-5 flex-column" id="dz9Container">
                                                                <!-- 파일 업로드 섹션 -->
                                                                <jsp:include page="/FileFormINC" flush="false">
                                                                    <jsp:param name="fileFormType" value="Y" />
                                                                    <jsp:param name="isImage" value="false" />
                                                                    <jsp:param name="hasOrder" value="false" />
                                                                    <jsp:param name="parentTable" value="REFERENCE_BOOK"/>
                                                                    <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                                    <jsp:param name="parentType" value="STUDENT-DATA2"/>
                                                                    <jsp:param name="maxFileCount" value="1"/>
                                                                    <jsp:param name="isSecure" value="N"/>
                                                                    <jsp:param name="DZID" value="dz9"/>
                                                                    <jsp:param name="dropzoneIndex" value="9"/>
                                                                    <jsp:param name="description" value="파일 크기는 300mb 이하, mp3, mp4, pdf, jpg, jpeg, png, hwp, hwpx, ppt, pptx, dox, doxc, zip 형식의 파일만 가능합니다."/>
                                                                </jsp:include>
                                                                <span class="base-input__error" id="studentData2Error"></span>
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

                                                <div class="col-lg-9">
                                                    <!-- "PC" 섹션 -->
                                                    <div class="row mb-3">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-2 d-flex align-items-center ">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check">HWP지문</label>
                                                            </div>

                                                            <div class="fv-row fv-plugins-icon-container col-lg-10 pb-5 flex-column" id="dz10Container">
                                                                <!-- 파일 업로드 섹션 -->
                                                                <jsp:include page="/FileFormINC" flush="false">
                                                                    <jsp:param name="fileFormType" value="Y" />
                                                                    <jsp:param name="isImage" value="false" />
                                                                    <jsp:param name="hasOrder" value="false" />
                                                                    <jsp:param name="parentTable" value="REFERENCE_BOOK"/>
                                                                    <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                                    <jsp:param name="parentType" value="TEACHER-HWP"/>
                                                                    <jsp:param name="maxFileCount" value="1"/>
                                                                    <jsp:param name="isSecure" value="N"/>
                                                                    <jsp:param name="DZID" value="dz10"/>
                                                                    <jsp:param name="dropzoneIndex" value="10"/>
                                                                    <jsp:param name="description" value="파일 크기는 300mb 이하, mp3, mp4, pdf, jpg, jpeg, png, hwp, hwpx, ppt, pptx, dox, doxc, zip 형식의 파일만 가능합니다."/>
                                                                </jsp:include>
                                                                <span class="base-input__error" id="teacherHwpError"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- "Mobile" 섹션 -->
                                                    <div class="row mb-3">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-2 d-flex align-items-center">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check">PDF지문<br>(강의용 PDF)</label>
                                                            </div>
                                                            <div class="fv-row fv-plugins-icon-container col-lg-10 pb-5 flex-column" id="dz11Container">
                                                                <!-- 파일 업로드 섹션 -->
                                                                <jsp:include page="/FileFormINC" flush="false">
                                                                    <jsp:param name="fileFormType" value="Y" />
                                                                    <jsp:param name="isImage" value="false" />
                                                                    <jsp:param name="hasOrder" value="false" />
                                                                    <jsp:param name="parentTable" value="REFERENCE_BOOK"/>
                                                                    <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                                    <jsp:param name="parentType" value="TEACHER-PDF"/>
                                                                    <jsp:param name="maxFileCount" value="1"/>
                                                                    <jsp:param name="isSecure" value="N"/>
                                                                    <jsp:param name="DZID" value="dz11"/>
                                                                    <jsp:param name="dropzoneIndex" value="11"/>
                                                                    <jsp:param name="description" value="파일 크기는 300mb 이하, mp3, mp4, pdf, jpg, jpeg, png, hwp, hwpx, ppt, pptx, dox, doxc, zip 형식의 파일만 가능합니다."/>
                                                                </jsp:include>
                                                                <span class="base-input__error" id="teacherPdfError"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-2 d-flex align-items-center ">
                                                                <label class="col-lg-12 form-label fw-bolder text-dark required-check">기타자료 1<br>(학생용 PDF)</label>
                                                            </div>

                                                            <div class="fv-row fv-plugins-icon-container col-lg-10 pb-5 flex-column" id="dz12Container">
                                                                <!-- 파일 업로드 섹션 -->
                                                                <jsp:include page="/FileFormINC" flush="false">
                                                                    <jsp:param name="fileFormType" value="Y" />
                                                                    <jsp:param name="isImage" value="false" />
                                                                    <jsp:param name="hasOrder" value="false" />
                                                                    <jsp:param name="parentTable" value="REFERENCE_BOOK"/>
                                                                    <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                                    <jsp:param name="parentType" value="TEACHER-ETC1"/>
                                                                    <jsp:param name="maxFileCount" value="1"/>
                                                                    <jsp:param name="isSecure" value="N"/>
                                                                    <jsp:param name="DZID" value="dz12"/>
                                                                    <jsp:param name="dropzoneIndex" value="12"/>
                                                                    <jsp:param name="description" value="파일 크기는 300mb 이하, mp3, mp4, pdf, jpg, jpeg, png, hwp, hwpx, ppt, pptx, dox, doxc, zip 형식의 파일만 가능합니다."/>
                                                                </jsp:include>
                                                                <span class="base-input__error" id="teacherEtc1Error"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-2 d-flex align-items-center ">
                                                                <div class="col-lg-12 flex-column">
                                                                    <input
                                                                            type="text"
                                                                            id="etcData2"
                                                                            name="etcData2"
                                                                            class="form-control textModifyDetail"
                                                                            placeholder="탭 명칭 입력"
                                                                            maxlength="12"
                                                                            oninput="validationDetailTitle(this)"
                                                                            <c:if test="${list.etcData2 eq '' || empty list}">
                                                                                value="<c:out value="기타자료 2"/>"
                                                                            </c:if>
                                                                            <c:if test="${list.etcData2 ne '' && not empty list}">
                                                                                value="${list.etcData2}"
                                                                            </c:if>
                                                                    />
                                                                    <span class="base-input__error" id="etcData2Error"></span>
                                                                </div>
                                                            </div>

                                                            <div class="fv-row fv-plugins-icon-container col-lg-10 pb-5 flex-column" id="dz13Container">
                                                                <!-- 파일 업로드 섹션 -->
                                                                <jsp:include page="/FileFormINC" flush="false">
                                                                    <jsp:param name="fileFormType" value="Y" />
                                                                    <jsp:param name="isImage" value="false" />
                                                                    <jsp:param name="hasOrder" value="false" />
                                                                    <jsp:param name="parentTable" value="REFERENCE_BOOK"/>
                                                                    <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                                    <jsp:param name="parentType" value="TEACHER-ETC2"/>
                                                                    <jsp:param name="maxFileCount" value="1"/>
                                                                    <jsp:param name="isSecure" value="N"/>
                                                                    <jsp:param name="DZID" value="dz13"/>
                                                                    <jsp:param name="dropzoneIndex" value="13"/>
                                                                    <jsp:param name="description" value="파일 크기는 300mb 이하, mp3, mp4, pdf, jpg, jpeg, png, hwp, hwpx, ppt, pptx, dox, doxc, zip 형식의 파일만 가능합니다."/>
                                                                </jsp:include>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-2 d-flex align-items-center ">
                                                                <div class="col-lg-12 flex-column">
                                                                    <input
                                                                            type="text"
                                                                            id="etcData3"
                                                                            name="etcData3"
                                                                            class="form-control textModifyDetail"
                                                                            placeholder="탭 명칭 입력"
                                                                            maxlength="12"
                                                                            oninput="validationDetailTitle(this)"
                                                                            <c:if test="${list.etcData3 eq '' || empty list}">
                                                                                value="<c:out value="기타자료 3"/>"
                                                                            </c:if>
                                                                            <c:if test="${list.etcData3 ne '' && not empty list}">
                                                                                value="${list.etcData3}"
                                                                            </c:if>
                                                                    />
                                                                    <span class="base-input__error" id="etcData3Error"></span>
                                                                </div>
                                                            </div>

                                                            <div class="fv-row fv-plugins-icon-container col-lg-10 pb-5 flex-column" id="dz14Container">
                                                                <!-- 파일 업로드 섹션 -->
                                                                <jsp:include page="/FileFormINC" flush="false">
                                                                    <jsp:param name="fileFormType" value="Y" />
                                                                    <jsp:param name="isImage" value="false" />
                                                                    <jsp:param name="hasOrder" value="false" />
                                                                    <jsp:param name="parentTable" value="REFERENCE_BOOK"/>
                                                                    <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                                    <jsp:param name="parentType" value="TEACHER-ETC3"/>
                                                                    <jsp:param name="maxFileCount" value="1"/>
                                                                    <jsp:param name="isSecure" value="N"/>
                                                                    <jsp:param name="DZID" value="dz14"/>
                                                                    <jsp:param name="dropzoneIndex" value="14"/>
                                                                    <jsp:param name="description" value="파일 크기는 300mb 이하, mp3, mp4, pdf, jpg, jpeg, png, hwp, hwpx, ppt, pptx, dox, doxc, zip 형식의 파일만 가능합니다."/>
                                                                </jsp:include>
                                                                <span class="base-input__error" id="teacherEtc3Error"></span>
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
                                        <div class="row mb-8 detailSection">

                                            <div class="col-lg-12 row">
                                                <div class="col-lg-2  d-flex align-items-center justify-content-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required-check">교재소개</label>
                                                    <input type="hidden" class="detailTitle" value="교재소개"/>
                                                </div>
                                                <div class="col-lg-10">
                                                    <div class="view" >
                                                        <textarea class="form-control form-control-solid contents"
                                                                  type="text"
                                                                  rows="5"
                                                                  id="referenceBookDetail"
                                                                  minlength="1"
                                                                  name="referenceBookDetail"
                                                                  placeholder="Content"
                                                        >${list.referenceBookDetail[0].detailContent}</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-8 detailSection">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-2  d-flex align-items-center justify-content-center">
                                                    <div class="col-lg-12">
                                                        <input
                                                                type="text"
                                                                id="detailTitle1"
                                                                name="detailTitle1"
                                                                class="form-control ${list.referenceBookDetail[1].isUse eq 'Y' ? '' : 'form-control-solid'} textModifyDetail detailTitle"
                                                                placeholder="탭 명칭 입력"
                                                                maxlength="12"
                                                                <c:if test="${list.referenceBookDetail[1].detailTitle eq '' || empty list}">
                                                                    value="<c:out value="교재서평"/>"
                                                                </c:if>
                                                                <c:if test="${list.referenceBookDetail[1].detailTitle ne ''}">
                                                                    value="<c:out value="${list.referenceBookDetail[1].detailTitle}"/>"
                                                                </c:if>
                                                                maxlength="12"
                                                                minlength="2"
                                                                oninput="validationDetailTitle(this)"
                                                        ${list.referenceBookDetail[1].isUse eq 'Y' ? '' : 'disabled'}
                                                        />
                                                        <span class="base-input__error" id="detailTitle1Error"></span>
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
                                                                                name="isUse1"
                                                                                value="N"
                                                                                data-froalaIdx="referenceBookDetailFroalaEditor1"
                                                                                data-title="detailTitle1"
                                                                                onclick="changeEditor(this)"
                                                                        ${list.referenceBookDetail[1].isUse eq 'N' || empty list ? 'checked' : ''}
                                                                                id="isNField1"
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
                                        <div class="row mb-8 detailSection">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-2  d-flex align-items-center">
                                                    <div class="col-lg-12">
                                                        <input
                                                                type="text"
                                                                id="detailTitle2"
                                                                name="detailTitle2"
                                                                class="form-control ${list.referenceBookDetail[2].isUse eq 'Y' ? '' : 'form-control-solid'} textModifyDetail detailTitle"
                                                                placeholder="탭 명칭 입력"
                                                                minlength="2"
                                                                maxlength="12"
                                                                <c:if test="${list.referenceBookDetail[2].detailTitle eq ''|| empty list}">
                                                                    value="<c:out value="내용문의"/>"
                                                                </c:if>
                                                                <c:if test="${list.referenceBookDetail[2].detailTitle ne ''}">
                                                                    value="<c:out value="${list.referenceBookDetail[2].detailTitle}"/>"
                                                                </c:if>
                                                        ${list.referenceBookDetail[2].isUse eq 'Y' ? '' : 'disabled'}
                                                                oninput="validationDetailTitle(this)"
                                                        />
                                                        <span class="base-input__error" id="detailTitle2Error"></span>
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
                                        <div class="row mb-8 detailSection">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-2  d-flex align-items-center">
                                                    <div class="col-lg-12">
                                                        <input
                                                                type="text"
                                                                id="detailTitle3"
                                                                name="detailTitle3"
                                                                class="form-control ${list.referenceBookDetail[3].isUse eq 'Y' ? '' : 'form-control-solid'} textModifyDetail detailTitle"
                                                                placeholder="탭 명칭 입력"
                                                                minlength="2"
                                                                maxlength="12"
                                                                <c:if test="${list.referenceBookDetail[3].detailTitle eq '' || empty list}">
                                                                    value="<c:out value="오류신고"/>"
                                                                </c:if>
                                                                <c:if test="${list.referenceBookDetail[3].detailTitle ne ''}">
                                                                    value="<c:out value="${list.referenceBookDetail[3].detailTitle}"/>"
                                                                </c:if>
                                                        ${list.referenceBookDetail[3].isUse eq 'Y' ? '' : 'disabled'}
                                                                oninput="validationDetailTitle(this)"
                                                        />
                                                        <span class="base-input__error" id="detailTitle3Error"></span>
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
                                                                                name="isUse3"
                                                                                value="N"
                                                                                data-title="detailTitle3"
                                                                                onclick="changeEditor(this)"
                                                                        ${list.referenceBookDetail[3].isUse eq 'N' || empty list ? 'checked' : ''}
                                                                                id="isNField3"
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
                                    <c:if test="${empty param.uid}">
                                        <div class="card-footer" id="footerIdx">
                                            <div class="row">
                                                <div id="listGroup" class="col-3">

                                                </div>
                                                <div id="editGroup" class="col-9 d-flex justify-content-end">
                                                    <a
                                                            type="button"
                                                            id="deleteBtn"
                                                            class="btn btn-light-warning me-2"
                                                            style="background-color: #fff3cd; color: #181C32"
                                                            href="/reference-book/reference-book-list">
                                                        취소
                                                    </a>
                                                    <button type="button" class="btn btn-warning" style="background-color: #ffcd39; color: #181C32" onclick="save()">
                                                        저장
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                            </div>


                            <c:if test="${not empty param.uid}">
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
                                    <div class="card-footer" id="footerIdx">
                                        <div class="row" id="modifyButton">
                                            <div class="col-3">
                                            </div>
                                            <div  class="col-9 d-flex justify-content-end">
                                                <a
                                                        data-uid="${list.uid}"
                                                        type="button"
                                                        id="deleteBtn"
                                                        class="btn btn-light-warning me-2"
                                                        style="background-color: #fff3cd; color: #181C32"
                                                        href="/reference-book/reference-book/${list.uid}">
                                                    취소
                                                </a>
                                                <button
                                                        type="button"
                                                        data-uid="${list.uid}"
                                                        data-idx="${list.idx}"
                                                        class="btn btn-light-warning"
                                                        style="background-color: #ffcd39; color: #181C32"
                                                        onclick="modify(this)">
                                                    저장
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>

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
<script src="/assets/js/file.js"></script>
<script type="text/javascript">
    const uid = document.getElementById('uid').value;
    const VALID_CLASS = '';
    const INVALID_CLASS = 'is-invalid';
    let invalidFields = [];
    let formValidation = null;
    let isValidate = false;

    const formValidationOption = {
        fields : {
            bookCode : {
                validators : {
                    notEmpty : {
                        message : '* 북코드를 입력해주세요.'
                    }
                }
            },
            year: {
                validators: {
                    callback: {
                        message: '* 년도를 입력해주세요.',
                        callback: function () {
                            const value = document.getElementById('bookCode').value.trim();
                            const value2 = document.getElementById('year').value.trim();

                            if (value === '') {
                                return true;
                            } else if (value2 === '') {
                                return false;
                            }
                            return true;
                        }
                    }
                }
            },
            revisionCurriculum: {
                validators: {
                    notEmpty: {
                        message: '* 개정 교육과정을 입력해주세요.'
                    }
                }
            },
            referenceBookTitle: {
                validators: {
                    callback: {
                        message: '* 참고서명을 입력해주세요.',
                        callback: function() {
                            const value = document.getElementById('referenceBookTitle').value.trim();
                            console.log('----', value.length)
                            if (value === '') {
                                return false;
                            } else if (value.length < 2 || value.length > 50) {
                                return false;
                            }

                            return true;
                        }
                    }
                }
            },
            // bookCharacter: {
            //     validators: {
            //         callback: {
            //             message: '* 성격 정보를 입력해주세요.',
            //             callback: function() {
            //                 const value = document.getElementById('bookCharacter').value.trim();
            //
            //                 return value !== '';
            //             }
            //
            //         }
            //     }
            // },
            author: {
                validators: {
                    notEmpty: {
                        message: '* 집필진 정보를 입력해주세요.'
                    }
                }
            },
            // width: {
            //     validators: {
            //         notEmpty: {
            //             message: '* 사이즈 정보를 입력해주세요.'
            //         }
            //     }
            // },
            // height: {
            //     validators: {
            //         notEmpty: {
            //             message: '* 사이즈 정보를 입력해주세요.'
            //         }
            //     }
            // },
            // chromacity: {
            //     validators: {
            //         notEmpty: {
            //             message: '* 색도를 입력해주세요.'
            //         }
            //     }
            // },
            // price: {
            //     validators: {
            //         notEmpty: {
            //             message: '* 정가 금액을 입력해주세요.'
            //         }
            //     }
            // },
            // bookStructure: {
            //     validators: {
            //         callback: {
            //             message: '* 구성 정보를 입력해주세요.',
            //             callback: function() {
            //                 const value = document.getElementById('bookStructure').value.trim();
            //
            //                 if (value === '') {
            //                     return false;
            //                 // } else if (value.length < 10) {
            //                 //     return false;
            //                 }
            //                 return true;
            //             }
            //         }
            //     }
            // },
            previewUrl: {
                validators: {
                    callback: {
                        message: '* 미리보기 URL 경로를 등록해주세요.',
                        callback: function() {
                            const previewType = document.querySelector('input[name="preview"]:checked').value;
                            console.log('Preview Type:', previewType);  // Debugging line
                            const previewUrl = document.getElementById('previewUrl').value;
                            console.log('Preview URL:', previewUrl);  // Debugging line
                            if (previewType === 'URL') {
                                console.log('URL validation condition met');  // Debugging line
                                console.log(previewUrl.trim())
                                return previewUrl.trim() !== '';
                            }
                            return true;
                        }
                    }
                }
            },
        },

        plugins: {
            trigger: new FormValidation.plugins.Trigger(),
            bootstrap: new FormValidation.plugins.Bootstrap5({
                rowSelector: '.fv-row',
                eleInvalidClass: 'is-invalid',
                eleValidClass: ''
            }),
            excluded: new FormValidation.plugins.Excluded({
                excluded: function (field, ele, eles) {
                    console.log(field)
                    if (document.referenceBookForm.querySelector('[name="' + field + '"]') === null) {
                        console.log('field:', field)
                        return true;
                    }
                },
            }),
        }
    }

    /***************************************************** INIT ***************************************/
    let ntdrop = [];

    window.onload = function() {
            ntdrop[0] = global.genDropzone("#dz0", {
                params: {
                  'ParentTable' : 'REFERENCE_BOOK',
                    'ParentType' : 'THUMBNAIL',
                    'ParentUid' : uid,
                    'description' : '참고서 섬네일'
                },
                hasOrder: false,
                isSecure: 'N',
                required: 'Y',
                maxFileCount: 2,
                acceptedExt: ['.jpg', '.png', '.jpeg'],
                dropzoneIdx: 'dz0',
                containerId: 'dz0Container',
                maxFileSize : 1,
                dropzoneIndex : 0,
                messages : {
                    empty : '* 도서 섬네일을 등록해주세요.',
                    accept: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.',
                    count: '',
                    size: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.'
                }
            });

            ntdrop[1] = global.genDropzone("#dz1", {
                params: {
                    'ParentTable' : 'REFERENCE_BOOK',
                    'ParentType' : 'PDF',
                    'ParentUid' : uid,
                    'description' : '미리보기 - PDF 등록'
                },
                hasOrder: false,
                isSecure: 'N',
                previewCheck : 'Y',
                maxFileCount: 2,
                acceptedExt: ['.pdf'],
                dropzoneIdx: 'dz1',
                containerId: 'dz1Container',
                maxFileSize : 300,
                dropzoneIndex : 1,
                messages : {
                    empty : '* 미리보기 pdf 파일을 등록해주세요.',
                    accept: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.',
                    count: '',
                    size: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.'
                }
            });
            ntdrop[2] = global.genDropzone("#dz2", {
                params: {
                  'ParentTable' : 'REFERENCE_BOOK',
                  'ParentType' : 'STUDENT-CORRIGENDUM',
                    'ParentUid' : uid,
                    'description' : '학습자료 - (학생용) 정오표'

                },
                hasOrder: false,
                isSecure: 'N',
                maxFileCount: 2,
                acceptedExt: ['.mp4', '.mp3', '.pdf', '.jpg', '.jpeg', '.png', '.hwp', '.hwpx', '.ppt', '.pptx', '.doc', '.docx', '.zip'],
                dropzoneIdx: 'dz2',
                containerId: 'dz2Container',
                maxFileSize : 300,
                dropzoneIndex : 2,
                messages : {
                    empty : '',
                    accept: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.',
                    count: '',
                    size: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.'
                }
            });
            ntdrop[3] = global.genDropzone("#dz3", {
                params: {
                    'ParentTable' : 'REFERENCE_BOOK',
                    'ParentType' : 'STUDENT-ANSWER',
                    'ParentUid' : uid,
                    'description' : '학습자료 - (학생용) 정답 및 해설'

                },
                hasOrder: false,
                isSecure: 'N',
                maxFileCount: 2,
                acceptedExt: ['.mp4', '.mp3', '.pdf', '.jpg', '.jpeg', '.png', '.hwp', '.hwpx', '.ppt', '.pptx', '.doc', '.docx', '.zip'],
                dropzoneIdx: 'dz3',
                containerId: 'dz3Container',
                maxFileSize : 300,
                dropzoneIndex : 3,
                messages : {
                    empty : '',
                    accept: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.',
                    count: '',
                    size: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.'
                }
            });
            ntdrop[4] = global.genDropzone("#dz4", {
                params: {
                    'ParentTable' : 'REFERENCE_BOOK',
                    'ParentType' : 'STUDENT-MP3',
                    'ParentUid' : uid,
                    'description' : '학습자료 - (학생용) 듣기 MP3'

                },
                hasOrder: false,
                isSecure: 'N',
                maxFileCount: 2,
                acceptedExt: ['.mp4', '.mp3', '.pdf', '.jpg', '.jpeg', '.png', '.hwp', '.hwpx', '.ppt', '.pptx', '.doc', '.docx', '.zip'],
                dropzoneIdx: 'dz4',
                containerId: 'dz4Container',
                maxFileSize : 300,
                dropzoneIndex : 4,
                messages : {
                    empty : '',
                    accept: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.',
                    count: '',
                    size: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.'
                }
            });
            ntdrop[5] = global.genDropzone("#dz5", {
                params: {
                    'ParentTable' : 'REFERENCE_BOOK',
                    'ParentType' : 'STUDENT-WRONG-ANSWER',
                    'ParentUid' : uid,
                    'description' : '학습자료 - (학생용) 오답용노트 문제'

                },
                hasOrder: false,
                isSecure: 'N',
                maxFileCount: 2,
                acceptedExt: ['.mp4', '.mp3', '.pdf', '.jpg', '.jpeg', '.png', '.hwp', '.hwpx', '.ppt', '.pptx', '.doc', '.docx', '.zip'],
                dropzoneIdx: 'dz5',
                containerId: 'dz5Container',
                maxFileSize : 300,
                dropzoneIndex : 5,
                messages : {
                    empty : '',
                    accept: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.',
                    count: '',
                    size: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.'
                }
            });
            ntdrop[6] = global.genDropzone("#dz6", {
                params: {
                    'ParentTable' : 'REFERENCE_BOOK',
                    'ParentType' : 'STUDENT-BLANK-NOTE',
                    'ParentUid' : uid,
                    'description' : '학습자료 - (학생용) 빈 정리노트'

                },
                hasOrder: false,
                isSecure: 'N',
                maxFileCount: 2,
                acceptedExt: ['.mp4', '.mp3', '.pdf', '.jpg', '.jpeg', '.png', '.hwp', '.hwpx', '.ppt', '.pptx', '.doc', '.docx', '.zip'],
                dropzoneIdx: 'dz6',
                containerId: 'dz6Container',
                maxFileSize : 300,
                dropzoneIndex : 6,
                messages : {
                    empty : '',
                    accept: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.',
                    count: '',
                    size: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.'
                }
            });
            ntdrop[7] = global.genDropzone("#dz7", {
                params: {
                    'ParentTable' : 'REFERENCE_BOOK',
                    'ParentType' : 'STUDENT-SENIOR-NOTE',
                    'ParentUid' : uid,
                    'description' : '학습자료 - (학생용) 선배들의 정리노트'

                },
                hasOrder: false,
                isSecure: 'N',
                maxFileCount: 2,
                acceptedExt: ['.mp4', '.mp3', '.pdf', '.jpg', '.jpeg', '.png', '.hwp', '.hwpx', '.ppt', '.pptx', '.doc', '.docx', '.zip'],
                dropzoneIdx: 'dz7',
                containerId: 'dz7Container',
                maxFileSize : 300,
                dropzoneIndex : 7,
                messages : {
                    empty : '',
                    accept: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.',
                    count: '',
                    size: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.'
                }

            });
            ntdrop[8] = global.genDropzone("#dz8", {
                params: {
                    'ParentTable' : 'REFERENCE_BOOK',
                    'ParentType' : 'STUDENT-DATA1',
                    'ParentUid' : uid,
                    'description' : '학습자료 - (학생용) 학생용자료1'

                },
                hasOrder: false,
                isSecure: 'N',
                maxFileCount: 2,
                acceptedExt: ['.mp4', '.mp3', '.pdf', '.jpg', '.jpeg', '.png', '.hwp', '.hwpx', '.ppt', '.pptx', '.doc', '.docx', '.zip'],
                dropzoneIdx: 'dz8',
                containerId: 'dz8Container',
                maxFileSize : 300,
                dropzoneIndex : 8,
                messages : {
                    empty : '',
                    accept: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.',
                    count: '',
                    size: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.'
                }
            });
            ntdrop[9] = global.genDropzone("#dz9", {
                params: {
                    'ParentTable' : 'REFERENCE_BOOK',
                    'ParentType' : 'STUDENT-DATA2',
                    'ParentUid' : uid,
                    'description' : '학습자료 - (학생용) 학생용자료2'

                },
                hasOrder: false,
                isSecure: 'N',
                maxFileCount: 2,
                acceptedExt: ['.mp4', '.mp3', '.pdf', '.jpg', '.jpeg', '.png', '.hwp', '.hwpx', '.ppt', '.pptx', '.doc', '.docx', '.zip'],
                dropzoneIdx: 'dz9',
                containerId: 'dz9Container',
                maxFileSize : 300,
                dropzoneIndex : 9,
                messages : {
                    empty : '',
                    accept: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.',
                    count: '',
                    size: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.'
                }
            });
            ntdrop[10] = global.genDropzone("#dz10", {
                params: {
                    'ParentTable' : 'REFERENCE_BOOK',
                    'ParentType' : 'TEACHER-HWP',
                    'ParentUid' : uid,
                    'description' : '학습자료 - (선생님 전용) HWP 지문'

                },
                hasOrder: false,
                isSecure: 'N',
                maxFileCount: 2,
                acceptedExt: ['.mp4', '.mp3', '.pdf', '.jpg', '.jpeg', '.png', '.hwp', '.hwpx', '.ppt', '.pptx', '.doc', '.docx', '.zip'],
                dropzoneIdx: 'dz10',
                containerId: 'dz10Container',
                maxFileSize : 300,
                dropzoneIndex : 10,
                messages : {
                    empty : '',
                    accept: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.',
                    count: '',
                    size: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.'
                }
            });
            ntdrop[11] = global.genDropzone("#dz11", {
                params: {
                    'ParentTable' : 'REFERENCE_BOOK',
                    'ParentType' : 'TEACHER-PDF',
                    'ParentUid' : uid,
                    'description' : '학습자료 - (선생님 전용) PDF 지문(강의용)'

                },
                hasOrder: false,
                isSecure: 'N',
                maxFileCount: 2,
                acceptedExt: ['.mp4', '.mp3', '.pdf', '.jpg', '.jpeg', '.png', '.hwp', '.hwpx', '.ppt', '.pptx', '.doc', '.docx', '.zip'],
                dropzoneIdx: 'dz11',
                containerId: 'dz11Container',
                maxFileSize : 300,
                dropzoneIndex : 11,
                messages : {
                    empty : '',
                    accept: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.',
                    count: '',
                    size: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.'
                }
            });
            ntdrop[12] = global.genDropzone("#dz12", {
                params: {
                    'ParentTable' : 'REFERENCE_BOOK',
                    'ParentType' : 'TEACHER-ETC1',
                    'ParentUid' : uid,
                    'description' : '학습자료 - (선생님 전용) 기타자료1'

                },
                hasOrder: false,
                isSecure: 'N',
                maxFileCount: 2,
                acceptedExt: ['.mp4', '.mp3', '.pdf', '.jpg', '.jpeg', '.png', '.hwp', '.hwpx', '.ppt', '.pptx', '.doc', '.docx', '.zip'],
                dropzoneIdx: 'dz12',
                containerId: 'dz12Container',
                maxFileSize : 300,
                dropzoneIndex : 12,
                messages : {
                    empty : '',
                    accept: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.',
                    count: '',
                    size: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.'
                }
            });
            ntdrop[13] = global.genDropzone("#dz13", {
                params: {
                    'ParentTable' : 'REFERENCE_BOOK',
                    'ParentType' : 'TEACHER-ETC2',
                    'ParentUid' : uid,
                    'description' : '학습자료 - (선생님 전용) 기타자료2'

                },
                hasOrder: false,
                isSecure: 'N',
                maxFileCount: 2,
                acceptedExt: ['.mp4', '.mp3', '.pdf', '.jpg', '.jpeg', '.png', '.hwp', '.hwpx', '.ppt', '.pptx', '.doc', '.docx', '.zip'],
                dropzoneIdx: 'dz13',
                containerId: 'dz13Container',
                maxFileSize : 300,
                dropzoneIndex : 13,
                messages : {
                    empty : '',
                    accept: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.',
                    count: '',
                    size: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.'
                }
            });
            ntdrop[14] = global.genDropzone("#dz14", {
                params: {
                    'ParentTable' : 'REFERENCE_BOOK',
                    'ParentType' : 'TEACHER-ETC3',
                    'ParentUid' : uid,
                    'description' : '학습자료 - (선생님 전용) 기타자료3'

                },
                hasOrder: false,
                isSecure: 'N',
                maxFileCount: 2,
                acceptedExt: ['.mp4', '.mp3', '.pdf', '.jpg', '.jpeg', '.png', '.hwp', '.hwpx', '.ppt', '.pptx', '.doc', '.docx', '.zip'],
                dropzoneIdx: 'dz14',
                containerId: 'dz14Container',
                maxFileSize : 300,
                dropzoneIndex : 14,
                messages : {
                    empty : '',
                    accept: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.',
                    count: '',
                    size: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.'
                }
            });
    };


    /******************************************************* VALIDATION *********************************************************/

    if (invalidFields.length > 0) {
        const firstInvalidField = invalidFields.reduce((highest, field) => field.getBoundingClientRect().top < highest.getBoundingClientRect().top ? field : highest);

        focusAndScroll(firstInvalidField);
    }


    let isSubmitCheck = false;
    function initFormValidation(isValidate) {
        console.log('hihih')
        if (formValidation !== null) formValidation.destroy();
        console.log('hihih2')

        // validation 설정
        // console.log(document.bookTriggerForm)
        // console.log(formValidationOption)
        formValidation = FormValidation.formValidation(document.referenceBookForm, formValidationOption);
        console.log('hihih3')
        console.log(formValidation);
        /**
         * form validator invalid event
         * 여기서 select2 인 경우 처리
         */
        formValidation.on('core.field.invalid', function(name) {
            try {
                const el = document.querySelector('[name=' + name + ']');

                if (el.dataset.control === 'select2') {
                    if (VALID_CLASS) el.nextSibling.querySelector('span.select2-selection').classList.remove(VALID_CLASS);
                    if (INVALID_CLASS) el.nextSibling.querySelector('span.select2-selection').classList.add(INVALID_CLASS);
                    el.nextSibling.querySelector('span.select2-selection').focus();
                }
                invalidFields.push(el);
            } catch(e) {
                console.log('Cannot find element: ' + name);
            }
        });


        /**
         * form validator valid event
         * 여기서 select2 인 경우 처리
         */
        formValidation.on('core.field.valid', function(name) {
            try {
                const el = document.querySelector('[name=' + name + ']');

                if (el.dataset.control === 'select2') {
                    if (INVALID_CLASS) el.nextSibling.querySelector('span.select2-selection').classList.remove(INVALID_CLASS);
                    if (VALID_CLASS) el.nextSibling.querySelector('span.select2-selection').classList.add(VALID_CLASS);
                }
                invalidFields = invalidFields.filter(field => field.name !== name);
            } catch(e) {
                console.log('Cannot find element: ' + name);
            }
        });


        formValidation.on('core.form.invalid', function() {
            const firstInvalidField = invalidFields.reduce((highest, field) => field.getBoundingClientRect().top < highest.getBoundingClientRect().top ? field : highest);
            if (invalidFields.length > 0) {
                focusAndScroll(firstInvalidField);
            }
        });


        if (isValidate) formValidation.validate();
    }

    function focusAndScroll(element) {
        setTimeout(() => {
            element.focus();
            element.scrollIntoView({ behavior: 'smooth', block: 'center' });
        }, 100);
    }

    function formSelect2() {
        if (isSubmitCheck) {
            const selectId = 'revisionCurriculum';

            const selectElement = document.getElementById(selectId);
            const res = selectElement.value
            const selectContainer = document.getElementById(selectId + 'Select2');

            if (res.length > 0) {
                selectContainer.querySelectorAll('.fv-plugins-message-container').forEach(function (el) {
                    el.style.display = 'none';
                });
                const select2Selection = selectContainer.querySelector('.select2-selection');
                if (select2Selection) {
                    select2Selection.classList.remove('is-invalid');
                }
            } else {
                selectContainer.querySelectorAll('.fv-plugins-message-container').forEach(function (el) {
                    el.style.display = 'block';
                });
                const select2Selection = selectContainer.querySelector('.select2-selection');
                if (select2Selection) {
                    select2Selection.classList.add('is-invalid');
                }
            }
        }
    }

    function validationDetailTitle(element) {
        if (isSubmitCheck) {
            if (element.value.trim() === '' || element.value.length < 2)  {
                showError(element.name, element.name + 'Error', '* 탭 명칭을 입력해주세요.');
            } else {
                clearError(element.name);
            }
        }
    }
    let intervalId = null;


    let froalaKey = <%= froalaKey %>;

    $('.contents').froalaEditor({
        key: froalaKey,
        toolbarButtons: ['fullscreen', 'bold', 'italic', 'underline', 'strikeThrough', 'subscript', 'superscript', '|', 'fontFamily', 'fontSize', 'color', 'inlineClass', 'inlineStyle', 'paragraphStyle', 'lineHeight', '|', 'paragraphFormat', 'align', 'formatOL', 'formatUL', 'outdent', 'indent', 'quote', '-', 'insertLink', 'insertImage', 'insertTable', '|', 'specialCharacters', 'insertHR', 'selectAll', 'clearFormatting', '|', 'print', 'getPDF', 'spellChecker', 'help', 'html', '|', 'undo', 'redo'],
        imageUploadURL: '/froalaeditor/upload/Image',
        imageUploadParams: {editorUploadPath: '${editorUploadPath}'},
        imageDefaultWidth: 0,
        language: 'en',
        videoUpload: false,
        fileUpload: false,
        height: 500,
        requestHeaders: {
            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        }
    });
    const idName = ['studentCorrigendum', 'studentAnswer', 'studentMp3', 'studentWrongAnswer', 'studentBlankNote', 'studentSeniorNote', 'studentData1', 'studentData2', 'teacherHwp', 'teacherPdf', 'teacherEtc1', 'teacherEtc2', 'teacherEtc3'];



    document.addEventListener('DOMContentLoaded', function () {


        const targetNode = document.querySelectorAll('.form-select.unselect-form');
        targetNode.forEach((node) => {
            node.style.backgroundColor = '#ffffff';
            node.style.backgroundClip = 'padding-box';
            node.style.border = '1px solid #E4E6EF';
        });


        let isComposing = false;

        document.querySelectorAll('.numberCheck').forEach(function(element) {
            element.addEventListener('keydown', function(e) {
                if ((e.keyCode >= 12593 && e.keyCode <= 12643) || (e.keyCode >= 44032 && e.keyCode <= 55203)) {
                    e.preventDefault();
                }
            });

            element.addEventListener('input', function(e) {
                if (!isComposing) {
                    this.value = this.value.replace(/[^0-9]/g, '');
                }
            });

            element.addEventListener('compositionstart', function(e) {
                isComposing = true;
            });

            element.addEventListener('compositionend', function(e) {
                isComposing = false;
                this.value = this.value.replace(/[^0-9]/g, '');
                e.preventDefault();
            });
            element.addEventListener('blur', function(e) {
                this.value = this.value.replace(/[^0-9]/g, '');
            });

            element.addEventListener('keyup', function(e) {
                this.value = this.value.replace(/[^0-9]/g, '');
            });
        });
    });

    /************************************************************************** VALIDATION ********************************************************************/

    function validateIsIntro() {
        console.log('introNUm ' ,introNum)
        const value = document.querySelector('input[name="isIntro"]:checked');
        if (value.value === 'Y' && introNum >= 10) {
            showError('showIsIntroN', 'showIsIntroNError', '* 이미 인트로에는 10개 모두 등록되어있습니다. 등록되어 있는 인트로 도서 "N"값으로 수정 후 재등록 해주세요.');
            invalidFields.push(value);
            return false;
        }
        clearError('showIsIntroN');
        return true;
    }

    function errorValidation(introNum) {


        let isValid = true;

        const isDetailTitle1 = document.querySelector('input[name="isUse1"]:checked').value;
        const isDetailTitle2 = document.querySelector('input[name="isUse2"]:checked').value;
        const isDetailTitle3 = document.querySelector('input[name="isUse3"]:checked').value;

        if (isDetailTitle1 === 'Y') {
            const detailTitle1 = document.getElementById('detailTitle1').value.trim();
            if (detailTitle1 === '' || detailTitle1.length < 2) {
                isValid =  false;
                validationDetailTitle(document.getElementById('detailTitle1'));
                if (!invalidFields.includes(detailTitle1)) {
                    invalidFields.push(detailTitle1);
                }
            }
        }

        if (isDetailTitle2 === 'Y') {
            const detailTitle2 = document.getElementById('detailTitle2').value.trim();
            if (detailTitle2 === '' || detailTitle2.length < 2) {
                isValid = false;
                validationDetailTitle(document.getElementById('detailTitle2'));
                if (!invalidFields.includes(detailTitle2)) {
                    invalidFields.push(detailTitle2);
                }
            }
        }

        if (isDetailTitle3 === 'Y') {
            const detailTitle3 = document.getElementById('detailTitle3').value.trim();
            if (detailTitle3 === '' || detailTitle3.length < 2) {
                isValid =  false;
                validationDetailTitle(document.getElementById('detailTitle3'));
                if (!invalidFields.includes(detailTitle3)) {
                    invalidFields.push(detailTitle3);
                }
            }
        }

        // const etc2Data = document.getElementById('etcData2').value.trim();
        // if (etc2Data === '' || etc2Data.length < 2) {
        //     isValid = false;
        //     validationDetailTitle(document.getElementById('etcData2'));
        // }
        //
        // const etc3Data = document.getElementById('etcData3').value.trim();
        // if (etc3Data === '' || etc3Data.length < 2) {
        //     isValid = false;
        //     validationDetailTitle(document.getElementById('etcData3'));
        // }



        return isValid;
    }



    // 에러 메시지 표시 함수
    function showError(inputId, errorId, message) {

        const input = document.getElementById(inputId);
        const error = document.getElementById(errorId);


        if (input) {
            input.classList.add('input-error');
            if ($(input).data('select2')) {
                $(input).next('.select2-container').find('.select2-selection').addClass('input-error');
            }
        }
        if (error) {
            error.textContent = message;
            error.classList.add('show-error');
        }
    }



    // 에러 메시지 숨김 함수
    function clearError(inputId) {
        const input = document.getElementById(inputId);
        const errorId = inputId + 'Error';
        const errorId2 = inputId + 'Error2';
        const error = document.getElementById(errorId);
        const error2 = document.getElementById(errorId2);

        if (input) {
            input.classList.remove('input-error');
            if ($(input).data('select2')) {
                $(input).next('.select2-container').find('.select2-selection').removeClass('input-error');
            }
        }
        if (error) {
            error.classList.remove('show-error');
        }
        if (error2) {
            error2.classList.remove('show-error');
        }
    }


    /**************************************************** EVENT ***************************************/

    function initializeFlatpickr() {
        const bookCodeSearchSdate = document.getElementById('bookCodeSearchSdate');

        startFlatpickr = flatpickr(bookCodeSearchSdate, {
            dateFormat: 'Y',
            altInput: true,
            altFormat: 'Y',
            locale: 'ko',
            onChange: function (selectedDates) {
                if (selectedDates.length > 0) {
                    const year = selectedDates[0].getFullYear();
                    const minDate = new Date(year, 0, 1);
                    const maxDate = new Date(year, 11, 31);
                    endFlatpickr.set('minDate', minDate);
                    endFlatpickr.set('maxDate', maxDate);
                }
            }
        });
    }

    function yearInit() {
        const currentYear = new Date().getFullYear();

        const yearSelect = document.getElementById('bookCodeSearchSdate');

        const option = document.createElement('option');
        option.value = '';
        option.text = '전체';
        yearSelect.appendChild(option);

        for (let year = currentYear; year > currentYear - 10; year--) {
            const option = document.createElement('option');
            option.value = year;
            option.text = year;
            yearSelect.appendChild(option);
        }
    }


    /**************************************************** UTILS ***************************************/

    function windowUpScroll() {
        window.scrollTo({
            top: 0,
            left: 0,
            behavior: 'smooth'
        });
    }


    function getRandomAlphanumeric(length) {
        const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        let result = '';
        for (let i = 0; i < length; i++) {
            result += characters.charAt(Math.floor(Math.random() * characters.length));
        }
        return result;
    }

    function changeSelectDataOption(element) {

        let clazz = element.value;
        let subject = document.getElementById('bookCodeSearchSubject');
        let grade = document.getElementById('bookCodeSearchGrade');
        let semester = document.getElementById('bookCodeSearchSemester');

        subject.innerHTML = '<option value="">전체</option>';
        grade.innerHTML = '<option value="">전체</option>';
        semester.innerHTML = '<option value="">전체</option>';

        let subjectOption = '';
        let gradeOption = '';
        let semesterOption = '';

        if (clazz === '초등학교') {
            subjectOption += '<option value="국어" ${param.subject eq '국어' ? 'selected' : ''}>국어</option><option value="수학" ${param.subject eq '수학' ? 'selected' : ''}>수학</option><option value="과학" ${param.subject eq '과학' ? 'selected' : ''}>과학</option><option value="사회" ${param.subject eq '사회' ? 'selected' : ''}>사회</option><option value="공통" ${param.subject eq '공통' ? 'selected' : ''}>공통</option>';
            gradeOption += '<option value="1학년" ${param.grade eq '1학년' ? 'selected' : ''}>1학년</option><option value="2학년" ${param.grade eq '2학년' ? 'selected' : ''}>2학년</option><option value="3학년" ${param.grade eq '3학년' ? 'selected' : ''}>3학년</option><option value="4학년" ${param.grade eq '4학년' ? 'selected' : ''}>4학년</option><option value="5학년" ${param.grade eq '5학년' ? 'selected' : ''}>5학년</option><option value="6학년" ${param.grade eq '6학년' ? 'selected' : ''}>6학년</option><option value="공통" ${param.grade eq '공통' ? 'selected' : ''}>공통</option>';
            semesterOption += '<option value="1학기" ${param.semester eq '1학기' ? 'selected' : ''}>1학기</option><option value="2학기" ${param.semester eq '2학기' ? 'selected' : ''}>2학기</option><option value="공통" ${param.semester eq '공통' ? 'selected' : ''}>공통</option>';
        } else if (clazz === '중학교') {
            subjectOption += '<option value="국어" ${param.subject eq '국어' ? 'selected' : ''}>국어</option><option value="영어" ${param.subject eq '영어' ? 'selected' : ''}>영어</option><option value="수학" ${param.subject eq '수학' ? 'selected' : ''}>수학</option><option value="사회" ${param.subject eq '사회' ? 'selected' : ''}>사회</option><option value="역사" ${param.subject eq '역사' ? 'selected' : ''}>역사</option><option value="도덕" ${param.subject eq '도덕' ? 'selected' : ''}>도덕</option><option value="과학" ${param.subject eq '과학' ? 'selected' : ''}>과학</option><option value="기술가정" ${param.subject eq '기술가정' ? 'selected' : ''}>기술가정</option><option value="한문" ${param.subject eq '한문' ? 'selected' : ''}>한문</option>';
            gradeOption += '<option value="1학년" ${param.grade eq '1학년' ? 'selected' : ''}>1학년</option><option value="2학년" ${param.grade eq '2학년' ? 'selected' : ''}>2학년</option><option value="3학년" ${param.grade eq '3학년' ? 'selected' : ''}>3학년</option><option value="공통" ${param.grade eq '공통' ? 'selected' : ''}>공통</option>';
            semesterOption += '<option value="1학기" ${param.semester eq '1학기' ? 'selected' : ''}>1학기</option><option value="2학기" ${param.semester eq '2학기' ? 'selected' : ''}>2학기</option><option value="공통" ${param.semester eq '공통' ? 'selected' : ''}>공통</option>';

        } else if (clazz === '고등학교') {
            subjectOption += '<option value="국어" ${param.subject eq '국어' ? 'selected' : ''}>국어</option><option value="영어" ${param.subject eq '영어' ? 'selected' : ''}>영어</option><option value="수학" ${param.subject eq '수학' ? 'selected' : ''}>수학</option><option value="사회" ${param.subject eq '사회' ? 'selected' : ''}>사회</option><option value="역사" ${param.subject eq '역사' ? 'selected' : ''}>역사</option><option value="과학" ${param.subject eq '과학' ? 'selected' : ''}>과학</option><option value="기술가정" ${param.subject eq '기술가정' ? 'selected' : ''}>기술가정</option><option value="한문" ${param.subject eq '한문' ? 'selected' : ''}>한문</option><option value="중국어" ${param.subject eq '중국어' ? 'selected' : ''}>중국어</option>';
            gradeOption += '<option value="공통" ${param.grade eq '공통' ? 'selected' : ''}>공통</option>';
            semesterOption += '<option value="공통" ${param.semester eq '공통' ? 'selected' : ''}>공통</option>';
        } else {
            subjectOption += '<option value="">-</option>';
            gradeOption += '<option value="">-</option>';
            semesterOption += '<option value="">-</option>';
        }

        if (clazz === '' || clazz === '전체') {
            subject.innerHTML = subjectOption;
            grade.innerHTML = gradeOption;
            semester.innerHTML = semesterOption;

            subject.disabled = true;
            grade.disabled = true;
            semester.disabled = true;

            const targetNode = document.querySelectorAll('.form-select.renewal-form');
            targetNode.forEach((node) => {
                node.style.backgroundColor = '##F5F8FA';
                node.style.backgroundClip = 'padding-box';
            });
        } else {
            subject.innerHTML += subjectOption;
            grade.innerHTML += gradeOption;
            semester.innerHTML += semesterOption;

            subject.disabled = false;
            grade.disabled = false;
            semester.disabled = false;

            const targetNode = document.querySelectorAll('.form-select.renewal-form');
            targetNode.forEach((node) => {
                node.style.backgroundColor = '#ffffff';
                node.style.backgroundClip = 'padding-box';
                node.style.border = '1px solid #E4E6EF';
            });
        }

    }


    window.onbeforeunload = function() {
        if (isModified) {
            return "변경 사항을 저장하지 않았습니다. 정말 지금 나가시겠습니까?";
        }
    };



    function formatDate(strDate) {
        let date = new Date(strDate);
        let year = date.getFullYear();
        let month = ("0" + (date.getMonth() + 1)).slice(-2);
        let day = ("0" + date.getDate()).slice(-2);
        let hour = ("0" + date.getHours()).slice(-2);
        let minute = ("0" + date.getMinutes()).slice(-2);
        let second = ("0" + date.getSeconds()).slice(-2);

        return year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;
    }

    function onInputChange() {
        isModified = true;
    }

    function isIntroShowRadio(element) {
        const isOpen = element.value;
        const intro = document.getElementsByName('isIntro');

        console.log(intro);
        if (isOpen === 'Y') {
            intro.forEach((element) => {
                element.disabled = false;
            });
        } else if (isOpen === 'N') {
            intro.forEach((element) => {
                element.disabled = true;
                element.checked = (element.value === 'N');
            });
        }
    }

    async function uploadByDropzone2(index) {
        try {
            if (ntdrop[index].files.length > 0) {
                await ntdrop[index].upload(async function (result) {
                    if (!result.error) {
                        if (index < (ntdrop.length - 1)) {
                            await uploadByDropzone2(index + 1);
                        } else {
                            await dropZoneDeleteFile();
                        }
                    } else {
                        onSubmitError(result.errorMsg);
                    }
                });
            } else {
                if (index < (ntdrop.length - 1)) {
                    await uploadByDropzone2(index + 1);
                } else {
                    await dropZoneDeleteFile();
                }
            }
        } catch (e) {
            console.error('Upload exception:', e);
        }
    }


    /********************************************************************** POST ************************************************/
    function collectData(idx) {
        const fields = ['bookCode', 'bookCodeName', 'school', 'semester', 'grade', 'subject', 'seriesCode', 'seriesCodeName', 'year', 'revisionCurriculum', 'referenceBookTitle', 'bookCharacter', 'author', 'bookStructure',
            'width', 'height', 'chromacity', 'price', 'previewUrl', 'gangnamBroadcastUrl', 'referenceBookDetail', 'detailTitle1', 'detailContent1', 'detailTitle2' ,'detailContent2', 'detailTitle3', 'detailContent3', 'seriesDescription', 'etcData2', 'etcData3'];
        let data = {
            reference: {},
            referenceDetailList: []
        };


        fields.forEach(field => {
            data.reference[field] = document.getElementById(field)?.value || '';
        });

        data.reference.uid = uid;
        data.reference.idx = idx;

        const radios = ['isRequestSample', 'isOpen', 'isIntro', 'isUse1', 'isUse2', 'isUse3'];
        radios.forEach(name => {
            data.reference[name] = document.querySelector('input[name="' + name + '"]:checked')?.value || '';
        });

        const previewValue = document.querySelector('input[name="preview"]:checked').value;

        if (previewValue === 'PDF') {
            data.reference.previewUrl = '';
        }

        const detailSections = document.querySelectorAll('.detailSection');
        detailSections.forEach((section, index) => {
            let detailTitle = section.querySelector('.detailTitle')?.value || '';
            let isUse;
            if (index === 0) {
                isUse = 'Y';
            } else {
                isUse = section.querySelector('input[type="radio"]:checked')?.value || 'N';
            }
            let detailContent = section.querySelector('.contents')?.value || '';

            data.referenceDetailList.push({
                detailTitle: detailTitle,
                isUse: isUse,
                detailContent: detailContent,
                sortOrder: index + 1
            });
        });

        return data;
    }


    let isSubmitting = false;
    let introNum = '';
    async function save(element) {
        if (isSubmitting) {
            return;
        }
        invalidFields = [];
        isSubmitting = true;
        isSubmitting = true;
        isSubmitCheck = true;
        subCheck = true;
        subCheck2 = true;
        const school = document.getElementById('school').value;

        if (school) {
            try {
                const response = await fetch('/api/v1/reference/intro/' + school, {
                    method: 'GET',
                    headers: {
                        'Content-Type': 'application/json',
                    }
                });

                const result = await response.json();
                if (result.result === true) {
                    introNum = result.data;
                    console.log('introNum ===', introNum)
                }
            } catch (e) {
                console.error(e);
            }
        }
        const previewValue = document.querySelector('input[name="preview"]:checked').value;
        let isFile = '';
        if (previewValue === 'PDF') {
            isFile = dropzoneCheck(previewValue);
        } else {
            isFile = dropzoneCheck();
        }

        initFormValidation(true);
        const status = await formValidation.validate();
        console.log('Validation status:', status);
        let isValid = errorValidation();
        let errorEl = getErrorElements();
        Array.prototype.push.apply(invalidFields, errorEl);
        const value = document.querySelector('input[name="isIntro"]:checked').value;
        console.log('introNum -====', introNum)
        if (!isValid || status === 'Invalid' || (introNum >= 10 && value === 'Y') || !isFile) {
            validateIsIntro();
            if (invalidFields.length > 0) {
                const firstInvalidField = invalidFields.reduce((highest, field) => field.getBoundingClientRect().top < highest.getBoundingClientRect().top ? field : highest);
                focusAndScroll(firstInvalidField);
            }
            isSubmitting = false;
            return;
        }



        try {
            if (previewValue === 'URL') {
                const el = document.getElementById('dropzoneImagedz1');
                if (el) {
                    console.log(el);
                    el.querySelector('td').querySelector('a').click();
                }

            }

            await uploadByDropzone2(0);


            const data = collectData();

            const response = await fetch('/api/v1/reference', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            });

            const result = await response.json();
            if (result.result === true) {
                Swal.fire({
                    title: '등록 완료',
                    text: '등록되었습니다.',
                    icon: 'success',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.href = '/reference-book/reference-book-list';
                    }
                })
            } else {
                Swal.fire({
                    title : '등록 실패',
                    text: '등록 처리에 실패되었습니다. \n다시 시도해주세요.',
                    icon : 'error',
                    confirmButtonText : '확인'
                });
            }
        } catch (error) {
            console.log(error);
        } finally {
            isSubmitting = false;
        }
    }

    function formatExtensions(regex) {
        const matches = regex.source.match(/\\.\((.+)\)\$/i);
        if (matches && matches[1]) {
            return matches[1].split('|').map(ext => '.' + ext).join(', ');
        }
        return '';
    }

    /******************************************************************* PUT ************************************************/

    let isModified = false;

    async function showPdf() {
        const preview = document.querySelector('input[name="preview"]:checked').value;

        if (preview === 'URL') {
            const url = document.getElementById('url');
            const pdf = document.getElementById('dz1Container');

            url.style.display = 'block';
            pdf.style.display = 'none';
        } else if (preview === 'PDF') {
            const url = document.getElementById('url');
            const pdf = document.getElementById('dz1Container');

            url.style.display = 'none';
            pdf.style.display = 'block';
        }
    }

    function changeEditor (element) {
        const title = element.getAttribute('data-title');
        const isUse = element.value;


        const titleInput = document.getElementById(title);
        if (isUse === 'Y') {
            titleInput.disabled = false;
            titleInput.classList.remove('form-control-solid')

        } else if (isUse === 'N') {
            titleInput.disabled = true;
            titleInput.classList.add('form-control-solid')
        }


    }


    async function modify(element) {
        if (isSubmitting) {
            return;
        }
        isSubmitting = true;
        isSubmitCheck = true;

        subCheck = true;
        subCheck2 = true;
        const uid = element.getAttribute('data-uid');
        const idx = element.getAttribute('data-idx');

        const school = document.getElementById('school').value;
        if (school) {
            try {
                const response = await fetch('/api/v1/reference/intro/' + school + '?uid=' + uid, {
                    method: 'GET',
                    headers: {
                        'Content-Type': 'application/json',
                    }
                });

                const result = await response.json();
                if (result.result === true) {
                    introNum = result.data;
                    // 인트로 노출 여부 체크
                }
            } catch (e) {
                console.error(e);
            }
        }

        const previewValue = document.querySelector('input[name="preview"]:checked').value;
        let isFile = '';
        if (previewValue === 'PDF') {
            isFile = dropzoneCheck(previewValue);
        } else {
            isFile = dropzoneCheck();
        }

        initFormValidation(true);
        const status = await formValidation.validate();
        console.log('Validation status:', status);
        let isValid = errorValidation();

        let errorEl = getErrorElements();
        Array.prototype.push.apply(invalidFields, errorEl);

        console.log('invalidFields ===', invalidFields)

        const value = document.querySelector('input[name="isIntro"]:checked').value;
        console.log('introNum === ', introNum);
        if (!isValid || status === 'Invalid' || (introNum >= 10 && value === 'Y') || !isFile) {
            validateIsIntro();
            if (invalidFields.length > 0) {
                const firstInvalidField = invalidFields.reduce((highest, field) => field.getBoundingClientRect().top < highest.getBoundingClientRect().top ? field : highest);

                focusAndScroll(firstInvalidField);
            }
            isSubmitting = false;

            return;
        }


        try {
            if (previewValue === 'URL') {
                const el = document.getElementById('dropzoneImagedz1');
                if (el) {
                    console.log(el,    el.querySelector('td').querySelector('a'));
                    el.querySelector('td').querySelector('a').click();
                }

            }

            await uploadByDropzone2(0);


            const data = collectData(idx);

            console.log(data);
            const response = await fetch('/api/v1/reference/' + uid, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            });


            const result = await response.json();
            if (result.result === true) {
                Swal.fire({
                    title: '등록 완료',
                    text: '등록되었습니다.',
                    icon: 'success',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.open('/reference-book/reference-book/' + uid, '_self');
                    }
                })
            } else {
                Swal.fire({
                    title : '등록 실패',
                    text: '등록 처리에 실패되었습니다. \n다시 시도해주세요.',
                    icon : 'error',
                    confirmButtonText : '확인'
                });
            }
        } catch (error) {
            console.log('error = ' ,error);
        } finally {
            isSubmitting = false;
        }
    }

    async function resetBookSearchForm() {
        if (isSubmitting) {
            return;
        }
        isSubmitting = true;

        document.getElementById('bookCodeSearchSdate').value = '';
        document.getElementById('bookCodeSearchSearch').value = '';

        let selects = document.querySelectorAll('.form-select');
        selects.forEach(function(select) {
            select.selectedIndex = 0;
            $(select).select2({
                minimumResultsForSearch: Infinity
            }).trigger('change');

        });
        const targetNode = document.querySelectorAll('.form-select.unselect-form');
        targetNode.forEach((node) => {
            node.style.backgroundColor = '#ffffff';
            node.style.backgroundClip = 'padding-box';
            node.style.border = '1px solid #E4E6EF';
        });

        let subject = document.getElementById('bookCodeSearchSubject');
        let grade = document.getElementById('bookCodeSearchGrade');
        let semester = document.getElementById('bookCodeSearchSemester');

        subject.innerHTML = '<option value="">-</option>';
        grade.innerHTML = '<option value="">-</option>';
        semester.innerHTML = '<option value="">-</option>';

        const unselectedNode = document.querySelectorAll('.form-select.renewal-form');
        unselectedNode.forEach((node) => {
            node.style.backgroundColor = '#F5F8FA';
            node.style.backgroundClip = 'padding-box';

            node.disabled = true;
        });




        nothingDataTable();
        isSubmitting = false;

    }

    function nothingDataTable() {
        document.getElementById('bookCodeListNum').innerHTML = `검색결과 총 <span class="fw-bolder">0</span> 개`;
        const tableBody = document.getElementById('bookCodeModalTableBody');
        tableBody.innerHTML = '';
        const row = tableBody.insertRow();
        const cell = row.insertCell(0);
        cell.colSpan = 8;
        cell.textContent = '데이터가 없습니다.';
        cell.className = 'text-center';
        let pagination = document.getElementById('pagination');


        pagination.innerHTML = '';
    }



    /**************************************************************** DELETE ***************************************************************/

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


    /**************************************************** BOOK CODE MODAL UTILS ******************************************/
    let isSearching = false;

    async function searchBookCode() {
        if (isSubmitting) {
            return;
        }

        isSubmitting = true;

        const bookCodeSearchSdate = document.getElementById('bookCodeSearchSdate').value;
        const bookCodeSearchClazz = document.getElementById('bookCodeSearchClazz').value;
        const bookCodeSearchSubject = document.getElementById('bookCodeSearchSubject').value;
        const bookCodeSearchGrade = document.getElementById('bookCodeSearchGrade').value;
        const bookCodeSearchSemester = document.getElementById('bookCodeSearchSemester').value;
        const bookCodeSearchKeyword = document.getElementById('bookCodeSearchKeyword').value;
        const bookCodeSearchSearch = document.getElementById('bookCodeSearchSearch').value;
        let queryParams = '?page=1';
        if (bookCodeSearchSdate) {
            queryParams += '&year=' + bookCodeSearchSdate;
        } else {
            queryParams += '&year=선택';
        }

        if (bookCodeSearchClazz) {
            queryParams += '&school=' + bookCodeSearchClazz;
        }

        if (bookCodeSearchSubject) {
            queryParams += '&subject=' + bookCodeSearchSubject;
        }

        if (bookCodeSearchGrade) {
            queryParams += '&grade=' + bookCodeSearchGrade;
        }

        if (bookCodeSearchSemester) {
            queryParams += '&semester=' + bookCodeSearchSemester;
        }

        if (bookCodeSearchKeyword) {
            queryParams += '&keyword=' + bookCodeSearchKeyword;
        }

        if (bookCodeSearchSearch) {
            queryParams += '&search=' + bookCodeSearchSearch;
        }

        try {
            const response = await fetch('/api/v1/reference-book/book-code' + queryParams, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                }
            });

            const result = await response.json();


            if (result.result === true) {
                if (result.data.listNum !== 0) {
                    updateLastRevisionDateTable(result.data.responseBookCodeDtoList);
                    updateLastRevisionDateForm(result.data.listNum);
                    updateLastRevisionDatePagination(result.data.pageHtml);
                } else {
                    nothingDataTable();
                }
            }
        } catch (e) {

        } finally {
            isSubmitting = false;
        }
    }

    async function changePage(page) {

        if (isSearching) {
            return;
        }

        isSearching = true;

        const bookCodeSearchSdate = document.getElementById('bookCodeSearchSdate').value;
        const bookCodeSearchClazz = document.getElementById('bookCodeSearchClazz').value;
        const bookCodeSearchSubject = document.getElementById('bookCodeSearchSubject').value;
        const bookCodeSearchGrade = document.getElementById('bookCodeSearchGrade').value;
        const bookCodeSearchSemester = document.getElementById('bookCodeSearchSemester').value;
        const bookCodeSearchKeyword = document.getElementById('bookCodeSearchKeyword').value;
        const bookCodeSearchSearch = document.getElementById('bookCodeSearchSearch').value;
        let queryParams = '?page=' + page;
        if (bookCodeSearchSdate) {
            queryParams += '&year=' + bookCodeSearchSdate;
        }

        if (bookCodeSearchClazz) {
            queryParams += '&school=' + bookCodeSearchClazz;
        }

        if (bookCodeSearchSubject) {
            queryParams += '&subject=' + bookCodeSearchSubject;
        }

        if (bookCodeSearchGrade) {
            queryParams += '&grade=' + bookCodeSearchGrade;
        }

        if (bookCodeSearchSemester) {
            queryParams += '&semester=' + bookCodeSearchSemester;
        }

        if (bookCodeSearchKeyword) {
            queryParams += '&keyword=' + bookCodeSearchKeyword;
        }

        if (bookCodeSearchSearch) {
            queryParams += '&search=' + bookCodeSearchSearch;
        }

        try {
            const response = await fetch('/api/v1/reference-book/book-code' + queryParams, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                }
            });

            const result = await response.json();


            if (result.result === true) {

                updateLastRevisionDateTable(result.data.responseBookCodeDtoList);
                updateLastRevisionDateForm(result.data.listNum);
                updateLastRevisionDatePagination(result.data.pageHtml);
            } else {
                Swal.fire({
                    title: '검색 실패',
                    text: '검색에 실패하였습니다.',
                    icon: 'error',
                    confirmButtonText: '확인'
                })
            }

        } catch (e) {

        } finally {
            isSearching = false;
        }
    }


    function updateLastRevisionDatePagination(html) {

        let pagination = document.getElementById('pagination');


        pagination.innerHTML = '';
        pagination.innerHTML = html;

    }


    function updateLastRevisionDateForm(listNum) {

        document.getElementById('bookCodeListNum').innerHTML = `검색결과 총 <span class="fw-bolder">` + listNum  + ` </span> 개`;

    }

    function updateLastRevisionDateTable(data) {
        const tableBody = document.getElementById('bookCodeModalTableBody');

        tableBody.innerHTML = ''; // 기존의 테이블 내용을 비웁니다.

        data.forEach(function(item) {
            const row = tableBody.insertRow();
            const CD_ITEM = row.insertCell(0);
            const CD_SERIES = row.insertCell(1);
            const YY_ITEM = row.insertCell(2);
            const NM_GB_SUBJ = row.insertCell(3);
            const CD_SUBJ = row.insertCell(4);
            const NM_GOODS = row.insertCell(5);
            const choice = row.insertCell(6);


            CD_ITEM.textContent = item.cd_ITEM === 'NULL' ? '-' : item.cd_ITEM;
            CD_SERIES.textContent = item.cd_SERIES === 'NULL' ? '-' : item.cd_SERIES;
            YY_ITEM.textContent = item.yy_ITEM === 'NULL' ? '-' : item.yy_ITEM;
            NM_GB_SUBJ.textContent = item.nm_GB_SUBJ === 'NULL' ? '-' : item.nm_GB_SUBJ;
            CD_SUBJ.textContent = item.nm_CD_SUBJ === 'NULL' ? '-' : item.nm_CD_SUBJ;
            NM_GOODS.textContent = item.sliceName === 'NULL' ? '-' : item.sliceName;


            let html = 'data-code="' + item.cd_ITEM + '"'
                + ' data-name="' + item.nm_GOODS + '"'
                + ' data-productCode="' + item.cd_GOODS + '"'
                + ' data-school="' + item.nm_GB_SUBJ + '"'
                + ' data-subject="' + item.nm_CD_SUBJ + '"'
                + ' data-grade="' + item.gb_GRAD + '"'
                + ' data-semester="' + item.gb_TERM + '"'
                + ' data-year="' + item.yy_ITEM + '"'
                + ' data-seriesCode="' + item.cd_SERIES + '"'
                + ' data-seriesCodeName="' + item.nm_SERIES + '"'
                + ' data-seriesDescription="시리즈 코드 설명 테스트"'
                + ' data-author="' + item.tx_AUTH + '"'
                + ' data-width="' + item.tx_LSPEC + '"'
                + ' data-height="' + item.tx_VSPEC + '"'
                + ' data-chromacity="' + item.cnt_COLOR + '"'
                + ' data-page="' + item.cnt_PAGE + '"'
                + ' data-saleYN="' + item.sale_YN + '"'
                + ' data-saleDay="' + item.dt_SALE_FR + '"'
                + ' data-saleTime="' + item.tm_SALE_FR + '"'
                + ' data-jegoData="' + item.jego + '"'
                + ' data-price="' + item.amt_LISTPRC + '"'
                + ' onClick=selectBookCode(this)';

            choice.innerHTML = `
                <span class="badge badge-secondary"` + html + `>선택</span> `;

            // 추가적인 클래스나 이벤트 리스너 설정 가능
            CD_ITEM.className = 'text-dark fw-bold text-hover-warning hoverable';
            CD_SERIES.className = 'text-hover-warning hoverable';
            YY_ITEM.className = 'text-hover-warning hoverable';
            NM_GB_SUBJ.className = 'text-hover-warning hoverable';
            CD_SUBJ.className = 'text-hover-warning hoverable';
            NM_GOODS.className = 'text-hover-warning hoverable';
            choice.className = 'text-hover-warning hover-scale hoverable';

        });
    }

    /**
     * 선택한 교재 코드를 입력 폼에 적용합니다.
     * @param element
     * @returns {Promise<void>}
     */
    async function selectBookCode(element) {
        let code = element.getAttribute('data-code');
        let name = element.getAttribute('data-name');
        let productCodeData = element.getAttribute('data-productCode');
        let schoolData = element.getAttribute('data-school');
        let subjectData = element.getAttribute('data-subject');
        let gradeData = element.getAttribute('data-grade');
        let semesterDate = element.getAttribute('data-semester');

        let yearData = element.getAttribute('data-year') || '';
        let authorData = element.getAttribute('data-author');
        let widthData = element.getAttribute('data-width');
        let heightData = element.getAttribute('data-height');
        let chromacityData = element.getAttribute('data-chromacity');
        let pageData = element.getAttribute('data-page');
        let saleYNData = element.getAttribute('data-saleYN');
        let saleDayData = element.getAttribute('data-saleDay');
        let saleTimeData = element.getAttribute('data-saleTime');
        let jegoDataData = element.getAttribute('data-jegoData');
        let priceData = element.getAttribute('data-price');
        let seriesCode = element.getAttribute('data-seriesCode');
        let seriesCodeName = element.getAttribute('data-seriesCodeName');
        let seriesDescription = element.getAttribute('data-seriesDescription');



        console.log(widthData, heightData)


        let bookCode1 = document.getElementById('bookCode');
        let bookCode2 = document.getElementById('bookCodeName');
        let school = document.getElementById('school');
        let subject = document.getElementById('subject');
        let grade = document.getElementById('grade');
        let semester = document.getElementById('semester');
        let year = document.getElementById('year');
        let author = document.getElementById('author');
        let width = document.getElementById('width');
        let height = document.getElementById('height');
        let chromacity = document.getElementById('chromacity');
        let totalPage = document.getElementById('bookStructure');
        let price = document.getElementById('price');
        let seriesCodeInput = document.getElementById('seriesCode');
        let seriesCodeNameInput = document.getElementById('seriesCodeName');
        let seriesDescriptionInput = document.getElementById('seriesDescription');

        bookCode1.value = code;
        bookCode2.value = name;
        school.value = schoolData;
        subject.value = subjectData;
        grade.value = gradeData;
        semester.value = semesterDate;
        author.value = authorData;
        width.value = widthData;
        height.value = heightData;
        chromacity.value = chromacityData;
        totalPage.value = pageData;
        price.value = priceData;
        year.value = yearData;
        seriesCodeInput.value = seriesCode;
        seriesCodeNameInput.value = seriesCodeName;
        seriesDescriptionInput.value = seriesDescription;

        // productCode.disabled = false;
        // school.disabled = false;
        // subject.disabled = false;
        // grade.disabled = false;
        // semester.disabled = false;
        year.disabled = false;

        if (isSubmitCheck) {
            initFormValidation(true);
        }

        let modal = document.getElementById('bookCodeModalLayout');
        modal.remove();
        closeModalBackdrop();
        document.body.classList.remove('modal-open'); // modal-open 클래스 제거
        document.body.style.paddingRight = '';
        document.body.style.overflow = ''; // 스크롤 스타일 초기화


    }



    /*********************************************************** Modal 영역 ********************************************/


    function attachModalEventListeners() {
        const bookCodeModalElements = document.querySelectorAll('.bookCodeModal:not(.modal-attached)');

        bookCodeModalElements.forEach(function (element) {
            element.classList.add('modal-attached');
            element.addEventListener('click', openBookCodeModalHandler);
        });
    }

    function openBookCodeModalHandler(event) {
        const modalLayout = document.createElement('div');
        modalLayout.classList.add('modal', 'fade');
        modalLayout.id = 'bookCodeModalLayout';
        modalLayout.tabIndex = '-1';
        modalLayout.setAttribute('aria-hidden', 'true');

        const modalDialog = document.createElement('div');
        modalDialog.classList.add('modal-dialog', 'modal-dialog-centered', 'modal-xl');
        modalDialog.id = 'modalContent';

        modalLayout.appendChild(modalDialog);
        document.body.appendChild(modalLayout);
        let modal = new bootstrap.Modal(modalLayout, {
            keyboard: false
        });

        modalLayout.addEventListener('hidden.bs.modal', function() {
            modalLayout.remove();
        });

        document.getElementById('loadingBar').style.display = 'block';
        NTUtil.ajax({
            url: '/reference-book/book-code-search',
            method: 'GET',
            success: function (data) {
                modalDialog.innerHTML = '';
                modalDialog.insertAdjacentHTML('beforeend', data);
                $(modalDialog).find('select').select2({
                    minimumResultsForSearch: Infinity
                });

                yearInit();
                const targetNode = document.querySelectorAll('.form-select.unselect-form');
                targetNode.forEach((node) => {
                    node.style.backgroundColor = '#ffffff';
                    node.style.backgroundClip = 'padding-box';
                    node.style.border = '1px solid #E4E6EF';
                });

                const unselectedNode = document.querySelectorAll('.form-select.renewal-form');
                unselectedNode.forEach((node) => {
                    node.style.backgroundColor = '##F5F8FA';
                    node.style.backgroundClip = 'padding-box';
                });

                let input = document.getElementById('bookCodeSearchSearch');
                input.addEventListener('keypress', function (event) {
                    if (event.key === 'Enter') {
                        event.preventDefault();
                        document.getElementById('searchBtn').click();
                    }
                });

                document.getElementById('loadingBar').style.display = 'none';
                modal.show();
            }
        })
    }


    function closeBookCodeModal() {
        let modal = document.getElementById('bookCodeModalLayout');
        modal.remove();
        closeModalBackdrop();
    }



    function closeModalBackdrop() {
        let backdrops = document.querySelectorAll('.modal-backdrop');

        if (!document.querySelector('.modal.show')) {

            backdrops.forEach(backdrop => backdrop.remove());
        }
    }

    attachModalEventListeners();

    function deleteFile (element) {
        console.log('hih')
        let idx = element.getAttribute('data-id');

        let replaceImageIdx = idx.replace('dropzone', 'dropzoneImage');
        console.log(replaceImageIdx);
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

    .select2-selection.select2-selection--single.form-select.form-select-solid.unselect-form .select2-selection__rendered .select2-selection__placeholder {
        color: #5E6278;
        font: 14.3px Poppins, Helvetica, "sans-serif";
    }

    .base-input__error {
        display: none; /* 기본적으로는 보이지 않도록 설정 */
        color: #F1416C; /* 에러 메시지 색상 */
        font-size: 0.925rem; /* 에러 메시지 폰트 크기 */
        text-align: left; /* 좌측 정렬 */
    }

    .input-error {
        border-color: #e74c3c; /* 입력 필드 에러 시 테두리 색상 */
    }

    /* 에러 메시지를 보이게 하는 클래스 */
    .show-error {
        display: block;
    }

    .select2-selection.input-error {
        border: 1px solid #e74c3c !important; /* 선택된 값의 테두리 색상 */
    }

    select2-selection.select2-selection--single.form-select.form-select-solid.unselect-form.input-error {
        border-color: #e74c3c !important; /* 선택된 값의 테두리 색상 */
    }
    /* select2의 커스터마이즈된 div 요소에 대한 스타일링 */
    .select2-container--default .select2-selection--single.input-error {

    }

    .select2-container--default .select2-selection--multiple.input-error {
        border-color: #e74c3c !important; /* 다중 선택의 테두리 색상 */
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
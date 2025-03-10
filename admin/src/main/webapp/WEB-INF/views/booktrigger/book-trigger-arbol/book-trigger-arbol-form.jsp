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
                <%@ include file="/WEB-INF/views/common/inc/ToolbarINC.jsp" %>
                <div class="post d-flex flex-column-fluid">
                    <div class="container-fluid">
                        <!-- 본문 내용 START -->
                        <input type="hidden" id="uid" value="${uid}" />
                        <form id="bookTriggerForm" name="bookTriggerForm">
                            <div class="card mb-5 mb-xl-10">
                                <div class="card-header border-0 pt-5">
                                    <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                        기본 정보
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">대상</label>
                                                </div>
                                                <div class="col-lg-3 fv-row row d-flex justify-content-center align-items-center" id="targetSelect2">
                                                    <select
                                                            id="target"
                                                            class="form-select form-select-solid form-select-lg unselect-form target"
                                                            data-control="select2"
                                                            name="target"
                                                            data-hide-search="true"
                                                            multiple="multiple"
                                                            autocomplete="off"
                                                            data-close-on-select="false"
                                                            data-placeholder="전체"
                                                            data-allow-clear="true"
                                                            onchange="formSelect2()"
                                                    >
                                                        <c:forEach items="${targetList}" var="targetOption">
                                                            <option value='${targetOption.categoryIdx}'
                                                                ${fn:contains(list.targetList, targetOption.categoryName) ? 'selected' : ''}>${targetOption.categoryName}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                    <%--                                                    <span class="base-input__error" id="targetError"></span>--%>
                                                </div>

                                                <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">분야</label>
                                                </div>
                                                <div class="col-lg-3 fv-row d-flex justify-content-center flex-column align-items-center" id="fieldSelect2">
                                                    <select
                                                            id="field"
                                                            class="form-select form-select-solid form-select-lg unselect-form field"
                                                            name="field"
                                                            data-control="select2"
                                                            data-hide-search="true"
                                                            multiple="multiple"
                                                            autocomplete="off"
                                                            data-close-on-select="false"
                                                            data-placeholder="전체"
                                                            data-allow-clear="true"
                                                            onchange="formSelect2()"
                                                    >
                                                        <c:forEach items="${fieldList}" var="fieldOption">
                                                            <option value='${fieldOption.categoryIdx}'
                                                                ${fn:contains(list.fieldList, fieldOption.categoryName) ? 'selected' : ''}>${fieldOption.categoryName}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>

                                                <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">시리즈</label>
                                                </div>
                                                <div class="col-lg-3 fv-row d-flex justify-content-center align-items-center" id="seriesSelect2">
                                                    <select
                                                            id="series"
                                                            class="form-select form-select-solid form-select-lg unselect-form series"
                                                            name="series"
                                                            data-control="select2"
                                                            data-hide-search="true"
                                                            multiple="multiple"
                                                            autocomplete="off"
                                                            data-close-on-select="false"
                                                            data-placeholder="전체"
                                                            data-allow-clear="true"
                                                            onchange="formSelect2()"
                                                    >
                                                        <c:forEach items="${seriesList}" var="seriesOption">
                                                            <option value='${seriesOption.categoryIdx}'
                                                                ${fn:contains(list.seriesList, seriesOption.categoryName) ? 'selected' : ''}>${seriesOption.categoryName}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row emptyUid">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">도서명</label>
                                            </div>
                                            <div class="col-lg-11 fv-row row">
                                                <input
                                                        id="bookName"
                                                        name="bookName"
                                                        type="text"
                                                        class="form-control"
                                                        placeholder="도서명 입력"
                                                        maxlength="100"
                                                        value="${list.bookName}"
                                                        autocomplete="off"
                                                />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row emptyUid" id="authorGroup">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center ">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">저자</label>
                                            </div>
                                            <div class="col-lg-11 row" >
                                                <div class="col-lg-4 row">
                                                    <div class="col-lg-2 d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3">글</label>
                                                    </div>
                                                    <div class="col-lg-8 fv-row">
                                                        <input
                                                                id="authorWriting"
                                                                name="authorWriting"
                                                                type="text"
                                                                maxlength="50"
                                                                class="form-control"
                                                                value="${list.authorWriting}"
                                                                autocomplete="off"
                                                        />
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 row">
                                                    <div class="col-lg-2 d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3">그림</label>
                                                    </div>
                                                    <div class="col-lg-8 fv-row">
                                                        <input
                                                                id="authorPicture"
                                                                name="authorWriting"
                                                                maxlength="50"
                                                                type="text"
                                                                class="form-control"
                                                                value="${list.authorPicture}"
                                                                autocomplete="off"
                                                        >
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 row">
                                                    <div class="col-lg-2 d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3">옮김</label>
                                                    </div>
                                                    <div class="col-lg-8 fv-row">
                                                        <input
                                                                id="authorTranslation"
                                                                name="authorWriting"
                                                                maxlength="50"
                                                                type="text"
                                                                class="form-control"
                                                                value="${list.authorTranslation}"
                                                                autocomplete="off"
                                                        >
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row" id="bookStatus">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">도서형태</label>
                                            </div>
                                            <div class="col-lg-11 row">
                                                <div class="col-lg-4 row" >
                                                    <div class="col-lg-2 d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3">쪽수</label>
                                                    </div>
                                                    <div class="col-lg-8 fv-row">
                                                        <input
                                                                id="totalPage"
                                                                name="totalPage"
                                                                type="number"
                                                                class="form-control"
                                                                value="${list.totalPage}"
                                                                autocomplete="off"
                                                        />
                                                    </div>
                                                    <div class="col-lg-2 d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3">쪽</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 row">
                                                    <div class="col-lg-2 d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3">가로</label>
                                                    </div>
                                                    <div class="col-lg-8 fv-row">
                                                        <input
                                                                id="width"
                                                                name="totalPage"
                                                                type="number"
                                                                class="form-control"
                                                                value="${list.width}"
                                                                autocomplete="off"
                                                        />
                                                    </div>
                                                    <div class="col-lg-2 d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3">mm</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 row">
                                                    <div class="col-lg-2 d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3">세로</label>
                                                    </div>
                                                    <div class="col-lg-8 fv-row">
                                                        <input
                                                                id="height"
                                                                name="totalPage"
                                                                type="number"
                                                                class="form-control"
                                                                value="${list.height}"
                                                                autocomplete="off"
                                                        />
                                                    </div>
                                                    <div class="col-lg-2 d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3">mm</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row emptyUid" >
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">발행일</label>
                                            </div>
                                            <div class="col-lg-8">

                                                <div class="col-4">
                                                    <div class="input-group fv-row">
                                                        <input
                                                                id="publicationDate"
                                                                name="publicationDate"
                                                                type="text"
                                                                class="form-control flatpickr-input"
                                                                placeholder="날짜 선택"
                                                                autocomplete="off"
                                                                value="<c:out value="${list.publicationDate}"/>"
                                                        />
                                                        <span class="input-group-text" id="basic-addon3">
                                                    <i class="bi bi-calendar-check fs-1"></i>
                                                    </span>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="row" >
                                            <div class="col-lg-6 row">
                                                <div class="col-lg-2 d-flex align-items-center justify-content-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">태그</label>
                                                </div>
                                                <div class="col-lg-10 row">
                                                    <div class="col-lg-12 mb-2 row">
                                                        <div class="col-lg-7 input-container fv-row" id="tagForm">
                                                            <input id="tag"
                                                                   name="tag"
                                                                   type="text"
                                                                   class="form-control"
                                                                   autocomplete="off"
                                                                   maxlength="10"
                                                                   oninput="updateCharCount()"
                                                            />
                                                            <span id="charCount" class="char-count">0/10</span>
                                                        </div>
                                                        <div class="col-lg-5">
                                                            <button type="button" id="plusTagBtn" class="btn btn-dark" onclick="plusTag()">태그 등록</button>
                                                        </div>

                                                    </div>
                                                    <div class="col-lg-10">
                                                        <span class="ms-2" style="color: gray;">* 태그는 #입력 없이 영문, 한글로만 최대 5개까지 등록이 가능합니다.</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="tagList" class="col-lg-6 pt-3">
                                                <c:if test="${not empty list.tagList}">
                                                    <c:forEach items="${list.tagList}" var="tag" varStatus="status">
                                                        <span id="tag${status.index}" class="badge badge-secondary badge-lg tags">#${tag} <span class="delete-btn" onclick="deleteTag(this)">X</span></span>
                                                    </c:forEach>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row emptyUid">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">금액</label>
                                            </div>
                                            <div class="col-lg-8 row">
                                                <div class="col-lg-5 row fv-row">
                                                    <input
                                                            id="price"
                                                            name="price"
                                                            type="text"
                                                            class="form-control"
                                                            value="${list.price}"
                                                            autocomplete="off"
                                                            oninput="formatPrice(this)"
                                                    />
                                                </div>
                                                <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">원</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row emptyUid">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">ISBN</label>
                                            </div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-5 row fv-row">
                                                    <input
                                                            id="isbn"
                                                            name="isbn"
                                                            maxlength="20"
                                                            type="text"
                                                            class="form-control isbn"
                                                            autocomplete="off"
                                                            value="${list.isbn}"
                                                    />




                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">도서 섬네일</label>
                                            </div>
                                            <div class="col-lg-11">
                                                <div class="col-lg-12 form-label text-dark">
                                                    <div class="col-lg-12 form-label text-dark flex-column" id="dz0Container">
                                                        <jsp:include page="/FileFormINC" flush="false">
                                                            <jsp:param name="fileFormType" value="Y" />
                                                            <jsp:param name="isImage" value="false" />
                                                            <jsp:param name="hasOrder" value="false" />
                                                            <jsp:param name="parentTable" value="BOOK_TRIGGER"/>
                                                            <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                            <jsp:param name="parentType" value="THUMBNAIL"/>
                                                            <jsp:param name="maxFileCount" value="1"/>
                                                            <jsp:param name="isSecure" value="N"/>
                                                            <jsp:param name="DZID" value="dz0"/>
                                                            <jsp:param name="dropzoneIndex" value="0"/>
                                                            <jsp:param name="description" value="파일 크기는 1MB이하, jpg, jpeg, png 형식의 파일만 가능합니다.__섬네일 이미지는 470 * 807 px 로 업로드 해주세요."/>
                                                        </jsp:include>
                                                        <span class="base-input__error" id="thumbnailFileError"></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark required pt-3">미리보기</label>
                                            </div>
                                            <div class="col-lg-11">
                                                <div class="row mb-4">
                                                    <div class="col-lg-3 row">
                                                        <div class="col">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                <input class="form-check-input" type="radio" name="preview" value="URL" ${not empty list.previewUrl or empty list ? 'checked' : ''} id="urlPath" onclick="showPdf()"/>
                                                                <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="urlPath">
                                                                    URL 경로
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                <input class="form-check-input" type="radio" name="preview" value="PDF" ${list.previewUrl eq '' ? 'checked' : ''} id="isPdf" onclick="showPdf()"/>
                                                                <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isPdf">
                                                                    PDF 등록
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div id="url" class="col-lg-12 form-label text-dark fv-row" style="display:  ${list.previewUrl ne '' ? 'block' : 'none'}">
                                                        <input
                                                                type="text"
                                                                class="form-control"
                                                                placeholder="URL 경로 입력"
                                                                id="previewUrl"
                                                                name="previewUrl"
                                                                value="${list.previewUrl}"
                                                                autocomplete="off"
                                                        />
                                                    </div>
                                                    <div id="dz1Container" class="col-lg-12 form-label text-dark flex-column" style="display:  ${list.previewUrl eq '' ? 'block' : 'none'}">
                                                        <jsp:include page="/FileFormINC" flush="false">
                                                            <jsp:param name="fileFormType" value="Y" />
                                                            <jsp:param name="isImage" value="false" />
                                                            <jsp:param name="hasOrder" value="false" />
                                                            <jsp:param name="parentTable" value="BOOK_TRIGGER"/>
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
                                        <div class="col-lg-12 row emptyUid">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">노출여부</label>
                                            </div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-3 row">
                                                    <div class="col">
                                                        <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                            <input class="form-check-input focusIsOpen" type="radio" name="isUse" value="N" ${list.isUse eq 'N' || empty list ? 'checked' : ''} id="isN" onclick="changeIntroRadio(this)"/>
                                                            <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isN">
                                                                N
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                            <input class="form-check-input" type="radio" name="isUse" value="Y" ${list.isUse eq 'Y' ? 'checked' : ''} id="isY" onclick="changeIntroRadio(this)"/>
                                                            <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isY">
                                                                Y
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8" id="onlineStoreLine1">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">온라인 서점</label>
                                            </div>
                                            <div class="col-lg-11 row">
                                                <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-blue d-flex align-items-center justify-content-start pt-2">01.</label>
                                                </div>
                                                <div class="col-lg-4 row fv-row flex-column">
                                                    <select
                                                            id="onlineBookStore"
                                                            class="form-select form-select-solid unselect-form onlineBookStore"
                                                            data-control="select2"
                                                            data-hide-search="true"
                                                            data-placeholder="전체"
                                                            name="onlineBookStore"
                                                            data-idx="onlineBookStore"
                                                            onchange="checkOnlineStore(this)"
                                                    >
                                                        <option></option>
                                                        <c:if test="${not empty list.onlineStoreDataList and fn:length(list.onlineStoreDataList) > 0}">
                                                            <option value="교보문고" ${list.onlineStoreDataList[0].storeName eq '교보문고' ? 'selected' : ''}>교보문고</option>
                                                            <option value="인터파크(도서)" ${list.onlineStoreDataList[0].storeName eq '인터파크(도서)' ? 'selected' : ''}>인터파크(도서)</option>
                                                            <option value="YES24" ${list.onlineStoreDataList[0].storeName eq 'YES24' ? 'selected' : ''}>YES24</option>
                                                            <option value="네이버" ${list.onlineStoreDataList[0].storeName eq '네이버' ? 'selected' : ''}>네이버</option>
                                                            <option value="영풍문고" ${list.onlineStoreDataList[0].storeName eq '영풍문고' ? 'selected' : ''}>영풍문고</option>
                                                            <option value="알라딘" ${list.onlineStoreDataList[0].storeName eq '알라딘' ? 'selected' : ''}>알라딘</option>
                                                        </c:if>
                                                        <c:if test="${empty list.onlineStoreDataList}">
                                                            <option value="교보문고">교보문고</option>
                                                            <option value="인터파크(도서)">인터파크(도서)</option>
                                                            <option value="YES24">YES24</option>
                                                            <option value="네이버">네이버</option>
                                                            <option value="영풍문고">영풍문고</option>
                                                            <option value="알라딘">알라딘</option>
                                                        </c:if>

                                                    </select>
                                                    <div class="base-input__error"></div>
                                                </div>
                                                <div class="col-lg-5 row fv-row flex-column">
                                                    <input type="text" class="form-control onlineInput1" autocomplete="off" maxlength="500" name="onlineBookStore" data-idx="1" placeholder="온라인 서점 URL 입력" value="${list.onlineStoreDataList[0].storeUrl}" oninput="validateOnlineStore()"/>
                                                    <div class="base-input__error"></div>
                                                </div>
                                                <div class="col-lg-2 d-flex justify-content-center align-items-center">
                                                    <button type="button" data-idx="1" id="plusOnlineStoreBtn" class="btn btn-dark " onclick="plusOnlineStore(this)">추가 +</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="showOnlineStore" style="display: ${not empty list ? '' : 'none'};">
                                        <c:if test="${not empty list.onlineStoreDataList}">
                                            <c:forEach var="online" items="${list.onlineStoreDataList}" varStatus="status">
                                                <c:if test="${status.index >= 1}">
                                                    <div class="row mb-8" id="onlineStoreLine${status.index + 1}">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                            </div>
                                                            <div class="col-lg-11 row">
                                                                <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                                    <label class="col-lg-12 form-label fw-bolder text-blue d-flex align-items-center justify-content-start pt-2">
                                                                        <fmt:formatNumber value="${status.index + 1}" pattern="00."/>
                                                                    </label>
                                                                </div>
                                                                <div class="col-lg-4 row fv-row flex-colum">
                                                                    <select
                                                                            id="onlineBookStore${status.index + 1}"
                                                                            class="form-select form-select-solid unselect-form onlineBookStore"
                                                                            data-control="select2"
                                                                            name="onlineBookStore"
                                                                            data-hide-search="true"
                                                                            data-placeholder="전체"
                                                                            data-idx="onlineBookStore${status.index + 1}"
                                                                            onchange="checkOnlineStore(this)"
                                                                    >
                                                                        <option></option>
                                                                        <option value="교보문고" ${online.storeName eq '교보문고' ? 'selected' : ''}>교보문고</option>
                                                                        <option value="인터파크(도서)" ${online.storeName eq '인터파크(도서)' ? 'selected' : ''}>인터파크(도서)</option>
                                                                        <option value="YES24" ${online.storeName eq 'YES24' ? 'selected' : ''}>YES24</option>
                                                                        <option value="네이버" ${online.storeName eq '네이버' ? 'selected' : ''}>네이버</option>
                                                                        <option value="영풍문고" ${online.storeName eq '영풍문고' ? 'selected' : ''}>영풍문고</option>
                                                                        <option value="알라딘" ${online.storeName eq '알라딘' ? 'selected' : ''}>알라딘</option>
                                                                    </select>
                                                                    <div class="base-input__error"></div>
                                                                </div>
                                                                <div class="col-lg-5 row fv-row flex-column">
                                                                    <input type="text" class="form-control onlineInput${status.index}" maxlength="500" autocomplete="off" placeholder="온라인 서점 URL 입력" data-idx="${status.index}" name="onlineBookStore" value="${online.storeUrl}" oninput="validateOnlineStore()" />
                                                                    <div class="base-input__error"></div>
                                                                </div>
                                                                <div class="col-lg-2 d-flex justify-content-center align-items-center">
                                                                    <button type="button" data-idx="${status.index + 1}" class="btn btn-secondary" onclick="deleteOnlineStore(this)">삭제 -</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-1">

                                        </div>
                                        <div class="col-lg-11">
                                            <span class="ms-2" style="color: gray;">* 온라인 서점은 기본1개, 최대 6개까지 등록 가능합니다.</span>
                                        </div>

                                    </div>

                                </div>
                            </div>


                            <div class="card mb-5 mb-xl-10">
                                <div>
                                    <div class="card-header border-0 pt-5">
                                        <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                            상세 정보
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="row mb-12">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 errorValid required">소개</label>
                                                </div>
                                                <div class="col-lg-11 fv-row">
                                                       <textarea class="form-control form-control-solid contents"
                                                                 rows="5"
                                                                 id="introduction"
                                                                 minlength="1"
                                                                 name="contents"
                                                                 placeholder="Content">
                                                           ${list.introduction}
                                                       </textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-4">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-1 d-flex justify-content-center align-items-center ">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">수상 및 선정 <br/>사례</label>
                                                </div>

                                                <div class="col-lg-11 row">
                                                    <div  class="row mb-8">
                                                        <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                            <label class="col-lg-12 form-label fw-bolder text-dark pt-3">사용여부</label>
                                                        </div>
                                                        <div class="col-lg-2 d-flex justify-content-center align-items-center row">
                                                            <div class="col">
                                                                <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                    <input
                                                                            class="form-check-input"
                                                                            type="radio"
                                                                            name="isAwards"
                                                                            value="N"
                                                                    ${list.isAwards eq 'N' || empty list ? 'checked' : ''}
                                                                            id="isAwardsN"
                                                                            onclick="showAwards()"
                                                                    />
                                                                    <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isAwardsN">
                                                                        N
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                    <input
                                                                            class="form-check-input"
                                                                            type="radio"
                                                                            name="isAwards"
                                                                            value="Y"
                                                                    ${list.isAwards eq 'Y' ? 'checked' : ''}
                                                                            id="isYWards"
                                                                            onclick="showAwards()"
                                                                    />
                                                                    <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isYWards">
                                                                        Y
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-9 d-flex align-items-center">
                                                            <span class="ms-2 form-label fw-bold text-gray-600">* 수상 및 선정 사례는 최대 5개까지 등록 가능합니다.</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-4">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-1 d-flex justify-content-center align-items-center ">

                                                </div>

                                                <div class="col-lg-11 row">
                                                    <div id="isAwardsLine1" class="row mb-8 awardLine" style="display: ${list.isAwards eq 'Y' ? '' : 'none'};">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-1 d-flex justify-content-start align-items-center">
                                                                <label class="col-lg-10 form-label fw-bolder text-blue d-flex align-items-center justify-content-start pt-2">01.</label>
                                                            </div>
                                                            <div class="col-lg-9 row fv-row flex-column">
                                                                <c:if test="${not empty list.awardList and fn:length(list.awardList) > 0}">
                                                                    <input
                                                                            type="text"
                                                                            name="award"
                                                                            class="form-control awards"
                                                                            maxlength="100"
                                                                            placeholder="수상 및 선정 사례 입력 (최대 100자까지 입력가능)"
                                                                            value="${list.awardList[0]}"
                                                                            oninput="validateAwardInput()"
                                                                            autocomplete="off"
                                                                    />
                                                                    <div class="base-input__error"></div>
                                                                </c:if>
                                                                <c:if test="${empty list.awardList}">
                                                                    <input
                                                                            type="text"
                                                                            name="award"
                                                                            class="form-control awards"
                                                                            maxlength="100"
                                                                            placeholder="수상 및 선정 사례 입력 (최대 100자까지 입력가능)"
                                                                            oninput="validateAwardInput()"
                                                                            autocomplete="off"
                                                                    />
                                                                    <div class="base-input__error"></div>
                                                                </c:if>
                                                            </div>
                                                            <div class="col-lg-2 d-flex justify-content-center align-items-center">
                                                                <button type="button" id="plusAwardBtn" data-idx="1" class="btn btn-dark " onclick="plusAwardLine()">추가 +</button>

                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div id="showAwards" style="display: ${list.isAwards eq 'Y' ? '' : 'none'};">
                                                        <c:if test="${not empty list.awardList}">
                                                            <c:forEach var="award" items="${list.awardList}" varStatus="status">
                                                                <c:if test="${status.index >= 1}">
                                                                    <div class="row mb-8 awardLine" id="isAwardsLine${status.index + 1}">
                                                                        <div class="col-lg-12 row">
                                                                            <div class="col-lg-1 d-flex justify-content-start align-items-center">
                                                                                <label class="col-lg-10 form-label fw-bolder text-blue d-flex align-items-start justify-content-center pt-2">
                                                                                    <fmt:formatNumber value="${status.index + 1}" pattern="00."/>
                                                                                </label>
                                                                            </div>
                                                                            <div class="col-lg-9 row flex-column">
                                                                                <input
                                                                                        type="text"
                                                                                        name="award"
                                                                                        class="form-control awards"
                                                                                        maxlength="100"
                                                                                        placeholder="수상 및 선정 사례 입력 (최대 100자까지 입력가능)"
                                                                                        oninput="validateAwardInput()"
                                                                                        autocomplete="off"
                                                                                        value="${award}"
                                                                                />
                                                                                <div class="base-input__error"></div>
                                                                            </div>
                                                                            <div class="col-lg-2 d-flex justify-content-center align-items-center">
                                                                                <button type="button" data-idx="${status.index + 1}" class="btn btn-secondary" onclick="deleteAward(this)">삭제 -</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-1 d-flex justify-content-center align-items-center ">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">관련 시리즈<br/>도서</label>
                                                </div>
                                                <div class="col-lg-11 row ">
                                                    <div  class="row mb-8 fv-row">
                                                        <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                            <label class="col-lg-12 form-label fw-bolder text-dark pt-3">사용여부</label>
                                                        </div>
                                                        <div class="col-lg-2 d-flex justify-content-center align-items-center row ">
                                                            <div class="col">
                                                                <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                    <input
                                                                            class="form-check-input"
                                                                            type="radio"
                                                                            name="isSeries"
                                                                            value="N" ${list.isSeries eq 'N' || empty list || empty list.isSeries ? 'checked' : ''}
                                                                            id="isSeriesN"
                                                                            onclick="showIsSeries()"
                                                                            autocomplete="off"
                                                                    />
                                                                    <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isSeriesN">
                                                                        N
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                    <input
                                                                            class="form-check-input"
                                                                            type="radio"
                                                                            name="isSeries"
                                                                            value="Y" ${list.isSeries eq 'Y' ? 'checked' : ''}
                                                                            id="isSeriesY"
                                                                            onclick="showIsSeries()"
                                                                            autocomplete="off"
                                                                    />
                                                                    <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isSeriesY">
                                                                        Y
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-9 pt-2" id="seriesBtn" style="display: ${list.isSeries eq 'Y' ? '' : 'none'};">
                                                            <button type="button" class="btn btn-dark seriesCodeModal">관련 시리즈 도서 검색 +</button>
                                                        </div>

                                                    </div>
                                                    <div class="col-lg-9 d-flex align-items-center"  style="display: ${list.isSeries eq 'Y' ? '' : 'none'};">
                                                        <span class="ms-2 form-label fw-bold text-gray-600" id="seriesMsg" style="display: ${list.isSeries eq 'Y' ? '' : 'none'};">* 관련 시리즈 도서는 기본3개, 최대 10개까지 등록 가능합니다.</span>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-1 d-flex justify-content-center align-items-center ">

                                            </div>
                                            <%--                                        <div class="col-lg-11" id="seriesLineDiv">--%>
                                            <%--                                            <div class="row mb-8" id="isSeriesLine0" style="display: ${list.isSeries eq 'Y' ? '' : 'none'};">       <!--- 시리즈 도서가 있으면 보여주면 됨 --->--%>

                                            <%--                                            </div>--%>

                                            <%--                                            <c:if test="${not empty list.seriesBookList}">--%>
                                            <%--                                                <c:forEach var="series" items="${list.seriesBookList}" varStatus="status">--%>
                                            <%--                                                    <div id="isSeriesLine${status.index}" class="row mb-8 seriesLine" data-index="${series.bookTriggerArbolIndex}" data-bookName="${series.bookName}">--%>
                                            <%--                                                        <div class="col-lg-11 row">--%>
                                            <%--                                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">--%>
                                            <%--                                                                <label class="col-lg-10 form-label fw-bolder text-blue d-flex align-items-center justify-content-start pt-2 seriesNumber">--%>
                                            <%--                                                                    <fmt:formatNumber value="${status.index + 1}" pattern="00."/>--%>
                                            <%--                                                                </label>--%>
                                            <%--                                                            </div>--%>
                                            <%--                                                            <div class="col-lg-7 row pt-3">--%>
                                            <%--                                                                <label class="col-lg-12 form-label text-dark">${series.bookName}</label>--%>
                                            <%--                                                            </div>--%>
                                            <%--                                                            <div class="col-lg-2 d-flex justify-content-center align-items-center">--%>
                                            <%--                                                                <button type="button" data-idx="${status.index}" class="btn btn-secondary seriesBtn" onclick="deleteSeries(this)">삭제 -</button>--%>
                                            <%--                                                            </div>--%>
                                            <%--                                                        </div>--%>
                                            <%--                                                    </div>--%>
                                            <%--                                                </c:forEach>--%>
                                            <%--                                            </c:if>--%>
                                            <%--                                        </div>--%>
                                            <div class="col-lg-11" id="seriesLineDiv">
                                                <table class="table table-striped" id="seriesTable">
                                                    <tbody id="seriesTableBody" class="seriesLine">
                                                    <c:if test="${not empty list.seriesBookList}">
                                                        <c:forEach varStatus="status" var="item" items="${list.seriesBookList}">
                                                            <tr id="isSeriesLine${status.index}" class="seriesLine" data-index="${item.bookTriggerArbolIndex}" data-book-name="${item.bookName}">

                                                                <td class=" num form-label fw-bolder text-blue">
                                                                    <fmt:formatNumber value="${status.index + 1}" pattern="00."/>
                                                                </td>
                                                                <td class="text-dark">
                                                                        ${item.bookName}
                                                                </td>
                                                                <td class="text-center button">
                                                                    <button type="button" data-idx="${status.index}" data-index="${item.bookTriggerArbolIndex}" class="btn btn-secondary seriesBtn" onclick="deleteSeries(this)">삭제 -</button>
                                                                </td>

                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                    </tbody>
                                                </table>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="card mb-5 mb-xl-10">
                                <div id="option">
                                    <div class="card-header border-0 pt-5">
                                        <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                            인트로 관리
                                        </div>

                                    </div>
                                    <div class="card-body">
                                        <div class="row mb-8">
                                            <div class="col-lg-8 row">
                                                <div class="col-lg-2 d-flex justify-content-center align-items-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">인트로 노출 여부</label>
                                                </div>
                                                <div class="col-lg-3 row" id="showIsIntroN" >
                                                    <div class="col">
                                                        <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                            <input
                                                                    class="form-check-input isIntro"
                                                                    type="radio"
                                                                    name="isIntro"
                                                            <%--                                                            ${list.isUse eq 'N' || empty list ? 'disabled' : ''}--%>
                                                                    value="N" ${list.isIntro eq 'N' || empty list ? 'checked' : ''}
                                                                    id="isIntroN"
                                                                    onclick="handleIntroChange()"
                                                            />
                                                            <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isIntroN">
                                                                N
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                            <input
                                                                    class="form-check-input isIntro"
                                                                    type="radio"
                                                                    name="isIntro"
                                                                    value="Y"
                                                            ${list.isIntro eq 'Y' ? 'checked' : ''}
                                                                    id="isIntroY"
                                                            <%--                                                            ${list.isUse eq 'N' || empty list ? 'disabled' : ''}--%>
                                                                    onclick="handleIntroChange()"
                                                            />
                                                            <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isIntroY">
                                                                Y
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-7 d-flex justify-content-center align-items-center">
                                                    <label class="col-lg-12 form-label fw-bold text-gray-600 pt-3">
                                                        * 인트로 노출여부 설정은 기본 5개, 최대 20개까지 등록 가능합니다.
                                                    </label>
                                                </div>
                                                <span class="base-input__error" id="showIsIntroNError"></span>
                                            </div>
<%--                                            <div class="col-lg-4 row">--%>
<%--                                                <div class="col-lg-3 d-flex justify-content-center align-items-center ">--%>
<%--                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">노출 순서</label>--%>
<%--                                                </div>--%>
<%--                                                <div class="col-lg-4 row d-flex justify-content-center align-items-center">--%>
<%--                                                    <select--%>
<%--                                                            id="introOrder"--%>
<%--                                                            class="form-select form-select-solid unselect-form"--%>
<%--                                                            name="introOrder"--%>
<%--                                                            data-control="select2"--%>
<%--                                                            data-hide-search="true"--%>
<%--                                                    ${list.isIntro eq 'N' || empty list ? 'disabled' : ''}--%>
<%--                                                    >--%>
<%--                                                        <option value="1" ${list.introSortOrder eq '1' ? 'selected' : ''}>1</option>--%>
<%--                                                        <option value="2" ${list.introSortOrder eq '2' ? 'selected' : ''}>2</option>--%>
<%--                                                        <option value="3" ${list.introSortOrder eq '3' ? 'selected' : ''}>3</option>--%>
<%--                                                        <option value="4" ${list.introSortOrder eq '4' ? 'selected' : ''}>4</option>--%>
<%--                                                        <option value="5" ${list.introSortOrder eq '5' ? 'selected' : ''}>5</option>--%>
<%--                                                        <option value="6" ${list.introSortOrder eq '6' ? 'selected' : ''}>6</option>--%>
<%--                                                        <option value="7" ${list.introSortOrder eq '7' ? 'selected' : ''}>7</option>--%>
<%--                                                        <option value="8" ${list.introSortOrder eq '8' ? 'selected' : ''}>8</option>--%>
<%--                                                        <option value="9" ${list.introSortOrder eq '9' ? 'selected' : ''}>9</option>--%>
<%--                                                        <option value="10" ${list.introSortOrder eq '10' ? 'selected' : ''}>10</option>--%>
<%--                                                        <option value="11" ${list.introSortOrder eq '11' ? 'selected' : ''}>11</option>--%>
<%--                                                        <option value="12" ${list.introSortOrder eq '12' ? 'selected' : ''}>12</option>--%>
<%--                                                        <option value="13" ${list.introSortOrder eq '13' ? 'selected' : ''}>13</option>--%>
<%--                                                        <option value="14" ${list.introSortOrder eq '14' ? 'selected' : ''}>14</option>--%>
<%--                                                        <option value="15" ${list.introSortOrder eq '15' ? 'selected' : ''}>15</option>--%>
<%--                                                        <option value="16" ${list.introSortOrder eq '16' ? 'selected' : ''}>16</option>--%>
<%--                                                        <option value="17" ${list.introSortOrder eq '17' ? 'selected' : ''}>17</option>--%>
<%--                                                        <option value="18" ${list.introSortOrder eq '18' ? 'selected' : ''}>18</option>--%>
<%--                                                        <option value="19" ${list.introSortOrder eq '19' ? 'selected' : ''}>19</option>--%>
<%--                                                        <option value="20" ${list.introSortOrder eq '20' ? 'selected' : ''}>20</option>--%>
<%--                                                    </select>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
                                        </div>


                                        <div class="row mb-8">
                                            <div class="col-lg-8 row emptyUid">
                                                <div class="col-lg-2 d-flex justify-content-center align-items-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">언론보도</br>인트로 노출 여부</label>
                                                </div>
                                                <div class="col-lg-3 row">
                                                    <div class="col">
                                                        <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                            <input
                                                                    class="form-check-input"
                                                                    type="radio"
                                                                    name="isPressIntro"
                                                                    value="N" ${list.isPressIntro eq 'N' || empty list ? 'checked' : ''}
                                                                    autocomplete="off"
                                                                    id="isPressIntroN"
                                                                    onclick="showPressIntro()"
                                                            />
                                                            <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isPressIntroN">
                                                                N
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                            <input
                                                                    class="form-check-input"
                                                                    type="radio"
                                                                    name="isPressIntro"
                                                                    value="Y"
                                                            ${list.isPressIntro eq 'Y' ? 'checked' : ''}
                                                                    id="isPressIntroY"
                                                                    autocomplete="off"
                                                                    onclick="showPressIntro()"
                                                            />
                                                            <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isPressIntroY">
                                                                Y
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-7 d-flex justify-content-center align-items-center">
                                                    <label class="col-lg-12 form-label fw-bold text-gray-600 pt-3">
                                                        * 언론보도 노출여부 설정은 기본1개, 최대 5개까지 등록 가능합니다.
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-8">
                                            <div class="col-lg-12 row emptyUid">
                                                <div class="col-lg-1 d-flex justify-content-center align-items-center">

                                                </div>
                                                <div class="col-lg-11 row">
                                                    <div class="row mb-8" id="showIsMainPress" style="display: ${list.isPressIntro eq 'Y' ? '' : 'none'};">
                                                        <div class="col-lg-12">
                                                            <div class="col-lg-12 form-label text-dark fv-row flex-column">
                                                                <input
                                                                        autocomplete="off"
                                                                        placeholder="언론보도 소개 입력(최대 50자까지 입력가능)"
                                                                        type="text"
                                                                        name="pressMain"
                                                                        class="form-control"
                                                                        maxlength="50"
                                                                        id="pressMain"
                                                                        value="${list.pressMain}"
                                                                        oninput="validateInput(this)"
                                                                />
                                                                <div class="base-input__error"></div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row mb-8 pressLine" id="showIsPress1" style="display: ${list.isPressIntro eq 'Y' ? '' : 'none'};">
                                                        <hr>
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-1 d-flex justify-content-start align-items-center">
                                                                <label class="col-lg-10 form-label fw-bolder text-blue d-flex align-items-center justify-content-start pt-2">01.</label>
                                                            </div>
                                                            <div class="col-lg-9 row">
                                                                <c:if test="${not empty list.pressTitleList and fn:length(list.pressTitleList) > 0}">
                                                                    <c:set var="pressParts" value="${fn:split(list.pressTitleList[0], ':')}"/>
                                                                    <div class="col-lg-6 fv-row flex-column">
                                                                        <input
                                                                                autocomplete="off"
                                                                                type="text"
                                                                                placeholder="언론보도 상세 내용 입력(최대 50자까지 입력가능)"
                                                                                maxlength="50"
                                                                                class="form-control pressTitle"
                                                                                name="pressTitle"
                                                                                id="pressTitle1"
                                                                                value="${pressParts[0]}"
                                                                                oninput="validePressTitle()"
                                                                        />
                                                                        <div class="base-input__error"></div>
                                                                    </div>

                                                                    <div class="col-lg-6 fv-row flex-column">
                                                                        <input
                                                                                autocomplete="off"
                                                                                type="text"
                                                                                placeholder="URL 입력 (새창으로 연결)"
                                                                                maxlength="50"
                                                                                class="form-control pressTitleUrl"
                                                                                name="pressTitle"
                                                                                id="pressTitleUrl1"
                                                                                value="${pressParts[1]}"
                                                                                oninput="validePressTitle()"
                                                                        />
                                                                        <div class="base-input__error"></div>
                                                                    </div>

                                                                </c:if>
                                                                <c:if test="${empty list.pressTitleList}">
                                                                    <div class="col-lg-6 fv-row flex-column">
                                                                        <input
                                                                                autocomplete="off"
                                                                                type="text"
                                                                                placeholder="언론보도 상세 내용 입력(최대 50자까지 입력가능)"
                                                                                maxlength="50"
                                                                                name="pressTitle"
                                                                                class="form-control pressTitle"
                                                                                id="pressTitle1"
                                                                                oninput="validePressTitle()"
                                                                        />
                                                                        <div class="base-input__error"></div>
                                                                    </div>

                                                                    <div class="col-lg-6 fv-row flex-column">
                                                                        <input
                                                                                autocomplete="off"
                                                                                type="text"
                                                                                placeholder="URL 입력 (새창으로 연결)"
                                                                                maxlength="50"
                                                                                name="pressTitle"
                                                                                class="form-control pressTitleUrl"
                                                                                id="pressTitleUrl1"
                                                                                oninput="validePressTitle()"
                                                                        />
                                                                        <div class="base-input__error"></div>
                                                                    </div>
                                                                </c:if>
                                                            </div>
                                                            <div class="col-lg-2 d-flex justify-content-center align-items-center">
                                                                <button type="button" id="plusPressBtn" class="btn btn-dark" data-idx="1" onclick="plusPressLine(this)">추가 +</button>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div id="showPress" style="display: ${list.isPressIntro eq 'Y' ? '' : 'none'};">
                                                        <c:if test="${not empty list.pressTitleList}">
                                                            <c:forEach var="press" items="${list.pressTitleList}" varStatus="status">
                                                                <c:set var="pressParts" value="${fn:split(press, ':')}"/>
                                                                <c:if test="${status.index >= 1}">
                                                                    <div class="row mb-8 pressLine" id="showIsPress${status.index + 1}">

                                                                        <div class="col-lg-1 d-flex justify-content-start align-items-center">
                                                                            <label class="col-lg-10 form-label fw-bolder text-blue d-flex align-items-center justify-content-start pt-2">
                                                                                <fmt:formatNumber value="${status.index + 1}" pattern="00."/>
                                                                            </label>
                                                                        </div>
                                                                        <div class="col-lg-9 row">
                                                                            <div class="col-lg-6  fv-row flex-column">
                                                                                <input
                                                                                        autocomplete="off"
                                                                                        type="text"
                                                                                        placeholder="언론보도 상세 내용 입력(최대 50자까지 입력가능)"
                                                                                        maxlength="50"
                                                                                        name="pressTitle"
                                                                                        class="form-control pressTitle"
                                                                                        id="pressTitle${status.index + 1}"
                                                                                        value="${pressParts[0]}"
                                                                                        oninput="validePressTitle()"
                                                                                />
                                                                                <div class="base-input__error"></div>
                                                                            </div>
                                                                            <div class="col-lg-6  fv-row flex-column">
                                                                                <input
                                                                                        autocomplete="off"
                                                                                        type="text"
                                                                                        placeholder="URL 입력 (새창으로 연결)"
                                                                                        maxlength="50"
                                                                                        name="pressTitle"
                                                                                        class="form-control pressTitleUrl"
                                                                                        id="pressTitle${status.index + 1}"
                                                                                        value="${pressParts[1]}"
                                                                                        oninput="validePressTitle()"
                                                                                />
                                                                                <div class="base-input__error"></div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-2 d-flex justify-content-center align-items-center">
                                                                            <button type="button" data-idx="${status.index + 1}" class="btn btn-secondary" onclick="deletePressLine(this)">삭제 -</button>
                                                                        </div>

                                                                    </div>
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:if>
                                                    </div>

                                                </div>

                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </div>



                            <div class="card mb-5 mb-xl-10">
                                <div id="option">
                                    <div class="card-body">
                                        <div class="row mb-8">
                                            <div class="col-lg-6 row">
                                                <div class="col-lg-2 d-flex justify-content-center align-items-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">최초 작성자</label>
                                                </div>
                                                <div class="col-lg-10 row d-flex align-items-center">
                                                    <c:if test="${empty param.uid}">
                                                        <c:out value="${admin.adminName}(${admin.department})" />
                                                    </c:if>
                                                    <c:if test="${not empty param.uid}">
                                                        <c:out value="${list.firstAdminName}(${list.firstAdminDepartment})"/>
                                                    </c:if>

                                                </div>

                                            </div>
                                            <div class="col-lg-6 row">
                                                <div class="col-lg-2 d-flex justify-content-center align-items-center ">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">작성일시</label>
                                                </div>
                                                <div class="col-lg-10 d-flex align-items-center">
                                                    <c:out value="${list.regDate}"/>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row mb-8">
                                            <div class="col-lg-6 row">
                                                <div class="col-lg-2 d-flex justify-content-center align-items-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">수정자</label>
                                                </div>
                                                <div class="col-lg-10 row d-flex align-items-center">
                                                    <c:if test="${not empty list.adminName}">
                                                        <c:out value="${list.adminName}(${list.adminDepartment})" />
                                                    </c:if>

                                                </div>

                                            </div>
                                            <div class="col-lg-6 row">
                                                <div class="col-lg-2 d-flex justify-content-center align-items-center ">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">수정일시</label>
                                                </div>
                                                <div class="col-lg-10 d-flex align-items-center">
                                                    <c:out value="${list.modDate}" />
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="card-footer" id="footerIdx">
                                        <div class="row" id="saveButton">
                                            <c:if test="${empty param.uid}">
                                                <div class="col-lg-12 d-flex justify-content-end">
                                                    <button type="button" class="btn btn-light-warning me-2" style="background-color: #fff3cd; color: #181C32" onclick="history.back()">
                                                        취소
                                                    </button>
                                                    <button
                                                            type="button"
                                                            class="btn btn-warning"
                                                            style="background-color: #ffcd39; color: #181C32"
                                                            onclick="save(this)"
                                                    >
                                                        저장
                                                    </button>
                                                </div>
                                            </c:if>
                                            <c:if test="${not empty param.uid}">
                                                <div class="col-12 d-flex justify-content-end">
                                                    <a type="button" id="cancelBtn" data-isAwards="${list.isAwards}" class="btn btn-light-warning me-2" style="background-color: #fff3cd; color: #181C32" href="/book-trigger/book-trigger/${list.uid}">
                                                        취소
                                                    </a>
                                                    <button
                                                            data-uid="${list.uid}"
                                                            data-idx="${list.idx}"
                                                            type="button"
                                                            class="btn btn-warning"
                                                            style="background-color: #ffcd39; color: #181C32"
                                                            onclick="update(this)"
                                                    >
                                                        저장
                                                    </button>
                                                </div>
                                            </c:if>
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

<div id="loadingBar" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5); z-index: 1000;">
    <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
        <div class="loader"></div>
        <p style="color: white; text-align: center;">저장중...</p>
    </div>
</div>


</body>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
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
        fields: {
            bookName: {
                validators: {
                    notEmpty: {
                        message: '* 도서명를 입력해주세요.'
                    }
                }
            },

            target: {
                validators: {
                    callback: {
                        message: '* 대상을 선택해주세요.',
                        callback: function(value) {
                            const target = document.getElementById('target').value;
                            console.log('Target:', value,'======', target);  // Debugging line
                            return target.trim() !== '';
                        }
                    }
                }
            },

            field: {
                validators: {
                    notEmpty: {
                        message: '* 분야를 선택해주세요.'
                    }
                }
            },

            authorWriting: {
                validators: {
                    callback: {
                        message: '* 저자를 입력해주세요.',
                        callback: function(value, validator, $field) {
                            const authorWriting = document.getElementById('authorWriting').value;
                            const authorPicture = document.getElementById('authorPicture').value;
                            const authorTranslation = document.getElementById('authorTranslation').value;
                            return authorWriting.trim() !== '' || authorPicture.trim() !== '' || authorTranslation.trim() !== '';
                        }
                    }
                }
            },
            totalPage: {
                validators: {
                    callback: {
                        message: '* 도서형태를 입력해주세요.',
                        callback: function(value, validator, $field) {
                            const totalPage = document.getElementById('totalPage').value;
                            const width = document.getElementById('width').value;
                            const height = document.getElementById('height').value;
                            return totalPage.trim() !== '' || width.trim() !== '' || height.trim() !== '';
                        }
                    }
                }
            },
            publicationDate: {
                validators: {
                    notEmpty: {
                        message: '* 발행일을 선택해주세요.'
                    }
                }
            },
            previewUrl: {
                validators: {
                    callback: {
                        message: '* 미리보기 URL을 등록해주세요.',
                        callback: function(value, validator, $field) {
                            const previewType = document.querySelector('input[name="preview"]:checked').value;
                            console.log('Preview Type:', previewType);  // Debugging line
                            const previewUrl = document.getElementById('previewUrl').value;
                            console.log('Preview URL:', previewUrl);  // Debugging line
                            if (previewType === 'URL') {
                                console.log('URL validation condition met');  // Debugging line
                                return previewUrl.trim() !== '';
                            }
                            return true;
                        }
                    }
                }
            },
            price: {
                validators: {
                    notEmpty: {
                        message: '* 금액을 입력해주세요.'
                    }
                }
            },
            tag: {
                validators: {
                    callback: {
                        message: '* 태그를 등록해주세요.',
                        callback: function(value) {
                            if (isSubmitCheck) {
                                const tag = document.querySelectorAll('.tags');
                                if (tag.length === 0) return false;
                            } else {
                                return true;
                            }

                        }
                    }
                }
            },

            isbn: {
                validators: {
                    notEmpty: {
                        message: '* ISBN을 입력해주세요.'
                    }
                }
            },
            contents: {
                validators: {
                    notEmpty: {
                        message: '* 소개를 입력해주세요.',
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
                    if (document.bookTriggerForm.querySelector('[name="' + field + '"]') === null) {
                        return true;
                    }
                },
            }),
        }
    }


    let isSubmitCheck = false;
    function formSelect2() {
        if (isSubmitCheck) {
            const selectIds = ['target', 'field'];
            selectIds.forEach(function(selectId) {
                const selectElement = document.getElementById(selectId);
                const res = getSelectedValues(selectElement);
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
            });
        }

    }

    function checkTagValidation() {
        if (isSubmitCheck) {
            const tag = document.querySelectorAll('.tags').length;
            if (tag === 0) {
                document.getElementById('tagForm').querySelectorAll('.fv-plugins-message-container.fv-plugins-message-container--enabled.invalid-feedback').forEach(function (el) {
                    el.style.display = 'block';
                });
                document.getElementById('tag').classList.add('is-invalid');
                return false;
            } else {
                document.getElementById('tagForm').querySelectorAll('.fv-plugins-message-container.fv-plugins-message-container--enabled.invalid-feedback').forEach(function (el) {
                    el.style.display = 'none';
                });
                document.getElementById('tag').classList.remove('is-invalid');
                return true;

            }
        }
    }





    function initFormValidation(isValidate) {
        if (formValidation !== null) formValidation.destroy();


        // validation 설정
        // console.log(document.bookTriggerForm)
        // console.log(formValidationOption)
        formValidation = FormValidation.formValidation(document.bookTriggerForm, formValidationOption);

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
                if (el.id === 'introduction') {
                    invalidFields.push(document.querySelector('.errorValid'));
                } else {
                    invalidFields.push(el);
                }
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

                if (el.id === 'introduction') {
                    invalidFields = invalidFields.filter(field => field !== document.querySelector('.errorValid'));
                } else {
                    invalidFields = invalidFields.filter(field => field.name !== name);
                }
            } catch(e) {
                console.log('Cannot find element: ' + name);
            }
        });


        formValidation.on('core.validator.validated', function(e) {
            if (!e.result.valid) {
                if (e.field === 'authorWriting') {
                    document.getElementById('authorGroup').querySelectorAll('.fv-plugins-message-container.fv-plugins-message-container--enabled.invalid-feedback').forEach(function (el) {
                        el.style.display = 'block';
                    });
                }
                if (e.field === 'totalPage') {
                    document.getElementById('bookStatus').querySelectorAll('.fv-plugins-message-container.fv-plugins-message-container--enabled.invalid-feedback').forEach(function (el) {
                        el.style.display = 'block';
                    });
                }
                // if (e.field === 'onlineBookStoreInput') {
                //     validateAllInputs();
                // }

            } else {
                if (e.field === 'authorWriting') {
                    document.getElementById('authorGroup').querySelectorAll('.fv-plugins-message-container.fv-plugins-message-container--enabled.invalid-feedback').forEach(function (el) {
                        el.style.display = 'none';
                    });

                }
                if (e.field === 'totalPage') {
                    document.getElementById('bookStatus').querySelectorAll('.fv-plugins-message-container.fv-plugins-message-container--enabled.invalid-feedback').forEach(function (el) {
                        el.style.display = 'none';
                    });
                }
                // if (e.field === 'onlineBookStoreInput') {
                //     validateAllInputs();
                // }

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



    /***************************************************** INIT ***************************************/

    let ntdrop = [];

    window.onload = function() {

        ntdrop[0] = global.genDropzone('#dz0',
            {
                params: {
                    'ParentTable' : 'BOOK_TRIGGER',
                    'ParentType' : 'THUMBNAIL',
                    'ParentUid' : uid,
                    'description' : '북트리거 섬네일'
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

        ntdrop[1] = global.genDropzone("#dz1",
            {
                params: {
                    'ParentTable' : 'BOOK_TRIGGER',
                    'ParentType' : 'PDF',
                    'ParentUid' : uid,
                    'description' : '미리보기 - PDF 등록'
                },
                hasOrder: false,
                isSecure: 'N',
                previewCheck : 'Y',
                maxFileCount: 2,
                acceptedExt: ['.pdf'],
                dropzoneIdx : 'dz1',
                maxFileSize : 300,
                containerId: 'dz1Container',
                dropzoneIndex : 1,
                messages : {
                    empty : '* 미리보기 pdf 파일을 등록해주세요.',
                    accept: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.',
                    count: '',
                    size: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.'
                }
            });


    };

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
        height: 300,
        requestHeaders: {
            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        },
        events: {
            'contentChanged': function () {
                formValidation.revalidateField('contents');
            }
        }
    });
    let itemCnt = 1;
    document.addEventListener('DOMContentLoaded', function() {

        const targetNode = document.querySelectorAll('.form-select.unselect-form');
        targetNode.forEach((node) => {
            node.style.backgroundColor = '#ffffff';
            node.style.backgroundClip = 'padding-box';
            node.style.border = '1px solid #E4E6EF';
        });

        // 태그 input 창에 엔터 누를시 plusTag() 실행
        let input = document.getElementById('tag');
        input.addEventListener('keypress', function(event) {
            var regex = /[0-9`!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?~]/;

            if (event.key === 'Enter') {
                event.preventDefault();
                document.getElementById('plusTagBtn').click();
                // checkTagValidation();
            }

            if (regex.test(event.key)) {
                event.preventDefault();
            }
        });



        // 온라인 서점 input 창에 엔터 누를시 추가 func 실행
        const inputFields = document.querySelectorAll('.onlineInput');
        inputFields.forEach(inputField => {
            inputField.addEventListener('keypress', function(event) {
                if (event.key === 'Enter') {
                    event.preventDefault();
                    plusOnlineStore();
                }
            });
        });

        // 수상 및 선정 사례 input 창에 엔터 누를시 추가 func 실행
        const awardFields = document.querySelectorAll('.awards');
        awardFields.forEach(awardField => {
            awardField.addEventListener('keypress', function(event) {
                if (event.key === 'Enter') {
                    event.preventDefault();
                    plusAwardLine();
                }
            });
        });

        // 언론보도 인트로 노출 여부 input 창에 엔터 누를시 추가 func 실행
        const pressFields = document.querySelectorAll('.pressTitle');
        pressFields.forEach(pressField => {
            pressField.addEventListener('keypress', function(event) {
                if (event.key === 'Enter') {
                    event.preventDefault();
                    plusPressLine();
                }
            });
        });

        const uid = '${list.uid}';
        let onlineStore = '';
        let award = '';
        let press = '';
        let tagSize = '';
        let seriesSize = '';

        if (seriesSize !== '' || seriesSize !== null) {
            if (`${list.seriesBookList.size()}` > 0) {
                seriesSize = `${list.seriesBookList.size()}`;
                seriesCnt = parseInt(seriesSize);
            }
        }

        // 시리즈 코드 3개 이하 일 시에 disabled 처리
        if (seriesSize <= 3) {
            document.querySelectorAll('[id^=isSeriesLine]').forEach(function(element) {
                element.querySelector('.text-center.button').querySelector('.btn.btn-secondary.seriesBtn').setAttribute('disabled', 'disabled');
            });
        }

        document.querySelectorAll('[id^=isSeriesLine]').forEach(function(element) {
            seriesBookList.push({
                index: element.getAttribute('data-index'),
                uid : element.getAttribute('data-uid'),
                bookName: element.getAttribute('data-book-name')
            });
        });


        if (onlineStore !== '' || onlineStore !== null) {
            if (`${list.onlineStoreDataList.size()}` > 0) {
                onlineStore = `${list.onlineStoreDataList.size()}`;
                itemCnt = parseInt(onlineStore);
                console.log(itemCnt)
            }
        }

        console.log(itemCnt)

        if (award !== '' || award !== null) {
            if (`${list.awardList.size()}` > 0) {
                award = '${list.awardList.size()}';
                awardCnt = parseInt(award);
            }
        }

        if (press !== '' || press !== null) {
            if (`${list.pressTitleList.size()}` > 0) {
                press = '${list.pressTitleList.size()}';
                pressCnt = parseInt(press);
            }
        }

        if (tagSize !== '' || tagSize !== null) {
            if (`${list.tagList.size()}` > 0) {
                tagSize = '${list.tagList.size()}';
                tagCnt = parseInt(tagSize);
            }
        }

        const bookStatus = document.getElementsByName('totalPage');
        bookStatus.forEach(bookStatus => {
            bookStatus.addEventListener('input', function() {
                if (bookStatus.value.length > 10) {
                    bookStatus.value = bookStatus.value.slice(0, 10);
                }
                this.value = this.value.replace(/[^0-9]/g, '');
            });
        })

        const price = document.getElementById('price');
        price.addEventListener('input', function() {
            let value = this.value;

            value = value.replace(/,/g, '');

            let number = parseInt(value, 10);
            if (isNaN(number)) {
                this.value = '';
            } else {
                let strNumber = number.toString();
                if (strNumber.length > 10) {
                    strNumber = strNumber.slice(0, 10);
                    number = parseInt(strNumber, 10);
                }
                this.value = number.toLocaleString('en-US');
            }
        });
        const select2Readonly = document.querySelectorAll('.select2-search__field');
        select2Readonly.forEach(select2Readonly => {
            select2Readonly.setAttribute('readonly', 'readonly');
        });

        let pressMain = document.getElementById('pressMain');

        pressMain.addEventListener('keypress', function(event) {

            const allowedChars = /^[a-zA-Z가-힣\s]$/;

            if (!allowedChars.test(event.key)) {
                event.preventDefault();
            }
        });



        console.log(itemCnt);
        console.log(onlineStore);
        console.log(uid);
        const publicationDateInput = document.getElementById('publicationDate');
        const selectElement = document.getElementById('introOrder');



        startFlatpickr = flatpickr(publicationDateInput, {
            dateFormat: 'Y-m-d',
            locale: 'ko',
        });

        let isComposing = false;
        document.querySelectorAll('.isbn').forEach(function(element) {
            element.addEventListener('keydown', function(e) {
                if ((e.key >= 'ㄱ' && e.key <= 'ㅎ') || (e.key >= 'ㅏ' && e.key <= 'ㅣ') || (e.key >= '가' && e.key <= '힣')) {
                    e.preventDefault();
                }
            });

            element.addEventListener('input', function(e) {
                if (!isComposing) {
                    this.value = this.value.replace(/[ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
                }
            });

            element.addEventListener('compositionstart', function(e) {
                isComposing = true;
            });

            element.addEventListener('compositionend', function(e) {
                isComposing = false;
                this.value = this.value.replace(/[ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
                e.preventDefault();
            });

            element.addEventListener('blur', function(e) {
                this.value = this.value.replace(/[ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
            });

            element.addEventListener('keyup', function(e) {
                this.value = this.value.replace(/[ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
            });
        });
    });




    /**************************************************** UTILS ***************************************/

    window.onbeforeunload = function() {
        if (isModified) {
            return "변경 사항을 저장하지 않았습니다. 정말 지금 나가시겠습니까?";
        }
    };

    function windowUpScroll() {
        window.scrollTo({
            top: 0,
            left: 0,
            behavior: 'smooth'
        });
    }

    function formatPrice(element) {

    }


    function changeIntroRadio(element) {
        const isOpen = element.value;
        const intro = document.querySelectorAll('.isIntro');
        const isIntroY = document.querySelector('input[name="isIntro"][value="N"]');
        if (isIntroY) {
            isIntroY.checked = true;
        }
        const introOrder = document.getElementById('introOrder');
        introOrder.disabled = true;
        console.log(intro)

    }



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

    function getSelectedValues(selectElement) {
        let values = [];
        for (let i = 0; i < selectElement.options.length; i++) {
            let option = selectElement.options[i];
            if (option.selected) {
                values.push(option.value);
            }
        }
        return values;
    }

    function getAllTagsText() {
        const tags = document.querySelectorAll('.tags');
        const tagList = Array.from(tags)
            .map(tag => tag.textContent.trim())
            .filter(value => value !== '');

        return tagList;
    }



    function getAllOnlineStores() {
        const stores = [];
        const rows = document.querySelectorAll('.row[id^="onlineStoreLine"]');

        rows.forEach(row => {
            const select = row.querySelector('select');
            const input = row.querySelector('input[type="text"]');

            if (select.value.trim() !== '' && input.value.trim() !== '') {
                const store = {
                    storeName: select.value,
                    storeUrl: input.value
                };

                stores.push(store);
            }
        });

        return stores;
    }

    function getAllAward() {
        const awards = document.querySelectorAll('.awards');
        const awardList = Array.from(awards)
            .map(award => award.value.trim())
            .filter(value => value !== '');

        return awardList;
    }


    function getAllPressIntroTitle() {
        const pressMain = document.querySelectorAll('.pressTitle');

        const pressMainList = Array.from(pressMain)
            .map(pressMain => pressMain.value.trim())
            .filter(value => value !== '');

        return pressMainList;
    }

    function getAllPressIntroTitlesAndUrls() {
        // .pressTitle과 .pressTitleUrl을 모두 가져옴
        const titles = document.querySelectorAll('.pressTitle');
        const urls = document.querySelectorAll('.pressTitleUrl');

        // 한 쌍으로 처리 (값이 없을 때는 빈 문자열로 대체)
        const pressPairs = Array.from(titles).map((title, index) => {
            const url = urls[index] ? urls[index].value.trim() : ''; // URL이 없으면 빈 문자열
            const titleValue = title.value.trim(); // 제목이 없으면 빈 문자열
            return {
                title: titleValue !== '' ? titleValue : null, // 값이 없으면 null로 처리
                url: url !== '' ? url : null, // 값이 없으면 null로 처리
            };
        });

        // 빈 값의 쌍 (null, null)인 경우 필터링하여 제외
        return pressPairs.filter(pair => pair.title !== null || pair.url !== null);
    }


    function getRandomAlphanumeric(length) {
        const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        let result = '';
        for (let i = 0; i < length; i++) {
            result += characters.charAt(Math.floor(Math.random() * characters.length));
        }
        return result;
    }


    function updateCharCount() {
        const input = document.getElementById('tag');
        const charCount = document.getElementById('charCount');
        const regex = /^[a-zA-Z가-힣]*$/;


        // if (!regex.test(input.value)) {
        //     input.value = input.value.replace(/[^a-zA-Z가-힣]/g, '');
        // }

        console.log(input.value.length)


        checkTagValidation();
        charCount.textContent = input.value.length + '/10';
    }

    /***************************************************** GET ***************************************/
    async function showAwards() {

        const isAwards = document.querySelector('input[name="isAwards"]:checked').value;
        if (isAwards === 'Y') {
            document.querySelectorAll('.awardLine').forEach(element => {
                element.style.display = 'block';
            });
        } else {
            document.querySelectorAll('.awardLine').forEach(element => {
                element.style.display = 'none';
            });
        }

    }

    async function showIsSeries() {
        const isSeries = document.querySelector('input[name="isSeries"]:checked').value;

        if (isSeries === 'Y') {
            document.getElementById('seriesBtn').style.display = 'block';
            document.getElementById('seriesMsg').style.display = 'block';
            document.getElementById('seriesLineDiv').style.display = 'block';
        } else {
            document.getElementById('seriesBtn').style.display = 'none';
            document.getElementById('seriesMsg').style.display = 'none';
            document.getElementById('seriesLineDiv').style.display = 'none';
        }
    }

    function handleIntroChange() {
        showIntro();
        // validateIsIntro();
        return false;
    }

    async function showIntro() {
        const isOpen = document.querySelector('input[name="isUse"]:checked').value;
        console.log(isOpen)
        if (isOpen === 'N') {
            Swal.fire({
                icon: 'info',
                title: '알림',
                text: '노출여부를 Y로 변경하시면 인트로 노출여부를 설정하실 수 있습니다.',
                confirmButtonText: '확인'
            }).then((result) => {
                if (result.isConfirmed) {
                    document.querySelectorAll('input[name="isIntro"]')[0].checked = true;
                } else {
                    document.querySelectorAll('input[name="isIntro"]')[0].checked = true;
                }

            }).then(() => {
                const focusIsOpen = document.querySelector('.focusIsOpen');
                console.log(focusIsOpen);
                focusAndScroll(focusIsOpen);
            });
        } else {
            // const intro = document.querySelector('input[name="isIntro"]:checked').value;
            // const introOrder = document.getElementById('introOrder');
            // if (intro === 'Y') {
            //     introOrder.disabled = false;
            // } else {
            //     introOrder.disabled = true;
            // }
        }
    }

    async function showPressIntro() {
        const isOpen = document.querySelector('input[name="isUse"]:checked').value;
        if (isOpen === 'N') {
            Swal.fire({
                icon: 'info',
                title: '알림',
                text: '노출여부를  Y로 변경하시면 언론보도 인트로 노출여부를 설정하실 수 있습니다.',
                confirmButtonText: '확인'
            }).then((result) => {
                if (result.isConfirmed) {
                    document.querySelectorAll('input[name="isPressIntro"]')[0].checked = true;
                } else {
                    document.querySelectorAll('input[name="isPressIntro"]')[0].checked = true;
                }
            }).then(() => {
                const focusIsOpen = document.querySelector('.focusIsOpen');
                console.log(focusIsOpen);
                focusAndScroll(focusIsOpen);
            });
        } else {
            const pressIntro = document.querySelector('input[name="isPressIntro"]:checked').value;
            if (pressIntro === 'Y') {
                const pressLines = document.querySelectorAll('.pressLine')
                console.log(pressLines)
                if (pressLines.length >= 2) {
                    document.getElementById('showIsMainPress').style.display = 'block';
                    document.querySelectorAll('.pressLine').forEach(element => {
                        element.style.display = 'flex';
                    });
                    document.getElementById('showPress').style.display = 'block';
                } else {
                    document.getElementById('showIsMainPress').style.display = 'block';
                    document.querySelectorAll('.pressLine').forEach(element => {
                        element.style.display = 'flex';
                    });
                }
            } else {
                const pressLines = document.querySelectorAll('.pressLine')
                if (pressLines.length >= 2) {
                    document.getElementById('showIsMainPress').style.display = 'none';
                    document.getElementById('showPress').style.display = 'none';
                    document.querySelectorAll('.pressLine').forEach(element => {
                        element.style.display = 'none';
                    });
                } else {
                    document.getElementById('showIsMainPress').style.display = 'none';
                    document.querySelectorAll('.pressLine').forEach(element => {
                        element.style.display = 'none';
                    });
                }
            }
        }

    }

    let intervalId = null;

    function errorValidation() {
        $('.contents').on('froalaEditor.keydown', function (e, editor, keydownEvent) {
            if (editor.html.get() !== '') {
                document.querySelector('.form-control.form-control-solid.contents').nextElementSibling.style.display = 'none';
            } else {
                document.querySelector('.form-control.form-control-solid.contents').nextElementSibling.style.display = 'block';
            }
        });

        $('.contents').on('froalaEditor.image.uploaded', function (e, editor, keydownEvent) {
            if (editor.html.get() !== '') {
                document.querySelector('.form-control.form-control-solid.contents').nextElementSibling.style.display = 'none';
            } else {
                document.querySelector('.form-control.form-control-solid.contents').nextElementSibling.style.display = 'block';
            }
        });

        $('.contents').on('froalaEditor.paste.after', function (e, editor, clipboardPasteEvent) {
            if (editor.html.get() !== '') {
                document.querySelector('.form-control.form-control-solid.contents').nextElementSibling.style.display = 'none';
            } else {
                document.querySelector('.form-control.form-control-solid.contents').nextElementSibling.style.display = 'block';
            }
        });

        const isValid = [
            validPressMain(),
            validateOnlineStore(),
            validePressTitle(),
            validateAwardInput()
        ].every(validation => validation);

        return isValid;
    }

    function validateInputs(className, isChecked, errorMsg, checkCondition) {
        if (isSubmitCheck && isChecked === 'Y') {
            let isValid = true;
            const elements = document.querySelectorAll(className);
            console.log('Validating inputs:', elements);
            elements.forEach(element => {
                let errorDiv = element.nextElementSibling;
                if (!element.value.trim()) {
                    element.classList.add('input-error');
                    errorDiv.classList.add('show-error');
                    errorDiv.textContent = errorMsg;
                    isValid = false;
                } else {
                    element.classList.remove('input-error');
                    errorDiv.classList.remove('show-error');
                }
            });
            console.log('Validation result for', className, '===', isValid);
            return isValid;
        }
        return true;
    }

    function validateAll() {
        const isPressIntro = document.querySelector('input[name="isPressIntro"]:checked').value;
        const isAwards = document.querySelector('input[name="isAwards"]:checked').value;

        const pressValid = validateInputs(
            '.pressTitle',
            isPressIntro,
            '* 언론보도 상세내용을 입력해주세요.',
            isSubmitCheck && isPressIntro === 'Y'
        );

        const awardValid = validateInputs(
            '.awards',
            isAwards,
            '* 수상 및 선정 사례를 입력해주세요.',
            isSubmitCheck && isAwards === 'Y'
        );

        return pressValid && awardValid;
    }


    function validPressMain() {

        const isPressIntro = document.querySelector('input[name="isPressIntro"]:checked').value;

        if (isSubmitCheck && isPressIntro === 'Y') {
            let checkBool = true;
            const pressTitles = document.querySelectorAll('[name="pressMain"]');
            console.log('-----press----',pressTitles)
            pressTitles.forEach(pressTitle => {
                let errorDiv = pressTitle.nextElementSibling;
                if (!pressTitle.value.trim()) {
                    pressTitle.classList.add('input-error');
                    errorDiv.classList.add('show-error');
                    errorDiv.textContent = '* 언론보도 소개를 입력해주세요.';
                    invalidFields.push(pressTitle);
                    checkBool = false;
                } else {
                    pressTitle.classList.remove('input-error');
                    errorDiv.classList.remove('show-error');
                    invalidFields.filter(field => field !== pressTitle);
                }
            });
            console.log('pressMain ===================', checkBool)
            return checkBool;
        }
        return true;
    }

    function validePressTitle() {
        const isPressIntro = document.querySelector('input[name="isPressIntro"]:checked').value;
        if (isSubmitCheck && isPressIntro === 'Y') {
            let checkBool = true;
            const pressTitles = document.querySelectorAll('.pressTitle');
            console.log('-----press----',pressTitles)
            pressTitles.forEach(pressTitle => {
                let errorDiv = pressTitle.nextElementSibling;
                if (!pressTitle.value.trim()) {
                    pressTitle.classList.add('input-error');
                    errorDiv.classList.add('show-error');
                    errorDiv.textContent = '* 언론보도 상세내용을 입력해주세요.';
                    invalidFields.push(pressTitle);
                    checkBool = false;
                } else {
                    pressTitle.classList.remove('input-error');
                    errorDiv.classList.remove('show-error');
                    invalidFields.filter(field => field !== pressTitle);
                }
            });
            console.log('pressTitleMain ===================', checkBool)
            return checkBool;
        }
        return true;
    }

    function validateAwardInput() {
        console.log('hihihihih2222')
        const isAwards = document.querySelector('input[name="isAwards"]:checked').value;
        let checkBool = true;
        if (isSubmitCheck && isAwards === 'Y') {

            const awards = document.querySelectorAll('.awards');
            console.log('---------------------award------------', awards)
            awards.forEach(award => {
                let errorDiv = award.nextElementSibling;
                if (!award.value.trim()) {
                    award.classList.add('input-error');
                    errorDiv.classList.add('show-error');
                    errorDiv.textContent = '* 수상 및 선정 사례를 입력해주세요.';
                    invalidFields.push(award);
                    checkBool = false;
                } else {
                    award.classList.remove('input-error');
                    errorDiv.classList.remove('show-error');
                    invalidFields.filter(field => field !== award);
                }
            });

            console.log('award ===================', checkBool)
            return checkBool;
        }
        return checkBool;
    }


    function validateOnlineStore() {
        if (isSubmitCheck) {
            const onlineStores = document.querySelectorAll('[name="onlineBookStore"]');
            let selectValue = '';
            let inputValue = '';
            let checkBool = true;

            onlineStores.forEach(store => {

                let errorDiv;
                let errorSelect2;

                if (store.tagName === 'SELECT') {
                    errorDiv = store.parentNode.querySelector('.select2-container').nextElementSibling;
                    errorSelect2 = store.parentNode.querySelector('.select2-selection.select2-selection--single');
                    selectValue = store.value;
                } else {
                    errorDiv = store.nextElementSibling;
                    inputValue = store.value;
                }

                if (store.tagName === 'SELECT' && !store.value) {
                    errorDiv.classList.add('show-error');
                    errorSelect2.style.borderColor = '#e74c3c';
                    errorDiv.textContent = '* 온라인 서점을 선택 및 입력해주세요.';
                    invalidFields.push(store);
                    checkBool = false;
                } else if (store.tagName === 'INPUT' && !store.value.trim()) {
                    errorDiv.classList.add('show-error');
                    store.classList.add('input-error');
                    if (selectValue.trim() !== '') {
                        errorDiv.textContent = '* 온라인 서점을 선택 및 입력해주세요.';
                    }
                    invalidFields.push(store);
                    checkBool = false;
                } else {
                    store.classList.remove('input-error');
                    console.log('errorDiv ===',errorDiv)
                    errorDiv.classList.remove('show-error');
                    if (store.tagName === 'SELECT') {
                        errorSelect2.style.borderColor = '';
                    }
                    invalidFields.filter(field => field !== store);
                    errorDiv.textContent = '';

                }
            });

            return checkBool;
        }
    }


    function validateIsIntro() {
        const value = document.querySelector('input[name="isIntro"]:checked');
        const isOpen = document.querySelector('input[name="isUse"]:checked');
        if (value.value === 'Y' && isOpen.value === 'Y' && introNum >= 20) {
            showError('showIsIntroN', 'showIsIntroNError', '* 이미 인트로에는 20개 모두 등록되어있습니다. 등록되어 있는 인트로 도서 "N"값으로 수정 후 재등록 해주세요.');
            invalidFields.push(value);
            return false;
        }
        clearError('showIsIntroN');
        return true;
    }

    // 에러 메시지 표시 함수
    function showError(inputId, errorId, message) {

        const input = document.getElementById(inputId);
        const error = document.getElementById(errorId);


        if (input) {
            input.classList.add('input-error');
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
        const error = document.getElementById(errorId);

        if (input) {
            input.classList.remove('input-error');
        }
        if (error) {
            error.classList.remove('show-error');
        }
    }

    function validateInput(inputElement) {
        const invalidChars = /[0-9`!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?~]/;
        if (inputElement.value.match(invalidChars)) {
            inputElement.value = inputElement.value.replace(invalidChars, '');
        }

        validPressMain();
    }

    function focusAndScroll(element) {
        setTimeout(() => {
            element.focus();
            element.scrollIntoView({ behavior: 'smooth', block: 'center' });
        }, 500);
    }

    /********************************************************************** POST ************************************************/
    let isSubmitting = false;
    let subCheck = false;
    let subCheck2 = false;

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

    let introNum = '';
    async function save(element) {
        if (isSubmitting) {
            return;
        }
        invalidFields = [];
        document.getElementById('loadingBar').style.display = 'block';
        isSubmitCheck = true;
        isSubmitting = true;
        subCheck = true;
        subCheck2 = true;

        // 인트로 노출 여부 노출 여부 숫자 체크

        // try {
        //     const response = await fetch('/api/v1/book-trigger-registration/intro/BOOK-TRIGGER' , {
        //         method: 'GET',
        //         headers: {
        //             'Content-Type': 'application/json',
        //         }
        //     });
        //
        //     const result = await response.json();
        //     if (result.result === true) {
        //         introNum = result.data;
        //         console.log('introNum:', introNum);
        //     }
        // } catch (e) {
        //     console.error(e);
        // }

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

        if (!isValid || status === 'Invalid'|| (introNum >= 20 && value === 'Y') || !isFile) {
            document.getElementById('loadingBar').style.display = 'none';
            // validateIsIntro();
            if (invalidFields.length > 0) {
                const firstInvalidField = invalidFields.reduce((highest, field) => field.getBoundingClientRect().top < highest.getBoundingClientRect().top ? field : highest);
                focusAndScroll(firstInvalidField);
            }
            isSubmitting = false;
            return;
        }

        // 인트로 노출 여부 노출 등록시 도서 체크
        const isIntro = document.querySelector('input[name="isIntro"]:checked').value;
        let introSortOrder = '';
        let introResult = '';
        if (isIntro === 'Y') {
            // introSortOrder = document.getElementById('introOrder').value;
            // try {
            //     const response = await fetch('/api/v1/book-trigger-registration/intro-order/BOOK-TRIGGER?sortOrder=' + introSortOrder, {
            //         method: 'GET',
            //         headers: {
            //             'Content-Type': 'application/json',
            //         }
            //     });
            //
            //     const result = await response.json();
            //
            //     if (result.result === true) {
            //         introResult = result.data;
            //     }
            //
            // } catch (e) {
            //     console.error(e);
            // }


            if (introResult === 'true') {
                Swal.fire({
                    icon: 'info',
                    title: '알림',
                    text: '해당 노출순서에 등록된 도서가 있습니다. 해당 도서로 변경 하시겠습니까?',
                    showDenyButton: true,
                    denyButtonText: '취소',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        Swal.fire({
                            icon: 'success',
                            title: '알림',
                            text: '해당 도서로 변경되었습니다.',
                            confirmButtonText: '확인'
                        }).then((result) => {
                            isPressCheckStep();
                        })
                    } else if (result.isDenied) {
                        document.getElementById('loadingBar').style.display = 'none';
                        isSubmitting = false;
                        return;
                    }
                });
            } else {
                isPressCheckStep();
            }
        } else {
            isPressCheckStep();
        }


        isSubmitting = false;
    }

    async function isPressCheckStep(element) {
        // 언론보도 인트로 노출 여부 노출 여부 숫자 체크
        const isPressIntro = document.querySelector('input[name="isPressIntro"]:checked').value;
        let pressIntroNum = '';
        let uid = '';
        if (element) {
            uid = element.getAttribute('data-uid');
        }
        try {
            const response = await fetch ('/api/v1/book-trigger-registration/press-intro/BOOK-TRIGGER?uid=' + uid, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                }
            });

            const result = await response.json();
            if (result.result === true) {
                pressIntroNum = result.data;
                console.log('pressIntroNum', pressIntroNum)
            }

        } catch (e) {
            console.error(e);
        }
        if (isPressIntro === 'N') {
            if (pressIntroNum < 1) {
                Swal.fire({
                    icon: 'info',
                    title: '알림',
                    text: '언론보도는 기본 1개 설정이 필수입니다.',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        document.getElementById('loadingBar').style.display = 'none';
                        isSubmitting = false;
                        return;
                    }
                });
            } else {
                if (element) {
                    updateApi(element);
                } else {
                    postApi();
                }
            }
        } else if (isPressIntro === 'Y') {
            if (pressIntroNum >= 5) {
                Swal.fire({
                    icon: 'info',
                    title: '알림',
                    text: '언론보도는 이미 5개 모두 설정되었습니다. 기존에 등록한 언론보도 도서를 N으로 변경 후 재설정해주세요.',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        document.getElementById('loadingBar').style.display = 'none';
                        isSubmitting = false;
                        return;
                    }
                });
            } else {
                if (element) {
                    updateApi(element);
                } else {
                    postApi();
                }
            }
        }
    }

    async function postApi() {
        let target = document.getElementById('target');
        let field = document.getElementById('field');
        let series = document.getElementById('series');
        const bookName = document.getElementById('bookName').value;
        const authorWriting = document.getElementById('authorWriting').value;
        const authorPicture = document.getElementById('authorPicture').value;
        const authorTranslation = document.getElementById('authorTranslation').value;
        const totalPage = document.getElementById('totalPage').value;
        const width = document.getElementById('width').value;
        const height = document.getElementById('height').value;
        const publicationDate = document.getElementById('publicationDate').value;
        const tagList = getAllTagsText();
        const price = document.getElementById('price').value;
        const isbn = document.getElementById('isbn').value;
        const isPreview = document.querySelector('input[name="preview"]:checked').value;
        let previewUrl = document.getElementById('previewUrl').value;
        const isUse = document.querySelector('input[name="isUse"]:checked').value;
        const onlineStoresData = getAllOnlineStores();
        const introduction = document.getElementById('introduction').value;
        const isAwards = document.querySelector('input[name="isAwards"]:checked').value;
        const isSeries = document.querySelector('input[name="isSeries"]:checked').value;
        const isPressIntro = document.querySelector('input[name="isPressIntro"]:checked').value;
        const isIntro = document.querySelector('input[name="isIntro"]:checked').value;
        let introSortOrder = '';

        if (isIntro === 'Y') {
            introSortOrder = document.getElementById('introOrder').value;
        }
        const seriesBookLine = document.querySelector('.seriesLine').querySelectorAll('[id^="isSeriesLine"]');
        const seriesBookIndexList = Array.from(seriesBookLine).map(line => ({
            bookTriggerArbolIndex: line.getAttribute('data-index'),
            uid: line.getAttribute('data-uid'),
            bookName: line.getAttribute('data-book-name')
        }));

        let pressTitleList = [];

        let pressMain = '';
        let awardList = [];
        if (isPressIntro === 'Y') {
            pressTitleList = getAllPressIntroTitlesAndUrls();
            pressMain = document.getElementById('pressMain').value;
        }

        if (isAwards === 'Y') {
            awardList = getAllAward();
        }

        if (isPreview === 'PDF') {
            previewUrl = '';
        }

        console.log(tagList);
        console.log(onlineStoresData)



        target = getSelectedValues(target);
        field = getSelectedValues(field);
        series = getSelectedValues(series);


        let data = {
            uid: uid,
            type: 'BOOK-TRIGGER',
            target : target,
            field : field,
            series : series,
            bookName : bookName,
            authorWriting : authorWriting,
            authorPicture : authorPicture,
            authorTranslation : authorTranslation,
            totalPage : totalPage,
            width : width,
            height : height,
            publicationDate : publicationDate,
            tagList : tagList,
            price : price,
            isbn : isbn,
            previewUrl : previewUrl,
            isUse : isUse,
            onlineStoresData : onlineStoresData,
            introduction : introduction,
            isAwards : isAwards,
            isSeries : isSeries,
            isIntro : isIntro,
            isPressIntro : isPressIntro,
            pressTitleList : pressTitleList,
            introSortOrder : introSortOrder,
            pressMain : pressMain,
            awardList : awardList,
            seriesBookIndexList : seriesBookIndexList
        }


        try {
            if (isPreview === 'URL') {
                const el = document.getElementById('dropzoneImagedz1');
                if (el) {
                    console.log(el);
                    el.querySelector('td').querySelector('a').click();
                }

            }
            await uploadByDropzone2(0);
            const response = await fetch('/api/v1/book-trigger-registration', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            });

            const result = await response.json();
            document.getElementById('loadingBar').style.display = 'none';
            if (result.result === true) {
                Swal.fire({
                    title: '등록 완료',
                    text: '등록되었습니다.',
                    icon: 'success',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.href = '/book-trigger/book-trigger';
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
        } catch (Exception) {
            console.error(Exception);
        }
    }



    let awardCnt = 1;
    async function plusAwardLine() {
        if (awardCnt >= 5) {

            return;
        }

        awardCnt++;

        if (awardCnt == 5) {
            const btn = document.getElementById('plusAwardBtn');
            btn.style.backgroundColor = '#5d5d5d'
            btn.style.color = '#fff';
            btn.classList.remove('btn-dark');
            btn.setAttribute('disabled', 'disabled');
        }

        let num = awardCnt < 10 ? '0' + awardCnt : awardCnt;
        num = num + '.';

        let htmlContent = `
            <div id="isAwardsLine` + awardCnt + `" class="row mb-8 awardLine">
                <div class="col-lg-12 row">
                    <div class="col-lg-1 d-flex justify-content-start align-items-center">
                        <label class="col-lg-10 form-label fw-bolder text-blue d-flex align-items-center justify-content-start pt-2">` + num + `</label>
                    </div>
                    <div class="col-lg-9 row fv-row flex-column">
                        <input type="text" class="form-control awards" name="award" maxlength="100" placeholder="수상 및 선정 사례 입력 (최대 100자까지 입력가능)" oninput="validateAwardInput()"/>
                        <div class="base-input__error"></div>
                    </div>
                    <div class="col-lg-2 d-flex justify-content-center align-items-center">
                        <button type="button" data-idx=` + awardCnt + ` class="btn btn-secondary" onclick="deleteAward(this)">삭제 -</button>
                    </div>
                </div>
            </div>
        `

        let container = document.getElementById('isAwardsLine' + (awardCnt - 1));
        console.log(container);
        container.insertAdjacentHTML('afterend', htmlContent);

        const newInput = container.nextElementSibling.querySelector('.awards');
        newInput.addEventListener('keypress', function(event) {
            if (event.key === 'Enter') {
                event.preventDefault();
                plusAwardLine();
            }
        });


    }

    async function plusOnlineStore() {
        if (itemCnt >= 6) {

            Swal.fire({
                title: '알림',
                text: '최대 5개까지 등록 가능합니다.',
                icon: 'info',
                confirmButtonText: '확인'
            })

            return;
        }

        itemCnt++;
        if (itemCnt === 6) {
            const btn = document.getElementById('plusOnlineStoreBtn');
            btn.style.backgroundColor = '#5d5d5d'
            btn.style.color = '#fff';
            btn.classList.remove('btn-dark');
            btn.setAttribute('disabled', 'disabled');
        }
        let num = itemCnt < 10 ? '0' + itemCnt : itemCnt;
        num = num + '.';

        let htmlContent = `
             <div class="row mb-8" id="onlineStoreLine` + itemCnt + `">
                <div class="col-lg-12 row">
                    <div class="col-lg-1 d-flex align-items-center justify-content-center">
                    </div>
                    <div class="col-lg-11 row">
                        <div class="col-lg-1 d-flex justify-content-start align-items-center">
                            <label class="col-lg-12 form-label fw-bolder text-blue d-flex align-items-center justify-content-start pt-2">`+ num + `</label>
                        </div>
                        <div class="col-lg-4 row fv-row flex-column" id="onlineBookStoreInput` + itemCnt + `">
                            <select
                                    id="onlineBookStore` + itemCnt + `"
                                    class="form-select form-select-solid unselect-form onlineBookStore"
                                    name="onlineBookStore"
                                    data-control="select2"
                                    data-hide-search="true"
                                    data-placeholder="전체"
                                    data-idx="onlineBookStore` + itemCnt + `"
                                    onchange="checkOnlineStore(this)"
                            >
                                <option></option>
                                <option value="교보문고">교보문고</option>
                                <option value="인터파크(도서)">인터파크(도서)</option>
                                <option value="YES24">YES24</option>
                                <option value="네이버">네이버</option>
                                <option value="영풍문고">영풍문고</option>
                                <option value="알라딘">알라딘</option>
                            </select>
                            <div class="base-input__error"></div>
                        </div>
                        <div class="col-lg-5 row flex-column">
                            <input type="text" maxlength="500" class="form-control onlineInput` + itemCnt + `" data-idx="`+ itemCnt + `" name="onlineBookStore" placeholder="온라인 서점 URL 입력" oninput="validateOnlineStore()" />
                           <div class="base-input__error"></div>
                        </div>
                       <div class="col-lg-2 d-flex justify-content-center align-items-center">
                            <button type="button" data-idx="` + itemCnt + `"  class="btn btn-secondary" onclick="deleteOnlineStore(this)">삭제 -</button>
                       </div>
                    </div>
                </div>
            </div>
        `;

        let container = document.getElementById('onlineStoreLine' + (itemCnt - 1));
        console.log(container, parseInt(itemCnt))
        container.insertAdjacentHTML('afterend', htmlContent);

        const newInput = container.nextElementSibling.querySelector('.onlineInput' + itemCnt);
        newInput.addEventListener('keypress', function(event) {
            if (event.key === 'Enter') {
                event.preventDefault();
                plusOnlineStore();
            }
        });

        $('#onlineBookStore' + itemCnt).select2({
            minimumResultsForSearch: -1
        });


        const targetNode = document.querySelectorAll('.form-select.unselect-form');
        targetNode.forEach((node) => {
            node.style.backgroundColor = '#ffffff';
            node.style.backgroundClip = 'padding-box';
            node.style.border = '1px solid #E4E6EF';
        });

        validateOnlineStore();
    }

    // 중복 서점 체크 안되게
    let onlineStoreList = [];
    let previousSelection = {};

    function checkOnlineStore(element) {
        const selectedOnlineBookStore = element.value;
        const elementId = element.id;

        if (previousSelection[elementId]) {
            const index = onlineStoreList.indexOf(previousSelection[elementId]);
            if (index > -1) {
                onlineStoreList.splice(index, 1);
            }
        }

        if (onlineStoreList.includes(selectedOnlineBookStore)) {
            console.log('check check');
            Swal.fire({
                title: '알림',
                text: '이미 선택된 온라인 서점입니다.',
                icon: 'info',
                confirmButtonText: '확인'
            }).then((result) => {
                if (result.isConfirmed) {
                    element.value = '';
                    $(element).val('').trigger('change.select2');
                    validateOnlineStore();
                }
            });
        } else {
            if (!selectedOnlineBookStore) {
                return;
            }
            onlineStoreList.push(selectedOnlineBookStore);
            previousSelection[elementId] = selectedOnlineBookStore;
        }

        validateOnlineStore();
    }


    let tagCnt = 0;
    async function plusTag(value) {
        const tagContainer = document.getElementById('tagList');
        const tagInput = document.getElementById('tag');
        let tagValue = tagInput.value.trim();



        if (value) {
            tagValue = value;
        }

        if (tagValue.includes('#')) {
            Swal.fire({
                title: '알림',
                text: '* 태그는 #입력 없이 영문, 한글로만 최대 5개까지 등록이 가능합니다.',
                icon: 'info',
                confirmButtonText: '확인'
            })
            return;
        }


        if (!tagValue) {
            Swal.fire({
                title: '알림',
                text: '태그를 입력해주세요.',
                icon: 'info',
                confirmButtonText: '확인'
            });
            return;
        }
        if (tagCnt >= 5) {
            Swal.fire({
                title: '알림',
                text: '최대 5개까지 등록 가능합니다.',
                icon: 'info',
                confirmButtonText: '확인'
            });
            return;
        }

        tagCnt++;
        if (tagCnt == 5) {
            const btn = document.getElementById('plusTagBtn');
            btn.style.backgroundColor = '#5d5d5d'
            btn.style.color = '#fff';
            btn.classList.remove('btn-dark');
            // btn.setAttribute('disabled', 'disabled');
        }




        let tag = '#' + tagValue;

        let htmlContent = `
            <span id="tag` + tagCnt + `" class="badge badge-secondary badge-lg tags">` + tag + ` <span class="delete-btn" onclick="deleteTag(this)">X</span></span>
        `

        if (tagContainer.children.length === 0) {
            tagContainer.innerHTML = htmlContent;
        } else {
            tagContainer.insertAdjacentHTML('beforeend', htmlContent);
        }
        tagInput.value = '';
        updateCharCount();
        checkTagValidation();
    }


    let seriesCnt = 0;
    async function plusSeriesLine(seriesBookList) {

        seriesCnt = seriesBookList.length;
        if (seriesCnt > 10) {

            Swal.fire({
                title: '알림',
                text: '최대 10개까지 등록 가능합니다.',
                icon: 'info',
                confirmButtonText: '확인'
            })
            return;
        }

        let num = seriesCnt < 10 ? '0' + seriesCnt : seriesCnt;

        const tableBody = document.getElementById('seriesTableBody');
        tableBody.innerHTML = '';

        seriesBookList.forEach((seriesBook, index) => {
            let row = tableBody.insertRow();
            row.id = "isSeriesLine" + (index + 1); // 각 행에 고유 ID 할당
            row.dataset.index = seriesBook.index;
            row.dataset.uid = seriesBook.uid;
            row.dataset.bookName = seriesBook.bookName;
            const cellNumber = row.insertCell(0);
            const cellBookName = row.insertCell(1);
            const cellAction = row.insertCell(2);

            if (index === 9) {
                cellNumber.textContent = '10' + '.';
            } else {
                cellNumber.textContent = '0' + (index + 1) + '.';
            }
            cellBookName.textContent = seriesBook.bookName;
            cellAction.innerHTML = `<button type="button" data-idx="` + (index + 1) + `" data-index="` + index + `" class="btn btn-secondary seriesBtn" onclick="deleteSeries(this)">삭제 -</button>`;

            // Assigning classes to cells for styling
            cellNumber.className = 'num form-label fw-bolder text-blue';
            cellBookName.className = 'text-dark';
            cellAction.className = 'text-center button';
        });

    }


    let pressCnt = 1;
    async function plusPressLine() {
        if (pressCnt >= 5) {

            Swal.fire({
                title: '알림',
                text: '최대 5개까지 등록 가능합니다.',
                icon: 'info',
                confirmButtonText: '확인'
            });

            return;
        }

        pressCnt++;

        if (pressCnt == 5) {
            const btn = document.getElementById('plusPressBtn');
            btn.style.backgroundColor = '#5d5d5d'
            btn.style.color = '#fff';
            btn.classList.remove('btn-dark');
            btn.setAttribute('disabled', 'disabled');
        }

        let num = pressCnt < 10 ? '0' + pressCnt : pressCnt;
        num = num + '.';

        let htmlContent =
            `
                   <div class="row mb-8 pressLine" id="showIsPress` + pressCnt + `">
                      <div class="col-lg-12 row">
                           <div class="col-lg-1 d-flex justify-content-start align-items-center">
                                <label class="col-lg-10 form-label fw-bolder text-blue d-flex align-items-center justify-content-start pt-2">`+ num + `</label>
                            </div>
                            <div class="col-lg-9 row">
                                  <div class="col-lg-6 fv-row flex-column">
                                       <input
                                                type="text"
                                                placeholder="언론보도 상세 내용 입력(최대 50자까지 입력가능)"
                                                maxlength="50"
                                                class="form-control pressTitle"
                                                name="pressTitle"
                                                id="pressTitle` + pressCnt + `"
                                                oninput="validePressTitle()"
                                        />
                                       <div class="base-input__error"></div>
                                  </div>

                                 <div class="col-lg-6 fv-row flex-column">
                                    <input
                                            type="text"
                                            placeholder="URL 입력 (새창으로 연결)"
                                            maxlength="50"
                                            class="form-control pressTitleUrl"
                                            name="pressTitle"
                                            id="pressTitle` + pressCnt + `"
                                            oninput="validePressTitle()"
                                    />
                                   <div class="base-input__error"></div>
                                </div>
                            </div>

                            <div class="col-lg-2 d-flex justify-content-center align-items-center">
                                <button type="button" id="plusPressBtn" data-idx="` + pressCnt + `" class="btn btn-secondary" onclick="deletePressLine(this)">삭제 -</button>
                            </div>
                        </div>
                    </div>
            `

        let container = document.getElementById('showIsPress' + (pressCnt - 1));
        container.insertAdjacentHTML('afterend', htmlContent);

        const newInput = container.nextElementSibling.querySelector('.pressTitle');
        newInput.addEventListener('keypress', function(event) {
            if (event.key === 'Enter') {
                event.preventDefault();
                plusPressLine();
            }
        });

    }

    let seriesBookList = [];        // form 에 존재하는 시리즈 도서 목록 전체??
    let allSeriesBookList = [];     // 전체 시리즈 도서 목록
    function selectSeriesBook(element) {


        const checkbox = element.querySelector('input[type="checkbox"]');
        const seriesBookIndex = element.getAttribute('data-idx');
        const seriesBookUid = element.getAttribute('data-uid');
        const seriesBookName = element.getAttribute('data-bookName');

        const seriesBookLine = document.querySelector('.seriesLine').querySelectorAll('[id^="isSeriesLine"]');
        console.log(seriesBookLine)
        const existingIndexes = Array.from(seriesBookLine).map(line => line.getAttribute('data-index'));
        console.log('existing ====', existingIndexes)
        let seriesLen = seriesBookList.length;
        console.log('seriesLen' , seriesLen)
        if (checkbox.checked) {
            if (seriesLen >= 10) {
                Swal.fire({
                    title: '알림',
                    text: '시리즈 도서는 최대 10개까지 선택 가능합니다. 삭제 후 재 등록해주세요.',
                    icon: 'info',
                    confirmButtonText: '확인'
                });
                seriesBookList = seriesBookList.filter(item => item.index !== seriesBookIndex);
                checkbox.checked = false;
                return;
            }
            // 선택된 seriesBookIndex가 이미 그려진 시리즈 도서 목록에 존재하는지 확인 + form 에 그려진 시리즈 도서 목록에 존재하는지 확인
            if (!existingIndexes.includes(seriesBookIndex)) {
                // seriesBookList 배열에 해당 index가 이미 포함되어 있는지 추가로 확인
                const isAlreadyListed = seriesBookList.some(item => item.index === seriesBookIndex);
                if (!isAlreadyListed) {
                    seriesBookList.push({
                        index: seriesBookIndex,
                        uid : seriesBookUid,
                        bookName: seriesBookName
                    });
                    checkbox.checked = true;
                }
            } else {
                Swal.fire({
                    title: '알림',
                    text: '이미 선택된 도서입니다.',
                    icon: 'info',
                    confirmButtonText: '확인'
                });
                seriesBookList = seriesBookList.filter(item => item.index !== seriesBookIndex);
                checkbox.checked = false;
            }
        } else {
            console.log('adfasdfasdf', allSeriesBookList)
            console.log('asdfsadf', seriesBookIndex)
            // 체크가 해제되면, 배열에서 해당 도서를 제거
            seriesBookList = seriesBookList.filter(item => item.index !== seriesBookIndex);
            checkbox.checked = false;
        }
        console.log('existing ====1', seriesBookList)
    }



    function postSeriesBook() {

        let seriesLen = seriesBookList.length;
        // 시리즈 도서 선택이 없을 시 얼랏 창 띄움
        if (seriesLen === 0) {
            Swal.fire({
                title: '알림',
                text: '시리즈 도서를 선택해주세요.',
                icon: 'info',
                confirmButtonText: '확인'
            });
            return;
        }

        // 최소 3개 선택 아닐시 얼랏 창 띄움
        if (seriesLen < 3) {
            Swal.fire({
                title: '알림',
                text: '시리즈 도서는 최소 3개 등록해야 합니다.',
                icon: 'info',
                confirmButtonText: '확인'
            });
            return;
        }

        // 총 시리즈 도서 10개 이상 일때 얼랏 창 띄움
        if (seriesLen > 10) {
            Swal.fire({
                title: '알림',
                text: '시리즈 도서는 최대 10개까지 선택 가능합니다. 삭제 후 재 등록해주세요.',
                icon: 'info',
                confirmButtonText: '확인'
            });
            return;
        }

        console.log('adf ', seriesBookList)

        plusSeriesLine(seriesBookList);

        // 시리즈 3개만 가지고 있으면 btn disabled 처리
        if (seriesLen === 3) {
            updateDeleteButtonState();
        }

        // 시리즈 3개 이상일시 btn disabled 초기화
        if (seriesLen > 3) {
            updateDeleteButtonState();
        }

        // modal 창 닫기
        let modal = document.getElementById('seriesCodeModalLayout');
        modal.remove();
        closeModalBackdrop();
        document.body.classList.remove('modal-open'); // modal-open 클래스 제거
        document.body.style.paddingRight = '';
        document.body.style.overflow = ''; // 스크롤 스타일 초기화

    }



    /******************************************************************* PUT ************************************************/

    let isModified = false;

    async function deleteAward(element) {
        if (awardCnt <= 1) {
            return;
        }

        const idx = element.getAttribute('data-idx');

        let container = document.getElementById('isAwardsLine' + idx);
        container.remove();
        awardCnt--;

        const  lines = document.querySelectorAll('[id^="isAwardsLine"]');
        lines.forEach((line, index) => {
            const newIndex = index + 1;

            line.id = 'isAwardsLine' + newIndex;

            const button = line.querySelector(`button[onclick="deleteAward(this)"]`);
            if (button) {
                button.setAttribute('data-idx', newIndex);
            }

            const label = line.querySelector('label.form-label');
            if (label) {
                label.textContent = "0" + newIndex + ".";
            }
        });

        const btn = document.getElementById('plusAwardBtn');

        btn.style.backgroundColor = ''
        btn.style.color = '';
        btn.classList.add('btn-dark');
        btn.removeAttribute('disabled');
    }

    async function deleteOnlineStore(element) {
        console.log(itemCnt);
        if (itemCnt <= 1) {
            return;
        }
        const idx = element.getAttribute('data-idx');

        const select = document.getElementById('onlineBookStore' + idx);
        if (select) {
            const onlineStoreToDelete = select.value;
            const indexInOnlineStoreList = onlineStoreList.indexOf(onlineStoreToDelete);

            if (indexInOnlineStoreList > -1) {
                onlineStoreList.splice(indexInOnlineStoreList, 1);
            }

            delete previousSelection['onlineBookStore' + idx];
        }

        let container = document.getElementById('onlineStoreLine' + idx);
        container.remove();
        itemCnt--;

        const lines = document.querySelectorAll('[id^="onlineStoreLine"]');
        lines.forEach((line, index) => {
            const newIndex = index + 1;

            line.id = 'onlineStoreLine' + newIndex;

            const select = line.querySelector(`select[name="onlineBookStore"]`);
            const button = line.querySelector(`button[onclick="deleteOnlineStore(this)"]`);

            if (select) {
                $(select).select2('destroy');
                select.id = 'onlineBookStore' + newIndex;
                $(select).select2({
                    placeholder: "전체",
                    minimumResultsForSearch: Infinity
                });
            }
            if (button) {
                button.setAttribute('data-idx', newIndex);
            }

            const label = line.querySelector('label.form-label');
            if (label && index !== 0) {
                label.textContent = "0" + newIndex + ".";
            }
        });

        const targetNode = document.querySelectorAll('.form-select.unselect-form');
        targetNode.forEach((node) => {
            node.style.backgroundColor = '#ffffff';
            node.style.backgroundClip = 'padding-box';
            node.style.border = '1px solid #E4E6EF';
        });

        const btn = document.getElementById('plusOnlineStoreBtn');

        btn.style.backgroundColor = ''
        btn.style.color = '';
        btn.classList.add('btn-dark');
        btn.removeAttribute('disabled');

        validateOnlineStore();
    }

    async function deleteTag(element) {
        if (tagCnt <= 0) {
            return;
        }

        element.parentNode.remove();
        tagCnt--;

        const btn = document.getElementById('plusTagBtn');

        btn.style.backgroundColor = ''
        btn.style.color = '';
        btn.classList.add('btn-dark');
        btn.removeAttribute('disabled');
        checkTagValidation();
    }

    async function deletePressLine(element) {
        if (pressCnt <= 1) {
            return;
        }

        const idx = element.getAttribute('data-idx');

        let container = document.getElementById('showIsPress' + idx);
        console.log(container)
        container.remove();
        pressCnt--;

        const lines = document.querySelectorAll('[id^="showIsPress"]');
        lines.forEach((line, index) => {
            const newIndex = index + 1;
            console.log(index);

            line.id = 'showIsPress' + newIndex;

            const button = line.querySelector(`button[onclick="deletePressLine(this)"]`);
            if (button) {
                button.setAttribute('data-idx', newIndex);
            }

            const label = line.querySelector('label.form-label');
            if (label) {
                label.textContent = "0" + newIndex + ".";
            }
        });

        const btn = document.getElementById('plusPressBtn');

        btn.style.backgroundColor = ''
        btn.style.color = '';
        btn.classList.add('btn-dark');
        btn.removeAttribute('disabled');
    }


    function deleteSeries(element) {
        if (seriesCnt <= 0) {
            return;
        }

        console.log(seriesBookList)

        const idx = parseInt(element.getAttribute('data-idx'));
        const index = parseInt(element.getAttribute('data-index'));
        let container = document.getElementById('isSeriesLine' + idx);
        if (container) {
            container.remove();
            seriesCnt--;
            console.log('idx====', idx, 'index====', index);
            console.log(seriesBookList)
            seriesBookList = seriesBookList.filter(item => item.index !== index.toString());
            console.log(seriesBookList.length)

            const lines = document.querySelector('.seriesLine').querySelectorAll('[id^="isSeriesLine"]');
            lines.forEach((line, index) => {
                console.log('index ===', index)
                const newIndex = index + 1;
                line.id = 'isSeriesLine' + newIndex;
                const button = line.querySelector('button[data-idx]');
                if (button) {
                    button.setAttribute('data-idx', newIndex);
                }
                const label = line.querySelector('.num');
                if (label) {
                    label.textContent = (newIndex < 10 ? "0" : "") + newIndex + ".";
                }
            });
            updateDeleteButtonState();
        } else {
            console.error('error' , idx);
        }
    }

    function updateDeleteButtonState() {
        const lines = document.querySelector('.seriesLine').querySelectorAll('[id^="isSeriesLine"]'); // 모든 .seriesLine 요소 선택

        lines.forEach((line) => {
            const button = line.querySelector('button[data-idx]');
            if (button) {
                button.disabled = seriesCnt <= 3; // 시리즈 개수가 3개 이하면 비활성화
            }
        });

        // 시리즈 개수가 3개 이상인 경우 활성화 로직
        if (seriesCnt > 3) {
            lines.forEach((line) => {
                const button = line.querySelector('button[data-idx]');
                if (button) {
                    button.disabled = false; // 버튼을 활성화
                }
            });
        }
    }






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

    async function update(element) {
        if (isSubmitting) {
            return;
        }
        invalidFields = [];
        document.getElementById('loadingBar').style.display = 'block';
        isSubmitCheck = true;
        isSubmitting = true;
        subCheck = true;
        subCheck2 = true;

        let uid = element.getAttribute('data-uid');
        // 인트로 노출 여부 노출 여부 숫자 체크
        // try {
        //     const response = await fetch('/api/v1/book-trigger-registration/intro/BOOK-TRIGGER?uid=' + uid , {
        //         method: 'GET',
        //         headers: {
        //             'Content-Type': 'application/json',
        //         }
        //     });
        //
        //     const result = await response.json();
        //     if (result.result === true) {
        //         introNum = result.data;
        //         console.log('introNum:', introNum);
        //     }
        // } catch (e) {
        //     console.error(e);
        // }


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

        if (!isValid || status === 'Invalid'|| (introNum >= 20 && value === 'Y') || !isFile) {
            document.getElementById('loadingBar').style.display = 'none';
            // validateIsIntro();
            console.log('llllllllllllllllllllllllllllll', invalidFields.length);
            if (invalidFields.length > 0) {
                const firstInvalidField = invalidFields.reduce((highest, field) => field.getBoundingClientRect().top < highest.getBoundingClientRect().top ? field : highest);
                focusAndScroll(firstInvalidField);
            }
            isSubmitting = false;
            return;
        }

        // 인트로 노출 여부 노출 등록시 도서 체크
        const isIntro = document.querySelector('input[name="isIntro"]:checked').value;
        let introSortOrder = '';
        let introResult = '';

        if (isIntro === 'Y') {
            // introSortOrder = document.getElementById('introOrder').value;
            // try {
            //     const response = await fetch('/api/v1/book-trigger-registration/intro-order/BOOK-TRIGGER?sortOrder=' + introSortOrder + '&uid=' + uid, {
            //         method: 'GET',
            //         headers: {
            //             'Content-Type': 'application/json',
            //         }
            //     });
            //
            //     const result = await response.json();
            //
            //     if (result.result === true) {
            //         introResult = result.data;
            //     }
            //
            // } catch (e) {
            //     console.error(e);
            // }
            introResult= 'false';

            if (introResult === 'true') {
                console.log('iii')
                Swal.fire({
                    icon: 'info',
                    title: '알림',
                    text: '해당 노출순서에 등록된 도서가 있습니다. 해당 도서로 변경 하시겠습니까?',
                    showDenyButton: true,
                    denyButtonText: '취소',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        Swal.fire({
                            icon: 'success',
                            title: '알림',
                            text: '해당 도서로 변경되었습니다.',
                            confirmButtonText: '확인'
                        }).then((result) => {
                            isPressCheckStep(element);
                        })
                    } else if (result.isDenied) {
                        document.getElementById('loadingBar').style.display = 'none';
                        isSubmitting = false;
                        return;
                    }
                });
            } else {
                console.log('iiiisadfasdf')
                isPressCheckStep(element);
            }
        } else {
            isPressCheckStep(element);
        }


        isSubmitting = false;
    }

    async function updateApi(element) {
        const idx = element.getAttribute('data-idx');
        const uid = element.getAttribute('data-uid');
        let target = document.getElementById('target');
        let field = document.getElementById('field');
        let series = document.getElementById('series');
        const bookName = document.getElementById('bookName').value;
        const authorWriting = document.getElementById('authorWriting').value;
        const authorPicture = document.getElementById('authorPicture').value;
        const authorTranslation = document.getElementById('authorTranslation').value;
        const totalPage = document.getElementById('totalPage').value;
        const width = document.getElementById('width').value;
        const height = document.getElementById('height').value;
        const publicationDate = document.getElementById('publicationDate').value;
        const tagList = getAllTagsText();
        const price = document.getElementById('price').value;
        const isbn = document.getElementById('isbn').value;
        const isPreview = document.querySelector('input[name="preview"]:checked').value;
        let previewUrl = document.getElementById('previewUrl').value;
        const isUse = document.querySelector('input[name="isUse"]:checked').value;
        const onlineStoresData = getAllOnlineStores();
        const introduction = document.getElementById('introduction').value;
        const isAwards = document.querySelector('input[name="isAwards"]:checked').value;
        const isSeries = document.querySelector('input[name="isSeries"]:checked').value;
        const isIntro = document.querySelector('input[name="isIntro"]:checked').value;
        const isPressIntro = document.querySelector('input[name="isPressIntro"]:checked').value;

        const seriesBookLine = document.querySelector('.seriesLine').querySelectorAll('[id^="isSeriesLine"]');
        const seriesBookIndexList = Array.from(seriesBookLine).map(line => ({
            bookTriggerArbolIndex: line.getAttribute('data-index'),
            uid: line.getAttribute('data-uid'),
            bookName: line.getAttribute('data-book-name')
        }));


        let pressTitleList = [];
        let introSortOrder = '';
        let pressMain = '';
        let awardList = [];
        // if (isPressIntro === 'Y') {
            pressTitleList = getAllPressIntroTitlesAndUrls();
            pressMain = document.getElementById('pressMain').value;
        // }

        if (isIntro === 'Y') {
            // introSortOrder = document.getElementById('introOrder').value;
        }

        if (isAwards === 'Y') {
            awardList = getAllAward();
        }

        if (isPreview === 'PDF') {
            previewUrl = '';
        }

        target = getSelectedValues(target);
        field = getSelectedValues(field);
        series = getSelectedValues(series);

        let data = {
            idx: idx,
            uid: uid,
            type: 'BOOK-TRIGGER',
            target : target,
            field : field,
            series : series,
            bookName : bookName,
            authorWriting : authorWriting,
            authorPicture : authorPicture,
            authorTranslation : authorTranslation,
            totalPage : totalPage,
            width : width,
            height : height,
            publicationDate : publicationDate,
            tagList : tagList,
            price : price,
            isbn : isbn,
            previewUrl : previewUrl,
            isUse : isUse,
            onlineStoresData : onlineStoresData,
            introduction : introduction,
            isAwards : isAwards,
            isSeries : isSeries,
            isIntro : isIntro,
            isPressIntro : isPressIntro,
            pressTitleList : pressTitleList,
            introSortOrder : '0',
            pressMain : pressMain,
            awardList : awardList,
            seriesBookIndexList : seriesBookIndexList
        }

        try {

            if (isPreview === 'URL') {
                const el = document.getElementById('dropzoneImagedz1');
                if (el) {
                    console.log(el,    el.querySelector('td').querySelector('a'));
                    el.querySelector('td').querySelector('a').click();
                }

            }

            await uploadByDropzone2(0);


            const response = await fetch('/api/v1/book-trigger-registration/' + uid, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            });

            const result = await response.json();

            document.getElementById('loadingBar').style.display = 'none';
            if (result.result === true) {
                Swal.fire({
                    title: '등록 완료',
                    text: '등록되었습니다.',
                    icon: 'success',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.href='/book-trigger/book-trigger/' + uid;
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
        } catch (Exception) {
            console.error(Exception);
        }
    }



    /*********************************************************** DELETE *******************************************************/
    async function deleteBookTrigger(element) {
        if (isSubmitting) {
            return;
        }
        isSubmitting = true;

        const isUse = document.querySelector('input[name="isUse"]:checked').value;

        if (isUse === 'Y') {
            Swal.fire({
                title: '삭제 불가',
                text: '공개된 북트리거는 삭제할 수 없습니다.',
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
                    try {
                        const response = await fetch('/api/v1/book-trigger-registration/' + idx, {
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
                                    location.href = '/book-trigger/book-trigger';
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

    /**************************************************** SERIES CODE MODAL UTILS ******************************************/

    let isSearching = false;
    async function searchSeriesBook() {
        if (isSearching) {
            return;
        }

        isSearching = true;

        const seriesSearch = document.getElementById('bookCodeSearchSearch').value;

        let queryParams = '?page=1';

        if (seriesSearch) {
            queryParams += '&search=' + seriesSearch;
        }

        console.log('before === ',seriesBookList);

        console.log('after = ==', seriesBookList);

        try {
            const response = await fetch('/api/v1/book-trigger-registration/series-book-list' + queryParams, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                }
            });

            const result = await response.json();

            console.log(result);
            if (result.result === true) {
                if (result.data.listNum !== 0) {
                    updateSeriesCodeTable(result.data.seriesBookList, result.data.listNum, result.data.page);
                    updateSeriesCodeForm(result.data.listNum);
                    updateSeriesCodePagination(result.data.pageHtml, result.data.listNum);
                    seriesBookBeforeCheck(result.data.seriesBookList);
                } else {
                    nothingDataTable();
                }

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

    async function resetSeriesSearchForm() {
        if (isSubmitting) {
            return;
        }
        isSubmitting = true;



        let queryParams = '?page=1';


        document.getElementById('bookCodeSearchSearch').value = '';



        try {
            const response = await fetch('/api/v1/book-trigger-registration/series-book-list' + queryParams, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                }
            });

            const result = await response.json();


            console.log(result);
            if (result.result === true) {
                if (result.data.listNum !== 0) {
                    updateSeriesCodeTable(result.data.seriesBookList, result.data.listNum, result.data.page);
                    updateSeriesCodeForm(result.data.listNum);
                    updateSeriesCodePagination(result.data.pageHtml, result.data.listNum);
                    seriesBookBeforeCheck(result.data.seriesBookList);
                } else {
                    nothingDataTable();
                }
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
            isSubmitting = false;
        }
    }


    async function changePage(page) {

        if (isSearching) {
            return;
        }

        isSearching = true;

        const seriesSearch = document.getElementById('bookCodeSearchSearch').value;

        console.log('seriesBookList ====' ,seriesBookList, 'allSeriesBookList ===', allSeriesBookList);

        let queryParams = '?page=' + page;

        if (seriesSearch) {
            queryParams += '&search=' + seriesSearch;
        }





        try {
            const response = await fetch('/api/v1/book-trigger-registration/series-book-list' + queryParams, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                }
            });

            const result = await response.json();
            console.log(result);

            if (result.result === true) {
                if (result.data.listNum !== 0) {
                    updateSeriesCodeTable(result.data.seriesBookList, result.data.listNum, result.data.page);
                    updateSeriesCodeForm(result.data.listNum);
                    updateSeriesCodePagination(result.data.pageHtml, result.data.listNum);
                    seriesBookBeforeCheck(result.data.seriesBookList);
                    listCheck();
                } else {
                    nothingDataTable();
                }
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

    function seriesBookBeforeCheck(data) {
        const seriesBookListIndexes = seriesBookList.map(item => item.index);   // list 선택된것
        const seriesLineIndexes = Array.from(document.querySelector('.seriesLine').querySelectorAll('[id^="isSeriesLine"]')).map(element => element.getAttribute('data-index'));        // 기존에 list 에 선택되어있는것
        const newLine = [...seriesBookListIndexes];
        const newLine2 = [...seriesLineIndexes];

        console.log('hih')

        data.forEach((item) => {
            const isExist = newLine.some((seriesBook) => seriesBook === item.bookTriggerArbolIndex);
            const isExist2 = newLine2.some((seriesBook) => seriesBook === item.bookTriggerArbolIndex);
            if (isExist) {
                const checkbox = document.querySelector('.form-check[data-idx="'+ item.bookTriggerArbolIndex + '"] input[type="checkbox"]');
                if (checkbox) {
                    checkbox.checked = true;
                }
            }
            if (isExist2) {
                const checkbox = document.querySelector('.form-check[data-idx="'+ item.bookTriggerArbolIndex + '"] input[type="checkbox"]');
                if (checkbox) {
                    checkbox.checked = true;
                }
            }
        });
    }

    function seriesBookBeforeListCheck(data) {
        const seriesBookListIndexes = seriesBookList.map(item => item.index);
        const seriesLineIndexes = Array.from(document.querySelector('.seriesLine').querySelectorAll('[id^="isSeriesLine"]')).map(element => element.getAttribute('data-index'));
        const newLine = [...seriesBookListIndexes, ...seriesLineIndexes];

        data.forEach((item) => {
            const isExist = newLine.some((seriesBook) => seriesBook === item.bookTriggerArbolIndex);
            if (isExist) {
                const checkbox = document.querySelector('.form-check[data-idx="'+ item.bookTriggerArbolIndex + '"] input[type="checkbox"]');
                if (checkbox) {
                    checkbox.checked = true;
                    checkbox.disabled = true;
                }
            }
        });
    }


    function updateSeriesCodePagination(html, listNum) {

        let pagination = document.getElementById('pagination');


        pagination.innerHTML = '';
        if (listNum !== 0) {
            pagination.innerHTML = html;
        }


        console.log('hhh' , pagination.innerHTML);


    }


    function updateSeriesCodeForm(listNum) {

        document.getElementById('bookCodeListNum').innerHTML = `검색결과 총 <span class="fw-bolder">` + listNum  + ` </span> 개`;

    }

    function updateSeriesCodeTable(data, listNum, page) {
        const tableBody = document.getElementById('bookCodeModalTableBody');
        tableBody.innerHTML = ''; // 기존의 테이블 내용을 비웁니다.

        console.log(data, listNum, page);
        data.forEach(function(item, index) {
            const row = tableBody.insertRow();
            const NM_CLASS = row.insertCell(0);
            const CD_SERIES = row.insertCell(1);
            const CD_BRAND = row.insertCell(2);

            // 순번 계산
            NM_CLASS.textContent = ((listNum - (page.pageListSize * (page.currentPage - 1))) - index);
            NM_CLASS.className = 'text-dark fw-bold';

            // 책 이름
            CD_SERIES.textContent = item.bookName;
            CD_SERIES.className = 'text-hover-warning hoverable';

            // 선택 체크박스
            CD_BRAND.innerHTML = `
            <div class="form-check form-check-custom form-check-warning form-check-solid" data-idx="` + item.bookTriggerArbolIndex + `" data-uid="` + item.uid + `" data-bookName="` + item.bookName + `" onclick="selectSeriesBook(this)">
                <input class="form-check-input" type="checkbox" value="" />
            </div>
        `;
            CD_BRAND.className = 'text-hover-warning hoverable';
        });
        console.log(tableBody);
    }


    /**
     * 선택한 교재 코드를 입력 폼에 적용합니다.
     * @param element
     * @returns {Promise<void>}
     */
    async function selectSeriesCode(element) {
        let code = element.getAttribute('data-code');
        let name = element.getAttribute('data-name');
        let dataYear = element.getAttribute('data-year');

        console.log(code, name, dataYear);



        let seriesCode1 = document.getElementById('seriesCode1');
        let seriesCode2 = document.getElementById('seriesCode2');
        let year = document.getElementById('year');

        console.log(code, name, dataYear);

        seriesCode1.value = code;
        seriesCode2.value = name;
        year.value = dataYear;

        // 년도 는 disabled 처리
        year.disabled = false;

        // modal 창 닫기
        let modal = document.getElementById('seriesCodeModalLayout');
        modal.remove();
        closeModalBackdrop();
        document.body.classList.remove('modal-open'); // modal-open 클래스 제거
        document.body.style.overflow = ''; // 스크롤 스타일 초기화

    }


    /*********************************************************** Modal 영역 ********************************************/


    function attachModalEventListeners() {

        const seriesModalElements = document.querySelectorAll('.seriesCodeModal:not(.modal-attached)');

        seriesModalElements.forEach(function (element) {

            element.classList.add('modal-attached');
            element.addEventListener('click', openSeriesModalHandler);
        });
    }

    function openSeriesModalHandler(event) {
        const modalLayout = document.createElement('div');
        modalLayout.classList.add('modal', 'fade');
        modalLayout.id = 'seriesCodeModalLayout';
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

        modalLayout.addEventListener('hide.bs.modal', closeSeriesCodeModal);

        modalLayout.addEventListener('hidden.bs.modal', function() {
            modalLayout.remove();
        });

        let series = document.getElementById('series');
        series = getSelectedValues(series);

        let seriesIndex = Array.from(document.querySelectorAll('.seriesLine [id^="isSeriesLine"]')).map(line => line.getAttribute('data-index'));
        let url = '/book-trigger/book-trigger-series-search-modal';
        let params = [];

        if (series) {
            params.push('series=' + encodeURIComponent(series));
        }

        if (seriesIndex) {
            params.push('seriesIndex=' + encodeURIComponent(seriesIndex));
        }

        if (params.length > 0) {
            url += '?' + params.join('&');
        }

        document.getElementById('loadingBar').style.display = 'block';
        NTUtil.ajax({
            url: url,
            method: 'GET',
            success: function (data) {
                modalDialog.innerHTML = '';
                modalDialog.insertAdjacentHTML('beforeend', data);
                $(modalDialog).find('select').select2({
                    minimumResultsForSearch: Infinity
                });
                document.getElementById('loadingBar').style.display = 'none';
                let input = document.getElementById('bookCodeSearchSearch');
                input.addEventListener('keypress', function (event) {
                    if (event.key === 'Enter') {
                        event.preventDefault();

                        searchSeriesBook();
                    }
                });
                modal.show();
            }
        })
    }

    function closeSeriesCodeModal() {
        let modal = document.getElementById('seriesCodeModalLayout');
        modal.remove();
        let checkedSeries = Array.from(modal.querySelectorAll('input[type="checkbox"]:checked')).map(checkbox => {
            return {
                index: checkbox.parentElement.getAttribute('data-idx'),
                uid: checkbox.parentElement.getAttribute('data-uid'),
                bookName: checkbox.parentElement.getAttribute('data-bookName')
            };
        });

        seriesBookList = seriesBookList.filter(item => {
            return !checkedSeries.some(checkedItem => {
                return checkedItem.index === item.index && checkedItem.uid === item.uid && checkedItem.bookName === item.bookName;
            });
        });


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

<style>

    /*.base-input__error {*/
    /*    display: none; !* 기본적으로는 보이지 않도록 설정 *!*/
    /*    color: #e74c3c; !* 에러 메시지 색상 *!*/
    /*    font-size: 1rem; !* 에러 메시지 폰트 크기 *!*/
    /*    margin-top: 0.25rem; !* 입력 필드와의 간격 *!*/
    /*    font-weight: bold; !* 글자를 더 굵게 *!*/
    /*    text-shadow: 0.5px 0.5px 0.5px rgba(0, 0, 0, 0.1); !* 약간의 그림자를 추가하여 선명하게 *!*/
    /*    text-align: left; !* 좌측 정렬 *!*/
    /*}*/

    /*.input-error {*/
    /*    border-color: #e74c3c; !* 입력 필드 에러 시 테두리 색상 *!*/
    /*}*/

    /*.show-error {*/
    /*    display: block;*/
    /*}*/

    /*.select2-selection.input-error {*/
    /*    border: 1px solid #e74c3c !important; !* 선택된 값의 테두리 색상 *!*/
    /*}*/



    /*select2-selection.select2-selection--single.form-select.form-select-solid.unselect-form.input-error.field {*/
    /*    border-color: #e74c3c !important; !* 선택된 값의 테두리 색상 *!*/
    /*}*/

    /*select2-selection.select2-selection--single.form-select.form-select-solid.unselect-form.input-error.target {*/
    /*    border-color: #e74c3c !important; !* 선택된 값의 테두리 색상 *!*/
    /*}*/

    /*select2-selection.select2-selection--single.form-select.form-select-solid.unselect-form.input-error.series {*/
    /*    border-color: #e74c3c !important; !* 선택된 값의 테두리 색상 *!*/
    /*}*/
    /*!* select2의 커스터마이즈된 div 요소에 대한 스타일링 *!*/
    /*.select2-container--default .select2-selection--single.input-error {*/

    /*}*/

    /*.select2-container--default .select2-selection--multiple.input-error {*/
    /*    border-color: #e74c3c !important; !* 다중 선택의 테두리 색상 *!*/
    /*}*/


    /*.invalid-feedback {*/
    /*    display: none;*/
    /*    width: 100%;*/
    /*    margin-top: 0.5rem;*/
    /*    font-size: 0.925rem;*/
    /*    color: #F1416C;*/
    /*}*/

    .delete-btn {
        cursor: pointer;
        padding: 2px 5px;
        border-radius: 50%;
    }

    .delete-btn:hover {
        background-color: red;
        color: white;
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

    .input-container {
        position: relative;
        display: inline-block;
    }
    #tag {
        width: 100%;
        padding-right: 30px; /* 공간 확보 */
        box-sizing: border-box; /* 패딩 포함한 박스 사이즈 */
    }
    .char-count {
        position: absolute;
        right: 10px;
        top: 50%;
        padding-right: 5%;
        transform: translateY(-50%);
        font-size: 12px;
        color: grey;
        pointer-events: none; /* 글자 수가 클릭되지 않도록 */
    }

    .base-input__error {
        display: none; /* 기본적으로는 보이지 않도록 설정 */
        color: #F1416C; /* 에러 메시지 색상 */
        font-size: 0.925rem; /* 에러 메시지 폰트 크기 */
        margin-top: 0.5rem; /* 입력 필드와의 간격 */
        text-shadow: 0.5px 0.5px 0.5px rgba(0, 0, 0, 0.1); /* 약간의 그림자를 추가하여 선명하게 */
        text-align: left; /* 좌측 정렬 */
    }


    .input-error {
        border-color: #e74c3c; /* 입력 필드 에러 시 테두리 색상 */


    }

    /* 에러 메시지를 보이게 하는 클래스 */
    .show-error {
        display: block;
    }

    /* 테이블의 열 너비를 고정하여 일관된 레이아웃 유지 */
    #seriesTable .num { width: 50px; text-align: left; }  /* 번호 열 */
    #seriesTable .text-dark { width: 200px; }                /* 도서명 열 */
    #seriesTable .button { width: 100px; text-align: center; }  /* 버튼 열 */

    /* 테이블의 최소 너비를 설정하여 내용이 줄어들어도 레이아웃 유지 */
    #seriesTable {
        min-width: 350px; /* 전체 테이블의 최소 너비 */
        width: 100%; /* 테이블 너비를 부모 요소에 맞춤 */
        table-layout: fixed; /* 테이블 레이아웃을 고정하여 열 너비가 고정됨 */
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
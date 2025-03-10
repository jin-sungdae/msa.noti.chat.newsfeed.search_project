<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ntUtil" uri="tld/NTUtil.tld" %>
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
                            <input type="hidden" name="readingReviewIndex" value="${readingReview.readingReviewIndex}"/>
                            <div class="card shadow-sm">
                                <div class="card-header">
                                    <h3 class="card-title fw-bolder">기본정보</h3>
                                </div>
                                <div class="card-body">
                                    <div class="row mb-6">
                                        <label class="col-2 col-form-label required fw-bolder fs-6 w-sm-175px">구분</label>
                                        <div class="col-lg-6">
                                            <div class="row">
                                                <div class="col-lg-6 fv-row fv-plugins-icon-container w-sm-200px">
                                                    <select id="readingReviewType" name="readingReviewType" aria-label="구분"
                                                            data-control="select2"
                                                            data-hide-search="true"
                                                            data-placeholder="선택" class="form-select form-select-transparent"
                                                            onchange="onChangeSelectForValidation(this)" >
                                                        <option value="">선택</option>
                                                        <c:forEach items="${readingReviewTypeList}" var="list" varStatus="status">
                                                            <option value=${list} <c:if test="${readingReview.readingReviewType eq list}">selected</c:if>><c:out value="${list.value}"/></option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-6">
                                        <label class="col-2 col-form-label required fw-bolder w-sm-175px">발행월호</label>
                                        <div class="col-lg-6">
                                            <div class="row">
                                                <div class="col-lg-6 fv-row fv-plugins-icon-container w-sm-200px">
                                                    <select name="year" aria-label="년도 선택"
                                                            data-control="select2"
                                                            data-hide-search="true"
                                                            data-placeholder="년도 선택" class="form-select form-select-transparent"
                                                            onchange="onChangeSelectForValidation(this)">
                                                        <option value="">년도 선택</option>
                                                        <c:set var="startYear" value="2025"/>
                                                        <c:forEach begin="0" end="22" step="1" var="i">
                                                            <option value=${startYear - i} <c:if test="${readingReview.year eq (startYear - i)}">selected</c:if>><c:out value="${startYear - i}"/>년</option>
                                                        </c:forEach>
                                                        <option value="2002" <c:if test="${readingReview.year eq '2002'}">selected</c:if>>2002년</option>
                                                    </select>
                                                </div>
                                                <div class="col-lg-6 fv-row fv-plugins-icon-container w-sm-200px">
                                                    <select name="month" aria-label="월호 선택"
                                                            data-control="select2"
                                                            data-hide-search="true"
                                                            data-placeholder="월호 선택" class="form-select form-select-transparent"
                                                            onchange="onChangeSelectForValidation(this)">
                                                        <option value="">월호 선택</option>
                                                        <c:forEach begin="1" end="12" step="1" var="i">
                                                            <option value=${ntUtil:addZero(i)} <c:if test="${readingReview.month eq ntUtil:addZero(i)}">selected</c:if>>${ntUtil:addZero(i)}월호</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-6">
                                        <label class="col-2 col-form-label required fw-bolder w-sm-175px">섬네일</label>
                                        <div class="col">
                                            <div class="fv-row fv-plugins-icon-container col-lg-10 flex-column" id="thumbnailDropzone">
                                                <!-- 파일 업로드 섹션 -->
                                                <jsp:include page="/FileFormINC" flush="false">
                                                    <jsp:param name="fileFormType" value="Y" />
                                                    <jsp:param name="viewType" value="${viewType}" />
                                                    <jsp:param name="isImage" value="true" />
                                                    <jsp:param name="hasOrder" value="false" />
                                                    <jsp:param name="parentTable" value="READING_REVIEW"/>
                                                    <jsp:param name="parentUid" value="${uid}"/>
                                                    <jsp:param name="parentType" value="THUMBNAIL"/>
                                                    <jsp:param name="maxFileCount" value="2"/>
                                                    <jsp:param name="isSecure" value="N"/>
                                                    <jsp:param name="DZID" value="dz0"/>
                                                    <jsp:param name="dropzoneIndex" value="0"/>
                                                    <jsp:param name="description" value="섬네일 이미지는 460px x 618px로 업로드해 주세요.<br>* 파일 크기는 1Mb이하, jpg, jpeg, png 형식의 파일만 가능합니다."/>
                                                </jsp:include>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-6">
                                        <label class="col-2 col-form-label required fw-bolder w-sm-175px">품절여부</label>
                                        <div class="col-lg-3">
                                            <div class="row fv-row">
                                                <div class="col">
                                                    <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                        <input type="radio" id="isSoldOutN" name="isSoldOut" value="N" class="form-check-input" <c:if test="${readingReview.isSoldOut eq 'N' or empty readingReview}">checked</c:if>/>
                                                        <label for="isSoldOutN" class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3">
                                                            N
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                        <input type="radio" id="isSoldOutY" name="isSoldOut" value="Y" class="form-check-input" <c:if test="${readingReview.isSoldOut eq 'Y'}">checked</c:if>/>
                                                        <label for="isSoldOutY" class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3">
                                                            Y
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-6">
                                        <label class="col-2 col-form-label required fw-bolder w-sm-175px">노출여부</label>
                                        <div class="col-lg-3">
                                            <div class="row fv-row">
                                                <div class="col">
                                                    <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                        <input type="radio" id="isOpenN" name="isOpen" value="N" class="form-check-input" <c:if test="${readingReview.isOpen eq 'N' or empty readingReview}">checked</c:if>/>
                                                        <label for="isOpenN" class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3">
                                                            N
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                        <input type="radio" id="isOpenY" name="isOpen" value="Y" class="form-check-input" <c:if test="${readingReview.isOpen eq 'Y'}">checked</c:if>/>
                                                        <label for="isOpenY" class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3">
                                                            Y
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-6">
                                        <label class="col-2 col-form-label required fw-bolder w-sm-175px">인트로 노출여부</label>
                                        <div class="col-lg-3">
                                            <div class="row fv-row">
                                                <div class="col">
                                                    <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                        <input type="radio" id="isIntroN" name="isIntro" value="N" class="form-check-input" <c:if test="${readingReview.isIntro eq 'N' or empty readingReview}">checked</c:if>/>
                                                        <label for="isIntroN" class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3">
                                                            N
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                        <input type="radio" id="isIntroY" name="isIntro" value="Y" class="form-check-input" <c:if test="${readingReview.isIntro eq 'Y'}">checked</c:if>/>
                                                        <label for="isIntroY" class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3">
                                                            Y
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                            </div>
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
                                    <c:if test="${empty readingReview}">
                                    <div data-section="contents">
                                        <div class="row mb-6">
                                            <label class="col-2 col-form-label required fw-bolder fs-6 w-sm-175px">목차명</label>
                                            <div class="col-lg-8">
                                                <div class="row">
                                                    <div class="col-lg-8 fv-row fv-plugins-icon-container">
                                                        <input type="hidden" name="readingReviewContentsIndex" value=""/>
                                                        <input type="text" name="contentsTitle" class="form-control form-control-lg mb-3 mb-lg-0" placeholder="목차명 입력"
                                                               maxlength="100"
                                                               value="">
                                                        <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-6">
                                            <label class="col-2 col-form-label fw-bolder fs-6 w-sm-175px">미리보기</label>
                                            <div class="col-lg-10">
                                                <div class="row">
                                                    <div class="col-lg-10 fv-row fv-plugins-icon-container">
                                                        <input type="text" name="previewUrl" class="form-control form-control-lg mb-3 mb-lg-0" placeholder="URL 경로 입력"
                                                               maxlength="100"
                                                               value="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-6">
                                            <label class="col-2 col-form-label required fw-bolder fs-6 w-sm-175px">세부목차</label>
                                            <div class="col-lg-10" data-name="contentsDetail">
                                                <div data-section="contentsDetail">
                                                    <div class="row align-items-center">
                                                        &#8226;
                                                        <div class="col-lg-5 fv-row fv-plugins-icon-container">
                                                            <input type="text" name="contentsDetail" class="form-control form-control-lg mb-3 mb-lg-0" placeholder="세부목차 입력"
                                                                   maxlength="100"
                                                                   value="">
                                                        </div>:
                                                        <div class="col-lg-5 fv-row fv-plugins-icon-container">
                                                            <input type="hidden" name="readingReviewContentsDetailIndex" value=""/>
                                                            <input type="text" name="contentsDetailTitle" class="form-control form-control-lg mb-3 mb-lg-0" placeholder="제목 입력"
                                                                   maxlength="100"
                                                                   value="">
                                                        </div>
                                                        <div class="col fv-plugins-icon-container">
                                                            <button type="button" class="btn btn-dark me-2" onclick="addContentsDetail(this)">추가+</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </c:if>
                                    <c:forEach items="${readingReview.readingReviewContentsList}" var="readingReviewContents" varStatus="status1">
                                    <div data-section="contents">
                                        <div class="row mb-6">
                                            <label class="col-2 col-form-label required fw-bolder fs-6 w-sm-175px">목차명</label>
                                            <div class="col-lg-8">
                                                <div class="row">
                                                    <div class="col-lg-8 fv-row fv-plugins-icon-container">
                                                        <input type="hidden" name="readingReviewContentsIndex" value="${readingReviewContents.readingReviewContentsIndex}"/>
                                                        <input type="text" name="contentsTitle" class="form-control form-control-lg mb-3 mb-lg-0" placeholder="목차명 입력"
                                                            maxlength="100"
                                                            value="<c:out value="${readingReviewContents.contentsTitle}"/>">
                                                    </div>
                                                    <c:if test="${not status1.first}">
                                                    <div class="col fv-plugins-icon-container">
                                                        <button type="button" class="btn btn-danger me-2" onclick="deleteContentsCard(this)">목차 삭제</button>
                                                    </div>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-6">
                                            <label class="col-2 col-form-label fw-bolder fs-6 w-sm-175px">미리보기</label>
                                            <div class="col-lg-10">
                                                <div class="row">
                                                    <div class="col-lg-10 fv-row fv-plugins-icon-container">
                                                        <input type="text" name="previewUrl" class="form-control form-control-lg mb-3 mb-lg-0" placeholder="URL 경로 입력"
                                                            maxlength="100"
                                                            value="<c:out value="${readingReviewContents.previewUrl}"/>">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-6">
                                            <label class="col-2 col-form-label required fw-bolder fs-6 w-sm-175px">세부목차</label>
                                            <div class="col-lg-10" data-name="contentsDetail">
                                                <c:forEach items="${readingReviewContents.readingReviewContentsDetailList}" var="item" varStatus="status">
                                                <div data-section="contentsDetail">
                                                    <div class="row align-items-center my-2">
                                                        &#8226;
                                                        <div class="col-lg-5 fv-row fv-plugins-icon-container">
                                                            <input type="hidden" name="readingReviewContentsDetailIndex" value="${item.readingReviewContentsDetailIndex}"/>
                                                            <input type="text" name="contentsDetail" class="form-control form-control-lg mb-3 mb-lg-0" placeholder="세부목차 입력"
                                                                maxlength="100"
                                                                value="<c:out value="${item.contentsDetail}"/>">
                                                        </div>:
                                                        <div class="col-lg-5 fv-row fv-plugins-icon-container">
                                                            <input type="text" name="contentsDetailTitle" class="form-control form-control-lg mb-3 mb-lg-0" placeholder="제목 입력"
                                                                maxlength="100"
                                                                value="<c:out value="${item.contentsDetailTitle}"/>">
                                                        </div>
                                                        <div class="col fv-plugins-icon-container">
                                                            <c:if test="${status.first}">
                                                            <button type="button" class="btn btn-dark me-2" onclick="addContentsDetail(this)">추가+</button>
                                                            </c:if>
                                                            <c:if test="${not status.first}">
                                                                <button type="button" class="btn btn-danger me-2" onclick="deleteContentsDetailRow(this)">삭제</button>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                                </c:forEach>

                                            </div>
                                        </div>
                                    </div>
                                    <c:if test="${not status1.last}"><div class="separator my-10"></div></c:if>
                                    </c:forEach>
                                </div>
                                <div class="card-footer d-flex justify-content-center">
                                    <button type="button" class="btn btn-dark" onclick="addContents()">목차 추가+</button>
                                </div>
                            </div>
                            <!-- end :: 목차 정보 카드 -->
                            <br>
                            <!-- begin :: 작성자 정보 카드 및 버튼 영역 -->
                            <div class="card shadow-sm">

                                <div class="card-footer d-flex justify-content-end">
<%--                                    <div class="col d-flex justify-content-start">--%>
<%--                                        <button type="button" class="btn btn-dark" onclick="location.href='/reading-review/reading-review'">목록</button>--%>
<%--                                    </div>--%>
                                    <div class="col d-flex justify-content-end">
                                        <button type="button" class="btn btn-secondary me-3" onclick="history.back();">취소</button>
                                        <button type="button" class="btn btn-warning" onclick="save()">저장</button>
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
<!-- begin :: 목차 추가용 템플릿 -->
<template id="contentsDetailTemplate">
    <div data-section="contentsDetail">
        <div class="row align-items-center my-2">
            &#8226;
            <div class="col-lg-5 fv-row fv-plugins-icon-container">
                <input type="hidden" name="readingReviewContentsDetailIndex" value=""/>
                <input type="text" name="contentsDetail" class="form-control form-control-lg mb-3 mb-lg-0" placeholder="세부목차 입력"
                       maxlength="100"
                       value="">
            </div>:
            <div class="col-lg-5 fv-row fv-plugins-icon-container">
                <input type="text" name="contentsDetailTitle" class="form-control form-control-lg mb-3 mb-lg-0" placeholder="제목 입력"
                       maxlength="100"
                       value="">
            </div>
            <div class="col fv-plugins-icon-container">
                <button type="button" class="btn btn-danger me-2" onclick="deleteContentsDetailRow(this)">삭제</button>
            </div>
        </div>
    </div>
</template>
<!-- end :: 목차 추가용 템플릿 -->

<!-- begin :: 세부목차 추가용 템플릿 -->
<template id="contentsTemplate">
    <div data-section="contents">
        <div class="separator my-10"></div>
        <div class="row mb-6">
            <label class="col-2 col-form-label required fw-bolder fs-6 w-sm-175px">목차명</label>
            <div class="col-lg-8">
                <div class="row">
                    <div class="col-lg-8 fv-row fv-plugins-icon-container">
                        <input type="hidden" name="readingReviewContentsIndex" value=""/>
                        <input type="text" name="contentsTitle" class="form-control form-control-lg mb-3 mb-lg-0" placeholder="목차명 입력"
                            maxlength="100"
                            value="">
                    </div>
                    <div class="col fv-plugins-icon-container">
                        <button type="button" class="btn btn-danger me-2" onclick="deleteContentsCard(this)">목차 삭제</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mb-6">
            <label class="col-2 col-form-label fw-bolder fs-6 w-sm-175px">미리보기</label>
            <div class="col-lg-10">
                <div class="row">
                    <div class="col-lg-10 fv-row fv-plugins-icon-container">
                        <input type="text" name="previewUrl" class="form-control form-control-lg mb-3 mb-lg-0" placeholder="URL 경로 입력"
                            maxlength="100"
                            value="">
                        </div>
                </div>
            </div>
        </div>
        <div class="row mb-6">
            <label class="col-2 col-form-label required fw-bolder fs-6 w-sm-175px">세부목차</label>
            <div class="col-lg-10" data-name="contentsDetail">
                <div class="row align-items-center">
                    &#8226;
                    <div class="col-lg-5 fv-row fv-plugins-icon-container">
                        <input type="hidden" name="readingReviewContentsDetailIndex" value=""/>
                        <input type="text" name="contentsDetail" class="form-control form-control-lg mb-3 mb-lg-0" placeholder="세부목차 입력"
                            maxlength="100"
                            value="">
                    </div>:
                    <div class="col-lg-5 fv-row fv-plugins-icon-container">
                        <input type="text" name="contentsDetailTitle" class="form-control form-control-lg mb-3 mb-lg-0" placeholder="제목 입력"
                            maxlength="100"
                            value="">
                    </div>
                    <div class="col fv-plugins-icon-container">
                        <button type="button" class="btn btn-dark me-2" onclick="addContentsDetail(this)">추가+</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<!-- end :: 세부목차 추가용 템플릿 -->
</body>
<script src="/assets/js/file.js"></script>
<script type="text/javascript">
    const uid = document.querySelector('input[name=uid]').value;
    const VALID_CLASS = '';
    const INVALID_CLASS = 'is-invalid';

    let ntdrop = [];
    let formValidation = null;
    let isValidate = false;

    const contentsTitleValidator = {
        validators: {
            notEmpty: {
                message: '목차명을 입력해 주세요.'
            }
        }
    }
    // const previewUrlValidator = {
    //     validators: {
    //         notEmpty: {
    //             message: '미리보기 URL 을 입력해 주세요.'
    //         }
    //     }
    // }
    const contentsDetailValidator = {
        validators: {
            notEmpty: {
                message: '세부목차를 입력해주세요.'
            }
        }
    }
    const contentsDetailTitleValidator = {
        validators: {
            notEmpty: {
                message: '제목을 입력해주세요.'
            }
        }
    }
    /**
     * 독서 평설용 form validator option object
     *
     * @type {{plugins: {excluded, trigger, bootstrap}, fields: {contentsDetailTitle: {validators: {notEmpty: {message: string}}}, isOpen: {validators: {notEmpty: {message: string}}}, previewUrl: {validators: {notEmpty: {message: string}}}, month: {validators: {notEmpty: {message: string}}}, readingReviewType: {validators: {notEmpty: {message: string}}}, year: {validators: {notEmpty: {message: string}}}, isIntro: {validators: {notEmpty: {message: string}}}, isSoldOut: {validators: {notEmpty: {message: string}}}, contentsDetail: {validators: {notEmpty: {message: string}}}, contentsTitle: {validators: {notEmpty: {message: string}}}}}}
     */
    const formValidationOption = {
        fields: {
            readingReviewType: {
                validators: {
                    notEmpty: {
                        message: '구분을 선택해 주세요.'
                    }
                }
            },
            year: {
                validators: {
                    notEmpty: {
                        message: '년도를 선택해 주세요.'
                    }
                }
            },
            month: {
                validators: {
                    notEmpty: {
                        message: '월호를 선택해 주세요.'
                    }
                }
            },
            isSoldOut: {
                validators: {
                    notEmpty: {
                        message: '품절여부를 선택해 주세요.'
                    }
                }
            },
            isOpen: {
                validators: {
                    notEmpty: {
                        message: '노출여부를 선택해 주세요.'
                    }
                }
            },
            isIntro: {
                validators: {
                    notEmpty: {
                        message: '인트로 노출여부를 선택해 주세요.'
                    }
                }
            },
            contentsTitle: contentsTitleValidator,
            // previewUrl: previewUrlValidator,
            contentsDetail: contentsDetailValidator,
            contentsDetailTitle: contentsDetailTitleValidator,
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
                    if (document.readingReviewForm.querySelector('[name="' + field + '"]') === null) {
                        return true;
                    }
                },
            }),
        }
    }

    /**
     * 윈도우 로드 이벤트
     * - 드롭존 생성
     * - form validator 설정
     */
    window.onload = function() {
        // 첨부파일 드롭존 설정
        ntdrop[0] = global.genDropzone('#dz0', {
            params: {
                'ParentTable': 'READING_REVIEW',
                'ParentType': 'THUMBNAIL',
                'ParentUid': uid,
            },
            hasOrder: false,
            isSecure: 'N',
            maxFileCount: 2,
            acceptedExt: ['.jpg', '.jpeg', '.png', 'webp', 'gif', 'apng', 'bmp'],
            required: 'Y',
            errorMsg : '섬네일을 등록해주세요.',
            containerId : 'thumbnailDropzone',
            dropzoneIdx : 'dz0',
            maxFileSize : 1,
            dropzoneIndex : 0,
            messages : {
                empty : '섬네일을 등록해주세요.',
                accept: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.',
                count: '',
                size: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.'
            }
        });
    }

    /**
     * select2 element 의 validation 을 위해 다음을 추가
     * select2 가 jQuery 객체라 스크립트로 이벤트 바인딩 하려면 jQuery 로 추가해야 바인딩이 잘 됨.
     * 아래 함수는 HTMLElement 에 onchagge attribute 에 걸려 있음.
     * @param obj
     */
    function onChangeSelectForValidation(obj) {
        if (formValidation) formValidation.revalidateField(obj.name);

        if (obj.id === 'readingReviewType') {
            $('select[name=year]').prop('disabled', false).trigger('change');
            $('select[name=month]').prop('disabled', false).trigger('change');
        }
    }

    /**
     * 목차 추가
     */
    function addContents() {
        const readingReviewContentsCard = document.querySelector('#readingReviewContentsCard');
        const contentsTemplate = document.querySelector('#contentsTemplate');
        const component = document.importNode(contentsTemplate.content, true);

        readingReviewContentsCard.append(component);
    }

    /**
     * 세부목차 추가
     *
     * @param obj 세부목자 추가 위치 element
     */
    function addContentsDetail(obj) {

        const contentsDetail = obj.closest('[data-name=contentsDetail]');
        // debugger;
        const contentsDetailTemplate = document.querySelector('#contentsDetailTemplate');
        const component = document.importNode(contentsDetailTemplate.content, true);

        contentsDetail.append(component);
    }

    /**
     * 데이터 저장 함수
     * - 드롭존 파일 업로드 처리
     * - form validation
     * - 데이터 저장 함수 호출
     */
    function save() {
        // validator 초기화
        initFormValidation(true);
        formValidation.validate().then(async function (status) {
            if (status === 'Valid') {
                if(dropzoneCheck()) {
                    uploadByDropzone(0);
                }
            } else {
                dropzoneCheck();
            }
        });
    }

    /**
     * 독서 평설 폼 데이터 전송
     * dropzone 에서 자동 호출됨
     * - 데이터 저장 또는 수정 처리
     *
     *       // 이전 년 월 호차에 등록되어있는 독서평설 있는지 확인 후 없으면 진행
     * @returns {Promise<void>}
     */
    async function saveFormData() {
        // ReadingReview 객체에 FormData 담아서 전송
        let readingReview = {};

        readingReview.readingReviewContentsList = [];

        const formData = new FormData(document.readingReviewForm);

        // 기본정보 처리
        formData.forEach((value, key) => {
            if (key.indexOf('contents') < 0 && key !== 'previewUrl') {
                readingReview[key] = value;
            }
        });

        // 목차정보 처리
        document.querySelectorAll('div[data-section=contents]').forEach( (el) => {
            let readingReviewContents = {};
            readingReviewContents.readingReviewContentsDetailList = [];
            // 목차 기본 정보 처리
            el.querySelectorAll('input').forEach((contentsEl) => {
                if (contentsEl.name.indexOf('contentsDetail') < 0) {
                    readingReviewContents[contentsEl.name] = contentsEl.value;
                }
            });
            // 세부 목차 정보 처리
            el.querySelectorAll('input[name=contentsDetail]').forEach((contentsDetailEl, index) => {
                let readingReviewContentsDetail = {};
                readingReviewContentsDetail.contentsDetail = contentsDetailEl.value;
                readingReviewContentsDetail.contentsDetailTitle = el.querySelectorAll('input[name=contentsDetailTitle]')[index].value;
                readingReviewContentsDetail.readingReviewContentsDetailIndex = el.querySelectorAll('input[name=readingReviewContentsDetailIndex]')[index].value;
                readingReviewContents.readingReviewContentsDetailList.push(readingReviewContentsDetail);
            });
            readingReview.readingReviewContentsList.push(readingReviewContents);
        });

        console.log('readingReview ==== ', readingReview);

        const res2 = await fetch('/api/v1/reading-review/check', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(readingReview)
        });

        const result = await res2.json();
        console.log('result ==== ', result);
        //
        // return;

        let url = '/api/v1/reading-review';
        let method = 'POST';
        let message = '등록되었습니다.';
        let isUpdate = true; // 수정 모드 플래그

        // 수정 모드일 때 변수 조정
        if (document.querySelector('input[name=readingReviewIndex]').value !== '') {
            method = 'PUT';
            url += '/' + uid;
            message = '수정되었습니다.';

            if (result.data === 'true') {
                const confirmation = await Swal.fire({
                    title: '등록 실패',
                    text: '이미 노출되고 있는 인트로가 있습니다. 해당 인트로로 변경하시겠습니까?',
                    icon: 'error',
                    showCancelButton: true,
                    confirmButtonText: '확인',
                    cancelButtonText: '취소',
                    buttonsStyling: !1,
                    customClass: {
                        confirmButton: 'btn btn-primary',
                        cancelButton: 'btn btn-secondary'
                    }
                });

                if (!confirmation.isConfirmed) {
                    isUpdate = false;
                    return;
                } else {
                    isUpdate = true;

                    const reponse = await fetch('/api/v1/reading-review/intro', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                        body: JSON.stringify(readingReview)
                    });

                    const res = await reponse.json();
                }
            }
        }

        if (isUpdate) {
            const response = await fetch(url, {
                method: method,
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(readingReview)
            });

            const res = await response.json();
            console.log(res);
            if(res.result) {
                Swal.fire({
                    title: '등록 완료',
                    text: message,
                    icon: 'success',
                    buttonsStyling: !1,
                    confirmButtonText: '확인',
                    customClass: {confirmButton: 'btn btn-primary'}
                }).then(() => {
                    window.location.href = '/reading-review/reading-review/' + uid;
                });
            }
        }

    }

    /**
     * form validator 초기화
     *
     * @param isValidate
     */
    function initFormValidation(isValidate) {
        if (formValidation !== null) formValidation.destroy();

        // validation 설정
        formValidation = FormValidation.formValidation(document.readingReviewForm, formValidationOption);

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
                    // el.nextSibling.querySelector('span.select2-selection').focus();
                }
            } catch(e) {
                console.log('Cannot find element: ' + name);
            }

            let errorEl = document.querySelector('.' + INVALID_CLASS);
            if (errorEl !== undefined && errorEl !== null) {
                if (errorEl.name.indexOf('contents') >= 0 && document.querySelector('.file_error') !== null) {
                    errorEl = document.querySelector('.file_error');
                }
                errorEl.scrollIntoView({behavior: 'smooth', block: 'center'});
                errorEl.focus();
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
            } catch(e) {
                console.log('Cannot find element: ' + name);
            }
        });

        if (isValidate) formValidation.validate();
    }

    /**
     * 추가된 목차를 제거
     * @param obj
     */
    function deleteContentsCard(obj) {
        obj.closest('[data-section=contents]').remove();
    }

    /**
     * 추가된 세부 목차를 제거
     * @param obj
     */
    function deleteContentsDetailRow(obj) {
        obj.closest('[data-section=contentsDetail]').remove();
    }

    document.addEventListener('DOMContentLoaded', function () {
        if (document.querySelector('#readingReviewType').value === '') {
            $('select[name=year]').prop('disabled', true).trigger('change');
            $('select[name=month]').prop('disabled', true).trigger('change');
        }
    })


</script>
</html>

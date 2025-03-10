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
                        <form id="promotionForm" name="promotionForm">
                            <input type="hidden" id="uid" value="${list.uid}"/>
                            <div class="card mb-5 mb-xl-10">
                                <div class="card-header border-0 pt-5">
                                    <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                        기본정보
                                    </div>
                                </div>
                                <div class="card-body">
                                    <c:if test="${not empty list}">
                                        <div class="row mb-12">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">상태</label>
                                                </div>
                                                <div class="col-lg-10 row">
                                                    <label class="col-lg-9 form-label fw-bolder text-dark pt-3 ">${list.promotionStatus}</label>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>

                                    <c:if test="${empty list}">
                                        <div class="row mb-12">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">구분</label>
                                                </div>
                                                <div class="col-lg-10 row">

                                                    <div class="col-lg-4 d-flex flex-column align-items-start justify-content-start fv-row" id="revisionCurriculumSelect2">
                                                        <select
                                                                id="promotionCategory"
                                                                name="promotionCategory"
                                                                class="form-select form-select-solid unselect-form data"
                                                                data-control="select2"
                                                                data-hide-search="true"
                                                                data-placeholder="선택"
                                                                onchange="togglePromotionCategory(); formSelect2()"

                                                        >
                                                            <option></option>
                                                            <option value="NEW" ${list.promotionCategory eq 'NEW' ? 'selected' : ''}>신규</option>
                                                            <option value="EXTENSION" ${list.promotionCategory eq 'EXTENSION' ? 'selected' : ''}>연장</option>
                                                            <option value="NEW_EXTENSION" ${list.promotionCategory eq 'NEW_EXTENSION' ? 'selected' : ''}>신규 + 연장</option>
                                                            <option value="CONVERSION" ${list.promotionCategory eq 'CONVERSION' ? 'selected' : ''}>전환</option>
                                                        </select>
                                                        <span class="base-input__error" id="revisionCurriculumError"></span>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${not empty list}">
                                        <div class="row mb-12">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">유형</label>
                                                </div>
                                                <div class="col-lg-10 row">

                                                    <label class="col-lg-9 form-label fw-bolder text-dark pt-3 ">${list.promotionCategory}</label>

                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${empty list}">
                                        <div class="row mb-14">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">유형</label>
                                                </div>

                                                <div id="promotionCategoryContainer1" class="col-lg-10 row" style="display: ${list.promotionCategory ne '전환' || empty list ? 'block' : 'none'}">
                                                    <div class="col-lg-6 row">
                                                        <div class="col">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                <input class="form-check-input data" type="radio" name="promotionType" value="BASIC_PREMIUM" id="isBasicPremium" onchange="togglePriceSection()" ${empty list ? 'checked' : list.promotionCategory eq 'isBasicPremium' ? 'checked' : ''} />
                                                                <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isBasicPremium">
                                                                    기본+프리미엄
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                <input class="form-check-input data" type="radio" name="promotionType" value="BASIC" id="isBasic" onchange="togglePriceSection()" ${list.promotionCategory eq 'isBasic' ? 'checked' : ''} />
                                                                <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isBasic">
                                                                    기본형
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                <input class="form-check-input data" type="radio" name="promotionType" value="PREMIUM" id="isPremium" onchange="togglePriceSection()" ${list.promotionCategory eq 'isPremium' ? 'checked' : ''} />
                                                                <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isPremium">
                                                                    프리미엄
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="promotionCategoryContainer2" class="col-lg-10 row" style="display: ${list.promotionCategory eq '전환' ? 'block' : 'none'}">
                                                    <div class="col-lg-6 row">
                                                        <div class="col">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3">
                                                                    기본형 -> 프리미엄
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${not empty list}">
                                        <div class="row mb-14">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">유형</label>
                                                </div>

                                                <div class="col-lg-10 row">
                                                    <label class="col-lg-9 form-label fw-bolder text-dark pt-3 ">${list.promotionType}</label>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>



                                    <div class="row mb-12">
                                        <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                            <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">프로모션 금액</label>
                                        </div>
                                        <div class="col-lg-11">
                                            <c:choose>
                                                <c:when test="${not empty list}">
                                                    <c:if test="${list.promotionType eq '기본형' || list.promotionType eq '기본형 + 프리미엄형'}">
                                                        <div class="row mb-12" id="basicPriceSection">
                                                            <div class="col-lg-12 d-flex align-items-center">
                                                                <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                                    <label class="col-lg-10 form-label fw-bolder text-dark required ">기본형</label>
                                                                </div>
                                                                <div class="col-lg-1">
                                                                    정가
                                                                </div>
                                                                <div class="col-lg-2 fv-row">
                                                                    <input type="number" class="form-control data" placeholder="금액 입력" id="basicOriginalPrice"
                                                                           name="basicOriginalPrice" maxlength="50" value="${list.basicOriginalPrice}" oninput="changePrice(this)">
                                                                </div>
                                                                <div class="col-lg-1">
                                                                    원
                                                                </div>
                                                                <div class="col-lg-1">
                                                                    -
                                                                </div>
                                                                <div class="col-lg-1">
                                                                    할인금액
                                                                </div>
                                                                <div class="col-lg-2 fv-row">
                                                                    <input type="number" class="form-control data" placeholder="금액 입력" id="basicDiscountPrice"
                                                                           name="basicDiscountPrice" maxlength="50" value="${list.basicDiscountPrice}" oninput="changePrice(this)">
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <c:set var="basicOriginalPrice" value="${list.basicOriginalPrice}" />
                                                                    <c:set var="basicDiscountPrice" value="${list.basicDiscountPrice}" />
                                                                    <c:set var="basicTotalPrice" value="${basicOriginalPrice - basicDiscountPrice}" />
                                                                    원 = <span id="basicSubscriptionPrice">정기구독가 <fmt:formatNumber value="${basicTotalPrice}" type="number" groupingUsed="true" /> 원</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${list.promotionCategory eq '전환' || list.promotionType eq '프리미엄형' || list.promotionType eq '기본형 + 프리미엄형'}">
                                                        <div class="row mb-12" id="premiumPriceSection">
                                                            <div class="col-lg-12 d-flex align-items-center">
                                                                <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                                    <label class="col-lg-10 form-label fw-bolder text-dark required">프리미엄</label>
                                                                </div>
                                                                <div class="col-lg-1">
                                                                    정가
                                                                </div>
                                                                <div class="col-lg-2 fv-row">
                                                                    <input type="number" class="form-control data" placeholder="금액 입력" id="premiumOriginalPrice"
                                                                           name="premiumOriginalPrice" maxlength="50" value="${list.premiumOriginalPrice}" oninput="changePrice(this)">
                                                                </div>
                                                                <div class="col-lg-1">
                                                                    원
                                                                </div>
                                                                <div class="col-lg-1">
                                                                    -
                                                                </div>
                                                                <div class="col-lg-1">
                                                                    할인금액
                                                                </div>
                                                                <div class="col-lg-2 fv-row">
                                                                    <input type="number" class="form-control data" placeholder="금액 입력" id="premiumDiscountPrice"
                                                                           name="premiumDiscountPrice" maxlength="50" value="${list.premiumDiscountPrice}" oninput="changePrice(this)">
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <c:set var="premiumOriginalPrice" value="${list.premiumOriginalPrice}" />
                                                                    <c:set var="premiumDiscountPrice" value="${list.premiumDiscountPrice}" />
                                                                    <c:set var="premiumTotalPrice" value="${premiumOriginalPrice - premiumDiscountPrice}" />
                                                                    원 = <span id="premiumSubscriptionPrice">정기구독가 <fmt:formatNumber value="${premiumTotalPrice}" type="number" groupingUsed="true" /> 원</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="row mb-12" id="basicPriceSection">
                                                        <div class="col-lg-12 d-flex align-items-center">
                                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                                <label class="col-lg-10 form-label fw-bolder text-dark required ">기본형</label>
                                                            </div>
                                                            <div class="col-lg-1">
                                                                정가
                                                            </div>
                                                            <div class="col-lg-2 fv-row">
                                                                <input type="number" class="form-control data" placeholder="금액 입력" id="basicOriginalPrice"
                                                                       name="basicOriginalPrice" maxlength="50" value="${list.basicOriginalPrice}" oninput="changePrice(this); limitInputLength(this, 8)">
                                                            </div>
                                                            <div class="col-lg-1">
                                                                원
                                                            </div>
                                                            <div class="col-lg-1">
                                                                -
                                                            </div>
                                                            <div class="col-lg-1">
                                                                할인금액
                                                            </div>
                                                            <div class="col-lg-2 fv-row">
                                                                <input type="number" class="form-control data" placeholder="금액 입력" id="basicDiscountPrice"
                                                                       name="basicDiscountPrice" maxlength="50" value="${list.basicDiscountPrice}" oninput="changePrice(this); limitInputLength(this, 8)">
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <c:set var="basicOriginalPrice" value="${list.basicOriginalPrice}" />
                                                                <c:set var="basicDiscountPrice" value="${list.basicDiscountPrice}" />
                                                                <c:set var="basicTotalPrice" value="${basicOriginalPrice + basicDiscountPrice}" />
                                                                원 = <span id="basicSubscriptionPrice">정기구독가 <fmt:formatNumber value="${list.basicOriginalPrice}" type="number" groupingUsed="true" /> 원</span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row mb-12" id="premiumPriceSection">
                                                        <div class="col-lg-12 d-flex align-items-center">
                                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                                <label class="col-lg-10 form-label fw-bolder text-dark required">프리미엄</label>
                                                            </div>
                                                            <div class="col-lg-1">
                                                                정가
                                                            </div>
                                                            <div class="col-lg-2 fv-row">
                                                                <input type="number" class="form-control data" placeholder="금액 입력" id="premiumOriginalPrice"
                                                                       name="premiumOriginalPrice" value="${list.premiumOriginalPrice}" oninput="changePrice(this); limitInputLength(this, 8)">
                                                            </div>
                                                            <div class="col-lg-1">
                                                                원
                                                            </div>
                                                            <div class="col-lg-1">
                                                                -
                                                            </div>
                                                            <div class="col-lg-1">
                                                                할인금액
                                                            </div>
                                                            <div class="col-lg-2 fv-row">
                                                                <input type="number" class="form-control data" placeholder="금액 입력" id="premiumDiscountPrice"
                                                                       name="premiumDiscountPrice" value="${list.premiumDiscountPrice}" oninput="changePrice(this); limitInputLength(this, 8)">
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <c:set var="premiumOriginalPrice" value="${list.premiumOriginalPrice}" />
                                                                <c:set var="premiumDiscountPrice" value="${list.premiumDiscountPrice}" />
                                                                <c:set var="premiumTotalPrice" value="${premiumOriginalPrice + premiumDiscountPrice}" />
                                                                원 = <span id="premiumSubscriptionPrice">정기구독가 <fmt:formatNumber value="${list.premiumOriginalPrice}" type="number" groupingUsed="true" /> 원</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">프로모션 기간</label>
                                            </div>
                                            <div class="col-lg-10 row">
                                                <div class="col-lg-5 d-flex row">
                                                    <div class="col-lg-2 d-flex align-items-center">
                                                        <label class="col-lg-12 ">시작일시</label>
                                                    </div>
                                                    <div class="col-lg-5 d-flex align-items-center">
                                                        <c:set var="dateTime" value="${fn:split(list.promotionStartDate, ' ')}" />
                                                        <c:set var="sdate" value="${dateTime[0]}" />
                                                        <c:set var="stime" value="${dateTime[1]}" />

                                                        <div class="input-group fv-row">
                                                            <input
                                                                    id="sdate"
                                                                    name="sdate"
                                                                    type="text"
                                                                    class="form-control flatpickr-input data"
                                                                    placeholder="시작일"
                                                                    autocomplete="off"
                                                                    <c:if test="${not empty list}">
                                                                        disabled
                                                                    </c:if>
                                                                    value="<c:out value="${sdate}"/>"
                                                            />
                                                            <span class="input-group-text" id="basic-addon3">
                                                            <i class="bi bi-calendar-check fs-1"></i>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-5 d-flex align-items-center">
                                                        <div class="input-group fv-row">
                                                            <input
                                                                    id="stime"
                                                                    name="stime"
                                                                    type="text"
                                                                    class="form-control flatpickr-input data"
                                                                    placeholder="시작일"
                                                                    autocomplete="off"
                                                                    <c:if test="${not empty list}">
                                                                        disabled
                                                                    </c:if>

                                                                    value="<c:out value="${stime}"/>"
                                                            />
                                                            <span class="input-group-text" id="basic-addon3">
                                                     <i class="bi bi-alarm-fill fs-1"></i>
                                                    </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                    ~
                                                </div>
                                                <div class="col-lg-5 d-flex row">
                                                    <div class="col-lg-2 d-flex align-items-center">
                                                        <label class="col-lg-12 ">종료일시</label>
                                                    </div>
                                                    <div class="col-lg-5 d-flex align-items-center">

                                                        <c:set var="endDateTime" value="${fn:split(list.promotionEndDate, ' ')}" />
                                                        <c:set var="edate" value="${endDateTime[0]}" />
                                                        <c:set var="etime" value="${endDateTime[1]}" />
                                                        <div class="input-group fv-row">
                                                            <input
                                                                    id="edate"
                                                                    name="edate"
                                                                    type="text"
                                                                    class="form-control flatpickr-input data"
                                                                    placeholder="종료일"
                                                                    autocomplete="off"
                                                                    value="<c:out value="${edate}"/>"
                                                            />
                                                            <span class="input-group-text" id="basic-addon3">
                                                    <i class="bi bi-calendar-check fs-1"></i>
                                                    </span>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-5 d-flex align-items-center">
                                                        <div class="input-group fv-row">
                                                            <input
                                                                    id="etime"
                                                                    name="etime"
                                                                    type="text"
                                                                    class="form-control flatpickr-input data"
                                                                    placeholder="시작일"
                                                                    autocomplete="off"
                                                                    value="<c:out value="${etime}"/>"
                                                            />
                                                            <span class="input-group-text" id="basic-addon3">
                                                            <i class="bi bi-alarm-fill fs-1"></i>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">프로모션명</label>
                                            </div>
                                            <div class="col-lg-10" id="showIsTsolUrlN">
                                                <div class="col-lg-12 form-label text-dark">
                                                    <input type="text"  class="form-control data" maxlength="20" placeholder="프로모션명 입력" id="promotionName" name="promotionName" value="${list.promotionName}" >
                                                </div>
                                                <div class="col-12">
                                                    <small class="form-text text-muted">
                                                        * 프로모션명은 공백포함 최대 20자까지 입력 가능하며 입력하지 않을 경우 노출되지 않습니다.
                                                    </small>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">사용여부</label>
                                            </div>
                                            <div class="col-lg-10 row">
                                                <div class="col-lg-2 row">
                                                    <div class="col">
                                                        <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                            <input class="form-check-input data" type="radio" name="isUse" value="N" ${empty list ? 'checked' : list.isUse eq 'N' ? 'checked' : ''}  id="isN" />
                                                            <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isN">
                                                                N
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                            <input class="form-check-input data" type="radio" name="isUse" value="Y" id="isY" ${list.isUse eq 'Y' ? 'checked' : ''} />
                                                            <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isY">
                                                                Y
                                                            </label>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col d-flex align-items-center">
                                                    <small class="form-text text-muted">
                                                        * 진행중인 프로모션의 사용여부를 비노출로 설정한 경우 생성된 URL 주소가 비활성화 처리 됩니다.
                                                    </small>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                                <c:if test="${empty list}">
                                    <div class="card-footer" id="footerIdx">
                                        <div class="row">
                                            <div class="col-12 d-flex justify-content-end">

                                                <a type="button"
                                                   class="btn btn-light-warning me-2"
                                                   style="background-color: #fff3cd; color: #181C32"
                                                   href="/reading-review/promotion"
                                                >
                                                    취소
                                                </a>


                                                <button
                                                        type="button"
                                                        class="btn btn-warning"
                                                        data-type="save"
                                                        style="background-color: #ffcd39; color: #181C32"
                                                        onclick="save(this)"
                                                >
                                                    저장
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>


                            </div>

                            <c:if test="${not empty list}">
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
                                        <div class="row">
                                            <div class="col-12 d-flex justify-content-end">

                                                <a type="button"
                                                   class="btn btn-light-warning me-2"
                                                   style="background-color: #fff3cd; color: #181C32"
                                                   href="/reading-review/promotion/${list.uid}"
                                                >
                                                    취소
                                                </a>
                                                <button
                                                        type="button"
                                                        class="btn btn-warning"
                                                        data-type="modify"
                                                        style="background-color: #ffcd39; color: #181C32"
                                                        onclick="save(this)"
                                                >
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

</body>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script type="text/javascript">

    const VALID_CLASS = '';
    const INVALID_CLASS = 'is-invalid';

    let formValidation = null;
    let isValidate = false;
    let isSubmitCheck = false;
    let invalidFields = [];

    const formValidationOption = {
        fields: {
            promotionCategory: {
                validators: {
                    notEmpty: {
                        message: '* 구분을 선택해주세요.'
                    }
                }
            },
            basicOriginalPrice: {
                validators: {
                    callback: {
                        message: '* 정가 금액을 입력해주세요.',
                        callback: function() {
                            const promotionCategory = document.getElementById('promotionCategory').value.trim();
                            const promotionType = document.querySelector('input[name="promotionType"]:checked').value;
                            const value = document.getElementById('basicOriginalPrice').value.trim();
                            if ((promotionCategory === 'NEW' || promotionCategory === 'EXTENSION' || promotionCategory === 'NEW_EXTENSION') && promotionType === 'PREMIUM') {
                                return true;
                            }

                            if (promotionCategory === 'CONVERSION') {
                                return true;
                            }

                            if (value === '') {
                                return false;
                            }else if (value.length < 2 || value.length > 50) {
                                return false;
                            }

                            return true;
                        }
                    }
                }
            },
            basicDiscountPrice: {
                validators: {
                    callback: {
                        message: '* 할인금액을 입력해주세요.',
                        callback: function() {
                            const promotionCategory = document.getElementById('promotionCategory').value.trim();
                            const promotionType = document.querySelector('input[name="promotionType"]:checked').value;
                            const value = document.getElementById('basicDiscountPrice').value.trim();

                            if ((promotionCategory === 'NEW' || promotionCategory === 'EXTENSION' || promotionCategory === 'NEW_EXTENSION') && promotionType === 'PREMIUM') {
                                return true;
                            }

                            if (promotionCategory === 'CONVERSION') {
                                return true;
                            }
                            if (value === '') {
                                return false;
                            }else if (value.length < 2 || value.length > 50) {
                                return false;
                            }

                            return true;
                        }
                    }
                }
            },
            premiumOriginalPrice: {
                validators: {
                    callback: {
                        message: '* 정가 금액을 입력해주세요.',
                        callback: function() {
                            const promotionCategory = document.getElementById('promotionCategory').value.trim();
                            const promotionType = document.querySelector('input[name="promotionType"]:checked').value;
                            const value = document.getElementById('premiumOriginalPrice').value.trim();

                            console.log('promotionCategory', promotionCategory , 'promotionType ===', promotionType)
                            if ((promotionCategory === 'NEW' || promotionCategory === 'EXTENSION' || promotionCategory === 'NEW_EXTENSION') && promotionType === 'BASIC') {
                                return true;
                            }
                            console.log('----', value.length)
                            if (value === '') {
                                return false;
                            }else if (value.length < 2 || value.length > 50) {
                                return false;
                            }

                            return true;
                        }
                    }
                }
            },
            premiumDiscountPrice: {
                validators: {
                    callback: {
                        message: '* 할인금액을 입력해주세요.',
                        callback: function() {
                            const promotionCategory = document.getElementById('promotionCategory').value.trim();
                            const promotionType = document.querySelector('input[name="promotionType"]:checked').value;
                            const value = document.getElementById('premiumDiscountPrice').value.trim();

                            if ((promotionCategory === 'NEW' || promotionCategory === 'EXTENSION' || promotionCategory === 'NEW_EXTENSION') && promotionType === 'BASIC') {
                                return true;
                            }
                            console.log('----', value.length)
                            if (value === '') {
                                return false;
                            }

                            return true;
                        }
                    }
                }
            },
            sdate: {
                validators: {
                    callback: {
                        message: '* 시간을 선택해주세요.',
                        callback: function() {
                            const value = document.getElementById('sdate').value.trim();
                            console.log('----', value.length)
                            if (value === '') {
                                return false;
                            }

                            return true;
                        }
                    }
                }
            },
            stime: {
                validators: {
                    callback: {
                        message: '* 종료일시를 선택해주세요.',
                        callback: function() {
                            const value = document.getElementById('stime').value.trim();
                            console.log('----', value.length)
                            if (value === '') {
                                return false;
                            }

                            return true;
                        }
                    }
                }
            },
            edate: {
                validators: {
                    callback: {
                        message: '* 시간을 선택해주세요.',
                        callback: function() {
                            const value = document.getElementById('edate').value.trim();
                            console.log('----', value.length)
                            if (value === '') {
                                return false;
                            }

                            return true;
                        }
                    }
                }
            },
            etime: {
                validators: {
                    callback: {
                        message: '* 할인금액을 입력해주세요.',
                        callback: function() {
                            const value = document.getElementById('etime').value.trim();
                            console.log('----', value.length)
                            if (value === '') {
                                return false;
                            }else if (value.length < 2 || value.length > 50) {
                                return false;
                            }

                            return true;
                        }
                    }
                }
            }

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
                    if (document.promotionForm.querySelector('[name="' + field + '"]') === null) {
                        console.log('field:', field)
                        return true;
                    }
                },
            }),
        }
    }

    function initFormValidation(isValidate) {
        console.log('hihih')
        if (formValidation !== null) formValidation.destroy();

        formValidation = FormValidation.formValidation(document.promotionForm, formValidationOption);
        formValidation.on('core.field.invalid', function(name) {
            try {
                const el = document.querySelector('[name=' + name + ']');

                if (el.dataset.control === 'select2') {
                    if (VALID_CLASS) el.nextSibling.querySelector('span.select2-selection').classList.remove(VALID_CLASS);
                    if (INVALID_CLASS) el.nextSibling.querySelector('span.select2-selection').classList.add(INVALID_CLASS);
                }
                if (el.id === 'textBookDetail') {
                    invalidFields.push(document.querySelector('.errorValid'));
                } else {
                    invalidFields.push(el);
                }
            } catch(e) {
                console.log('Cannot find element: ' + name);
            }
        });

        formValidation.on('core.field.valid', function(name) {
            try {
                const el = document.querySelector('[name=' + name + ']');

                if (el.dataset.control === 'select2') {
                    if (INVALID_CLASS) el.nextSibling.querySelector('span.select2-selection').classList.remove(INVALID_CLASS);
                    if (VALID_CLASS) el.nextSibling.querySelector('span.select2-selection').classList.add(VALID_CLASS);
                }

                if (el.id === 'textBookDetail') {
                    invalidFields = invalidFields.filter(field => field !== document.querySelector('.errorValid'));
                } else {
                    invalidFields = invalidFields.filter(field => field.name !== name);
                }
            } catch(e) {
                console.log('Cannot find element: ' + name);
            }
        });




        formValidation.on('core.form.invalid', function() {
            const firstInvalidField = invalidFields.reduce((highest, field) => field.getBoundingClientRect().top < highest.getBoundingClientRect().top ? field : highest);
            if (invalidFields.length > 0) {
                // focusAndScroll(firstInvalidField);
            }
        });

        if (isValidate) formValidation.validate();
    }

    // function focusAndScroll(element) {
    //     setTimeout(() => {
    //         element.focus();
    //         element.scrollIntoView({ behavior: 'smooth', block: 'center' });
    //     }, 100);
    // }


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

    function initializeFlatpickr() {
        const today = new Date();
        const oneMonthLater = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());

        const startDateInput = document.getElementById('sdate');
        const endDateInput = document.getElementById('edate');
        const startTimeInput = document.getElementById('stime');
        const endTimeInput = document.getElementById('etime');

        // 시작일시 기본값 설정 (값이 없는 경우에만)
        if (!startDateInput.value) {
            startDateInput.value = today.toISOString().split('T')[0];
        }
        if (!startTimeInput.value) {
            startTimeInput.value = '00:00';
        }

        // 종료일시 기본값 설정 (값이 없는 경우에만)
        if (!endDateInput.value) {
            endDateInput.value = oneMonthLater.toISOString().split('T')[0];
        }
        if (!endTimeInput.value) {
            endTimeInput.value = '23:59';
        }

        startFlatpickr = flatpickr(startDateInput, {
            dateFormat: 'Y-m-d',
            locale: 'ko',
            onChange: function (selectedDates) {
                if (selectedDates.length > 0) {
                    const maxDate = new Date(selectedDates[0]);
                    maxDate.setFullYear(maxDate.getFullYear() + 1);
                    endFlatpickr.latestSelectedDateObj = maxDate; // 연도 버그 처리
                    endFlatpickr.set('minDate', selectedDates[0]);
                    endFlatpickr.set('maxDate', maxDate);
                }
            }
        });

        endFlatpickr = flatpickr(endDateInput, {
            dateFormat: 'Y-m-d',
            locale: 'ko',
            onChange: function (selectedDates) {
                if (selectedDates.length > 0) {
                    startFlatpickr.set('maxDate', selectedDates[0]);
                }
            }
        });

        startFlatpickr2 = flatpickr(startTimeInput, {
            dateFormat: 'H:i',
            enableTime: true,
            noCalendar: true,
            locale: 'ko',
        });

        endFlatpickr2 = flatpickr(endTimeInput, {
            dateFormat: 'H:i',
            enableTime: true,
            noCalendar: true,
            locale: 'ko',
        });
    }


    function togglePromotionCategory() {
        let promotionType = document.getElementById('promotionCategory').value;

        console.log(promotionType)
        let promotionCategoryContainer1 = document.getElementById('promotionCategoryContainer1');
        let promotionCategoryContainer2 = document.getElementById('promotionCategoryContainer2');
        let basicPriceSection = document.getElementById('basicPriceSection');
        let premiumPriceSection = document.getElementById('premiumPriceSection');

        if (promotionType ==='NEW' || promotionType === 'NEW_EXTENSION' || promotionType === 'EXTENSION' ) {
            togglePriceSection();
            promotionCategoryContainer1.style.display = 'block';
            promotionCategoryContainer2.style.display = 'none';
        } else if (promotionType === 'CONVERSION') {
            basicPriceSection.style.display = 'none';
            premiumPriceSection.style.display = 'block';
            promotionCategoryContainer1.style.display = 'none';
            promotionCategoryContainer2.style.display = 'block';
        }

    }

    function togglePriceSection() {
        let promotionCategory = document.querySelector('input[name="promotionType"]:checked').value;
        let basicPriceSection = document.getElementById('basicPriceSection');
        let premiumPriceSection = document.getElementById('premiumPriceSection');

        if (promotionCategory === 'BASIC_PREMIUM') {
            basicPriceSection.style.display = 'block';
            premiumPriceSection.style.display = 'block';
        } else if (promotionCategory === 'BASIC') {
            basicPriceSection.style.display = 'block';
            premiumPriceSection.style.display = 'none';
        } else if (promotionCategory === 'PREMIUM') {
            basicPriceSection.style.display = 'none';
            premiumPriceSection.style.display = 'block';
        }
    }

    document.addEventListener('DOMContentLoaded', function () {
        initializeFlatpickr();
        const uid = document.getElementById('uid').value;
        if (uid === '') {
            togglePromotionCategory();
            togglePriceSection();

            document.querySelectorAll('input[name="promotionCategory"]').forEach(function(input) {
                input.addEventListener('change', togglePriceSection);
            });
        }
    });


    function changePrice(el) {
        const type = el.name.includes('premium') ? 'premium' : 'basic';
        const originalPriceInput = document.getElementById(type + 'OriginalPrice');
        const discountPriceInput = document.getElementById(type + 'DiscountPrice');
        const subscriptionPriceOutput = document.getElementById(type + 'SubscriptionPrice');

        const originalPrice = Number(originalPriceInput.value) || 0;
        const discountPrice = Number(discountPriceInput.value) || 0;

        if (discountPrice > originalPrice) {
            discountPriceInput.value = originalPrice;
            subscriptionPriceOutput.textContent = '정기구독가 0 원';
        } else {
            const subscriptionPrice = (originalPrice - discountPrice).toLocaleString();
            subscriptionPriceOutput.textContent = '정기구독가 ' + subscriptionPrice + ' 원';
        }
    }

    function limitInputLength(element, maxLength) {
        if (element.value.length > maxLength) {
            element.value = element.value.slice(0, maxLength);
        }
    }

    let isSubmit = false;


    async function save(el) {
        if (isSubmit) {
            return;
        }

        isSubmit = true;
        isSubmitCheck = true;

        initFormValidation(true);
        const status = await formValidation.validate();
        console.log('Validation status:', status);

        if (status === 'Invalid') {

            isSubmit = false;
            return;
        }


        let inputs = document.querySelectorAll('.data');
        let apiType = el.getAttribute('data-type');
        let formData = {};

        inputs.forEach(function(input) {
            let key = input.name || input.id;
            if (key) {
                if (input.type === 'radio') {
                    if (input.checked) {
                        formData[key] = input.value;
                    }
                } else {
                    formData[key] = input.value;
                }
            }
        });

        if (formData['sdate'] && formData['stime']) {
            formData['promotionStartDate'] = formData['sdate'] + ' ' + formData['stime'];
            delete formData['sdate'];
            delete formData['stime'];
        }

        if (formData['edate'] && formData['etime']) {
            formData['promotionEndDate'] = formData['edate'] + ' ' + formData['etime'];
            delete formData['edate'];
            delete formData['etime'];
        }

        console.log(formData['promotionStartDate']);

        let method = 'POST';
        let url = '/api/v1/reading-review/promotion';
        let uid = '';
        if (apiType === 'modify') {
            uid = document.getElementById('uid').value;
            url += '/' + uid;
            method = 'PUT';
        }

        console.log(formData);

        const result = await sendRequest(url, method, formData);
        isSubmit = false;

        if (result && result.result === true) {
            Swal.fire({
                title: '등록 완료',
                text: '등록되었습니다.',
                icon: 'success',
                confirmButtonText: '확인'
            }).then((swalResult) => {
                if (swalResult.isConfirmed && apiType === 'save') {
                    location.href = '/reading-review/promotion';
                } else if (swalResult.isConfirmed && apiType === 'modify') {
                    location.href = '/reading-review/promotion/' + uid;
                }
            });
        } else {
            Swal.fire({
                title: '등록 실패',
                text: '등록 처리에 실패하였습니다. 다시 시도해주세요.',
                icon: 'error',
                confirmButtonText: '확인'
            });
        }
    }

    async function sendRequest(url, method, body) {
        try {
            const response = await fetch(url, {
                method: method,
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(body)
            });
            return await response.json();
        } catch (e) {
            console.error(e);
            return { result: false };
        }
    }



</script>
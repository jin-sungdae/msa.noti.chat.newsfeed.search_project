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
                        <form>
                            <div class="card mb-5 mb-xl-10">
                                <div class="card-header border-0 pt-5">
                                    <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                        견본신청 관리
                                    </div>
                                </div>
                                <div class="card-body">

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-3 row">
                                                <div class="col-lg-4  d-flex align-items-center justify-content-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">학급</label>
                                                </div>
                                                <div class="col-lg-8 row">
                                                    <div class="col-lg-12 form-label text-primary fw-bolder fs-6 pt-3">
                                                        <c:out value="${list.school}"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 row">
                                                <div class="col-lg-4  d-flex align-items-center justify-content-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">과목</label>
                                                </div>
                                                <div class="col-lg-8 row">
                                                    <div class="col-lg-12 form-label text-primary fw-bolder fs-6 pt-3">
                                                        <c:out value="${list.subject}"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 row">
                                                <div class="col-lg-4  d-flex align-items-center justify-content-center">
                                                    <label class="col-lg-4 form-label fw-bolder text-dark pt-3 ">교재명</label>
                                                </div>
                                                <div class="col-lg-8 row">
                                                    <div class="col-lg-12 form-label text-primary fw-bolder fs-6 pt-3">
                                                        <c:out value="${list.referenceBookTitle}"/> (<c:out value="${list.bookCode}"/>)
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
                                            신청자 정보
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="row mb-8">

                                            <div class="col-lg-12 row">
                                                <div class="col-lg-6 row">
                                                    <div class="col-lg-4  d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">이름</label>
                                                    </div>
                                                    <div class="col-lg-8 row">
                                                        <div class="col-lg-12 form-label text-dark fs-6 pt-3">
                                                            <c:out value="${list.requestUserName}"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 row">
                                                    <div class="col-lg-4  d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">신청일시</label>
                                                    </div>
                                                    <div class="col-lg-8 row">
                                                        <div class="col-lg-12 form-label text-dark fs-6 pt-3">
                                                            <c:out value="${list.regDate}"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-6 row">
                                                    <div class="col-lg-4  d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">휴대폰 번호</label>
                                                    </div>
                                                    <div class="col-lg-8 row">
                                                        <div class="col-lg-12 form-label text-dark fs-6 pt-3">
                                                            <c:out value="${list.requestMobileNo}"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 row">
                                                    <div class="col-lg-4  d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">전화번호</label>
                                                    </div>
                                                    <div class="col-lg-8 row">
                                                        <div class="col-lg-12 form-label text-dark fs-6 pt-3">
                                                            <c:out value="${list.requestPhoneNo}"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-8">

                                            <div class="col-lg-12 row">
                                                <div class="col-lg-6 row">
                                                    <div class="col-lg-4  d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">이메일 주소</label>
                                                    </div>
                                                    <div class="col-lg-8">
                                                        <div class="col-lg-12 form-label text-dark pt-3 fs-6">
                                                            <c:out value="${list.requestEmail}"/>
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
                                            배송지 정보
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-6 row">
                                                    <div class="col-lg-4  d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">이름</label>
                                                    </div>
                                                    <div class="col-lg-8 row">
                                                        <div class="col-lg-12 form-label text-dark pt-3 fs-6">
                                                            <c:out value="${list.deliveryUserName}"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-6 row">
                                                    <div class="col-lg-4  d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">휴대폰 번호</label>
                                                    </div>
                                                    <div class="col-lg-8 row">
                                                        <div class="col-lg-12 form-label pt-3 fs-6">
                                                            <c:out value="${list.deliveryMobileNo}"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 row">
                                                    <div class="col-lg-4  d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">전화번호</label>
                                                    </div>
                                                    <div class="col-lg-8">
                                                        <div class="col-lg-12 form-label pt-3 fs-6">
                                                            <c:out value="${list.deliveryPhoneNo}"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-6 row">
                                                    <div class="col-lg-4  d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">우편번호</label>
                                                    </div>
                                                    <div class="col-lg-8">
                                                        <div class="col-lg-12 form-label pt-3 fs-6">
                                                            <c:out value="${list.zipCode}"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-6 row">
                                                    <div class="col-lg-4  d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">배송지 주소</label>
                                                    </div>
                                                    <div class="col-lg-8">
                                                        <div class="col-lg-12 form-label pt-3 fs-6">
                                                            <c:out value="${list.address1}"/> <c:out value="${list.address2}"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-6 row">
                                                    <div class="col-lg-4  d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">학교/학원명</label>
                                                    </div>
                                                    <div class="col-lg-8">
                                                        <div class="col-lg-12 form-label pt-3 fs-6">
                                                            <c:out value="${list.schoolName}"/>
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
                                            배송관리
                                        </div>
                                    </div>
                                    <div class="card-body" id="normalForm">
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-6 row">
                                                    <div class="col-lg-4  d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">상태</label>
                                                    </div>

                                                    <div class="col-lg-8">
                                                        <div class="col-lg-12 form-label text-danger fw-bolder pt-3 fs-6">
                                                            <c:out value="${list.requestStatus}"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 row">
                                                    <div class="col-lg-4 d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">발송/취소일시</label>
                                                    </div>

                                                    <div class="col-lg-8">
                                                        <div class="col-lg-12 form-label pt-3 fs-6">
                                                            <c:if test="${list.requestStatus eq '신청대기' or empty list.modDate}">
                                                                <c:out value="-"/>
                                                            </c:if>
                                                            <c:if test="${list.requestStatus ne '신청대기'}">
                                                                <c:out value="${list.modDate}"/>
                                                            </c:if>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-6 row">
                                                    <div class="col-lg-4 d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">발송수단</label>
                                                    </div>

                                                    <div class="col-lg-8">
                                                        <div class="col-lg-12 form-label pt-3 fs-6">
                                                            <c:if test="${list.requestStatus eq '신청대기' or empty list.deliveryMethod}">
                                                                <c:out value="-"/>
                                                            </c:if>
                                                            <c:if test="${list.requestStatus ne '신청대기'}">
                                                                <c:if test="${list.deliveryMethod eq '기타'}">
                                                                    <c:out value="송장번호(로젠택배) ${list.deliveryNo}"/>
                                                                </c:if>
                                                                <c:if test="${list.deliveryMethod ne '기타'}">
                                                                    <c:out value="${list.deliveryMethod}"/>
                                                                </c:if>

                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-6 row">
                                                    <div class="col-lg-4 d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">유의사항</label>
                                                    </div>

                                                    <div class="col-lg-8">
                                                        <div class="col-lg-12 form-label pt-3 fs-6">
                                                            <c:if test="${list.requestStatus eq '신청대기' or empty list.note}">
                                                                <c:out value="-"/>
                                                            </c:if>
                                                            <c:if test="${list.requestStatus ne '신청대기'}">
                                                                <c:out value="${list.note}"/>
                                                            </c:if>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-6 row">
                                                    <div class="col-lg-4 d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">SMS 발송여부</label>
                                                    </div>

                                                    <div class="col-lg-8">
                                                        <div class="col-lg-12 form-label pt-3 fs-6">
                                                            <c:if test="${list.requestStatus eq '신청대기' or empty list.isSMS}">
                                                                <c:out value="-"/>
                                                            </c:if>
                                                            <c:if test="${list.requestStatus ne '신청대기'}">
                                                                <c:out value="${list.isSMS}"/>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 row">
                                                    <div class="col-lg-4  d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">SMS 발송번호</label>
                                                    </div>

                                                    <div class="col-lg-8">
                                                        <div class="col-lg-12 form-label text-dark pt-3 fs-6">
                                                            <c:if test="${list.requestStatus eq '신청대기' or empty list.SMSPhoneNo}">
                                                                <c:out value="-"/>
                                                            </c:if>
                                                            <c:if test="${list.requestStatus ne '신청대기'}">
                                                                <c:out value="${list.SMSPhoneNo}"/>
                                                            </c:if>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-2  d-flex align-items-center justify-content-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">SMS 발송 메시지</label>
                                                </div>
                                                <div class="col-lg-10">
                                                    <div class="col-lg-12 form-label pt-3 fs-6">
                                                        <c:if test="${list.requestStatus eq '신청대기' or empty list.SMSContent}">
                                                            <c:out value="-"/>
                                                        </c:if>
                                                        <c:if test="${list.requestStatus ne '신청대기'}">
                                                            <c:out value="${list.SMSContent}"/>
                                                        </c:if>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="card-body" id="modifyForm" style="display: none;">
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-6 row">
                                                    <div class="col-lg-4  d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">상태</label>
                                                    </div>

                                                    <div class="col-lg-8 row pt-0">
                                                        <div class="col">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                <input class="form-check-input" type="radio" name="isRequestStatus" value="WAIT" ${list.requestStatus eq '신청대기' ? 'checked' : ''} id="isRequestStatusWait" onclick="changeDeliveryMethod()"/>
                                                                <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isRequestStatusWait">
                                                                    신청대기
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                <input class="form-check-input" type="radio" name="isRequestStatus" value="SEND" ${list.requestStatus eq '발송' ? 'checked' : ''} id="isRequestStatusSend" onclick="changeDeliveryMethod()"/>
                                                                <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isRequestStatusSend">
                                                                    발송
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                <input class="form-check-input" type="radio" name="isRequestStatus" value="CANCELLATION" ${list.requestStatus eq '취소' ? 'checked' : ''} id="isRequestStatusCancellation" onclick="changeDeliveryMethod()"/>
                                                                <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isRequestStatusCancellation">
                                                                    취소
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                <input class="form-check-input" type="radio" name="isRequestStatus" value="REQUEST_CANCELLATION" ${list.requestStatus eq '취소요청' ? 'checked' : ''} id="isRequestStatusRequestCancellation" onclick="changeDeliveryMethod()"/>
                                                                <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isRequestStatusRequestCancellation">
                                                                    취소요청
                                                                </label>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-8 row">
                                                    <div class="col-lg-4  d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">발송수단  ${list.deliveryMethod}</label>
                                                    </div>

                                                    <div class="col-lg-8 row pt-0">
                                                        <div class="col">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                ${list.deliveryMethod}
                                                                <input class="form-check-input" type="radio" name="isDeliveryMethod" value="PARCEL" ${list.deliveryMethod eq '택배' ? 'checked' : ''} id="parcel" onclick="changeDeliveryNo()" ${list.requestStatus eq '취소' || list.requestStatus eq '취소요청' ? 'disabled' : ''}/>
                                                                <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="parcel">
                                                                    택배
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                <input class="form-check-input" type="radio" name="isDeliveryMethod" value="POST" ${list.deliveryMethod eq '우편' ? 'checked' : ''} id="post" onclick="changeDeliveryNo()" ${list.requestStatus eq '취소' || list.requestStatus eq '취소요청' ? 'disabled' : ''}/>
                                                                <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="post">
                                                                    우편
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                <input class="form-check-input" type="radio" name="isDeliveryMethod" value="ETC" ${list.deliveryMethod eq '기타' ? 'checked' : ''} id="etc" onclick="changeDeliveryNo()" ${list.requestStatus eq '취소' || list.requestStatus eq '취소요청' ? 'disabled' : ''}/>
                                                                <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="etc">
                                                                    기타 / 송장번호(로젠택배)
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input
                                                            id="deliveryNo"
                                                            type="text"
                                                            class="form-control"
                                                            disabled
                                                            value="<c:out value="${list.deliveryNo}"/>"
                                                    />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-8 row">
                                                    <div class="col-lg-4  d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">유의사항</label>
                                                    </div>

                                                    <div class="col-lg-8 row pt-0">
                                                        <div class="col">
                                                                <textarea
                                                                        id="note"
                                                                        class="form-control"
                                                                        rows="3"
                                                                        placeholder="유의사항을 입력해주세요."
                                                                ><c:out value="${list.note}"/></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-6 row">
                                                    <div class="col-lg-4  d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">SMS 발송여부</label>
                                                    </div>
                                                    <div class="col-lg-8 row pt-0">
                                                        <div class="col">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                <input class="form-check-input" type="radio" name="isSMS" value="Y" ${list.isSMS eq 'Y' ? 'checked' : ''} id="isSMSY" onclick="changeSMSIsUse()"/>
                                                                <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isSMSY">
                                                                    Y
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                <input class="form-check-input" type="radio" name="isSMS" value="N" ${list.isSMS eq 'N' ? 'checked' : ''} id="isSMSN" onclick="changeSMSIsUse()"/>
                                                                <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isSMSN">
                                                                    N
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-6 row">
                                                    <div class="col-lg-4  d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">SMS 발송번호</label>
                                                    </div>
                                                    <div class="col-lg-8 row pt-0">
                                                        <input
                                                                id="SMSPhoneNo"
                                                                type="text"
                                                                class="form-control"
                                                        ${list.isSMS eq 'N' ? 'disabled' : ''}
                                                                value="<c:out value="${list.SMSPhoneNo}"/>"
                                                        />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-6 row">
                                                    <div class="col-lg-4 d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">SMS 발송 메시지</label>
                                                    </div>

                                                    <div class="col-lg-8 row pt-0">
                                                        <input
                                                                id="SMSContent"
                                                                type="text"
                                                                class="form-control"
                                                        ${list.isSMS eq 'N' ? 'disabled' : ''}
                                                                value="<c:out value="${list.SMSContent}"/>"
                                                        />

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer" id="footerIdx">
                                        <div class="row">
                                            <div id="listGroup" class="col-3">
                                                <a type="button" class="btn btn-light-dark" style="background-color: #343a40; color: #FFFFFF" href="/reference-book/sample-request?page=${reqParam.page}&perPage=${reqParam.perPage}&sdate=${reqParam.sdate}&edate=${reqParam.edate}&clazz=${reqParam.clazz}&subject=${reqParam.subject}&requestStatus=${reqParam.requestStatus}&search=${reqParam.search}">목록</a>
                                            </div>
                                            <div id="modifyButton" class="col-9 d-flex justify-content-end">
                                                <a type="button" class="btn btn-warning" style="background-color: #ffcd39; color: #181C32" href="/reference-book/sample-request-form/${list.idx}">
                                                    수정
                                                </a>
                                            </div>
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

</body>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script type="text/javascript">



    /**************************************************** UTILS ***************************************/


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



    /********************************************************************** POST ************************************************/
    let isSubmitting = false;

    async function save(element) {
        if (isSubmitting) {
            return;
        }
        isSubmitting = true;
        let uid = element.getAttribute('data-uid');
        let data = {
            isSMS: document.getElementById('isSMS').checked ? 'Y' : 'N',
            isMailing: document.getElementById('isMailing').checked ? 'Y' : 'N',
            textbookOrderCount: document.getElementById('textbookOrderCount').value,
        }


        try {
            const response = await fetch('/api/v1/user/' + uid + '/etc', {
                method: 'PATCH',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            });

            const result = await response.json();

            if (result.data == 'true') {
                Swal.fire({
                    title: '등록 완료',
                    text: '등록되었습니다.',
                    icon: 'success',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.reload();
                    }
                })
            } else if (result.data == 'false') {
                Swal.fire({
                    title: '등록 실패',
                    text: '등록 처리에 실패되었습니다. \n다시 시도해주세요.',
                    icon: 'error',
                    confirmButtonText: '확인'
                })
            }
        } catch (Exception) {
            console.error(Exception);
        } finally {
            isSubmitting = false;
        }
    }

    /******************************************************************* PUT ************************************************/

    let isModified = false;

    async function modify() {
        const modifyButton = document.getElementById('modifyButton');
        const updateButton = document.getElementById('updateButton');
        const normalForm = document.getElementById('normalForm');
        const modifyForm = document.getElementById('modifyForm');

        normalForm.style.display = 'none';
        modifyForm.style.display = 'block';

        updateButton.classList.add('col-9', 'd-flex', 'justify-content-end');
        modifyButton.classList.remove('col-9', 'd-flex', 'justify-content-end');

        modifyButton.style.display = 'none';
        updateButton.style.display = 'block';
    }

    async function cancel() {
        const modifyButton = document.getElementById('modifyButton');
        const updateButton = document.getElementById('updateButton');
        const normalForm = document.getElementById('normalForm');
        const modifyForm = document.getElementById('modifyForm');

        normalForm.style.display = 'block';
        modifyForm.style.display = 'none';

        modifyButton.classList.add('col-9', 'd-flex', 'justify-content-end');
        updateButton.classList.remove('col-9', 'd-flex', 'justify-content-end');

        modifyButton.style.display = 'block';
        updateButton.style.display = 'none';
    }

    async function changeDeliveryNo() {
        const deliveryNo = document.getElementById('deliveryNo');
        const etc = document.getElementById('etc');

        if (etc.checked) {
            deliveryNo.disabled = false;
        } else {
            deliveryNo.disabled = true;
        }
    }

    async function changeDeliveryMethod() {
        const isRequestStatusCancellation = document.getElementById('isRequestStatusCancellation');
        const isRequestStatusRequestCancellation = document.getElementById('isRequestStatusRequestCancellation');

        const parcel = document.getElementById('parcel');
        const post = document.getElementById('post');
        const etc = document.getElementById('etc');

        if (isRequestStatusCancellation.checked || isRequestStatusRequestCancellation.checked) {
            parcel.disabled = true;
            post.disabled = true;
            etc.disabled = true;
        } else {
            parcel.disabled = false;
            post.disabled = false;
            etc.disabled = false;
        }
    }

    async function changeSMSIsUse() {
        const isSMSY = document.getElementById('isSMSY');
        const isSMSN = document.getElementById('isSMSN');

        const SMSPhoneNo = document.getElementById('SMSPhoneNo');
        const SMSContent = document.getElementById('SMSContent');

        if (isSMSY.checked) {
            SMSPhoneNo.disabled = false;
            SMSContent.disabled = false;
        } else {
            SMSPhoneNo.disabled = true;
            SMSContent.disabled = true;
        }
    }

    async function update(element) {

        if (isSubmitting) {
            return;
        }
        isSubmitting = true;

        const idx = element.getAttribute('data-id');

        const requestStatus = document.querySelector('input[name="isRequestStatus"]:checked').value;
        let deliveryMethod =  document.querySelector('input[name="isDeliveryMethod"]:checked') ? document.querySelector('input[name="isDeliveryMethod"]:checked').value : '';
        let deliveryNo = document.getElementById('deliveryNo') ? document.getElementById('deliveryNo').value : '';
        const note = document.getElementById('note').value;
        const isSMS = document.querySelector('input[name="isSMS"]:checked').value;
        const SMSPhoneNo = document.getElementById('SMSPhoneNo').value;
        const SMSContent = document.getElementById('SMSContent').value;

        let data = {
            idx : idx,
            requestStatus: requestStatus,
            deliveryMethod: deliveryMethod,
            deliveryNo: deliveryNo,
            note: note,
            isSMS: isSMS,
            smsPhoneNo: SMSPhoneNo,
            smsContent: SMSContent
        }

        console.log(data)

        try {
            const response = await fetch('/api/v1/sample-request/' + idx, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            });

            const result = await response.json();
            if (result.result === false) {
                const resultData = result.message;
                if (resultData.includes("Validation error - ")) {
                    let errorMsg = resultData.split('Validation error - ')[1].replace(/\n/g, '<br>');
                    Swal.fire({
                        title : '등록 실패',
                        html : errorMsg,
                        icon : 'error',
                        confirmButtonText : '확인'
                    });
                } else  {
                    Swal.fire({
                        title: '등록 실패',
                        text: '등록 처리에 실패되었습니다. \n다시 시도해주세요.',
                        icon: 'error',
                        confirmButtonText: '확인'
                    });
                }
            } else if (result.result == true) {
                Swal.fire({
                    title: '등록 완료',
                    text: '등록되었습니다.',
                    icon: 'success',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.reload();
                    }
                })

            }
        } catch (Exception) {
            console.error(Exception);
        }
    }





    /**************************************************************** GET ***************************************************************/


    /*********************************************************** Modal 영역 ********************************************/



</script>
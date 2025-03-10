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
                        <form id="sampleRequestForm" name="sampleRequestForm">
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
                                                    <div class="col-lg-12 form-label text-dark fs-6 pt-3">
                                                        <c:out value="${list.school}"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 row">
                                                <div class="col-lg-4  d-flex align-items-center justify-content-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">과목</label>
                                                </div>
                                                <div class="col-lg-8 row">
                                                    <div class="col-lg-12 form-label text-dark fs-6 pt-3">
                                                        <c:out value="${list.subject}"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 row">
                                                <div class="col-lg-4  d-flex align-items-center justify-content-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">교재명</label>
                                                </div>
                                                <div class="col-lg-8 row">
                                                    <div class="col-lg-12 form-label text-dark fs-6 pt-3">
                                                        <c:out value="${list.referenceBookTitle}"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <table class="table table-row-bordered gy-5" id="faqCommonTable">
                                        <!--begin::Table head-->
                                        <thead>
                                        <!--begin::Table row-->
                                        <tr class="fw-semibold fs-6 text-muted">
                                            <th class="min-w-30px form-label fw-bolder text-dark fs-4" style="text-align: center;">학급</th>
                                            <th class="min-w-30px form-label fw-bolder text-dark fs-4" style="text-align: center;">과목</th>
                                            <th class="min-w-120px form-label fw-bolder text-dark fs-4" style="text-align: center;">교재명</th>
                                        </tr>
                                        <!--end::Table row-->
                                        </thead>
                                        <!--end::Table head-->
                                        <!--begin::Table body-->
                                        <tbody>
                                            <tr>
                                                <td class="text-dark fw-bold text-hover-warning hoverable  fs-6"
                                                    data-uid="${list.idx}"
                                                    name="userType"
                                                    style="text-align: center;"
                                                >
                                                    <c:out value="${list.school}"/>
                                                </td>
                                                <td class="text-dark text-hover-warning fw-bold hoverable  fs-6"
                                                    data-uid="${list.idx}"
                                                    name="name"
                                                    style="text-align: center;"
                                                >
                                                    <c:out value="${list.subject}"/>
                                                </td>
                                                <td class="text-dark text-hover-warning fw-bold hoverable fs-6"
                                                    data-uid="${list.idx}"
                                                    name="userId"
                                                    style="text-align: center;"
                                                >
                                                    <c:out value="${list.referenceBookTitle}"/>
                                                </td>
                                            </tr>
                                        </tbody>
                                        <!--end::Table body-->
                                    </table>
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

                                    <div class="card-body" id="modifyForm">
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
                                                <div class="col-lg-6 row">
                                                    <div class="col-lg-4  d-flex align-items-center justify-content-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">발송수단</label>
                                                    </div>

                                                    <div class="col-lg-8 row pt-0">
                                                        <div class="col-lg-3">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                <input class="form-check-input" type="radio" name="isDeliveryMethod" value="PARCEL" ${list.deliveryMethod eq '택배' || empty list.deliveryMethod  ? 'checked' : ''} id="parcel" onclick="changeDeliveryNo()" ${list.requestStatus eq '취소' || list.requestStatus eq '취소요청' ? 'disabled' : ''}/>
                                                                <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="parcel">
                                                                    택배
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                <input class="form-check-input" type="radio" name="isDeliveryMethod" value="POST" ${list.deliveryMethod eq '우편' ? 'checked' : ''} id="post" onclick="changeDeliveryNo()" ${list.requestStatus eq '취소' || list.requestStatus eq '취소요청' ? 'disabled' : ''}/>
                                                                <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="post">
                                                                    우편
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6">
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
                                                <div class="col-lg-2  d-flex align-items-center justify-content-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">유의사항</label>
                                                </div>

                                                <div class="col-lg-10 row pt-0">
                                                    <div class="col">
                                                                <input
                                                                        id="note"
                                                                        class="form-control"
                                                                        placeholder="유의사항을 입력해주세요."
                                                                        value="${list.note}"
                                                                >
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
                                                        <div class="col-lg-3">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                <input class="form-check-input" type="radio" name="isSMS" value="Y" ${list.isSMS eq 'Y' ? 'checked' : ''} id="isSMSY" onclick="changeSMSIsUse()"/>
                                                                <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isSMSY">
                                                                    Y
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3">
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
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3  required">SMS 발송번호</label>
                                                    </div>
                                                    <div class="col-lg-8 row pt-0 fv-row">
                                                        <input
                                                                id="SMSPhoneNo"
                                                                name="SMSPhoneNo"
                                                                type="text"
                                                                class="form-control"
                                                                maxlength="13"
                                                                ${list.isSMS eq 'N' ? 'disabled' : ''}
                                                                value="<c:out value="${list.SMSPhoneNo}"/>"
                                                        />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">

                                                <div class="col-lg-2 d-flex align-items-center justify-content-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3  required">SMS 발송 메시지</label>
                                                </div>



                                                <div class="col-lg-10 row pt-0 fv-row">
                                                    <input
                                                            id="SMSContent"
                                                            name="SMSContent"
                                                            type="text"
                                                            class="form-control"
                                                            maxlength="70"
                                                    ${list.isSMS eq 'N' ? 'disabled' : ''}
                                                            value="<c:out value="${list.SMSContent}"/>"
                                                    />

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer" id="footerIdx">
                                        <div class="row">
                                            <div id="editGroup" class="col-12 d-flex justify-content-end">
                                                <a
                                                        data-uid="${list.idx}"
                                                        type="button"
                                                        class="btn btn-light-warning me-2"
                                                        href="/reference-book/sample-request/${list.idx}">
                                                    취소
                                                </a>
                                                <button
                                                        data-id = "${list.idx}"
                                                        type="button"
                                                        class="btn btn-warning"
                                                        style="background-color: #ffcd39; color: #181C32;"
                                                        onclick="update(this)"
                                                >
                                                    저장
                                                </button>
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


    const VALID_CLASS = '';
    const INVALID_CLASS = 'is-invalid';

    let formValidation = null;
    let isValidate = false;

    const formValidationOption = {
        fields : {
            SMSPhoneNo : {
                validators : {
                    callback : {
                        message : '* 휴대폰 번호를 입력해주세요.',
                        callback: function() {
                            const isRequestStatus = document.querySelector('input[name="isRequestStatus"]:checked').value;
                            const isSMS = document.querySelector('input[name="isSMS"]:checked').value;
                            if ((isRequestStatus === 'SEND' || isRequestStatus === 'CANCELLATION' || isRequestStatus === 'REQUEST_CANCELLATION') && isSMS === 'Y') {
                                if (document.getElementById('SMSPhoneNo').value === '') {
                                    return {
                                        valid: false,
                                        message: '* 휴대폰 번호를 입력해주세요.'
                                    };
                                } else if (document.getElementById('SMSPhoneNo').value.length < 12) {
                                    return {
                                        valid: false,
                                        message: '* 휴대폰 번호를 정확하게 입력해주세요.'
                                    };
                                }
                            }
                            return true;
                        }
                    }
                }
            },
            SMSContent: {
                validators: {
                    callback: {
                        message: '* SMS 발송할 메시지를 입력해주세요.',
                        callback: function() {
                            const isRequestStatus = document.querySelector('input[name="isRequestStatus"]:checked').value;
                            const isSMS = document.querySelector('input[name="isSMS"]:checked').value;
                            console.log('isRequestStatus' , isRequestStatus, 'isSMS', isSMS);
                            if ((isRequestStatus === 'SEND' || isRequestStatus === 'CANCELLATION' || isRequestStatus === 'REQUEST_CANCELLATION') && isSMS === 'Y') {
                                return document.getElementById('SMSContent').value !== '';
                            } else {
                                return true;
                            }
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
                    if (document.sampleRequestForm.querySelector('[name="' + field + '"]') === null) {
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
        console.log('hihih2')

        // validation 설정
        // console.log(document.bookTriggerForm)
        // console.log(formValidationOption)
        formValidation = FormValidation.formValidation(document.sampleRequestForm, formValidationOption);
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

    /**************************************************** UTILS ***************************************/


    window.onbeforeunload = function() {
        if (isModified) {
            return "변경 사항을 저장하지 않았습니다. 정말 지금 나가시겠습니까?";
        }
    };

    document.addEventListener('DOMContentLoaded', function() {
        const isRequestStatusWait = document.getElementById('isRequestStatusWait');
        const isRequestStatusCancellation = document.getElementById('isRequestStatusCancellation');
        const isRequestStatusRequestCancellation = document.getElementById('isRequestStatusRequestCancellation');
        const isRequestStatusSend = document.getElementById('isRequestStatusSend');

        const parcel = document.getElementById('parcel');
        const post = document.getElementById('post');
        const etc = document.getElementById('etc');
        const note = document.getElementById('note');
        const SMSPhoneNo = document.getElementById('SMSPhoneNo');
        const SMSContent = document.getElementById('SMSContent');
        const isSMSY = document.getElementById('isSMSY');
        const isSMSN = document.getElementById('isSMSN');
        const deliveryNo = document.getElementById('deliveryNo');

        console.log(isRequestStatusWait)
        if (isRequestStatusWait.checked) {
            parcel.disabled = true;
            post.disabled = true;
            etc.disabled = true;
            note.disabled = true;
            SMSPhoneNo.disabled = true;
            SMSContent.disabled = true;
            isSMSY.disabled = true;
            isSMSN.disabled = true;
            deliveryNo.disabled = true;
            parcel.checked = false;
            post.checked = false;
            etc.checked = false;
            deliveryNo.value = '';
            note.value = '';
            SMSContent.value = '';
        } else if (isRequestStatusSend.checked){
            parcel.disabled = false;
            post.disabled = false;
            etc.disabled = false;
            note.disabled = false;
            deliveryNo.disabled = false;
            console.log(etc)
            if (etc.checked) {
                deliveryNo.disabled = false;
            } else {
                deliveryNo.disabled = true;
            }

            if (isSMSN.checked) {
                SMSPhoneNo.disabled = true;
                SMSContent.disabled = true;
                SMSContent.value = '';
            } else if (isSMSY.checked) {
                SMSPhoneNo.disabled = false;
                SMSContent.disabled = false;
            }

            isSMSY.disabled = false;
            isSMSN.disabled = false;

            // parcel.checked = true;
        } else if (isRequestStatusCancellation.checked) {
            parcel.disabled = true;
            post.disabled = true;
            etc.disabled = true;
            note.disabled = true;
            parcel.checked = false;
            post.checked = false;
            etc.checked = false;

            if (isSMSN.checked) {
                SMSPhoneNo.disabled = true;
                SMSContent.disabled = true;
                SMSContent.value = '';
            } else if (isSMSY.checked) {
                SMSPhoneNo.disabled = false;
                SMSContent.disabled = false;
            }

            note.disabled = false;
            isSMSY.disabled = false;
            isSMSN.disabled = false;
        } else if (isRequestStatusRequestCancellation.checked) {
            parcel.disabled = true;
            post.disabled = true;
            etc.disabled = true;
            note.disabled = true;
            parcel.checked = false;
            post.checked = false;
            etc.checked = false;

            if (isSMSN.checked) {
                SMSPhoneNo.disabled = true;
                SMSContent.disabled = true;
                SMSContent.value = '';
            } else if (isSMSY.checked) {
                SMSPhoneNo.disabled = false;
                SMSContent.disabled = false;
            }
            note.disabled = false;
            isSMSY.disabled = false;
            isSMSN.disabled = false;
        }

        document.getElementById('SMSPhoneNo').addEventListener('input', handleInput);
    });



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

    function formatMobileNumber(value) {

        const cleaned = value.replace(/\D/g, '');

        const match = cleaned.match(/^(\d{3})(\d{3,4})(\d{4})$/);
        if (match) {
            return [match[1], match[2], match[3]].filter(Boolean).join('-');
        }

        return cleaned;
    }
    function handleInput(event) {
        const input = event.target;
        const formatted = formatMobileNumber(input.value);
        input.value = formatted;
    }


    /********************************************************************** POST ************************************************/
    let isSubmitting = false;


    /******************************************************************* PUT ************************************************/

    let isModified = false;


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
        const isRequestStatusWait = document.getElementById('isRequestStatusWait');
        const isRequestStatusCancellation = document.getElementById('isRequestStatusCancellation');
        const isRequestStatusRequestCancellation = document.getElementById('isRequestStatusRequestCancellation');
        const isRequestStatusSend = document.getElementById('isRequestStatusSend');

        const parcel = document.getElementById('parcel');
        const post = document.getElementById('post');
        const etc = document.getElementById('etc');
        const note = document.getElementById('note');
        const SMSPhoneNo = document.getElementById('SMSPhoneNo');
        const SMSContent = document.getElementById('SMSContent');
        const isSMSY = document.getElementById('isSMSY');
        const isSMSN = document.getElementById('isSMSN');
        const deliveryNo = document.getElementById('deliveryNo');

        if (isRequestStatusWait.checked) {
            parcel.disabled = true;
            post.disabled = true;
            etc.disabled = true;
            note.disabled = true;
            SMSPhoneNo.disabled = true;
            SMSContent.disabled = true;
            isSMSY.disabled = true;
            isSMSN.disabled = true;
            deliveryNo.disabled = true;
            parcel.checked = false;
            post.checked = false;
            etc.checked = false;
            deliveryNo.value = '';
            note.value = '';
            SMSContent.value = '';
        } else if (isRequestStatusSend.checked){
            parcel.disabled = false;
            post.disabled = false;
            etc.disabled = false;
            note.disabled = false;
            deliveryNo.disabled = false;
            if (etc.checked) {
                deliveryNo.disabled = false;
            } else {
                deliveryNo.disabled = true;
            }

            if (isSMSN.checked) {
                SMSPhoneNo.disabled = true;
                SMSContent.disabled = true;
                SMSContent.value = '';
            } else if (isSMSY.checked) {
                SMSPhoneNo.disabled = false;
                SMSContent.disabled = false;
                SMSContent.value = '지학사 홈페이지에서 신청한 견본이 발송 되었습니다.';
            }

            isSMSY.disabled = false;
            isSMSN.disabled = false;
            parcel.checked = true;
        } else if (isRequestStatusCancellation.checked) {
            parcel.disabled = true;
            post.disabled = true;
            etc.disabled = true;
            note.disabled = true;
            parcel.checked = false;
            post.checked = false;
            etc.checked = false;

            if (isSMSN.checked) {
                SMSPhoneNo.disabled = true;
                SMSContent.disabled = true;
                SMSContent.value = '';
            } else if (isSMSY.checked) {
                SMSPhoneNo.disabled = false;
                SMSContent.disabled = false;
                SMSContent.value = '지학사 홈페이지에서 신청한 견본이 취소 되었습니다.';
            }

            note.disabled = false;
            isSMSY.disabled = false;
            isSMSN.disabled = false;
        } else if (isRequestStatusRequestCancellation.checked) {
            parcel.disabled = true;
            post.disabled = true;
            etc.disabled = true;
            note.disabled = true;
            parcel.checked = false;
            post.checked = false;
            etc.checked = false;

            if (isSMSN.checked) {
                SMSPhoneNo.disabled = true;
                SMSContent.disabled = true;
                SMSContent.value = '';
            } else if (isSMSY.checked) {
                SMSPhoneNo.disabled = false;
                SMSContent.disabled = false;
                SMSContent.value = '지학사 홈페이지에서 신청한 견본이 취소요청 완료 되었습니다.';
            }
            note.disabled = false;
            isSMSY.disabled = false;
            isSMSN.disabled = false;
        }
    }

    async function changeSMSIsUse() {
        const isSMSY = document.getElementById('isSMSY');
        const isSMSN = document.getElementById('isSMSN');

        const isRequestStatus = document.querySelector('input[name="isRequestStatus"]:checked').value;
        const SMSPhoneNo = document.getElementById('SMSPhoneNo');
        const SMSContent = document.getElementById('SMSContent');

        if (isSMSY.checked && isRequestStatus === 'SEND') {
            SMSPhoneNo.disabled = false;
            SMSContent.disabled = false;
            SMSContent.value = '지학사 홈페이지에서 신청한 견본이 발송 되었습니다.';
        } else if (isSMSY.checked && isRequestStatus === 'WAITING') {
            SMSPhoneNo.disabled = false;
            SMSContent.disabled = false;
            SMSContent.value = '-';
        } else if (isSMSY.checked && isRequestStatus === 'CANCELLATION') {
            SMSPhoneNo.disabled = false;
            SMSContent.disabled = false;
            SMSContent.value = '지학사 홈페이지에서 신청한 견본이 취소 되었습니다.';
        } else if (isSMSY.checked && isRequestStatus === 'REQUEST_CANCELLATION') {
            SMSPhoneNo.disabled = false;
            SMSContent.disabled = false;
            SMSContent.value = '지학사 홈페이지에서 신청한 견본이 취소요청 완료 되었습니다.';
        } else if (isSMSN.checked) {
            SMSPhoneNo.disabled = true;
            SMSContent.disabled = true;
            SMSContent.value = '';
        }

    }

    async function update(element) {

        if (isSubmitting) {
            return;
        }
        isSubmitting = true;

        initFormValidation(true);
        const status = await formValidation.validate();
        console.log('Validation status:', status);
        if (status === 'Invalid') {
            isSubmitting = false;
            return;
        }

        const idx = element.getAttribute('data-id');

        const requestStatus = document.querySelector('input[name="isRequestStatus"]:checked').value;
        let deliveryMethod =  document.querySelector('input[name="isDeliveryMethod"]:checked') ? document.querySelector('input[name="isDeliveryMethod"]:checked').value : '';
        let deliveryNo = document.getElementById('deliveryNo') ? document.getElementById('deliveryNo').value : '';
        const note = document.getElementById('note').value;
        const isSMS = document.querySelector('input[name="isSMS"]:checked').value;
        let SMSPhoneNo = document.getElementById('SMSPhoneNo').value;
        let SMSContent = document.getElementById('SMSContent').value;

        if (isSMS === 'N') {
            SMSContent = '';
        }

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
                        location.href = '/reference-book/sample-request/' + idx;
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
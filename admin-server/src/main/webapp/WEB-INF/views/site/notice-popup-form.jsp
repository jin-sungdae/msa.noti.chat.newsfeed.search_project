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
                        <form id="bannerForm">
                            <input type="hidden" name="menu" id="menu" value="${menu}">
                            <input type="hidden" name="uid" id="uid" value="${uid}"/>
                            <input type="hidden" name="disabledUid" id="disabledUid">
                            <input type="hidden" name="noticePopupLocation" value="${fn:toUpperCase(menu)}">
                            <div class="card mb-5 mb-xl-10">
                                <div class="card-header border-0 pt-5">
                                    <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                        공지 팝업 관리
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="row mb-8">
                                        <div class="col-lg-6 row">
                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
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
                                                <input type="text" class="form-control" placeholder="제목 입력" name="title" maxlength="50" value="${data.title}"  >
                                            </div>
                                        </div>
                                    </div>
                                    <c:if test="${menu eq 'reading-review'}">
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                    <label class="col-lg-9 form-label fw-bolder text-dark pt-3 required">게시기간</label>
                                                </div>
                                                <div class="col-lg-2 row fv-row fv-plugins-icon-container">
                                                    <div class="input-group">
                                                        <input
                                                                id="exposureStartDateInput"
                                                                name="exposureStartDateInput"
                                                                type="text"
                                                                class="form-control flatpickr-input"
                                                                placeholder="시작 날짜 선택"
                                                                autocomplete="off"
                                                                value="${data.exposureStartDateInput}"
                                                                ${data.getIsStartDateExpiry() ? 'disabled' : ''}
                                                        />
                                                        <span class="input-group-text"><i class="bi bi-calendar-check fs-1"></i></span>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2 row fv-row fv-plugins-icon-container">
                                                    <div class="input-group">
                                                        <input
                                                                id="exposureStartTimeInput"
                                                                name="exposureStartTimeInput"
                                                                type="text"
                                                                class="form-control flatpickr-input"
                                                                placeholder="시간 선택"
                                                                autocomplete="off"
                                                                value="${data.exposureStartTimeInput}"
                                                                ${data.getIsStartDateExpiry() ? 'disabled' : ''}
                                                        />
                                                        <span class="input-group-text"><i class="bi bi-clock-history fs-1"></i></span>
                                                    </div>
                                                </div>
                                                <div class="col-1 d-flex justify-content-center align-items-center">
                                                    <h2>~</h2>
                                                </div>
                                                <div class="col-lg-2 row fv-row fv-plugins-icon-container">
                                                    <div class="input-group">
                                                        <input
                                                                id="exposureEndDateInput"
                                                                name="exposureEndDateInput"
                                                                type="text"
                                                                class="form-control flatpickr-input"
                                                                placeholder="종료 날짜 선택"
                                                                autocomplete="off"
                                                                value="${data.exposureEndDateInput}"
                                                                ${empty data ? 'disabled' : ''}
                                                        />
                                                        <span class="input-group-text"><i class="bi bi-calendar-check fs-1"></i></span>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2 row fv-row fv-plugins-icon-container">
                                                    <div class="input-group">
                                                        <input
                                                                id="exposureEndTimeInput"
                                                                name="exposureEndTimeInput"
                                                                type="text"
                                                                class="form-control flatpickr-input"
                                                                placeholder="시간 선택"
                                                                autocomplete="off"
                                                                value="${data.exposureEndTimeInput}"
                                                                ${empty data ? 'disabled' : ''}
                                                        />
                                                        <span class="input-group-text"><i class="bi bi-clock-history fs-1"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <div class="row mb-8" id="floatingBanner">
                                        <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                            <label class="col-lg-9 form-label fw-bolder text-dark pt-3 required">팝업 이미지</label>
                                        </div>
                                        <div class="col-lg-10">
                                            <div class="row">
                                                <div class="col-lg-12" id="dz1Container">
                                                    <jsp:include page="/FileFormINC" flush="false">
                                                        <jsp:param name="fileFormType" value="Y" />
                                                        <jsp:param name="viewType" value="${viewType}" />
                                                        <jsp:param name="isImage" value="false" />
                                                        <jsp:param name="hasOrder" value="false" />
                                                        <jsp:param name="parentTable" value="NOTICE_POPUP"/>
                                                        <jsp:param name="parentUid" value="${uid}"/>
                                                        <jsp:param name="parentType" value="POPUP"/>
                                                        <jsp:param name="maxFileCount" value="2"/>
                                                        <jsp:param name="isSecure" value="N"/>
                                                        <jsp:param name="DZID" value="dz1"/>
                                                        <jsp:param name="dropzoneIndex" value="0"/>
                                                        <jsp:param name="description" value="섬네일 이미지는 ${menu eq 'main' ? '700 x 347px' : '520px x 165px'}로 업로드해 주세요. (파일명 띄어쓰기 금지) <br>* 파일 크기는 1Mb이하, jpg, jpeg, png 형식의 파일만 가능합니다."/>
                                                    </jsp:include>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3 required">이미지 링크</label>
                                            </div>

                                            <div class="col-lg-10 fv-row fv-plugins-icon-container">
                                                <input type="text" class="form-control" placeholder="URL 경로 입력" name="linkUrl" maxlength="100" value="${data.linkUrl}"  >
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3">Target</label>
                                            </div>

                                            <div class="col-lg-10">
                                                <div class="col-lg-4 row">
                                                    <div class="col">
                                                        <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                            <input class="form-check-input" type="radio" name="linkType" value="_self" ${empty data ? 'checked' : data.linkType eq '_self' ? 'checked' : ''}  id="linkTypeSelf" />
                                                            <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="linkTypeSelf">
                                                                본창 이동
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                            <input class="form-check-input" type="radio" name="linkType" value="_blank" id="linkTypeBlank" ${data.linkType eq '_blank' ? 'checked' : ''} />
                                                            <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="linkTypeBlank">
                                                                새창 띄우기
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3">노출여부</label>
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
                                                <span class="ms-2" style="color: gray;">* 노출여부 설정은 3개만 등록 가능합니다.</span>
                                            </div>
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
                                                    <a href="/${menu}/notice-popup" class="btn btn-light-warning me-2" style="background-color: #fff3cd; color: #181C32">
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
    const menu = document.getElementById('menu').value;
    let noticePopupFv = null;
    const sortOrderValidators = {
        validators: {
            notEmpty: {
                message: '* 노출순서를 선택해주세요.'
            }
        }
    };

    window.onload = function() {

        noticePopupFv = FormValidation.formValidation(document.getElementById('bannerForm'), {
            fields: {
                title: {
                    validators: {
                        notEmpty: {
                            message: '* 제목을 입력해주세요.'
                        }
                    }
                },
                linkUrl: {
                    validators: {
                        notEmpty: {
                            message: '* 이미지 링크를 등록해주세요.'
                        }
                    }
                }
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

        if(menu === 'reading-review'){
            initializeFlatpickr();

            noticePopupFv.addField('exposureStartDateInput', {
                validators: {
                    notEmpty: {
                        message: '* 시작 날짜를 선택해주세요.'
                    }
                }
            });

            noticePopupFv.addField('exposureStartTimeInput', {
                validators: {
                    notEmpty: {
                        message: '* 시간을 선택해주세요.'
                    }
                }
            });

            noticePopupFv.addField('exposureEndDateInput', {
                validators: {
                    notEmpty: {
                        message: '* 종료 날짜를 선택해주세요.'
                    }
                }
            });

            noticePopupFv.addField('exposureEndTimeInput', {
                validators: {
                    notEmpty: {
                        message: '* 시간을 선택해주세요.'
                    }
                }
            });
        }

        ntdrop[0] = global.genDropzone("#dz1",
            {
                params: {
                    'ParentTable': 'NOTICE_POPUP',
                    'ParentType': 'POPUP',
                    'ParentUid': uid,
                }, hasOrder: false, isSecure: 'N', maxFileCount: 2, required: 'Y', dropzoneIdx: 'dz1',
                acceptedExt : ['.jpg', '.jpeg', '.png'],
                containerId : 'dz1Container',
                maxFileSize : 1,
                dropzoneIndex : 0,
                messages : {
                    empty : '* 팝업 이미지를 등록해주세요.',
                    accept: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.',
                    count: '',
                    size: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.'
                }
            });

        /**
         * form validator invalid event
         * 여기서 select2 인 경우 처리
         */

        noticePopupFv.on('core.field.invalid', function(name) {
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
        noticePopupFv.on('core.field.valid', function(name) {
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

        $('#sortOrder').on('select2:selecting', function(e) {
            const el = document.querySelector('[name="sortOrder"]');
            el.nextSibling.querySelector('span.select2-selection').classList.remove(INVALID_CLASS);
            const fvContainer = el.parentNode.querySelector('div.fv-plugins-message-container');
            if(fvContainer !== null) {
                fvContainer.remove();
            }
        });
    };

    function initializeFlatpickr() {
        const exposureStartDateInput = document.getElementById('exposureStartDateInput');
        const exposureStartTimeInput = document.getElementById('exposureStartTimeInput');
        const exposureEndDateInput = document.getElementById('exposureEndDateInput');
        const exposureEndTimeInput = document.getElementById('exposureEndTimeInput');

        let exposureStartDateFlatpickr;
        let exposureStartTimeFlatpickr;
        let exposureEndDateFlatpickr;
        let exposureEndTimeFlatpickr;

        exposureStartDateFlatpickr = flatpickr(exposureStartDateInput, {
            dateFormat: 'Y-m-d',
            locale: 'ko',
            onChange: function (selectedDates) {
                if (selectedDates.length > 0) {
                    const selectedDate = new Date(selectedDates[0]);
                    exposureEndDateFlatpickr.set('minDate', selectedDate);
                }
            }
        });

        flatpickr(exposureStartTimeInput, {
            enableTime: true,
            noCalendar: true,
            dateFormat: "H:i",
            locale: 'ko',
            onChange: function (selectedDates) {
                if (selectedDates.length > 0) {
                    const selectedDate = new Date(selectedDates[0]);
                    exposureEndDateInput.disabled = false;
                    exposureEndTimeInput.disabled = false;
                }
            }
        });

        exposureEndDateFlatpickr = flatpickr(exposureEndDateInput, {
            dateFormat: 'Y-m-d',
            locale: 'ko',
            onChange: function (selectedDates) {
                if (selectedDates.length > 0) {
                    console.log(exposureStartDateFlatpickr.value);
                    console.log(exposureEndDateFlatpickr.value);

                    if(document.getElementById('exposureStartDateInput').value === document.getElementById('exposureEndDateInput').value) {
                        exposureEndTimeFlatpickr.set('minDate', exposureStartTimeInput.value);
                        exposureEndTimeFlatpickr.set('date', exposureStartTimeInput.value);
                        document.getElementById('exposureEndTimeInput').value = exposureStartTimeInput.value;
                    } else {
                        exposureEndTimeFlatpickr.set('minDate', '');
                    }

                    let selectedDate = new Date(selectedDates[0]);
                    selectedDate.setTime(selectedDate.getTime() + (1 * 60 * 1000));
                    exposureStartDateFlatpickr.set('maxDate', selectedDate);
                }
            }
        });

        exposureEndTimeFlatpickr = flatpickr(exposureEndTimeInput, {
            enableTime: true,
            noCalendar: true,
            dateFormat: "H:i",
            locale: 'ko',
        });

        if(exposureStartDateInput.value !== '') {
            exposureEndDateFlatpickr.set('minDate', exposureStartDateInput.value);
            exposureEndTimeFlatpickr.set('minDate', exposureStartTimeInput.value);
        }

        // endFlatpickr = flatpickr(endDateInput, {
        //     dateFormat: 'Y-m-d',
        //     locale: 'ko',

        // });
    }

    let isUseRadios = document.querySelectorAll('input[type="radio"][name="isOpen"]');
    isUseRadios.forEach( el => {
        el.addEventListener('change', () => {
            if(el.value === 'N') {
                $('#sortOrder').val('').trigger('change');
                document.querySelector('#sortOrder').disabled = true;
                const fields = noticePopupFv.getFields();
                if(fields.sortOrder) {
                    // noticePopupFv.removeField('sortOrder');
                }
            } else {
                // noticePopupFv.addField('sortOrder', sortOrderValidators);
                document.querySelector('#sortOrder').disabled = false;
            }
        })
    });

    document.getElementById('saveButton').addEventListener('click', () => {
        noticePopupFv.validate().then(async function (status) {
            if (status === 'Valid') {
                let isConfirm = await checkSortOrder();
                if(!isConfirm) {
                    isConfirm = true;
                    await Swal.fire({
                        title: '노출순서 중복',
                        text: '해당 노출순서에 등록된 팝업 이미지가 있습니다. 해당 이미지로 변경 하시겠습니까? ',
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
    });

    const checkSortOrder = async () => {
        const formData = makeJsonData();
        const response = await fetch('/api/v1/site/check-sort-order-notice-popup', {
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
        const formData = makeJsonData();
        let url = '/api/v1/site/notice-popup';
        let method = 'POST';
        let successUrl = `/\${menu}/notice-popup`;
        let regMsg = '등록되었습니다.';

        if(viewType === 'edit') {
            method = 'PUT';
            url = `/api/v1/site/notice-popup/\${uid}`;
            successUrl = `/\${menu}/notice-popup/\${uid}`;

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
                const url = `/\${menu}/notice-popup/\${uid}`;
                window.location.href = successUrl;
            });
        }
    }

    const makeJsonData = () => {
        const bannerData = new FormData(document.getElementById('bannerForm'));
        let jsonObject = {};
        bannerData.forEach(function (value, key) {
            jsonObject[key] = value;
        });
        return jsonObject;
    }

</script>
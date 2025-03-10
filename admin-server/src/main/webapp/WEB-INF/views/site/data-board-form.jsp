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
                <c:set value="${menuTitle}" var="menuTitle"/>
                <%@ include file="/WEB-INF/views/common/inc/ToolbarINC.jsp" %>
                <div class="post d-flex flex-column-fluid">
                    <div class="container-fluid">
                        <!-- 본문 내용 START -->
                        <input type="hidden" name="menu" id="menu" value="${menu}">
                        <form id="dataBoardForm">
                            <input type="hidden" name="uid" id="uid" value="${uid}"/>
                            <input type="hidden" name="disabledUid" id="disabledUid">
                            <input type="hidden" id="categoryCode" name="categoryCode" value="${categoryCode}">
                            <div class="card mb-5 mb-xl-10">
                                <div class="card-header border-0 pt-5">
                                    <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                        ${menu eq 'reference-book' ? '기출ㆍ평가자료 관리' : '자료실'}
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="row mb-8">
                                        <div class="row mb-8">
                                            <div class="col-lg-6 row">
                                                <div class="col-lg-2 d-flex justify-content-center align-items-center">
                                                    <label class="col-lg-9 form-label fw-bolder text-dark pt-3 required">작성자</label>
                                                </div>
                                                <div class="col-lg-10 row d-flex align-items-center">
                                                    <c:out value="${adminName}"/>
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
                                    <c:if test="${menu ne 'reference-book'}">
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3 required">자료명</label>
                                            </div>

                                            <div class="col-lg-10 fv-row fv-plugins-icon-container">
                                                <input type="text" class="form-control" placeholder="자료명 입력" id="title" name="title" maxlength="50" value="${data.title}"  >
                                            </div>
                                        </div>
                                    </div>
                                    </c:if>

                                    <c:if test="${menu eq 'reading-review' || menu eq 'reference-book'}">
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3 required">
                                                    <c:if test="${menu eq 'reference-book'}">
                                                        과목
                                                    </c:if>
                                                    <c:if test="${menu eq 'reading-review'}">
                                                        구분
                                                    </c:if>
                                                </label>
                                            </div>
                                            <div class="col-lg-10 fv-row">
                                                <select
                                                        id="categoryIndex1"
                                                        name="categoryIndex1"
                                                        class="form-select form-select-solid custom-select-box"
                                                        data-control="select2"
                                                        data-hide-search="true"
                                                >
                                                    <option value="">선택</option>
                                                    <c:forEach items="${category1Depth}" var="depth1">
                                                        <option value="${depth1.categoryIndex}" ${data.categoryIndex1 eq depth1.categoryIndex ? 'selected' : ''} >${depth1.categoryName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3 required">자료구분</label>
                                            </div>
                                            <div class="col-lg-10 fv-row">
                                                <select
                                                        id="categoryIndex2"
                                                        name="categoryIndex2"
                                                        class="form-select form-select-solid custom-select-box"
                                                        data-control="select2"
                                                        data-hide-search="true"

                                                        ${viewType eq 'create' ? 'disabled' : ''}
                                                >
                                                    <option value="">선택</option>
                                                    <c:forEach items="${category2Depth}" var="depth2">
                                                        <option value="${depth2.categoryIndex}" ${data.categoryIndex2 eq depth2.categoryIndex ? 'selected' : ''} >${depth2.categoryName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    </c:if>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3 required">노출 여부</label>
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
                                        </div>
                                    </div>

                                    <c:if test="${menu eq 'arbol' || menu eq 'book-trigger'}">
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                    <label class="col-lg-9 form-label fw-bolder text-dark pt-3 required">상단 고정</label>
                                                </div>
                                                <div class="col-lg-2 row">
                                                    <div class="col">
                                                        <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                            <input class="form-check-input" type="radio" name="isTop" value="N" ${empty data ? 'checked' : data.isTop eq 'N' ? 'checked' : ''}  id="isTopN" />
                                                            <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isTopN">
                                                                N
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                            <input class="form-check-input" type="radio" name="isTop" value="Y" id="isTopY" ${data.isTop eq 'Y' ? 'checked' : ''} />
                                                            <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isTopY">
                                                                Y
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 d-flex justify-content-center align-items-center">
                                                    <span class="ms-2" style="color: gray;">* 상단고정 게시물은 최대 3개 까지 고정 가능합니다</span>
                                                </div>
                                                <div class="col-lg-1 d-flex justify-content-center align-items-center required">
                                                    <label class="form-label fw-bolder text-dark pt-3">노출순서</label>
                                                </div>
                                                <div class="col-lg-2 fv-row fv-plugins-icon-container">
                                                    <select
                                                            id="sortOrder"
                                                            name="sortOrder"
                                                            class="form-select form-select-solid custom-select-box"
                                                            data-control="select2"
                                                            data-hide-search="true"
                                                            data-placeholder="-"
                                                            ${empty data ? 'disabled' : data.isOpen eq 'Y' && data.isTop eq 'Y' ? '' : 'disabled'}
                                                    >
                                                        <option value="">-</option>
                                                        <option value="1" ${data.sortOrder eq 1 ? 'selected' : ''} >1</option>
                                                        <option value="2" ${data.sortOrder eq 2 ? 'selected' : ''} >2</option>
                                                        <option value="3" ${data.sortOrder eq 3 ? 'selected' : ''} >3</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3 required">${menu ne 'reference-book' ? '자료유형' : '자료명'}</label>
                                            </div>
                                            <div class="col-lg-10">
                                                <div class="col-lg-12 pt-3" id="dz1Container">
                                                    <jsp:include page="/FileFormINC" flush="false">
                                                        <jsp:param name="fileFormType" value="Y" />
                                                        <jsp:param name="isImage" value="false" />
                                                        <jsp:param name="hasOrder" value="false" />
                                                        <jsp:param name="parentTable" value="DATA_BOARD"/>
                                                        <jsp:param name="parentUid" value="${uid}"/>
                                                        <jsp:param name="parentType" value="FILE"/>
                                                        <jsp:param name="maxFileCount" value="2"/>
                                                        <jsp:param name="isSecure" value="N"/>
                                                        <jsp:param name="dropzoneIndex" value="0"/>
                                                        <jsp:param name="DZID" value="dz1"/>
                                                        <jsp:param name="description" value="파일 크기는 300mb 이하, mp3, mp4, pdf, jpg, jpeg, png, hwp, hwpx, ppt, pptx, dox, doxc, zip 형식의 파일만 가능합니다."/>
                                                    </jsp:include>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer" id="footerIdx">
                                    <div class="row">
                                        <div id="editGroup" class="col-12 d-flex justify-content-end">
                                            <c:choose>
                                                <c:when test="${viewType eq 'edit'}">
                                                    <button type="button" onclick="history.back()" class="btn btn-light-warning me-2" style="background-color: #fff3cd; color: #181C32" >
                                                        취소
                                                    </button>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="/${menu}/data-board" class="btn btn-light-warning me-2" style="background-color: #fff3cd; color: #181C32">
                                                        취소
                                                    </a>
                                                </c:otherwise>
                                            </c:choose>
                                            <button id="saveButton" type="button" class="btn btn-warning" >
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

<div class="modal fade" id="modalLayout" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered mw-900px" id="modalContent">

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
    let dataBoardPopupFv = null;
    const uid = document.getElementById('uid').value;
    const menu = document.getElementById('menu').value;
    let viewType = "${viewType}";
    let ntdrop = [];

    window.onload = function() {

        // document.getElementById('title')?.addEventListener('input', function (e) {
        //     var value = e.target.value;
        //     e.target.value = value.replace(/[^a-zA-Z0-9 \uAC00-\uD7A3\u1100-\u11FF\u3130-\u318F]/g, '');
        // });

        ntdrop[0] = global.genDropzone("#dz1",
            {
                params: {
                    'ParentTable': 'DATA_BOARD',
                    'ParentType': 'FILE',
                    'ParentUid': uid,
                }, hasOrder: false, isSecure: 'N', maxFileCount: 2, required: 'Y', dropzoneIdx: 'dz1',
                acceptedExt: ['.mp4', '.mp3', '.pdf', '.jpg', '.jpeg', '.png', '.hwp', '.hwpx', '.ppt', '.pptx', '.doc', '.docx', '.zip'],
                containerId : 'dz1Container',
                maxFileSize : 300,
                dropzoneIndex : 0,
                messages : {
                    empty : '* 첨부파일을 등록해주세요.',
                    accept: '* 파일용량 및 파일유형을 다시 확인해주세요.',
                    count: '',
                    size: '해당 첨부파일은 등록이 불가합니다.'
                }
            });

        dataBoardPopupFv = FormValidation.formValidation(document.getElementById('dataBoardForm'), {
            fields: {
                title: {
                    validators: {
                        notEmpty: {
                            message: '* 자료명을 입력해주세요.'
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

        if(menu === 'reference-book' || menu === 'reading-review') {
            dataBoardPopupFv.addField("categoryIndex1",{
                validators: {
                    notEmpty: {
                        message: '* 구분을 선택해주세요.'
                    }
                }
            });

            dataBoardPopupFv.addField("categoryIndex2",{
                validators: {
                    notEmpty: {
                        message: '* 자료구분을 선택해주세요.'
                    }
                }
            });

            $('#categoryIndex1').on('select2:selecting', function(e) {
                const el = document.querySelector('[name="categoryIndex1"]');
                el.nextSibling.querySelector('span.select2-selection').classList.remove(INVALID_CLASS);
                const fvContainer = el.parentNode.querySelector('div.fv-plugins-message-container');
                if(fvContainer !== null) {
                    fvContainer.style.display = 'none';
                }
            });

            $('#categoryIndex2').on('select2:selecting', function(e) {
                const el = document.querySelector('[name="categoryIndex2"]');
                el.nextSibling.querySelector('span.select2-selection').classList.remove(INVALID_CLASS);
                const fvContainer = el.parentNode.querySelector('div.fv-plugins-message-container');
                if(fvContainer !== null) {
                    fvContainer.style.display = 'none';
                }
            });
        }

        if(menu === 'arbol' || menu === 'book-trigger') {
            $('#sortOrder').on('select2:selecting', function(e) {
                const el = document.querySelector('[name="sortOrder"]');
                el.nextSibling.querySelector('span.select2-selection').classList.remove(INVALID_CLASS);
                const fvContainer = el.parentNode.querySelector('div.fv-plugins-message-container');
                if(fvContainer !== null) {
                    fvContainer.style.display = 'none';
                }
            });
        }

        /**
         * form validator invalid event
         * 여기서 select2 인 경우 처리
         */

        dataBoardPopupFv.on('core.field.invalid', function(name) {
            try {
                const el = document.querySelector('[name=' + name + ']');
                if (el.dataset.control === 'select2') {
                    if(name === 'categoryIndex1' || name === 'categoryIndex2') {
                        const el = document.querySelector('[name="'+name+'"]');
                        el.nextSibling.querySelector('span.select2-selection').classList.remove(INVALID_CLASS);
                        const fvContainer = el.parentNode.querySelector('div.fv-plugins-message-container');
                        if(fvContainer !== null) {
                            fvContainer.style.display = '';
                        }
                    }

                    if(name === 'sordOrder') {
                        const el = document.querySelector('[name="sortOrder"]');
                        el.nextSibling.querySelector('span.select2-selection').classList.remove(INVALID_CLASS);
                        const fvContainer = el.parentNode.querySelector('div.fv-plugins-message-container');
                        if(fvContainer !== null) {
                            fvContainer.style.display = 'none';
                        }
                    }

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
        dataBoardPopupFv.on('core.field.valid', function(name) {
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

        if(menu === 'arbol' || menu === 'book-trigger') {
            let isUseRadios = document.querySelectorAll('input[type="radio"][name="isOpen"]');
            isUseRadios.forEach( el => {
                el.addEventListener('change', () => {
                    if(el.value === 'N') {
                        $('#sortOrder').val('').trigger('change');
                        document.querySelector('#sortOrder').disabled = true;
                        const fields = dataBoardPopupFv.getFields();
                        if(fields.sortOrder) {
                            dataBoardPopupFv.removeField('sortOrder');
                        }
                        const sortOrderEl = document.querySelector('[name="sortOrder"]');
                        if (INVALID_CLASS) sortOrderEl.nextSibling.querySelector('span.select2-selection').classList.remove(INVALID_CLASS);
                        if (VALID_CLASS) sortOrderEl.nextSibling.querySelector('span.select2-selection').classList.add(VALID_CLASS);
                    } else {
                        if(document.querySelector('input[type="radio"][name="isTop"]:checked').value === 'Y') {
                            document.querySelector('#sortOrder').disabled = false;
                            dataBoardPopupFv.addField('sortOrder', {
                                validators: {
                                    notEmpty: {
                                        message: '* 노출순서를 선택해주세요.'
                                    }
                                }
                            });
                        }
                    }
                })
            });

            let isTopRadios = document.querySelectorAll('input[type="radio"][name="isTop"]');
            isTopRadios.forEach( el => {
                el.addEventListener('change', () => {
                    if(el.value === 'N') {
                        $('#sortOrder').val('').trigger('change');
                        document.querySelector('#sortOrder').disabled = true;
                        const fields = dataBoardPopupFv.getFields();
                        if(fields.sortOrder) {
                            dataBoardPopupFv.removeField('sortOrder');
                        }
                    } else {
                        if(document.querySelector('input[type="radio"][name="isOpen"]:checked').value === 'Y') {
                            document.querySelector('#sortOrder').disabled = false;
                            dataBoardPopupFv.addField('sortOrder', {
                                validators: {
                                    notEmpty: {
                                        message: '* 노출순서를 선택해주세요.'
                                    }
                                }
                            });
                        }
                    }
                })
            });
        }
    };

    document.getElementById('saveButton').addEventListener('click', () => {
        dataBoardPopupFv.validate().then(async function (status) {
            if (status === 'Valid') {
                if(menu === 'arbol' || menu === 'book-trigger') {
                    let isConfirm = await checkSortOrder();
                    if(!isConfirm) {
                        isConfirm = true;
                        await Swal.fire({
                            title: '노출순서 중복',
                            text: '해당 노출순서에 등록된 자료가 있습니다. 해당 자료로 변경 하시겠습니까?',
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
                    if(dropzoneCheck()) {
                        uploadByDropzone(0)
                    }
                }


            } else {
                dropzoneCheck();
            }
        });
    });

    async function saveFormData() {
        const formData = makeJsonData();
        let url = '/api/v1/reading-review/data-board';
        let method = 'POST';
        let successUrl = `/\${menu}/data-board`;
        let regMsg = '등록되었습니다.';

        if(viewType === 'edit') {
            method = 'PUT';
            url = `/api/v1/reading-review/data-board/\${uid}`;
            successUrl = `/\${menu}/data-board/\${uid}`;
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

    const makeJsonData = () => {
        const bannerData = new FormData(document.getElementById('dataBoardForm'));
        let jsonObject = {};
        bannerData.forEach(function (value, key) {
            jsonObject[key] = value;
        });
        return jsonObject;
    }

    $('#categoryIndex1').on('select2:select', async function () {
        const category1DepthIndex = $('#categoryIndex1').val();
        if(category1DepthIndex === '') {
            $('#categoryIndex2').empty().trigger("change");
            document.getElementById('categoryIndex2').disabled = true;
            const defaultOption = new Option('선택', '', false, false);
            $('#categoryIndex2').append(defaultOption).trigger('change');
        } else {
            let category2DepthData = await getCategoryList(3, category1DepthIndex);
            makeCategoryList(category2DepthData);
        }
    });

    const getCategoryList = async (depth, categoryIndex) => {
        const response = await fetch('/api/v1/reading-review/data-board-category-list', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                depth : depth,
                categoryCode : document.getElementById('categoryCode').value,
                parentCategoryIndex: categoryIndex
            })
        });

        const res = await response.json();
        return res.data.data;
    }

    const makeCategoryList = (data) => {
        document.getElementById('categoryIndex2').disabled = false;
        $('#categoryIndex2').empty().trigger("change");
        const defaultOption = new Option('선택', '', false, false);
        $('#categoryIndex2').append(defaultOption).trigger('change');
        if(data) {
            data.forEach(category => {
                const newOption = new Option(category.categoryName, category.categoryIndex, false, false);
                $('#categoryIndex2').append(newOption).trigger('change');
            })
        }
    }

    // let isPreviewRadios = document.querySelectorAll('input[type="radio"][name="isPreview"]');
    // isPreviewRadios.forEach( el => {
    //     el.addEventListener('change', () => {
    //         if(el.value === 'N') {
    //             dataBoardPopupFv.addField("previewUrl",{
    //                 validators: {
    //                     notEmpty: {
    //                         message: '미리보기 URL 경로를 등록해주세요.'
    //                     }
    //                 }
    //             });
    //             document.querySelector('#previewFile').classList.add('d-none')
    //             document.querySelector('#previewUrl').classList.remove('d-none');
    //         } else {
    //             dataBoardPopupFv.removeField("previewUrl");
    //             document.querySelector('#previewFile').classList.remove('d-none')
    //             document.querySelector('#previewUrl').classList.add('d-none');
    //         }
    //     })
    // });

    const checkSortOrder = async () => {
        const formData = makeJsonData();
        const response = await fetch('/api/v1/reading-review/check-sort-order', {
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

</script>
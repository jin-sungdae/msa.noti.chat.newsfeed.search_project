<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="java.util.*" %>
<%@ page import="com.user.server.site.dto.menu.AdminMenu"%>
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
        <div class="wrapper d-flex flex-column flex-row-fluid" id="kt_wrapper">
            <%@ include file="/WEB-INF/views/common/inc/BodyHeaderINC.jsp" %>
            <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
                <%@ include file="/WEB-INF/views/common/inc/ToolbarINC.jsp" %>
                <div class="container-fluid" id="kt_post">
                    <div id="kt_content_container" class="card-body">
                        <div class="card">
                            <div class="card-header border-0 pt-6">
                                <table class="table align-middle table-row-dashed fs-6 gy-5" id="List">
                                    <colgroup>
                                        <col width="34%"/>
                                        <col width="33%"/>
                                        <col width="33%"/>
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th style="color: #000000;font-weight: bold;">1 Depth</th>
                                        <th style="color: #000000;font-weight: bold;">2 Depth</th>
                                        <th style="color: #000000;font-weight: bold;">3 Depth</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>
                                            <select
                                                    name="menuIndex1"
                                                    id="menuIndex1"
                                                    size="2"
                                                    style="width:100%;height:300px;"
                                                    onchange="loadCategory(this)"
                                                    data-depth = '1'
                                            >
                                                <c:forEach items="${depth1List}" var="menu" varStatus="status">
                                                    <option
                                                            data-category-index="<c:out value='${menu.categoryIndex}'/>"
                                                            data-parent-category-index="<c:out value='${menu.parentCategoryIndex}'/>"
                                                            data-category-code="<c:out value='${menu.categoryCode}'/>"
                                                            data-depth="<c:out value='${menu.depth}'/>"
                                                            data-is-open="<c:out value='${menu.isOpen}'/>"
                                                            value="<c:out value='${menu.categoryIndex}'/>"
                                                    ><c:out value="${menu.categoryName }"/>(<c:out value="${menu.isOpen }"/>)</option>
                                                </c:forEach>
                                            </select>
                                            <br><br>
                                            <div class="col-lg-10">
                                                <button type="button"
                                                        data-depth="1"
                                                        data-post-type="post"
                                                        class="btn btn-primary justify-content-center me-3"
                                                        onclick="postModalHandler(this)"
                                                >
                                                    <span class="menu-icon">
                                                        <i class="bi bi-plus fs-2"></i>
                                                    </span>추가
                                                </button>
                                                <button type="button"
                                                        data-depth="1"
                                                        data-post-type="put"
                                                        class="btn btn-success justify-content-center me-3"
                                                        onclick="putModalHandler(this)"
                                                >
                                                    <span class="menu-icon">
                                                        <i class="bi bi-pencil-square fs-2"></i>
                                                    </span>수정
                                                </button>
<%--                                                <button type="button"--%>
<%--                                                        data-depth="1"--%>
<%--                                                        data-post-type="delete"--%>
<%--                                                        class="btn btn-danger justify-content-center"--%>
<%--                                                        onclick="deleteCategory(this)"--%>
<%--                                                >--%>
<%--                                                    <span class="menu-icon">--%>
<%--                                                        <i class="bi bi-pencil-square fs-2"></i>--%>
<%--                                                    </span>삭제--%>
<%--                                                </button>--%>
                                            </div>
                                        </td>
                                        <td>
                                            <select
                                                    name="menuIndex2"
                                                    id="menuIndex2"
                                                    size="2"
                                                    style="width:100%;height:300px;"
                                                    data-depth = '2'
                                                    onchange="loadCategory(this)"
                                                    disabled
                                            >
                                            </select>
                                            <br><br>
                                            <div class="col-lg-10">
                                                <button type="button"
                                                        data-depth="2"
                                                        data-post-type="post"
                                                        class="btn btn-primary justify-content-center me-3"
                                                        onclick="postModalHandler(this)"
                                                >
                                                    <span class="menu-icon">
                                                        <i class="bi bi-plus fs-2"></i>
                                                    </span>추가
                                                </button>
                                                <button type="button"
                                                        data-depth="2"
                                                        data-post-type="put"
                                                        class="btn btn-success justify-content-center me-3"
                                                        onclick="putModalHandler(this)"
                                                >
                                                    <span class="menu-icon">
                                                        <i class="bi bi-pencil-square fs-2"></i>
                                                    </span>수정
                                                </button>
<%--                                                <button type="button"--%>
<%--                                                        data-depth="2"--%>
<%--                                                        data-post-type="delete"--%>
<%--                                                        class="btn btn-danger justify-content-center"--%>
<%--                                                        onclick="deleteCategory(this)"--%>
<%--                                                >--%>
<%--                                                    <span class="menu-icon">--%>
<%--                                                        <i class="bi bi-pencil-square fs-2"></i>--%>
<%--                                                    </span>삭제--%>
<%--                                                </button>--%>
                                            </div>
                                        </td>
                                        <td>
                                            <select
                                                    name="menuIndex3"
                                                    id="menuIndex3"
                                                    size="2"
                                                    style="width:100%;height:300px;"
                                                    data-depth = '3'
                                                    disabled
                                            ></select>
                                            <br><br>
                                            <div class="col-lg-10">
                                                <button type="button"
                                                        data-depth="3"
                                                        data-post-type="post"
                                                        class="btn btn-primary justify-content-center me-3"
                                                        onclick="postModalHandler(this)"
                                                >
                                                    <span class="menu-icon">
                                                        <i class="bi bi-plus fs-2"></i>
                                                    </span>추가
                                                </button>
                                                <button type="button"
                                                        data-depth="3"
                                                        data-post-type="put"
                                                        class="btn btn-success justify-content-center me-3"
                                                        onclick="putModalHandler(this)"
                                                >
                                                    <span class="menu-icon">
                                                        <i class="bi bi-pencil-square fs-2"></i>
                                                    </span>수정
                                                </button>
<%--                                                <button type="button"--%>
<%--                                                        data-depth="3"--%>
<%--                                                        data-post-type="delete"--%>
<%--                                                        class="btn btn-danger justify-content-center"--%>
<%--                                                        onclick="deleteCategory(this)"--%>
<%--                                                >--%>
<%--                                                    <span class="menu-icon">--%>
<%--                                                        <i class="bi bi-pencil-square fs-2"></i>--%>
<%--                                                    </span>삭제--%>
<%--                                                </button>--%>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@ include file="/WEB-INF/views/common/inc/FooterINC.jsp" %>
        </div>
    </div>
</div>

<script src="/assets/plugins/custom/datatables/datatables.bundle.js"></script>
<script src="/assets/js/list.js"></script>
<script src="/assets/js/flatpickr/ko.js"></script>
<script type="text/javascript">
    let isSubmitting = false;

    let depth1List = [];
    let depth2List = [];
    let depth3List = [];
    /************************************************************* INIT ***********************************************/
    document.addEventListener('DOMContentLoaded', function() {
        let json1 = '${depth1Json}';
        let json2 = '${depth2Json}';
        let json3 = '${depth3Json}';

        json1 = json1.replace(/[\u0000-\u001F\u007F-\u009F]/g, "");
        json2 = json2.replace(/[\u0000-\u001F\u007F-\u009F]/g, "");
        json3 = json3.replace(/[\u0000-\u001F\u007F-\u009F]/g, "");
        depth1List = JSON.parse(json1);
        depth2List = JSON.parse(json2);
        depth3List = JSON.parse(json3);

//        console.log(depth1List);
//        console.log(depth2List);
//        console.log(depth3List);

        attachModalEventListeners();

        // 메뉴버튼 모두 disabled처리
        document.querySelectorAll('button[data-post-type]').forEach((btn) => {btn.disabled = true;})
        document.querySelector('button[data-post-type="post"]').disabled = false;
    });


    /*********************************************************** LOAD 영역 ********************************************/
    let loadCategoryTimeout;

    async function loadCategory(element) {
        clearTimeout(loadCategoryTimeout);


        loadCategoryTimeout = setTimeout(async () => {
            let depth = element.getAttribute('data-depth');
            let menuIndex2 = document.getElementById('menuIndex2');
            let menuIndex3 = document.getElementById('menuIndex3');

            let menuIndex2Option = '';
            let menuIndex3Option = '';

            if (depth === '1') {
                for (let i = 0; i < depth2List.length; i++) {
                    if (depth2List[i].parentCategoryIndex === parseInt(element.value)) {
                        menuIndex2Option += '<option data-category-index="' + depth2List[i].categoryIndex +
                            '" data-parent-category-index="' + depth2List[i].parentCategoryIndex +
                            '" data-category-code="' + depth2List[i].categoryCode +
                            '" data-depth="' + depth2List[i].depth +
                            '" data-is-open="' + depth2List[i].isOpen +
                            '" value="' + depth2List[i].categoryIndex + '">' +
                            depth2List[i].categoryName + '(' + depth2List[i].isOpen + ')</option>';

                    }
                }
                menuIndex2.innerHTML = menuIndex2Option;
                menuIndex2.disabled = false;
                menuIndex3.innerHTML = '';
                menuIndex3.disabled = true;
            } else if (depth === '2') {
                for (let i = 0; i < depth3List.length; i++) {
                    if (depth3List[i].parentCategoryIndex === parseInt(element.value)) {
                        menuIndex3Option += '<option data-category-index="' + depth3List[i].categoryIndex +
                            '" data-parent-category-index="' + depth3List[i].parentCategoryIndex +
                            '" data-category-code="' + depth3List[i].categoryCode +
                            '" data-depth="' + depth3List[i].depth +
                            '" data-is-open="' + depth3List[i].isOpen +
                            '" value="' + depth3List[i].categoryIndex + '">' +
                            depth3List[i].categoryName + '(' + depth3List[i].isOpen + ')</option>';}
                }
                menuIndex3.innerHTML = menuIndex3Option;
                menuIndex3.disabled = false;
            }
        }, 300);
    }
    /******************************************************** MakeData 영역 ********************************************/
    const makeData = (idx) => {
        let params = {
            categoryIndex: idx ? idx : '',
            categoryName: document.getElementById('categoryName').value,
            parentCategoryIndex: document.getElementById('parentCategoryIndex').value ? document.getElementById('parentCategoryIndex').value : 0,
            depth: document.getElementById('depth').value,
            isOpen: document.querySelector('input[name="isOpen"]:checked') ? 'Y' : 'N',
            description: document.getElementById('description').value,
            categoryCode: document.getElementById('categoryCode').value,
            sortOrder: document.getElementById('sortOrder').value,
        }
        return params;
    };
    /*************************************** start: Valid ********************************************/
    // 유효성 체크 통합
    const regExp = {
        exp1: /[ㄱ-힣]/, // 한글 불가용
        exp2: /^[0-9]+$/, // 숫자만
    };
    const validMessage = {
        form: {
            categoryName: {elem: null, msg: '* 카테고리명을 입력해주세요.'},
            categoryCode: {elem: null, msg: '* 카테고리 코드를 입력해주세요.'},
            sortOrder: {elem: null, msg: '* 정렬 순서를 입력해주세요.'},
        },
    };
    const setMessage = (elem, isValid) => {
        console.log(elem.name, isValid, validMessage.form[elem.name].elem);
        const name = elem.name;

        // 에러 메세지 생성
        if (!isValid) {
            elem.disabled = true;
            if (!validMessage.form[name].elem) {
                validMessage.form[name].elem = document.createElement('small');
                validMessage.form[name].elem.style.color = '#F1416C';
                elem.parentNode.insertBefore(validMessage.form[name].elem, elem.nextSibling);
                validMessage.form[name].elem.textContent = validMessage.form[name].msg;
            }
            elem.disabled = false;
            return
        }
        // 메세지 제거
        if (validMessage.form[name].elem) {
            validMessage.form[name].elem.remove();
            validMessage.form[name].elem = null;
        }
    }

    const clearInputIfInvalid = (inputEvent) => {
        const elem = inputEvent.target
        const inputValue = elem.value
        setMessage(elem, true);
        if (elem.name === 'categoryCode') {
            elem.value = inputValue.replace(new RegExp(regExp.exp1, 'g'), '');
        }
        if (elem.name === 'sortOrder') {
            // if (inputValue > 1000) {
            //     elem.value = 999;
            // }
            if(!regExp.exp2.test(inputValue)) {
                elem.value = inputValue.replace(/[^0-9]/g, '');
            }
        }
    }

    const validForm = async () => {
        let categoryName = document.getElementById('categoryName');
        let categoryCode = document.getElementById('categoryCode');
        let sortOrder = document.getElementById('sortOrder');

        let categoryNameBol = true;
        let categoryCodeBol = true;
        let sortOrderBol = true;

        if (!categoryName.value) {
            validMessage.form.categoryName.msg = '* 카테고리명을 입력해주세요.';
            categoryNameBol = false;
        } else if(categoryName.value.length < 2) {
            validMessage.form.categoryName.msg = '* 카테고리명은 2자 이상 입력해주세요.';
            categoryNameBol = false;
        }
        if (!categoryCode.value) categoryCodeBol = false;
        if (!sortOrder.value) sortOrderBol = false;

        // 메세지 세팅
        setMessage(categoryName, categoryNameBol);
        setMessage(categoryCode, categoryCodeBol);
        setMessage(sortOrder, sortOrderBol);

        return categoryNameBol && categoryCodeBol && sortOrderBol;
    }
    /*************************************** end : Valid ********************************************/
    /*********************************************************** POST 영역 ********************************************/
    async function saveCategory() {
        if (isSubmitting) {
            return;
        }
        isSubmitting = true;
        let data = makeData(null);
        if(!await validForm()) {
            isSubmitting = false;
            return false;
        }

        try {
            const response = await fetch('/api/v1/site/category', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            });

            const result = await response.json();
            if (result.result == true) {
                Swal.fire({
                    title: '등록 완료',
                    text: '등록되었습니다.',
                    icon: 'success',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.href = '/site/category-list';
                    }
                })
            } else {
                if(result.resultCode == '10009') {
                    let message = '노출여부 설정은 25개 이상 등록 불가합니다.<br> “Y” 값으로 등록되어 있는 카테고리를 “N”값으로 수정 후 재 등록해주세요.';
                    Swal.fire({
                        title: '등록 실패',
                        html: message,
                        icon: 'error',
                        confirmButtonText: '확인'
                    });
                    return false;
                }
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


    /*********************************************************** PUT 영역 ********************************************/

    async function updateCategory(element) {
        if (isSubmitting) {
            return;
        }
        isSubmitting = true;
        let idx = element.getAttribute('data-category-index');
        let data = makeData(idx);

        if(!await validForm()) {
            isSubmitting = false;
            return false;
        }

        try {
            const response = await fetch('/api/v1/site/category', {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            });

            const result = await response.json();
            if (result.result == true) {
                Swal.fire({
                    title: '등록 완료',
                    text: '등록되었습니다.',
                    icon: 'success',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.href = '/site/category-list';
                    }
                })
            } else {
                if(result.resultCode == '10009') {
                    let message = '노출여부 설정은 25개 이상 등록 불가합니다.<br> “Y” 값으로 등록되어 있는 카테고리를 “N”값으로 수정 후 재 등록해주세요.';
                    Swal.fire({
                        title: '등록 실패',
                        html: message,
                        icon: 'error',
                        confirmButtonText: '확인'
                    });
                    return false;
                }
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


    /*********************************************************** Modal 영역 ********************************************/


    function attachModalEventListeners() {
        const postModalElements = document.querySelectorAll('.postModal:not(.modal-attached)');
        const putModalElements = document.querySelectorAll('.putModal:not(.modal-attached)');
        postModalElements.forEach(function (element) {
            element.classList.add('modal-attached');
            element.addEventListener('click', postModalHandler);
        });

        putModalElements.forEach(function (element) {
            element.classList.add('modal-attached');
            element.addEventListener('click', putModalHandler);
        });
    }

    function postModalHandler(element) {
        const modalLayout = document.createElement('div');
        modalLayout.classList.add('modal', 'fade');
        modalLayout.id = 'postModalLayout';
        modalLayout.tabIndex = '-1';
        modalLayout.setAttribute('aria-hidden', 'true');

        const modalDialog = document.createElement('div');
        modalDialog.classList.add('modal-dialog', 'modal-dialog-centered', 'mw-650px');
        modalDialog.id = 'modalContent';

        modalLayout.appendChild(modalDialog);
        document.body.appendChild(modalLayout);
        let modal = new bootstrap.Modal(modalLayout, {
            keyboard: false
        });

        modalLayout.addEventListener('hidden.bs.modal', function() {
            modalLayout.remove();
        });

        let depth = element.getAttribute('data-depth');
        let newDepth = '';
        if (depth !== '1') {
            newDepth = parseInt(depth) - 1;
        }
        let selectElement = document.getElementById('menuIndex' + newDepth);

        let selectedOption = selectElement?.options[selectElement.selectedIndex] ?? null;
        let parentCategoryIndex = selectedOption?.getAttribute('data-category-index') ?? 0;
        NTUtil.ajax({
            url: '/site/category-modal?parentCategoryIndex=' + parentCategoryIndex + '&depth=' + depth,
            method: 'GET',
            success: function (data) {
                modalDialog.innerHTML = '';
                modalDialog.insertAdjacentHTML('beforeend', data);
                $(modalDialog).find('select').select2({
                    minimumResultsForSearch: Infinity
                });
                modal.show();
            }
        })
    }

    function putModalHandler(element) {
        const modalLayout = document.createElement('div');
        modalLayout.classList.add('modal', 'fade');
        modalLayout.id = 'putModalLayout';
        modalLayout.tabIndex = '-1';
        modalLayout.setAttribute('aria-hidden', 'true');

        const modalDialog = document.createElement('div');
        modalDialog.classList.add('modal-dialog', 'modal-dialog-centered', 'mw-650px');
        modalDialog.id = 'modalContent';

        modalLayout.appendChild(modalDialog);
        document.body.appendChild(modalLayout);
        let modal = new bootstrap.Modal(modalLayout, {
            keyboard: false
        });


        modalLayout.addEventListener('hidden.bs.modal', function() {
            modalLayout.remove();
        });

        let depth = element.getAttribute('data-depth');
        let newDepth = '';
        if (depth !== '1') {
            newDepth = parseInt(depth) - 1;
        }

        let selectElement = document.getElementById('menuIndex' + depth);
        let selectedOption = selectElement?.options[selectElement.selectedIndex] ?? null;
//        console.log(selectedOption);
        let categoryIndex = selectedOption?.getAttribute('data-category-index') ?? '';
        let categoryCode = selectedOption?.getAttribute('data-category-code') ?? '';

        let parentIdx = selectedOption?.getAttribute('data-parent-category-index') ?? '';


//        console.log('Depth:', depth);
//        console.log('Looking for ID:', 'categoryIndex' + depth);
//        console.log('Element:', document.getElementById('categoryIndex' + depth));
        NTUtil.ajax({
            url: '/site/category-modal?categoryIndex=' + categoryIndex + '&parentCategoryIndex=' + parentIdx + '&categoryCode=' + categoryCode + '&depth=' + depth,
            method: 'GET',
            success: function (data) {
                modalDialog.innerHTML = '';
                modalDialog.insertAdjacentHTML('beforeend', data);
                $(modalDialog).find('select').select2({
                    minimumResultsForSearch: Infinity
                });
                modal.show();
            }
        })
    }

    function closePostModal() {
        let modal = document.getElementById('postModalLayout');
        modal.remove();
        closeModalBackdrop();
    }

    function closePutModal() {
        let modal = document.getElementById('putModalLayout');
        modal.remove();
        closeModalBackdrop();
    }

    function closeModalBackdrop() {
        let backdrops = document.querySelectorAll('.modal-backdrop');

        if (!document.querySelector('.modal.show')) {

            backdrops.forEach(backdrop => backdrop.remove());
        }
    }
    // 수정 삭제, 비활성화 로직 추가
    const menuBtns = document.querySelectorAll('button[data-post-type]');
    const postBtns = document.querySelectorAll('button[data-post-type="post"]');
    const modifyBtns = document.querySelectorAll('button[data-post-type="put"]');
    // const deleteBtns = document.querySelectorAll('button[data-post-type="delete"]');

    document.getElementById("menuIndex1").addEventListener('change', (e) => { btnChecker(e); })
    document.getElementById("menuIndex2").addEventListener('change', (e) => { btnChecker(e); })
    document.getElementById("menuIndex3").addEventListener('change', (e) => { btnChecker(e); })

    const btnChecker = (e) => {
        const selectedOption = e.target.options[e.target.selectedIndex];
        const isOpen = selectedOption.dataset.isOpen == 'Y';
        const depth = e.target.dataset.depth;
        postBtns.forEach((btn) => {
            btn.disabled = (parseInt(depth) + 1 < parseInt(btn.dataset.depth));
        })
        modifyBtns.forEach((btn) => {
            btn.disabled = (depth != btn.dataset.depth);
        })
        // deleteBtns.forEach((btn) => {
        //     btn.disabled = isOpen ? true : (depth != btn.dataset.depth);
        // })
    }

    let isDelete = false;
    async function deleteCategory(elem) {
        const depth = elem.dataset.depth;
        console.log(depth);
        if (isDelete) {
            return;
        }
        isDelete = true;
        Swal.fire({
            title: '게시물 삭제',
            html: '등록하신 카테고리를 삭제 하시겠습니까?<br> 하위 카테고리도 모두 삭제됩니다.',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '확인',
            cancelButtonText: '취소'
        }).then(async (result) => {
            if (result.isConfirmed) {
                let categoryIndex = document.getElementById('menuIndex' + depth).options[document.getElementById('menuIndex' + depth).selectedIndex].dataset.categoryIndex;
                try {
                    const response = await fetch('/api/v1/site/category/' + categoryIndex, {
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
                                location.href = '/site/category-list';
                            }
                        })
                    } else {
                        Swal.fire({
                            title: '삭제 실패',
                            text: '삭체 처리에 실패되었습니다. \n다시 시도해주세요.',
                            icon: 'error',
                            confirmButtonText: '확인'
                        })
                    }

                } catch (Exception) {
                    console.error(Exception);
                } finally {
                    isSubmitting = false;
                }
            } else {
                isDelete = false;
            }
        });
    }
</script>
</body>
</html>
<style>
    select#menuIndex1 {
        width: 100%;
        height: 200px;
        border: 1px solid #000;
        background-color: #fff;
    }

    select#menuIndex1 option:checked {
        background-color: #FFFF66;
        color: #000000;
        font-weight: bold;
    }

    select#menuIndex1 option {
        padding: 10px;
    }

    select#menuIndex2 {
        width: 100%;
        height: 200px;
        border: 1px solid #000;
        background-color: #fff;
    }

    select#menuIndex2 option:checked {
        background-color: #FFFF66;
        color: #000000;
        font-weight: bold;
    }

    select#menuIndex2 option {
        padding: 10px;
    }

    select#menuIndex3 {
        width: 100%;
        height: 200px;
        border: 1px solid #000;
        background-color: #fff;
    }

    select#menuIndex3 option:checked {
        background-color: #FFFF66;
        color: #000000;
        font-weight: bold;
    }

    select#menuIndex3 option {
        padding: 10px;
    }
    .btn-primary:disabled, .btn-success:disabled {
        background-color: #B5B5C3 !important;
    }
</style>
<!--end::Javascript-->

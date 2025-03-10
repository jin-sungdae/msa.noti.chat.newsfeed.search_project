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
                                        장애감지
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3">제목</label>
                                            </div>
                                            <div class="col-lg-11">
                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                    <c:out value="${list.title}"/>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3">발생시간</label>
                                            </div>
                                            <div class="col-lg-11">
                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                    <c:out value="${list.occurTime}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3">파일위치</label>
                                            </div>

                                            <div class="col-lg-11 row">
                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                    <c:out value="${list.file}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3">발생서버</label>
                                            </div>

                                            <div class="col-lg-11 row">
                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                    <c:out value="${list.server}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3">User ID</label>
                                            </div>

                                            <div class="col-lg-11">
                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                    <c:out value="${list.userId}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3">User IP</label>
                                            </div>

                                            <div class="col-lg-11">
                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                    <c:out value="${list.userIp}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3">내용</label>
                                            </div>

                                            <div class="col-lg-11">
                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                    <c:out value="${list.description}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <div class="d-flex justify-content-start">
                                        <button type="button" class="btn btn-light btn-active-light-primary me-2" onclick="history.back()">목록</button>
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
<script type="text/javascript">

    /***************************************************** INIT ***************************************/
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
        }
    });


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

        for (let year = currentYear; year > currentYear - 100; year--) {
            const option = document.createElement('option');
            option.value = year;
            option.text = year;
            yearSelect.appendChild(option);
        }
    }


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

        let editGroup = document.getElementById('editGroup');
        let saveGroup = document.getElementById('saveGroup');
        let listCroup = document.getElementById('listGroup');
        let isSMS = document.getElementById('isSMS');
        let isMailing = document.getElementById('isMailing');
        let textbookOrderCount = document.getElementById('textbookOrderCount');
        let textBookOrderCountText = document.getElementById('textBookOrderCountText');
        let password = document.getElementById('password');
        let userTypeChange = document.getElementById('userTypeChange');
        let userType = document.getElementById('userType');
        let selectUserType = document.getElementById('selectUserType');

        editGroup.style.display = 'none';
        editGroup.classList.remove('col-9', 'd-flex', 'justify-content-end');
        listCroup.style.visibility = 'hidden';
        saveGroup.style.display = 'flex';
        saveGroup.classList.add('col-9', 'd-flex', 'justify-content-end');
        textBookOrderCountText.parentElement.classList.add('required');

        selectUserType.style.display = 'flex';
        userType.style.display = 'none';
        password.style.display = 'flex';
        userTypeChange.style.display = 'flex';

        isSMS.removeAttribute('disabled');
        isMailing.removeAttribute('disabled');
        textbookOrderCount.removeAttribute('disabled');
    }

    async function cancel() {
        let editGroup = document.getElementById('editGroup');
        let saveGroup = document.getElementById('saveGroup');
        let listGroup = document.getElementById('listGroup');
        let isSMS = document.getElementById('isSMS');
        let isMailing = document.getElementById('isMailing');
        let textbookOrderCount = document.getElementById('textbookOrderCount');
        let password = document.getElementById('password');
        let userTypeChange = document.getElementById('userTypeChange');
        let userType = document.getElementById('userType');
        let selectUserType = document.getElementById('selectUserType');
        let textBookOrderCountText = document.getElementById('textBookOrderCountText');
        let passwordChangeContainer = document.getElementById('passwordChangeContainer');
        let passwordBtn = document.getElementById('passwordBtn');
        let passwordText = document.getElementById('passwordText');

        saveGroup.style.display = 'none';
        saveGroup.classList.remove('col-9', 'd-flex', 'justify-content-end');
        textBookOrderCountText.parentElement.classList.remove('required');

        passwordBtn.style.display = 'flex';
        passwordChangeContainer.style.display = 'none';
        passwordText.parentElement.classList.remove('required');

        listGroup.style.visibility = 'visible';
        editGroup.style.display = 'flex';
        editGroup.classList.add('col-9', 'd-flex', 'justify-content-end');

        password.style.display = 'none';
        userTypeChange.style.display = 'none';
        selectUserType.style.display = 'none';
        userType.style.display = 'flex';

        isSMS.setAttribute('disabled', '');
        isMailing.setAttribute('disabled', '');
        textbookOrderCount.setAttribute('disabled', '');
    }

    function passwordChange() {
        console.log('password change');

        let passwordText = document.getElementById('passwordText');
        passwordText.parentElement.classList.add('required');



        let container = document.getElementById('passwordChangeContainer');
        let passwordBtn = document.getElementById('passwordBtn');

        let htmlContent = `
        <div class="row slide-in-animation">
            <div class="col-lg-7">
                <input id="newPassword" type="password" class="form-control" placeholder="새 비밀번호">
            </div>
            <div class="col-lg-5">
                <button data-uid="${data.user.uid}" type="button" class="btn btn-dark" onclick="completeChange(this)">변경완료</button>
            </div>

            <div class="col-12">
                <small class="form-text text-muted">
                    비밀번호는 8~12자의 영문/숫자/특수문자 조합하여 입력하세요.
                </small>
            </div>
        </div>
    `;


        container.innerHTML = htmlContent;
        passwordBtn.style.display = 'none';
        container.style.display = 'block';

    }

    async function completeChange(element) {
        if (isSubmitting) {
            return;
        }
        isSubmitting = true;
        try {
            let uid = element.getAttribute('data-uid');
            let password = document.getElementById('newPassword').value;
            const data = {
                password: password
            }
            console.log(uid)
            console.log(password);
            const response = await fetch('/api/v1/user/' + uid + '/password', {
                method: 'PATCH',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            });

            const result = await response.json();

            console.log(result);

            if (result.data == 'true') {
                Swal.fire({
                    title: '비밀번호 변경 완료',
                    text: '비밀번호 변경이 완료되었습니다.',
                    icon: 'success',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.reload();
                    }
                })
            } else if (result.data == 'false') {
                Swal.fire({
                    title: '비밀번호 변경 실패',
                    text: '비밀번호 변경에 실패하였습니다.',
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


    async function userTypeChange(element) {
        if (isSubmitting) {
            return;
        }
        isSubmitting = true;
        let uid = element.getAttribute('data-uid');
        let selectUserType = document.getElementById('subSelectUserType');

        try {

            const response = await fetch('/api/v1/user/' + uid + '/type', {
                method: 'PATCH',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({userType: selectUserType.value})
            });

            const result = await response.json();
            if (result.data == 'true') {
                Swal.fire({
                    title: '회원구분 변경 완료',
                    text: '회원구분 변경이 완료되었습니다.',
                    icon: 'success',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.reload();
                    }
                })
            } else if (result.data == 'false') {
                Swal.fire({
                    title: '회원구분 변경 실패',
                    text: '회원구분 변경에 실패하였습니다.',
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

    async function deleteUser(element) {
        if (isSubmitting) {
            return;
        }
        isSubmitting = true;

        // 탈퇴 처리 전에 사용자에게 확인 요청
        Swal.fire({
            title: '탈퇴 처리 확인',
            text: '정말로 탈퇴 처리하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '예, 탈퇴 처리합니다',
            cancelButtonText: '아니요, 취소합니다'
        }).then(async (result) => {
            if (result.isConfirmed) {
                let uid = element.getAttribute('data-uid');
                try {
                    const response = await fetch('/api/v1/user/' + uid, {
                        method: 'PATCH',
                        headers: {
                            'Content-Type': 'application/json',
                        }
                    });

                    const result = await response.json();

                    if (result.result == true) {
                        Swal.fire({
                            title: '탈퇴 처리 완료',
                            text: '탈퇴 처리가 완료되었습니다.',
                            icon: 'success',
                            confirmButtonText: '확인'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                location.href = '/user/user-list';
                            }
                        })
                    } else {
                        Swal.fire({
                            title: '탈퇴 처리 실패',
                            text: '탈퇴 처리에 실패하였습니다.',
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
                isSubmitting = false;
            }
        });
    }

    async function resetSeriesSearchForm() {
        if (isSubmitting) {
            return;
        }
        isSubmitting = true;

        document.getElementById('bookCodeSearchSdate').value = '';

        let selects = document.querySelectorAll('.form-select');
        selects.forEach(function(select) {
            select.selectedIndex = 0;
        })

        let searchResults = document.getElementById('bookCodeModalTableBody');
        if (searchResults) {
            searchResults.innerHTML = '<tr><td class="center">데이터가 없습니다.</td></tr>';
        }
        isSubmitting = false;
    }

    async function resetBookSearchForm() {
        if (isSubmitting) {
            return;
        }
        isSubmitting = true;

        document.getElementById('bookCodeSearchSdate').value = '';

        let selects = document.querySelectorAll('.form-select');
        selects.forEach(function(select) {
            select.selectedIndex = 0;
            $(select).select2({
                minimumResultsForSearch: Infinity
            }).trigger('change');

        })

        let searchResults = document.getElementById('bookCodeModalTableBody');
        if (searchResults) {
            searchResults.innerHTML = '<tbody><tr><td class="center">데이터가 없습니다.</td></tr></tbody>';
        }
        isSubmitting = false;
    }



    /**************************************************************** GET ***************************************************************/
    async function searchBookCode() {
        if (isSubmitting) {
            return;
        }
        isSubmitting = true;

        console.log('searchBookCode');
        isSubmitting = false;
    }

    async function searchSeriesCode() {
        if (isSubmitting) {
            return;
        }

        isSubmitting = true;

        console.log('searchSeriesCode');

        isSubmitting = false;
    }

    /*********************************************************** Modal 영역 ********************************************/


    function attachModalEventListeners() {
        const bookCodeModalElements = document.querySelectorAll('.bookCodeModal:not(.modal-attached)');
        const seriesModalElements = document.querySelectorAll('.seriesCodeModal:not(.modal-attached)');
        bookCodeModalElements.forEach(function (element) {
            element.classList.add('modal-attached');
            element.addEventListener('click', openBookCodeModalHandler);
        });

        seriesModalElements.forEach(function (element) {


            element.classList.add('modal-attached');
            element.addEventListener('click', openSeriesModalHandler);
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

        NTUtil.ajax({
            url: '/reference/modal/book-code-search',
            method: 'GET',
            success: function (data) {
                modalDialog.innerHTML = '';
                modalDialog.insertAdjacentHTML('beforeend', data);
                $(modalDialog).find('select').select2({
                    minimumResultsForSearch: Infinity
                });

                yearInit();

                modal.show();
            }
        })
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

        modalLayout.addEventListener('hidden.bs.modal', function() {
            modalLayout.remove();
        });

        NTUtil.ajax({
            url: '/reference/modal/series-code-search',
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

    function closeBookCodeModal() {
        let modal = document.getElementById('bookCodeModalLayout');
        modal.remove();
        closeModalBackdrop();
    }

    function closeSeriesCodeModal() {
        let modal = document.getElementById('seriesCodeModalLayout');
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





</script>

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



</style>
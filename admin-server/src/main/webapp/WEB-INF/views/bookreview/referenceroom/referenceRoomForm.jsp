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
                    <input type="hidden" name="uid" id="uid" value="${list.uid}"/>
                    <input type="hidden" name="adminId" id="adminId" value="${list.adminId}"/>
                    <input type="hidden" name="adminIdx" id="adminIdx" value="${list.adminIndex}"/>
                    <input type="hidden" name="account" id="account" value ="${account}" />
                    <input type="hidden" id="chUid" />
                    <input type="hidden" id="regDate" />
                    <div class="container-fluid">
                        <!-- 본문 내용 START -->
                        <form>
                            <div class="card mb-5 mb-xl-10">
                                <div class="card-header border-0 pt-5">
                                    <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                        기본 정보
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3">작성자</label>
                                            </div>
                                            <div class="col-lg-8 row">

                                                <div id="userType" class="col-lg-4 form-label text-dark pt-3">
                                                    <c:out value="${data.user.userType}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex justify-content-center align-items-center ">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3 required">구분</label>
                                            </div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-3">
                                                    <select
                                                            id="month"
                                                            class="form-select form-select-solid"
                                                            name="month"
                                                            data-control="select2"
                                                            data-hide-search="true"
                                                    >
                                                        <option value="3002" ${data.user.userType eq '학생' ? 'selected' : ''}>선택</option>
                                                        <option value="3003" ${data.user.userType eq '선생님' ? 'selected' : ''}>12</option>
                                                        <option value="3004" ${data.user.userType eq '학부모' ? 'selected' : ''}>11</option>
                                                        <option value="3005" ${data.user.userType eq '일반' ? 'selected' : ''}>10</option>
                                                        <option value="3006" ${data.user.userType eq '학원강사' ? 'selected' : ''}>9</option>
                                                        <option value="2001" ${data.user.userType eq '관리자' ? 'selected' : ''}>8</option>
                                                        <option value="3003" ${data.user.userType eq '선생님' ? 'selected' : ''}>7</option>
                                                        <option value="3004" ${data.user.userType eq '학부모' ? 'selected' : ''}>6</option>
                                                        <option value="3005" ${data.user.userType eq '일반' ? 'selected' : ''}>5</option>
                                                        <option value="3006" ${data.user.userType eq '학원강사' ? 'selected' : ''}>4</option>
                                                        <option value="2001" ${data.user.userType eq '관리자' ? 'selected' : ''}>3</option>
                                                        <option value="3003" ${data.user.userType eq '선생님' ? 'selected' : ''}>2</option>
                                                        <option value="3004" ${data.user.userType eq '학부모' ? 'selected' : ''}>1</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex justify-content-center align-items-center ">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3 required">자료구분</label>
                                            </div>
                                            <div class="col-lg-8">

                                                <div class="col-lg-4">
                                                    <select
                                                            id="month"
                                                            class="form-select form-select-solid"
                                                            name="month"
                                                            data-control="select2"
                                                            data-hide-search="true"
                                                    >
                                                        <option value="3002" ${data.user.userType eq '학생' ? 'selected' : ''}>선택</option>
                                                        <option value="3003" ${data.user.userType eq '선생님' ? 'selected' : ''}>12</option>
                                                        <option value="3004" ${data.user.userType eq '학부모' ? 'selected' : ''}>11</option>
                                                        <option value="3005" ${data.user.userType eq '일반' ? 'selected' : ''}>10</option>
                                                        <option value="3006" ${data.user.userType eq '학원강사' ? 'selected' : ''}>9</option>
                                                        <option value="2001" ${data.user.userType eq '관리자' ? 'selected' : ''}>8</option>
                                                        <option value="3003" ${data.user.userType eq '선생님' ? 'selected' : ''}>7</option>
                                                        <option value="3004" ${data.user.userType eq '학부모' ? 'selected' : ''}>6</option>
                                                        <option value="3005" ${data.user.userType eq '일반' ? 'selected' : ''}>5</option>
                                                        <option value="3006" ${data.user.userType eq '학원강사' ? 'selected' : ''}>4</option>
                                                        <option value="2001" ${data.user.userType eq '관리자' ? 'selected' : ''}>3</option>
                                                        <option value="3003" ${data.user.userType eq '선생님' ? 'selected' : ''}>2</option>
                                                        <option value="3004" ${data.user.userType eq '학부모' ? 'selected' : ''}>1</option>
                                                    </select>
                                                </div>


                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex justify-content-center align-items-center ">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3 required">제목</label>
                                            </div>
                                            <div class="col-lg-8">
                                                <input type="text" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3 required">첨부파일</label>
                                            </div>
                                            <div class="fv-row fv-plugins-icon-container col-lg-10" id="dropzoneContainer">
                                                <!-- 파일 업로드 섹션 -->
                                                <jsp:include page="/FileFormINC" flush="false">
                                                    <jsp:param name="isImage" value="false" />
                                                    <jsp:param name="hasOrder" value="false" />
                                                    <jsp:param name="parentTable" value="banner"/>
                                                    <jsp:param name="parentIndex" value="${uid == null ?'':region.regionIndex}"/>
                                                    <jsp:param name="parentUid" value="${uid == null ? '' : uid}"/>
                                                    <jsp:param name="parentType" value="IMAGE"/>
                                                    <jsp:param name="maxFileCount" value="1"/>
                                                    <jsp:param name="isSecure" value="N"/>
                                                    <jsp:param name="DZID" value="dz0"/>
                                                </jsp:include>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3 required">노출여부</label>
                                            </div>
                                            <div class="col-lg-4 row">

                                                <div class="col-lg-3 row  d-flex justify-content-center align-items-center">
                                                    <div class="col">
                                                        <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                            <input class="form-check-input" type="radio" name="isEmpty" value="" checked id="isNEmpty"/>
                                                            <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isNEmpty">
                                                                N
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                            <input class="form-check-input" type="radio" name="isEmpty" value="" checked id="isYEmpty"/>
                                                            <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isYEmpty">
                                                                Y
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-footer" id="footerIdx">
                                    <div class="row">
                                        <div id="listGroup" class="col-3">
                                            <button type="button" class="btn btn-light-primary" style="background-color: #343a40; color: #FFFFFF" onclick="history.back()">목록</button>
                                        </div>
                                        <div id="editGroup" class="col-9 d-flex justify-content-end">
                                            <button
                                                    data-uid="${data.user.uid}"
                                                    type="button"
                                                    id="deleteBtn"
                                                    class="btn btn-light-primary me-2"
                                                    style="background-color: #fff3cd; color: #181C32"
                                                    onclick="deleteUser(this)">
                                                탈퇴 처리
                                            </button>
                                            <button type="button" class="btn btn-warning" style="background-color: #ffcd39; color: #181C32" onclick="modify()">
                                                수정
                                            </button>
                                        </div>
                                        <div id="saveGroup" style="display: none;">
                                            <button type="button" id="cancelBtn" class="btn btn-light-primary me-2" style="background-color: #fff3cd; color: #181C32" onclick="cancel()">
                                                취소
                                            </button>
                                            <button
                                                    data-uid="${data.user.uid}"
                                                    type="button"
                                                    class="btn btn-warning"
                                                    style="background-color: #ffcd39; color: #181C32"
                                                    onclick="save(this)"
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
<script type="text/javascript">

    /***************************************************** INIT ***************************************/




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



    /**************************************************************** DELETE ***************************************************************/




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

    .slide-in-animation {
        animation: slide-in 0.5s forwards;
    }

</style>
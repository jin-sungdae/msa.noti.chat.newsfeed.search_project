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
                <div id="kt_content_container" class="container-fluid container-xl">
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
                                        메인 배너 관리
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-2 ">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3">작성자</label>
                                            </div>
                                            <div class="col-lg-10 row">

                                                <div id="userType" class="col-lg-4 form-label text-dark pt-3">
                                                    <c:out value="${data.user.userType}"/>
                                                </div>

                                            </div>
                                        </div>
                                        <c:if test="${data.uid}">
                                            <div class="col-lg-4 row">
                                                <div class="col-lg-6 ">
                                                    <label class="col-lg-10 form-label fw-bolder text-dark pt-3">작성일시</label>
                                                </div>
                                                <div class="col-lg-8 row">

                                                    <div id="userType" class="col-lg-4 form-label text-dark pt-3">
                                                        <c:out value="${data.user.userType}"/>
                                                    </div>

                                                </div>
                                            </div>
                                        </c:if>

                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-2  d-flex align-items-center">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3 required">제목</label>
                                            </div>

                                            <div class="col-lg-10">
                                                <c:if test="${data.uid}">
                                                    <div class="col-lg-12 form-label text-dark pt-3">
                                                        <c:out value="${data.user.userName}"/>
                                                    </div>
                                                </c:if>
                                                <c:if test="${empty data.uid}">
                                                    <div class="col-lg-12 form-label text-dark">
                                                        <input type="text"  class="form-control" id="userName" name="userName" value="${data.user.userName}" required>
                                                    </div>
                                                </c:if>


                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8" id="floatingBanner">
                                        <div class="col-lg-1 d-flex align-items-center ">
                                            <!-- 상위 라벨 "배너 이미지" -->
                                            <label class="form-label fw-bolder text-dark required">배너 이미지</label>
                                        </div>
                                        <div class="col-lg-9">
                                            <!-- "PC" 섹션 -->
                                            <div class="row">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex align-items-center ">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark required">PC</label>
                                                    </div>

                                                    <div class="fv-row fv-plugins-icon-container col-lg-11" id="dropzoneContainer">
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
                                            <!-- "Mobile" 섹션 -->
                                            <div class="row">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex align-items-center ">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark required">Mobile</label>
                                                    </div>
                                                    <div class="fv-row fv-plugins-icon-container col-lg-11" id="dropzoneContainer2">
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
                                        </div>
                                    </div>




                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-2  d-flex align-items-center">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3">배너 이미지 링크</label>
                                            </div>
                                            <div class="col-lg-10">

                                                <c:if test="${data.uid}">
                                                    <div class="col-lg-12 form-label text-dark pt-3">
                                                        <c:out value="${data.user.userName}"/>
                                                    </div>
                                                </c:if>
                                                <c:if test="${empty data.uid}">
                                                    <div class="col-lg-12 form-label text-dark">
                                                        <input type="text"  class="form-control" id="userName" name="userName" value="${data.user.userName}" required>
                                                    </div>
                                                </c:if>


                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-2 ">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3 required">노출여부</label>
                                            </div>
                                            <div class="col-lg-4 pt-3 row">

                                                <div class="col-lg-4">
                                                    <label class="form-check-label me-10">
                                                        <input
                                                                class="form-check-input"
                                                                type="radio"
                                                                name="linkType"
                                                        ${empty list.uid || list.linkType == '0'  ? 'checked' : ''}
                                                                value="0"
                                                        />
                                                        <c:out value="N"/>
                                                    </label>
                                                    <label class="form-check-label">
                                                        <input
                                                                class="form-check-input"
                                                                type="radio"
                                                                name="linkType"
                                                        ${list.linkType == '1' ? 'checked' : ''}
                                                                value="1"
                                                        />
                                                        <c:out value="Y"/>
                                                    </label>
                                                </div>


                                                <div class="col-lg-7">
                                                    <span class="ms-2" style="color: gray;">* 노출여부 설정은 3개까지 등록 가능합니다.</span>
                                                </div>

                                            </div>

                                            <div class="col-lg-4 row">
                                                <div class="col-lg-6 ">
                                                    <label class="col-lg-10 form-label fw-bolder text-dark pt-3 required">노출순서</label>
                                                </div>
                                                <div class="col-lg-5 row">

                                                    <select
                                                            id="userType"
                                                            name="userType"
                                                            class="form-select form-select-solid"
                                                            data-control="select2"
                                                            data-hide-search="true"
                                                            ${empty list.uid ? 'disabled' : ''}
                                                    >
                                                        <option value="">Select</option>
                                                        <option value="3005" ${param.userType eq '3005' ? 'selected' : ''}>일반</option>
                                                        <option value="3002" ${param.userType eq '3002' ? 'selected' : ''}>학생</option>
                                                        <option value="3004" ${param.userType eq '3004' ? 'selected' : ''}>학부모</option>
                                                        <option value="3003" ${param.userType eq '3003' ? 'selected' : ''}>선생님</option>
                                                        <option value="3006" ${param.userType eq '3006' ? 'selected' : ''}>학원선생님</option>

                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer" id="footerIdx">
                                    <div class="row">
                                        <c:if test="${not empty data.uid}">
                                            <div id="listGroup" class="col-3">
                                                <button type="button" class="btn btn-light-primary" style="background-color: #343a40; color: #FFFFFF" onclick="history.back()">목록</button>
                                            </div>
                                            <div id="editGroup" class="col-9 d-flex justify-content-end">
                                                <button
                                                        data-uid="${data.user.uid}"
                                                        type="button"
                                                        class="btn btn-light-primary me-2"
                                                        onclick="history.back()">
                                                    취소
                                                </button>
                                                <button type="button" class="btn btn-warning" onclick="save()">
                                                    저장
                                                </button>
                                            </div>
                                        </c:if>
                                        <c:if test="${empty data.uid}">
                                            <div id="editGroup" class="col-12 d-flex justify-content-end">
                                                <button
                                                        data-uid="${data.user.uid}"
                                                        type="button"
                                                        class="btn btn-light-primary me-2"
                                                        onclick="history.back()">
                                                    취소
                                                </button>
                                                <button type="button" class="btn btn-warning" onclick="save()">
                                                    저장
                                                </button>
                                            </div>
                                        </c:if>
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
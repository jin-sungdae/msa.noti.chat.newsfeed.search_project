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
                    <input type="hidden" name="uid" id="uid" value="${lectureRequest.uid}"/>
                    <input type="hidden" id="regDate" />
                    <div class="container-fluid">
                        <!-- 본문 내용 START -->
                        <form>
                            <div class="card mb-5 mb-xl-10">
                                <div class="card-header border-0 pt-5">
                                    <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                        강연신청
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="row mb-8">
                                        <label class="col-lg-2 fw-bolder w-sm-175px">희망 작가명</label>
                                        <div class="col-lg-3">
                                            <c:out value="${lectureRequest.hopeWriter}"/>
                                        </div>
                                        <label class="col-lg-2 fw-bolder w-sm-175px">신청일시</label>
                                        <div class="col-lg-3">
                                            <c:out value="${lectureRequest.regDate}"/>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <label class="col-lg-2 fw-bolder w-sm-175px">도서명</label>
                                        <div class="col-lg-9 d-flex align-items-center">
                                            <c:out value="${lectureRequest.bookTitle}"/>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <label class="col-lg-2 fw-bolder w-sm-175px">강연 주제</label>
                                        <div class="col-lg-9 d-flex align-items-center">
                                            <c:out value="${lectureRequest.lectureTheme}"/>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <label class="col-lg-2 fw-bolder w-sm-175px">강연 대상</label>
                                        <div class="col-lg-9 d-flex align-items-center">
                                            <c:out value="${lectureRequest.lectureTarget}"/>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <label class="col-lg-2 fw-bolder w-sm-175px">강연 형식</label>
                                        <div class="col-lg-9 d-flex align-items-center">
                                            <c:out value="${lectureRequest.lectureType}"/>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <label class="col-lg-2 fw-bolder w-sm-175px">참석 인원</label>
                                        <div class="col-lg-9 d-flex align-items-center">
                                            <c:out value="${lectureRequest.personnel}"/> 명
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <label class="col-lg-2 fw-bolder w-sm-175px">희망 일시</label>
                                        <div class="col-lg-9">
                                            <div class="row mb-3">
                                                <label class="col-lg-1 fw-bolder w-sm-80px">1 지망</label>
                                                <div class="col-lg-9">
                                                    <c:out value="${lectureRequest.hopeDate1}"/>(<c:out value="${lectureRequest.dayOfWeek1}"/>) <c:out value="${lectureRequest.hopeStartTime1}"/> <c:out value="${lectureRequest.hopeEndTime1}"/>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <label class="col-lg-1 fw-bolder w-sm-80px">2 지망</label>
                                                <div class="col-lg-9">
                                                    <c:if test="${not empty lectureRequest.hopeDate2}">
                                                        <c:out value="${lectureRequest.hopeDate2}"/>(<c:out value="${lectureRequest.dayOfWeek2}"/>) <c:out value="${lectureRequest.hopeStartTime2}"/> <c:out value="${lectureRequest.hopeEndTime2}"/>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <label class="col-lg-1 fw-bolder w-sm-80px">3 지망</label>
                                                <div class="col-lg-9">
                                                    <c:if test="${not empty lectureRequest.hopeDate3}">
                                                        <c:out value="${lectureRequest.hopeDate3}"/>(<c:out value="${lectureRequest.dayOfWeek3}"/>) <c:out value="${lectureRequest.hopeStartTime3}"/> <c:out value="${lectureRequest.hopeEndTime3}"/>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <label class="col-lg-2 fw-bolder w-sm-175px">신청 기관명</label>
                                        <div class="col-lg-9 d-flex align-items-center">
                                            <c:out value="${lectureRequest.applicationOrganization}"/>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <label class="col-lg-2 fw-bolder w-sm-175px">강연 장소</label>
                                        <div class="col-lg-9 d-flex align-items-center">
                                            <c:out value="${lectureRequest.place}"/>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <label class="col-lg-2 fw-bolder w-sm-175px">강연료</label>
                                        <div class="col-lg-9 d-flex align-items-center">
                                            <c:out value="${lectureRequest.price}"/> 원
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <label class="col-lg-2 fw-bolder w-sm-175px">신청자명</label>
                                        <div class="col-lg-9 d-flex align-items-center">
                                            <c:out value="${lectureRequest.applicantName}"/>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <label class="col-lg-2 fw-bolder w-sm-175px">신청자 연락처</label>
                                        <div class="col-lg-9">
                                            <c:out value="${lectureRequest.applicantPhoneNo}"/>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <label class="col-lg-2 fw-bolder w-sm-175px">신청자 이메일</label>
                                        <div class="col-lg-9">
                                            <c:out value="${lectureRequest.applicantEmail}"/>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <label class="col-lg-2 fw-bolder w-sm-175px">요청 사항</label>
                                        <div class="col-lg-9">
                                            <c:out value="${lectureRequest.content}"/>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <label class="col-lg-2 fw-bolder w-sm-175px">동의</label>
                                        <div class="col-lg-9">
                                            전체 동의 완료
                                        </div>
                                    </div>

                                </div>
                                <div class="card-footer" id="footerIdx">
                                    <div class="row">
                                        <div id="listGroup" class="col-3">
                                            <button type="button" class="btn btn-light-primary" style="background-color: #343a40; color: #FFFFFF" onclick="history.back()">목록</button>
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
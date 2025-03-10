<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/inc/HeaderINC.jsp" %>

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
                                            <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 fs-4">교사유형</label>
                                            </div>
                                            <div class="col-lg-8 row">

                                                <div id="userType" class="col-lg-4 form-label fw-bold text-dark pt-3 fs-6">
                                                    <c:out value="${not empty data.userDetail.teacherTypeString ? data.userDetail.teacherTypeString : '-'}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 fs-4">이름</label>
                                            </div>
                                            <div class="col-lg-8">

                                                <div class="col-lg-12 form-label text-dark fw-bold pt-3 fs-6">
                                                    <c:out value="${data.user.userName}"/>
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 fs-4">아이디</label>
                                            </div>
                                            <div class="col-lg-8">

                                                <div class="col-lg-12 form-label text-dark fw-bold pt-3 fs-6">
                                                    <c:out value="${data.user.userId}"/>
                                                </div>


                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 fs-4">학교명</label>
                                            </div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-12 form-label text-dark fw-bold pt-3 fs-6">
                                                    <c:out value="${not empty data.userDetail.name ? data.userDetail.name : '-'}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 fs-4">학교주소</label>
                                            </div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-12 form-label text-dark fw-bold pt-3 fs-6">
                                                    <c:out value="${not empty data.userDetail.address1 ? data.userDetail.address1 : '-'}"/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 row">

                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 fs-4">학교분류</label>
                                            </div>
                                            <div class="col-lg-3">

                                                <div class="col-lg-12 form-label text-dark pt-3 fs-6">
                                                    <c:out value="${not empty data.userDetail.schoolType ? data.userDetail.schoolType : '-'}"/>
                                                </div>


                                            </div>

                                            <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3 fs-4">학년</label>
                                            </div>
                                            <div class="col-lg-3">

                                                <div class="col-lg-12 form-label text-dark pt-3 fs-6">
                                                    <c:out value="${not empty data.userDetail.schoolGrade ? data.userDetail.schoolGrade : '-'}"/>
                                                </div>


                                            </div>

                                            <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3 fs-4">관심과목</label>
                                            </div>
                                            <div class="col-lg-3">

                                                <div class="col-lg-12 form-label text-dark pt-3 fs-6">
                                                    <c:out value="${not empty data.userDetail.subjectName ? data.userDetail.subjectName : '-'}"/>
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
                                                교사인증
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 fs-4">교사 인증방식</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <div class="col-lg-12 form-label text-dark pt-3 fs-6">
                                                        <c:out value="${not empty data.userDetail.teacherCertificationTypeString ? data.userDetail.teacherCertificationTypeString : '-'}"/>
                                                    </div>
                                                </div>
                                                <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 fs-4">인증 요청 일시</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <div class="col-lg-12 form-label text-dark pt-3 fs-6">
                                                        <c:out value="${not empty data.userDetail.teacherCertificationDate ? data.userDetail.teacherCertificationDate : '-'}"/>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <c:if test="${data.userDetail.teacherCertificationType eq '02'}">
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 fs-4">첨부파일</label>
                                                    </div>
                                                    <div class="col-lg-8">
                                                        <div class="col-lg-12 form-label text-dark pt-3 fs-6">
                                                            <a href="/api/v1/file/file-download/${data.userDetail.certFileUid}">
                                                                <c:out value="${data.userDetail.certFileName}"/>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">인증상태</label>
                                                </div>
                                                <div class="col-lg-3" id="teacherCertificationStatusText">
                                                    <div class="col-lg-12 form-label text-dark pt-3">
                                                        <c:out value="${not empty data.userDetail.teacherCertificationStatusString ? data.userDetail.teacherCertificationStatusString : '미완료'}"/>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3" id="teacherCertificationStatusInput" style="display: none;">
                                                    <div class="col-lg-4 form-label text-dark pt-3 fs-6">
                                                        <select
                                                                id="teacherCertificationStatus"
                                                                name="teacherCertificationStatus"
                                                                class="form-select form-select-solid"
                                                                data-control="select2"
                                                                data-hide-search="true"
                                                        >
                                                            <option value="01" ${data.userDetail.teacherCertificationStatusString eq '미완료' ? 'selected' : ''}>미완료</option>
                                                            <option value="02" ${data.userDetail.teacherCertificationStatusString eq '대기' ? 'selected' : ''}>대기</option>
                                                            <option value="03" ${data.userDetail.teacherCertificationStatusString eq '검토중' ? 'selected' : ''}>검토중</option>
                                                            <option value="04" ${data.userDetail.teacherCertificationStatusString eq '완료' ? 'selected' : ''}>완료</option>
                                                            <option value="05" ${data.userDetail.teacherCertificationStatusString eq '반려' ? 'selected' : ''}>반려</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-lg-1 align-items-center justify-content-start companion" ${data.userDetail.teacherCertificationStatus ne '05' ? 'style="display: none;"' : ''} >
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 fs-4">반려 사유</label>
                                                </div>
                                                <div class="col-lg-5 reject-div" ${data.userDetail.teacherCertificationStatus ne '05' ? 'style="display: none;"' : ''}>
                                                    <div class="col-lg-12 form-label text-dark fw-bold pt-3 fs-6" >
                                                        ${data.userDetail.teacherCertificationRejectionReason}
                                                    </div>
                                                </div>
                                                <div class="col-lg-5 companion" style="display: none">
                                                    <div class="col-lg-12 form-label text-dark pt-3 fs-6">
                                                        <input class="form-control" type="text" id="teacherCertificationRejectionReason" name="title" maxlength="50" value="${data.userDetail.teacherCertificationRejectionReason}" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="card mb-5 mb-xl-10">
                                <div id="option">
                                    <div class="card-body">
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-1 ">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 fs-4">수정자</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <div class="col-lg-12 form-label text-dark pt-3 fs-6">
                                                        <c:out value="${data.user.adminName}"/>(<c:out value="${data.user.department}"/>)
                                                    </div>
                                                </div>
                                                <div class="col-lg-1">
                                                    <label class="col-lg-10 form-label fw-bolder text-dark pt-3 fs-4">수정일시</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <div class="col-lg-12 form-label text-dark pt-3 fs-6">
                                                        <c:out value="${data.user.modDate}"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer" id="footerIdx">
                                        <div class="row">
                                            <div id="listGroup" class="col-3">
                                                <button type="button" class="btn btn-light-dark" style="background-color: #343a40; color: #FFFFFF" onclick="goList()">목록</button>
                                            </div>
<%--                                            <c:if test="${data.userDetail.teacherCertificationTypeString eq '서류 인증'}">--%>
                                            <div id="editGroup" class="col-9 d-flex justify-content-end">
                                                <button type="button" class="btn btn-light-warning" style="background-color: #ffcd39; color: #181C32" onclick="modify()">
                                                    수정
                                                </button>
                                            </div>
<%--                                            </c:if>--%>
                                            <div id="saveGroup" style="display: none;">
                                                <button type="button" id="cancelBtn" class="btn btn-light-warning me-2" style="background-color: #fff3cd; color: #181C32" onclick="cancel()">
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

<form name="searchForm" id="searchForm">
    <input type="hidden" name="sdate" value="${reqMap.sdate}" />
    <input type="hidden" name="edate" value="${reqMap.edate}" />
    <input type="hidden" name="teacherType" value="${reqMap.teacherType}" />
    <input type="hidden" name="teacherCertificationStatus" value="${reqMap.teacherCertificationStatus}" />
    <input type="hidden" name="search" value="${reqMap.search}" />
    <input type="hidden" name="perPage" value="${reqMap.perPage}" />
    <input type="hidden" name="page" value="${reqMap.page}" />
</form>

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

    function validation(data) {
        let nothingData = [];
        for (let key in data) {
            if (data.hasOwnProperty(key)) {
                if (data[key] === '') {
                    nothingData.push(key);
                }
            }
        }
        return nothingData;
    }


    function limitLength(inputField, maxLength){
        if (inputField.value.length > maxLength) {
            inputField.value = inputField.value.slice(0, maxLength);
        }
    }


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

        if(document.getElementById('teacherCertificationStatus').value == '05' && document.querySelector('#teacherCertificationRejectionReason').value == '') {
            Swal.fire({
                title: '반려사유 미입력',
                text: '반려사유를 입력해주세요.',
                icon: 'error',
                confirmButtonText: '확인'
            })
            return;
        }

        isSubmitting = true;
        let uid = element.getAttribute('data-uid');
        let data = {
            teacherCertificationStatus : document.getElementById('teacherCertificationStatus').value,
            teacherCertificationRejectionReason: document.querySelector('#teacherCertificationRejectionReason').value
        }

        try {
            const response = await fetch('/api/v1/user/' + uid + '/isTeacherCertificationStatus', {
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

        let teacherCertificationStatusText = document.getElementById('teacherCertificationStatusText');
        let teacherCertificationStatusInput = document.getElementById('teacherCertificationStatusInput');

        teacherCertificationStatusText.style.display = 'none';
        teacherCertificationStatusInput.style.display = 'flex';

        document.querySelector('.reject-div').style.display = 'none';

        editGroup.style.display = 'none';
        editGroup.classList.remove('col-9', 'd-flex', 'justify-content-end');
        listCroup.style.visibility = 'hidden';
        saveGroup.style.display = 'flex';
        saveGroup.classList.add('col-9', 'd-flex', 'justify-content-end');

        const certSelBox = document.querySelector('#teacherCertificationStatus');

        if (certSelBox !== null) {
            if (certSelBox.value === '05') {
                document.querySelectorAll('.companion').forEach((el) => {
                    el.style.display = '';
                })
            }

            $('#teacherCertificationStatus').on('select2:select', (e) => {
                if (e.params.data.id === '05') {
                    document.querySelectorAll('.companion').forEach((el) => {
                        el.style.display = '';
                    })
                } else {
                    document.querySelectorAll('.companion').forEach((el) => {
                        el.style.display = 'none';
                    })
                }
            })
        }
    }

    async function cancel() {
        let editGroup = document.getElementById('editGroup');
        let saveGroup = document.getElementById('saveGroup');
        let listGroup = document.getElementById('listGroup');

        let teacherCertificationStatusText = document.getElementById('teacherCertificationStatusText');
        let teacherCertificationStatusInput = document.getElementById('teacherCertificationStatusInput');


        teacherCertificationStatusText.style.display = 'flex';
        teacherCertificationStatusInput.style.display = 'none';


        saveGroup.style.display = 'none';
        saveGroup.classList.remove('col-9', 'd-flex', 'justify-content-end');


        listGroup.style.visibility = 'visible';
        editGroup.style.display = 'flex';
        editGroup.classList.add('col-9', 'd-flex', 'justify-content-end');

    }

    function goList() {
        const form = document.querySelector('#searchForm');
        form.action = '/user/teacher-auth-list';
        form.method = 'GET';
        form.submit();
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
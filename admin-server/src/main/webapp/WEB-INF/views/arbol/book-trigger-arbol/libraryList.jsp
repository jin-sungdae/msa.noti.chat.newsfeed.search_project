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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lipis/flag-icons@6.6.6/css/flag-icons.min.css"/>
<div class="d-flex flex-column flex-root">
    <div class="page d-flex flex-row flex-column-fluid">
        <%@ include file="/WEB-INF/views/common/inc/BodyAsideINC.jsp" %>
        <div class="wrapper d-flex flex-column flex-row-fluid" id="kt_wrapper">
            <%@ include file="/WEB-INF/views/common/inc/BodyHeaderINC.jsp" %>
            <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
                <%@ include file="/WEB-INF/views/common/inc/ToolbarINC.jsp" %>

                <div id="kt_content_container" class="container-fluid">
                    <div class="card mb-7">
                        <form class="form">
                            <div class="card-body">

                                <div class="row g-8">
                                    <div class="col-xxl-3 fv-row">
                                        <label class="fs-6 form-label fw-bolder text-dark">기간</label>
                                        <div class="row fv-row fv-plugins-icon-container">
                                            <div class="col-6">
                                                <div class="input-group">
                                                    <input
                                                            id="sdate"
                                                            name="sdate"
                                                            type="text"
                                                            class="form-control flatpickr-input"
                                                            placeholder="시작일"
                                                            autocomplete="off"
                                                            value="<c:out value="${param.sdate}"/>"
                                                    />
                                                    <span class="input-group-text" id="basic-addon3">
                                                    <i class="bi bi-calendar-check fs-1"></i>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="input-group">
                                                    <input
                                                            id="edate"
                                                            name="edate"
                                                            type="text"
                                                            class="form-control flatpickr-input"
                                                            placeholder="종료일"
                                                            autocomplete="off"
                                                            value="<c:out value="${param.edate}"/>"
                                                    />
                                                    <span class="input-group-text" id="basic-addon3">
                                                    <i class="bi bi-calendar-check fs-1"></i>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <label
                                                class="fs-6 form-label fw-bolder text-dark"
                                                for="userType"
                                        >
                                            회원 구분
                                        </label>
                                        <select
                                                id="userType"
                                                name="userType"
                                                class="form-select form-select-solid"
                                                data-control="select2"
                                                data-hide-search="true"
                                                data-placeholder="전체"
                                        >
                                            <option></option>
                                            <option value="3005" ${param.userType eq '3005' ? 'selected' : ''}>일반</option>
                                            <option value="3002" ${param.userType eq '3002' ? 'selected' : ''}>학생</option>
                                            <option value="3004" ${param.userType eq '3004' ? 'selected' : ''}>학부모</option>
                                            <option value="3003" ${param.userType eq '3003' ? 'selected' : ''}>선생님</option>
                                            <option value="3006" ${param.userType eq '3006' ? 'selected' : ''}>학원선생님</option>

                                        </select>
                                    </div>

                                    <div class="col-lg-7">
                                        <div class="row g-8">
                                            <div class="col-lg-12">
                                                <label class="fs-6 form-label fw-bolder text-dark">검색어</label>
                                                <input
                                                        type="text"
                                                        id="search"
                                                        name="search"
                                                        class="form-control"
                                                        placeholder="검색어 입력"
                                                        maxlength="100"
                                                        value="<c:out value="${search.search}"/>"
                                                />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="card-footer">
                                <div class="d-flex justify-content-end" data-kt-customer-table-toolbar="base">
                                    <div>
                                        <a href="/book-trigger/library-list" class="btn btn-secondary" style="color: #181c32; background-color : #fff3cd">
                                            <i class="fas bi-arrow-repeat fs-2 me-2"></i>
                                            초기화
                                        </a>
                                           <button type="submit" class="btn btn-m btn-warning" style="background-color: #ffcd39; color: #181C32">
                                            검색
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="card">
                        <div class="card-header border-0 pt-6L">
                   <%@ include file="/WEB-INF/views/common/SelectPaging.jsp" %>
                        </div>

                        <div class="card-body pt-0 table-responsive">
                            <!--begin::Table-->
                            <table class="table table-row-bordered gy-5" id="faqCommonTable">
                                <!--begin::Table head-->
                                <thead>
                                <!--begin::Table row-->
                                <tr class="fw-semibold fs-6 text-muted">
                                    <th class="min-w-70px">No.</th>
                                    <th class="min-w-70px">자료명</th>
                                    <th class="min-w-70px">자료유형</th>
                                    <th class="min-w-70px">노출여부</th>
                                    <th class="min-w-60px">작성일시</th>
                                </tr>
                                <!--end::Table row-->
                                </thead>
                                <!--end::Table head-->
                                <!--begin::Table body-->
                                <tbody>
                                <tr>
                                    <td>
                                        <span class="badge badge-warning">노출</span>
                                    </td>
                                    <td class="text-dark fw-bold text-hover-warning hoverable">
                                        <c:out value="<레전드 과학 탐험대> 교과 연계 특별부록"/>
                                    </td>
                                    <td class="text-dark fw-bold text-hover-warning hoverable">
                                        <i class="fas bi-file-pdf fs-1 me-2"></i>
                                    </td>
                                    <td class="text-dark fw-bold text-hover-warning hoverable">
                                        Y
                                    </td>
                                    <td class="text-dark fw-bold text-hover-warning hoverable">
                                        2023-11-25 10:35
                                    </td>
                                </tr>
                                <c:if test="${not empty list}">
                                    <c:forEach items="${list}" var="list" varStatus="status">
                                        <tr>
                                            <td class="text-dark fw-bold">
                                                    ${((listNum - (page.pageListSize * (page.currentPage - 1))) - status.index)}
                                            </td>
                                            <td class="text-dark fw-bold text-hover-warning hoverable"
                                                data-uid="${list.uid}"
                                                name="userType"
                                                onclick="openUserForm(this)">
                                                <c:out value="${list.userType}"/>
                                            </td>
                                            <td class="text-dark text-hover-warning fw-bold hoverable"
                                                data-uid="${list.uid}"
                                                name="name"
                                                onclick="openUserForm(this)">
                                                <c:out value="${list.userName}"/>
                                            </td>
                                            <td class="text-dark text-hover-warning fw-bold hoverable"
                                                data-uid="${list.uid}"
                                                name="userId"
                                                onclick="openUserForm(this)">
                                                <c:out value="${list.userId}"/>
                                            </td>
                                            <td class="text-dark text-hover-warning fw-bold hoverable"
                                                data-uid="${list.uid}"
                                                name="userPhoneNumber"
                                                onclick="openUserForm(this)">
                                                <c:out value="${list.phoneNo}"/>
                                            </td>
                                            <td class="text-dark text-hover-warning fw-bold hoverable"
                                                data-uid="${list.uid}"
                                                name="email"
                                                onclick="openUserForm(this)">
                                                <c:out value="${list.email}"/>
                                            </td>
                                            <td class="text-hover-warning hoverable"
                                                data-uid="${list.uid}"
                                                name="firstRegistrationType"
                                                onclick="openUserForm(this)">
                                                <c:out value="${list.joinRoot}"/>
                                            </td>
                                            <td class="text-hover-warning hoverable"
                                                data-uid="${list.uid}"
                                                name="firstRegistrationDateTime"
                                                onclick="openUserForm(this)"
                                            />
                                            <c:out value="${list.regDate}"/>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty list}">
                                    <tr>
                                        <td class="center">
                                            데이터가 없습니다.
                                        </td>
                                    </tr>
                                </c:if>
                                </tbody>
                                <!--end::Table body-->
                            </table>
                            <%@ include file="/WEB-INF/views/common/inc/Paging.jsp" %>
                            <!--end::Table-->
                        </div>
                    </div>
                </div>
                <%--                    </div>--%>
            </div>
            <%@ include file="/WEB-INF/views/common/inc/FooterINC.jsp" %>
        </div>
    </div>
</div>
<div class="modal fade" id="modalLayout" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered mw-900px" id="modalContent">

    </div>
</div>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script type="text/javascript">
    function initializeFlatpickr() {
        const startDateInput = document.getElementById('sdate');
        const endDateInput = document.getElementById('edate');

        startFlatpickr = flatpickr(startDateInput, {
            dateFormat: 'Y-m-d',
            locale: 'ko',
            onChange: function (selectedDates) {
                if (selectedDates.length > 0) {
                    const maxDate = new Date(selectedDates[0]);
                    maxDate.setFullYear(maxDate.getFullYear() + 3);
                    endFlatpickr.set('minDate', selectedDates[0]);
                    endFlatpickr.set('maxDate', maxDate);
                }
            }
        });

        endFlatpickr = flatpickr(endDateInput, {
            dateFormat: 'Y-m-d',
            locale: 'ko',
            onChange: function (selectedDates) {
                if (selectedDates.length > 0) {
                    const minDate = new Date(selectedDates[0]);
                    minDate.setFullYear(minDate.getFullYear() - 1);
                    startFlatpickr.set('minDate', minDate);
                    startFlatpickr.set('maxDate', selectedDates[0]);
                }
            }
        });
    }

    document.addEventListener('DOMContentLoaded', function () {
        initializeFlatpickr();
    })


    function fetchUserList(page) {
        const sdate = document.getElementById('sdate').value;
        const edate = document.getElementById('edate').value;
        const userType = document.getElementById('userType').value;
        const joinRoot = document.getElementById('joinRoot').value;
        const search = document.getElementById('search').value;
        let queryParams = '?perPage=' + document.getElementById('perPage').value;

        if (sdate != null || sdate !== undefined) {
            queryParams += '&sdate=' + sdate;
        }

        if (edate != null || edate !== undefined) {
            queryParams += '&edate=' + edate;
        }

        if (userType != null || userType !== undefined) {
            queryParams += '&userType=' + userType;
        }

        if (joinRoot != null || joinRoot !== undefined) {
            queryParams += '&joinRoot=' + joinRoot;
        }

        if (search != null || search !== undefined) {
            queryParams += '&search=' + search;
        }

        location.href = '/user/user-list' + queryParams;
    }

    function changePage(page) {
        const sdate = document.getElementById('sdate').value;
        const edate = document.getElementById('edate').value;
        const userType = document.getElementById('userType').value;
        const joinRoot = document.getElementById('joinRoot').value;
        const search = document.getElementById('search').value;


        let queryParams = '?page=' + page + '&perPage=' + document.getElementById('perPage').value;

        if (sdate != null || sdate !== undefined) {
            queryParams += '&sdate=' + sdate;
        }

        if (edate != null || edate !== undefined) {
            queryParams += '&edate=' + edate;
        }

        if (userType != null || userType !== undefined) {
            queryParams += '&userType=' + userType;
        }

        if (joinRoot != null || joinRoot !== undefined) {
            queryParams += '&joinRoot=' + joinRoot;
        }

        if (search != null || search !== undefined) {
            queryParams += '&search=' + search;
        }

        location.href = '/user/user-list' + queryParams;
    }

    function openUserForm(element) {
        const uid = element.getAttribute('data-uid');
        const url = '/user/user-form?uid=' + uid;
        window.location.href = url;
    }



    async function inputDownload() {
        const sdate = document.getElementById('sdate').value;
        const edate = document.getElementById('edate').value;
        const userType = document.getElementById('userType').value;
        const joinRoot = document.getElementById('joinRoot').value;
        const search = document.getElementById('search').value;

        let date = new Date();
        let year = date.getFullYear();
        let month = ("0" + (date.getMonth() + 1)).slice(-2);
        let day = ("0" + date.getDate()).slice(-2);

        let formattedDate = year + "-" + month + "-" + day;

        const data = {
            nowDay: formattedDate,
            sdate: sdate,
            edate: edate,
            userType: userType,
            joinRoot: joinRoot,
            search: search,
            filename: 'userList',
            headerMap : {
                header1: 'No.',
                header2: '회원구분',
                header3: '이름',
                header4: '아이디',
                header5: '휴대폰번호',
                header6: '이메일',
                header7: '최초 가입방식',
                header8: '최초 가입일시'
            }
        }
        try {
            const response = await fetch('/api/v1/excel', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data),
            });

            console.log(response);

            if (response.ok) {
                const blob = await response.blob();
                const fileName = await response.headers.get('Content-Disposition').split('filename=')[1];
                console.log(fileName);
                // 파일 다운로드 링크 변경 (선택 사항)
                let downloadLink = document.createElement('a');
                downloadLink.href = window.URL.createObjectURL(blob);
                downloadLink.download = fileName;
                downloadLink.style.display = 'none';
                document.body.appendChild(downloadLink);
                downloadLink.click();
                document.body.removeChild(downloadLink);

            } else {
                throw new Error('파일 다운로드 요청에 실패했습니다.');
            }
        } catch (error) {
            console.log("=== Excel error : " + error);
            Swal.fire({
                html: '<div>파일 다운로드 중 오류가 발생했습니다.</div>',
                icon: 'error',
                buttonsStyling: false,
                confirmButtonText: 'OK',
                customClass: { confirmButton: 'btn btn-primary' }
            });
        }
    }

</script>

</body>
</html>

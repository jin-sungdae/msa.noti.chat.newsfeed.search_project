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
                        <form class="form" method="get" action="/user/user-list">
                            <input type="hidden" name="page" id="page" value="${pageNo}" />
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
                                                            <c:if test="${param.sdate eq null}">
                                                                value="<c:out value="${sdate}"/>"
                                                            </c:if>
                                                            <c:if test="${param.sdate ne null}">
                                                                value="<c:out value="${param.sdate}"/>"
                                                            </c:if>

                                                    />
                                                    <input type="hidden" name="flag" value="t">
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
                                            <option value="default">전체</option>
                                            <option value="3005" ${param.userType eq '3005' ? 'selected' : ''}>일반</option>
                                            <option value="3002" ${param.userType eq '3002' ? 'selected' : ''}>학생</option>
                                            <option value="3004" ${param.userType eq '3004' ? 'selected' : ''}>학부모</option>
                                            <option value="3003" ${param.userType eq '3003' ? 'selected' : ''}>선생님</option>
                                            <option value="3006" ${param.userType eq '3006' ? 'selected' : ''}>학원선생님</option>

                                        </select>
                                    </div>

                                    <div class="col-lg-2">
                                        <label class="fs-6 form-label fw-bolder text-dark">최초 가입방식</label>
                                        <select
                                                id="joinRoot"
                                                name="joinRoot"
                                                class="form-select form-select-solid"
                                                data-control="select2"
                                                data-hide-search="true"
                                                data-placeholder="전체"
                                        >
                                            <option value="default">전체</option>
                                            <option value='jihaksa' ${param.joinRoot eq 'jihaksa' ? 'selected' : ''}>지학사</option>
                                            <option value='naver' ${param.joinRoot eq 'naver' ? 'selected' : ''}>네이버</option>
                                            <option value='google'   ${param.joinRoot eq 'google' ? 'selected' : ''}>구글</option>
                                            <option value='kakao' ${param.joinRoot eq 'kakao' ? 'selected' : ''}>카카오</option>
                                        </select>
                                    </div>

                                    <div class="col-lg-5">
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
                                                        value="<c:out value="${param.search}"/>"
                                                />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="card-footer">


                                <div class="d-flex justify-content-end" data-kt-customer-table-toolbar="base">
                                    <div>
                                        <a href="/user/user-list" class="btn btn-secondary" style="color: #181c32; background-color : #fff3cd">
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
                            <div class="card-toolbar">
                                <div class="d-flex justify-content-end" data-kt-customer-table-toolbar="base">
                                    <button type="button" class="btn btn-m" style="color: #fff; background-color: #1aa179"  onclick="inputDownload()">
                                        엑셀 다운로드
                                    </button>
                                </div>
                            </div>
                        </div>

                        <div class="card-body pt-0 table-responsive">
                            <!--begin::Table-->
                            <table class="table table-row-bordered gy-5" id="faqCommonTable">
                                <!--begin::Table head-->
                                <thead>
                                <!--begin::Table row-->
                                <tr class="fw-semibold fs-6 text-muted">
                                    <th class="min-w-70px ">No.</th>
                                    <th class="min-w-70px ">회원구분</th>
                                    <th class="min-w-70px ">이름</th>
                                    <th class="min-w-70px ">아이디</th>
                                    <th class="min-w-60px ">휴대폰번호</th>
                                    <th class="min-w-50px ">이메일</th>
                                    <th class="min-w-70px ">최초 가입방식</th>
                                    <th class="min-w-70px ">최초 가입일시</th>
                                </tr>
                                <!--end::Table row-->
                                </thead>
                                <!--end::Table head-->
                                <!--begin::Table body-->
                                <tbody>
                                <c:if test="${not empty list}">
                                    <c:forEach items="${list}" var="list" varStatus="status">
                                        <tr>
                                            <td class="text-dark fw-bold">
                                                    ${((listNum - (page.pageListSize * (page.currentPage - 1))) - status.index)}
                                            </td>
                                            <td class="text-hover-warning hoverable"
                                                data-uid="${list.uid}"
                                                name="userType"
                                                onclick="openUserForm(this)">
                                                <c:out value="${list.userType}"/>
                                            </td>
                                            <td class="text-hover-warning hoverable"
                                                data-uid="${list.uid}"
                                                name="name"
                                                onclick="openUserForm(this)">
                                                <c:out value="${list.userName}"/>
                                            </td>
                                            <td class="text-hover-warning hoverable"
                                                data-uid="${list.uid}"
                                                name="userId"
                                                onclick="openUserForm(this)">
                                                <c:out value="${list.userId}"/>
                                            </td>
                                            <td class="text-hover-warning hoverable"
                                                data-uid="${list.uid}"
                                                name="userPhoneNumber"
                                                onclick="openUserForm(this)">
                                                <c:out value="${list.phoneNo}"/>
                                            </td>
                                            <td class="text-hover-warning hoverable"
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

<div id="loadingBar" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5); z-index: 1000;">
    <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
        <div class="loader"></div>
        <p style="color: white; text-align: center;">엑셀 다운로드 중...</p>
    </div>
</div>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script type="text/javascript">
    function initializeFlatpickr() {
        const today = new Date();
        const oneMonthBefore = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());

        const startDateInput = document.getElementById('sdate');
        const endDateInput = document.getElementById('edate');
        const initialStartDate = startDateInput.value;
        const initialEndDate = endDateInput.value;

        startFlatpickr = flatpickr(startDateInput, {
            dateFormat: 'Y-m-d',
            locale: 'ko',
            onChange: function (selectedDates) {
                if (selectedDates.length > 0) {
                    const maxDate = new Date(selectedDates[0]);
                    maxDate.setFullYear(maxDate.getFullYear() + 5);
                    endFlatpickr.latestSelectedDateObj = maxDate; // 연도 버그 처리
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


        let queryParams = '?page=' + page + '&perPage=' + document.getElementById('perPage').value + '&flag=t';

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
        const sdate = document.getElementById('sdate').value;
        const edate = document.getElementById('edate').value;
        const userType = document.getElementById('userType').value;
        const joinRoot = document.getElementById('joinRoot').value;
        const search = document.getElementById('search').value;
        const page = document.querySelector('#page').value;


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

        const uid = element.getAttribute('data-uid');
        queryParams += '&uid=' + uid;


        const url = '/user/user-form' + queryParams;
        window.location.href = url;
    }



    async function inputDownload() {
        const sdate = document.getElementById('sdate').value;
        const edate = document.getElementById('edate').value;
        const userType = document.getElementById('userType').value;
        const joinRoot = document.getElementById('joinRoot').value;
        const search = document.getElementById('search').value;

        const startDate = new Date(sdate);
        const endDate = new Date(edate);
        const currentDate = new Date();
        const oneYearFromNow = new Date();
        oneYearFromNow.setFullYear(currentDate.getFullYear() - 1);

        if (sdate && edate) {
            if (endDate - startDate > 365 * 24 * 60 * 60 * 1000) {
                Swal.fire({
                    html: '<div>시작일과 종료일의 차이는 1년 이내여야 합니다.</div>',
                    icon: 'error',
                    buttonsStyling: false,
                    confirmButtonText: 'OK',
                    customClass: { confirmButton: 'btn btn-primary' }
                });
                return;
            }
        } else if (sdate && !edate) {
            if (currentDate - startDate > 365 * 24 * 60 * 60 * 1000) {
                Swal.fire({
                    html: '<div>시작일은 현재 날짜로부터 1년 이내여야 합니다.</div>',
                    icon: 'error',
                    buttonsStyling: false,
                    confirmButtonText: 'OK',
                    customClass: { confirmButton: 'btn btn-primary' }
                });
                return;
            }
        } else if (!sdate && edate) {
            if (currentDate - endDate > 365 * 24 * 60 * 60 * 1000) {
                Swal.fire({
                    html: '<div>종료일은 현재 날짜로부터 1년 이내여야 합니다.</div>',
                    icon: 'error',
                    buttonsStyling: false,
                    confirmButtonText: 'OK',
                    customClass: { confirmButton: 'btn btn-primary' }
                });
                return;
            }
        } else if (!(sdate && edate)) {
            Swal.fire({
                html: '<div>기간을 선택해 주세요.</div>',
                icon: 'error',
                buttonsStyling: false,
                confirmButtonText: 'OK',
                customClass: { confirmButton: 'btn btn-primary' }
            });
            return;
        }

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
                header8: '최초 가입일시',
                header9: '교사유형',
                header10: '교사인증상태',
                header11: '주소',
                header12: '학교명',
                header13: '학교주소',
                header14: '학교분류',
                header15: '학년',
                header16: '관심과목',
                header17: '이메일 약관동의(선택)',
                header18: 'SMS 약관동의(선택)',
            }
        }
        try {
            document.getElementById('loadingBar').style.display = 'block';
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

                document.getElementById('loadingBar').style.display = 'none';
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
<style>
    .loader {
        border: 16px solid #f3f3f3; /* Light grey */
        border-top: 16px solid #ffff00; /* Yellow */
        border-radius: 50%;
        width: 120px;
        height: 120px;
        animation: spin 2s linear infinite;
    }

    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }
</style>
</body>
</html>

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

                                    <div class="col-lg-9">
                                        <div class="row">
                                            <div class="col-lg-2">
                                                <label class="fs-6 form-label fw-bolder text-dark">대상</label>
                                                <select
                                                        id="target"
                                                        name="target"
                                                        class="form-select form-select-solid unselect-form"
                                                        data-control="select2"
                                                        data-hide-search="true"
                                                >
                                                    <option>전체</option>
                                                    <c:forEach items="${targetList}" var="target">
                                                        <option value='<c:out value="${target.categoryName}"/>' ${param.target eq target.categoryName ? 'selected' : ''}><c:out value="${target.categoryName}"/></option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-lg-2">
                                                <label class="fs-6 form-label fw-bolder text-dark">분야</label>
                                                <select
                                                        id="field"
                                                        name="field"
                                                        class="form-select form-select-solid unselect-form"
                                                        data-control="select2"
                                                        data-hide-search="true"
                                                >
                                                    <option>전체</option>
                                                    <c:forEach items="${fieldList}" var="field">
                                                        <option value='<c:out value="${field.categoryName}"/>' ${param.field eq field.categoryName ? 'selected' : ''}><c:out value="${field.categoryName}"/></option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-lg-2">
                                                <label class="fs-6 form-label fw-bolder text-dark">시리즈</label>
                                                <select
                                                        id="series"
                                                        name="series"
                                                        class="form-select form-select-solid unselect-form"
                                                        data-control="select2"
                                                        data-hide-search="true"
                                                >
                                                    <option>전체</option>
                                                    <c:forEach items="${seriesList}" var="series">
                                                        <option value='<c:out value="${series.categoryName}"/>' ${param.series eq series.categoryName ? 'selected' : ''}><c:out value="${series.categoryName}"/></option>
                                                    </c:forEach>
                                                </select>
                                            </div>

                                            <div class="col-lg-2">
                                                <label class="fs-6 form-label fw-bolder text-dark">노출여부</label>
                                                <select
                                                        id="isOpen"
                                                        name="isOpen"
                                                        class="form-select form-select-solid unselect-form"
                                                        data-control="select2"
                                                        data-hide-search="true"
                                                >
                                                    <option>전체</option>
                                                    <option value='Y' ${param.isOpen eq 'Y' ? 'selected' : ''}>Y</option>
                                                    <option value='N' ${param.isOpen eq 'N' ? 'selected' : ''}>N</option>
                                                </select>
                                            </div>
                                            <div class="col-lg-2">
                                                <label class="fs-6 form-label fw-bolder text-dark">인트로 노출여부</label>
                                                <select
                                                        id="isIntro"
                                                        name="isIntro"
                                                        class="form-select form-select-solid unselect-form"
                                                        data-control="select2"
                                                        data-hide-search="true"
                                                >
                                                    <option>전체</option>
                                                    <option value='Y' ${param.isIntro eq 'Y' ? 'selected' : ''}>Y</option>
                                                    <option value='N' ${param.isIntro eq 'N' ? 'selected' : ''}>N</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </div>

                            <div class="card-footer">
                                <div class="d-flex justify-content-between">
                                    <div class="col-lg-10">
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
                                                        autocomplete="off"
                                                        value="<c:out value="${param.search}"/>"
                                                />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 d-flex justify-content-end mt-8"  data-kt-customer-table-toolbar="base">
                                        <div>
                                            <a href="/arbol/arbol" class="btn btn-secondary" style="color: #181c32; background-color : #fff3cd">
                                                <i class="fas bi-arrow-repeat fs-2 me-2"></i>
                                                초기화
                                            </a>
                                            <button type="submit" class="btn btn-m btn-warning" style="background-color: #ffcd39; color: #181C32">
                                                검색
                                            </button>
                                        </div>
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
                                    <th class="min-w-20px">No.</th>
                                    <th class="min-w-30px">대상</th>
                                    <th class="min-w-30px">분야</th>
                                    <th class="min-w-30px">시리즈</th>
                                    <th class="min-w-120px">도서명</th>
                                    <th class="min-w-30px">노출여부</th>
                                    <th class="min-w-30px">인트로<br/>노출여부</th>
                                    <th class="min-w-60px">작성자</th>
                                    <th class="min-w-60px">최종수정일</th>
                                </tr>
                                <!--end::Table row-->
                                </thead>
                                <!--end::Table head-->
                                <!--begin::Table body-->
                                <tbody>
                                <c:if test="${not empty list}">
                                    <c:forEach items="${list}" var="list" varStatus="status">
                                        <tr>
                                            <td class="text-dark fw-bold vertical_center">
                                                    ${((listNum - (page.pageListSize * (page.currentPage - 1))) - status.index)}
                                            </td>
                                            <td class="text-dark fw-bold hoverable fw-bold vertical_center"
                                                data-uid="${list.uid}"
                                                name="userType"
                                            >

                                                <div>

                                                    <div data-uid="${list.uid}" onclick="toggleVisibility(this)">
                                                        <c:out value="${list.targetList[0]}"/>
                                                        <c:if test="${list.targetList.size() > 1}">
                                                            <i class="bi bi-caret-down"></i>
                                                        </c:if>
                                                        <br/>

                                                    </div>

                                                    <div class="targetItem${list.uid}" style="display: none;">
                                                        <c:forEach items="${list.targetList}" var="target" varStatus="status">
                                                            <c:if test="${status.index > 0}">
                                                                <c:out value="${target}"/><br/>
                                                            </c:if>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </td>

                                            <td class="hoverable vertical_center"
                                                data-uid="${list.uid}"
                                                name="name"
                                            >
                                                <div data-uid="${list.uid}" onclick="toggleVisibility(this)">
                                                    <c:out value="${list.fieldList[0]}"/>
                                                    <c:if test="${list.fieldList.size() > 1}">
                                                        <i class="bi bi-caret-down"></i>
                                                    </c:if>
                                                    <br/>
                                                </div>
                                                <div class="targetItem${list.uid}" style="display: none;">
                                                    <c:forEach items="${list.fieldList}" var="field" varStatus="status">
                                                        <c:if test="${status.index > 0}">
                                                            <c:out value="${field}"/><br/>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                            </td>
                                            <td class="hoverable vertical_center"
                                                data-uid="${list.uid}"
                                                name="userId"
                                            >
                                                <div data-uid="${list.uid}" onclick="toggleVisibility(this)">
                                                    <c:out value="${list.seriesList[0]}"/>
                                                    <c:if test="${list.seriesList.size() > 1}">
                                                        <i class="bi bi-caret-down"></i>
                                                    </c:if>
                                                    <br/>
                                                </div>
                                                <div class="targetItem${list.uid}" style="display: none;">
                                                    <c:forEach items="${list.seriesList}" var="series" varStatus="status">
                                                        <c:if test="${status.index > 0}">
                                                            <c:out value="${series}"/><br/>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                            </td>
                                            <td class="text-hover-warning hoverable vertical_center"
                                                data-uid="${list.uid}"
                                                name="userPhoneNumber"
                                                onclick="openUserForm(this)">
                                                <img src="${list.filePath}" style="width: 54px; height: 70px; margin: 10px"/>
                                                <c:out value="${list.bookName}"/>
                                            </td>
                                            <td class="text-hover-warning hoverable ${list.isOpen eq 'Y' ? 'text-danger' : 'text-primary'} vertical_center"
                                                data-uid="${list.uid}"
                                                name="name"
                                                onclick="openUserForm(this)">
                                                <c:out value="${list.isOpen}"/>
                                            </td>
                                            <td class="text-hover-warning hoverable ${list.isIntro eq 'Y' ? 'text-danger' : 'text-primary'} vertical_center"
                                                data-uid="${list.uid}"
                                                name="userId"
                                                onclick="openUserForm(this)">
                                                <c:out value="${list.isIntro}"/>
                                            </td>
                                            <td class="text-dark fw-bold text-hover-warning hoverable vertical_center"
                                                data-uid="${list.uid}"
                                                name="userType"
                                                onclick="openUserForm(this)">
                                                <c:out value="${list.adminName}(${list.adminGroup})"/>
                                            </td>
                                            <td class="text-hover-warning hoverable vertical_center"
                                                data-uid="${list.uid}"
                                                name="name"
                                                onclick="openUserForm(this)">
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
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="d-flex justify-content-center flex-grow-1">
                                    <%@ include file="/WEB-INF/views/common/inc/Paging.jsp" %>
                                </div>
                                <div>
                                    <a href="/arbol/arbol-reg-form" class="btn btn-m" style=" color: #fff; background-color: #343a40;">
                                        등록
                                    </a>
                                </div>
                            </div>
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
                    maxDate.setFullYear(maxDate.getFullYear() + 3);
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


        const targetNode = document.querySelectorAll('.form-select.unselect-form');
        targetNode.forEach((node) => {
            node.style.backgroundColor = '#ffffff';
            node.style.backgroundClip = 'padding-box';
            node.style.border = '1px solid #E4E6EF';
        });

    })


    function fetchUserList(page) {
        const sdate = document.getElementById('sdate').value;
        const edate = document.getElementById('edate').value;
        const target = document.getElementById('target').value;
        const field = document.getElementById('field').value;
        const series = document.getElementById('series').value;
        const isOpen = document.getElementById('isOpen').value;
        const isIntro = document.getElementById('isIntro').value;

        const search = document.getElementById('search').value;

        let queryParams = '?perPage=' + document.getElementById('perPage').value;

        if (sdate != null || sdate !== undefined) {
            queryParams += '&sdate=' + sdate;
        }

        if (edate != null || edate !== undefined) {
            queryParams += '&edate=' + edate;
        }

        if (target != null || target !== undefined) {
            queryParams += '&target=' + target;
        }

        if (field != null || field !== undefined) {
            queryParams += '&field=' + field;
        }

        if (series != null || series !== undefined) {
            queryParams += '&series=' + series;
        }

        if (isOpen != null || isOpen !== undefined) {
            queryParams += '&isOpen=' + isOpen;
        }

        if (isIntro != null || isIntro !== undefined) {
            queryParams += '&isIntro=' + isIntro;
        }


        if (search != null || search !== undefined) {
            queryParams += '&search=' + search;
        }

        location.href = '/arbol/arbol' + queryParams;
    }

    function changePage(page) {
        const sdate = document.getElementById('sdate').value;
        const edate = document.getElementById('edate').value;
        const target = document.getElementById('target').value;
        const field = document.getElementById('field').value;
        const series = document.getElementById('series').value;
        const isOpen = document.getElementById('isOpen').value;
        const isIntro = document.getElementById('isIntro').value;
        const search = document.getElementById('search').value;


        let queryParams = '?page=' + page + '&perPage=' + document.getElementById('perPage').value;

        if (sdate != null || sdate !== undefined) {
            queryParams += '&sdate=' + sdate;
        }

        if (edate != null || edate !== undefined) {
            queryParams += '&edate=' + edate;
        }

        if (target != null || target !== undefined) {
            queryParams += '&target=' + target;
        }

        if (field != null || field !== undefined) {
            queryParams += '&field=' + field;
        }

        if (series != null || series !== undefined) {
            queryParams += '&series=' + series;
        }

        if (isOpen != null || isOpen !== undefined) {
            queryParams += '&isOpen=' + isOpen;
        }

        if (isIntro != null || isIntro !== undefined) {
            queryParams += '&isIntro=' + isIntro;
        }


        if (search != null || search !== undefined) {
            queryParams += '&search=' + search;
        }

        location.href = '/arbol/arbol' + queryParams;
    }

    function openUserForm(element) {
        const uid = element.getAttribute('data-uid');
        const sdate = document.getElementById('sdate').value;
        const edate = document.getElementById('edate').value;
        const target = document.getElementById('target').value;
        const field = document.getElementById('field').value;
        const series = document.getElementById('series').value;
        const isOpen = document.getElementById('isOpen').value;
        const isIntro = document.getElementById('isIntro').value;
        const search = document.getElementById('search').value;
        const page = new URLSearchParams(window.location.search).get('page') || '1';

        let queryParams = '?page=' + page + '&perPage=' + document.getElementById('perPage').value;

        if (sdate != null || sdate !== undefined) {
            queryParams += '&sdate=' + sdate;
        }

        if (edate != null || edate !== undefined) {
            queryParams += '&edate=' + edate;
        }

        if (target != null || target !== undefined) {
            queryParams += '&target=' + target;
        }

        if (field != null || field !== undefined) {
            queryParams += '&field=' + field;
        }

        if (series != null || series !== undefined) {
            queryParams += '&series=' + series;
        }

        if (isOpen != null || isOpen !== undefined) {
            queryParams += '&isOpen=' + isOpen;
        }

        if (isIntro != null || isIntro !== undefined) {
            queryParams += '&isIntro=' + isIntro;
        }


        if (search != null || search !== undefined) {
            queryParams += '&search=' + search;
        }

        const url = '/arbol/arbol/' + uid + queryParams;
        window.location.href = url;
    }

    function toggleVisibility(element) {
        let firstItem = element.getAttribute('data-uid');
        let restOfItems = document.querySelectorAll('.targetItem' + firstItem);
        restOfItems.forEach((item) => {
            if (item.style.display === 'none') {
                item.style.display = 'block';
            } else {
                item.style.display = 'none';
            }
        });

    }

</script>
<style>
    .vertical_center {
        vertical-align: middle;
        height: 90px;
    }

    .table {
        width: 100%; /* 테이블의 전체 너비를 100%로 설정 */
        table-layout: fixed; /* 테이블 레이아웃을 고정으로 설정 */
    }

    .table th, .table td {
        width: 80px; /* 각 셀의 기본 너비를 80px로 설정 */
        white-space: nowrap; /* 텍스트가 줄 바꿈되지 않도록 설정 */
    }
    .table th.min-w-120px, .table td.min-w-120px {
        width: 120px; /* 교과서명 열의 너비를 120px로 설정 */
    }
    .table th.min-w-100px, .table td.min-w-100px {
        width: 100px; /* 저자명 열의 너비를 100px로 설정 */
    }
    .table th.min-w-40px, .table td.min-w-40px {
        width: 40px; /* 노출여부 및 인트로 노출여부 열의 너비를 40px로 설정 */
    }
    .table th.min-w-60px, .table td.min-w-60px {
        width: 60px; /* 작성자 및 작성일시 열의 너비를 60px로 설정 */
    }

    .table th.min-w-30px, .table td.min-w-30px {
        width: 30px; /* 작성자 및 작성일시 열의 너비를 30px로 설정 */
    }

    .table th.min-w-20px, .table td.min-w-20px {
        width: 20px; /* 작성자 및 작성일시 열의 너비를 30px로 설정 */
    }

    .table th.min-w-80px, .table td.min-w-80px {
        width: 80px; /* 작성자 및 작성일시 열의 너비를 80px로 설정 */
    }
    .table img {
        width: 54px;
        height: 70px;
        margin: 10px;
    }
</style>

</body>
</html>

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

                                <div class="row g-8 mb-8">
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
                                        <label class="fs-6 form-label fw-bolder text-dark">학급</label>
                                        <select
                                                id="clazz"
                                                name="clazz"
                                                class="form-select form-select-solid unselect-form"
                                                data-control="select2"
                                                data-hide-search="true"
                                                onchange="changeSelectDataOption(this)"
                                        >
                                            <option>전체</option>
                                            <option value='초등' ${param.clazz eq '초등' ? 'selected' : ''}>초등</option>
                                            <option value='중학' ${param.clazz eq '중학' ? 'selected' : ''}>중학</option>
                                            <option value='고등' ${param.clazz eq '고등' ? 'selected' : ''}>고등</option>
                                        </select>
                                    </div>

                                    <div class="col-lg-3">
                                        <label class="fs-6 form-label fw-bolder text-dark">과목</label>
                                        <select
                                                id="subject"
                                                name="subject"
                                                class="form-select form-select-solid renewal-form"
                                                data-control="select2"
                                                data-hide-search="true"
                                                disabled
                                        >
                                            <option value="">-</option>
                                        </select>
                                    </div>

                                    <div class="col-lg-2">
                                        <label class="fs-6 form-label fw-bolder text-dark">학년</label>
                                        <select
                                                id="grade"
                                                name="grade"
                                                class="form-select form-select-solid renewal-form"
                                                data-control="select2"
                                                data-hide-search="true"
                                                disabled
                                        >
                                            <option value="">-</option>
                                        </select>
                                    </div>

                                    <div class="col-lg-2">
                                        <label class="fs-6 form-label fw-bolder text-dark">학기</label>
                                        <select
                                                id="semester"
                                                name="semester"
                                                class="form-select form-select-solid renewal-form"
                                                data-control="select2"
                                                data-hide-search="true"
                                                disabled
                                        >
                                            <option value="">-</option>
                                        </select>
                                    </div>

                                </div>
                                <div class="row g-8">
                                    <div class="col-xxl-3 fv-row">
                                        <div class="row">
                                            <div class="col-6">
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
                                            <div class="col-6">
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


                                    <div class="col-lg-2">
                                        <label class="fs-6 form-label fw-bolder text-dark">검색어</label>
                                        <select
                                                id="searchKey"
                                                name="searchKey"
                                                class="form-select form-select-solid unselect-form"
                                                data-control="select2"
                                                data-hide-search="true"

                                        >
                                            <option>전체</option>
                                            <option value='BOOK_CODE' ${param.searchKey eq 'BOOK_CODE' ? 'selected' : ''}>북코드</option>
                                            <option value='PRODUCT_CODE' ${param.searchKey eq 'PRODUCT_CODE' ? 'selected' : ''}>제품코드</option>
                                            <option value='TEXTBOOK_TITLE'   ${param.searchKey eq 'TEXTBOOK_TITLE' ? 'selected' : ''}>교과서명</option>
                                            <option value='AUTHOR' ${param.searchKey eq 'AUTHOR' ? 'selected' : ''}>저자명</option>
                                        </select>
                                    </div>

                                    <div class="col-lg-7">
                                        <div class="row pt-8">
                                            <div class="col-lg-12">
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
                                </div>


                            </div>
                            <div class="card-footer">
                                <div class="d-flex justify-content-end" data-kt-customer-table-toolbar="base">
                                    <div>
                                        <a href="/textbook/textbook-list" class="btn btn-secondary" style="color: #181c32; background-color : #fff3cd">
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
                                    <th class="min-w-30px">북코드</th>
                                    <th class="min-w-30px">제품코드</th>
                                    <th class="min-w-30px">시리즈 코드</th>
                                    <th class="min-w-20px">학급</th>
                                    <th class="min-w-20px">과목</th>
                                    <th class="min-w-120px">교과서명</th>
                                    <th class="min-w-40px">집필진</th>
                                    <th class="min-w-30px">노출여부</th>
                                    <th class="min-w-30px">인트로<br/>노출여부</th>
                                    <th class="min-w-40px">작성자</th>
                                    <th class="min-w-40px">최종수정일</th>
                                </tr>
                                <!--end::Table row-->
                                </thead>
                                <!--end::Table head-->
                                <!--begin::Table body-->
                                <tbody>
                                <c:if test="${not empty list}">
                                    <c:forEach items="${list}" var="list" varStatus="status">
                                        <tr >
                                            <td class="text-dark fw-bold text-hover-warning hoverable vertical_center">
                                                <c:out value="${list}"/>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty list}">
                                    <tr>
                                        <td class="center no-results">
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
                                    <a href="/textbook/textbook-reg-form" class="btn btn-m" style=" color: #fff; background-color: #343a40;">
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

        let classSelectElement = document.querySelector('select[name="clazz"]');

        initializeFlatpickr();
        changeSelectDataOption(classSelectElement);

        const targetNode = document.querySelectorAll('.form-select.unselect-form');
        targetNode.forEach((node) => {
            node.style.backgroundColor = '#ffffff';
            node.style.backgroundClip = 'padding-box';
            node.style.border = '1px solid #E4E6EF';
        });

        const unselectedNode = document.querySelectorAll('.form-select.renewal-form');
        unselectedNode.forEach((node) => {
            node.style.backgroundColor = '##F5F8FA';
            node.style.backgroundClip = 'padding-box';
        });
    })


    function changeSelectDataOption(element) {



        let clazz = element.value;
        let subject = document.getElementById('subject');

        let grade = document.getElementById('grade');
        let semester = document.getElementById('semester');

        subject.innerHTML = '<option value="">전체</option>';
        grade.innerHTML = '<option value="">전체</option>';
        semester.innerHTML = '<option value="">전체</option>';

        let subjectOption = '';
        let gradeOption = '';
        let semesterOption = '';

        if (clazz === '초등') {
            subjectOption += '<option value="수학" ${param.subject eq '수학' ? 'selected' : ''}>수학</option><option value="과학" ${param.subject eq '과학' ? 'selected' : ''}>과학</option><option value="사회" ${param.subject eq '사회' ? 'selected' : ''}>사회</option><option value="음악" ${param.subject eq '음악' ? 'selected' : ''}>음악</option><option value="미술" ${param.subject eq '미술' ? 'selected' : ''}>미술</option><option value="체육" ${param.subject eq '체육' ? 'selected' : ''}>체육</option><option value="통합" ${param.subject eq '통합' ? 'selected' : ''}>통합</option>';
            gradeOption += '<option value="1학년" ${param.grade eq '1학년' ? 'selected' : ''}>1학년</option><option value="2학년" ${param.grade eq '2학년' ? 'selected' : ''}>2학년</option><option value="3학년" ${param.grade eq '3학년' ? 'selected' : ''}>3학년</option><option value="4학년" ${param.grade eq '4학년' ? 'selected' : ''}>4학년</option><option value="5학년" ${param.grade eq '5학년' ? 'selected' : ''}>5학년</option><option value="6학년" ${param.grade eq '6학년' ? 'selected' : ''}>6학년</option><option value="공통" ${param.grade eq '공통' ? 'selected' : ''}>공통</option>';
            semesterOption += '<option value="1학기" ${param.semester eq '1학기' ? 'selected' : ''}>1학기</option><option value="2학기" ${param.semester eq '2학기' ? 'selected' : ''}>2학기</option><option value="공통" ${param.semester eq '공통' ? 'selected' : ''}>공통</option>';
        } else if (clazz === '중학') {
            subjectOption += '<option value="국어" ${param.subject eq '국어' ? 'selected' : ''}>국어</option><option value="영어" ${param.subject eq '영어' ? 'selected' : ''}>영어</option><option value="수학" ${param.subject eq '수학' ? 'selected' : ''}>수학</option><option value="사회" ${param.subject eq '사회' ? 'selected' : ''}>사회</option><option value="역사" ${param.subject eq '역사' ? 'selected' : ''}>역사</option><option value="도덕" ${param.subject eq '도덕' ? 'selected' : ''}>도덕</option><option value="음악" ${param.subject eq '음악' ? 'selected' : ''}>음악</option><option value="미술" ${param.subject eq '미술' ? 'selected' : ''}>미술</option><option value="체육" ${param.subject eq '체육' ? 'selected' : ''}>체육</option><option value="기술가정" ${param.subject eq '기술가정' ? 'selected' : ''}>기술가정</option><option value="한문" ${param.subject eq '한문' ? 'selected' : ''}>한문</option><option value="진로와 직업" ${param.subject eq '진로와 직업' ? 'selected' : ''}>진로와 직업</option>';
            gradeOption += '<option value="1학년" ${param.grade eq '1학년' ? 'selected' : ''}>1학년</option><option value="2학년" ${param.grade eq '2학년' ? 'selected' : ''}>2학년</option><option value="3학년" ${param.grade eq '3학년' ? 'selected' : ''}>3학년</option><option value="공통" ${param.grade eq '공통' ? 'selected' : ''}>공통</option>';
            semesterOption += '<option value="1학기" ${param.semester eq '1학기' ? 'selected' : ''}>1학기</option><option value="2학기" ${param.semester eq '2학기' ? 'selected' : ''}>2학기</option><option value="공통" ${param.semester eq '공통' ? 'selected' : ''}>공통</option>';

        } else if (clazz === '고등') {
            subjectOption += '<option value="국어" ${param.subject eq '국어' ? 'selected' : ''}>국어</option><option value="영어" ${param.subject eq '영어' ? 'selected' : ''}>영어</option><option value="수학" ${param.subject eq '수학' ? 'selected' : ''}>수학</option><option value="사회" ${param.subject eq '사회' ? 'selected' : ''}>사회</option><option value="역사" ${param.subject eq '역사' ? 'selected' : ''}>역사</option><option value="한국사" ${param.subject eq '한국사' ? 'selected' : ''}>한국사</option><option value="과학" ${param.subject eq '과학' ? 'selected' : ''}>과학</option><option value="음악" ${param.subject eq '음악' ? 'selected' : ''}>음악</option><option value="미술" ${param.subject eq '미술' ? 'selected' : ''}>미술</option><option value="체육" ${param.subject eq '체육' ? 'selected' : ''}>체육</option><option value="기술가정" ${param.subject eq '기술가정' ? 'selected' : ''}>기술가정</option><option value="한문" ${param.subject eq '한문' ? 'selected' : ''}>한문</option><option value="중국어" ${param.subject eq '중국어' ? 'selected' : ''}>중국어</option><option value="진로와 직업" ${param.subject eq '진로와 직업' ? 'selected' : ''}>진로와 직업</option><option value="연극" ${param.subject eq '연극' ? 'selected' : ''}>연극</option>';
            gradeOption += '<option value="공통" ${param.grade eq '공통' ? 'selected' : ''}>공통</option>';
            semesterOption += '<option value="공통" ${param.semester eq '공통' ? 'selected' : ''}>공통</option>';
        } else {
            subjectOption += '<option value="">-</option>';
            gradeOption += '<option value="">-</option>';
            semesterOption += '<option value="">-</option>';
        }

        if (clazz === '' || clazz === '전체') {
            subject.innerHTML = subjectOption;
            grade.innerHTML = gradeOption;
            semester.innerHTML = semesterOption;

            subject.disabled = true;
            grade.disabled = true;
            semester.disabled = true;

            const targetNode = document.querySelectorAll('.form-select.renewal-form');
            targetNode.forEach((node) => {
                node.style.backgroundColor = '#F5F8FA';
                node.style.backgroundClip = 'padding-box';
                node.style.border = 'none';
            });
        } else {
            subject.innerHTML += subjectOption;
            grade.innerHTML += gradeOption;
            semester.innerHTML += semesterOption;

            subject.disabled = false;
            grade.disabled = false;
            semester.disabled = false;

            const targetNode = document.querySelectorAll('.form-select.renewal-form');
            targetNode.forEach((node) => {
                node.style.backgroundColor = '#ffffff';
                node.style.backgroundClip = 'padding-box';
                node.style.border = '1px solid #E4E6EF';
            });
        }

    }

    function fetchUserList(page) {
        const sdate = document.getElementById('sdate').value;
        const edate = document.getElementById('edate').value;
        const clazz = document.getElementById('clazz').value;
        const subject = document.getElementById('subject').value;
        const grade = document.getElementById('grade').value;
        const semester = document.getElementById('semester').value;
        const isOpen = document.getElementById('isOpen').value;
        const isIntro = document.getElementById('isIntro').value;
        const searchKey = document.getElementById('searchKey').value;
        const search = document.getElementById('search').value;

        let queryParams = '?perPage=' + document.getElementById('perPage').value;

        if (sdate != null || sdate !== undefined) {
            queryParams += '&sdate=' + sdate;
        }

        if (edate != null || edate !== undefined) {
            queryParams += '&edate=' + edate;
        }

        if (clazz != null || clazz !== undefined) {
            queryParams += '&clazz=' + clazz;
        }

        if (subject != null || subject !== undefined) {
            queryParams += '&subject=' + subject;
        }

        if (grade != null || grade !== undefined) {
            queryParams += '&grade=' + grade;
        }

        if (semester != null || semester !== undefined) {
            queryParams += '&semester=' + semester;
        }

        if (isOpen != null || isOpen !== undefined) {
            queryParams += '&isOpen=' + isOpen;
        }

        if (isIntro != null || isIntro !== undefined) {
            queryParams += '&isIntro=' + isIntro;
        }

        if (searchKey != null || searchKey !== undefined) {
            queryParams += '&searchKey=' + searchKey;
        }

        if (search != null || search !== undefined) {
            queryParams += '&search=' + search;
        }

        location.href = '/textbook/textbook-list' + queryParams;
    }

    function changePage(page) {
        const sdate = document.getElementById('sdate').value;
        const edate = document.getElementById('edate').value;
        const clazz = document.getElementById('clazz').value;
        const subject = document.getElementById('subject').value;
        const grade = document.getElementById('grade').value;
        const semester = document.getElementById('semester').value;
        const isOpen = document.getElementById('isOpen').value;
        const isIntro = document.getElementById('isIntro').value;
        const searchKey = document.getElementById('searchKey').value;
        const search = document.getElementById('search').value;


        let queryParams = '?page=' + page + '&perPage=' + document.getElementById('perPage').value;

        if (sdate != null || sdate !== undefined) {
            queryParams += '&sdate=' + sdate;
        }

        if (edate != null || edate !== undefined) {
            queryParams += '&edate=' + edate;
        }

        if (clazz != null || clazz !== undefined) {
            queryParams += '&clazz=' + clazz;
        }

        if (subject != null || subject !== undefined) {
            queryParams += '&subject=' + subject;
        }

        if (grade != null || grade !== undefined) {
            queryParams += '&grade=' + grade;
        }

        if (semester != null || semester !== undefined) {
            queryParams += '&semester=' + semester;
        }

        if (isOpen != null || isOpen !== undefined) {
            queryParams += '&isOpen=' + isOpen;
        }

        if (isIntro != null || isIntro !== undefined) {
            queryParams += '&isIntro=' + isIntro;
        }

        if (searchKey != null || searchKey !== undefined) {
            queryParams += '&searchKey=' + searchKey;
        }

        if (search != null || search !== undefined) {
            queryParams += '&search=' + search;
        }


        location.href = '/textbook/textbook-list' + queryParams;
    }

    function openTextBookForm(element) {
        const uid = element.getAttribute('data-uid');
        const sdate = document.getElementById('sdate').value;
        const edate = document.getElementById('edate').value;
        const clazz = document.getElementById('clazz').value;
        const subject = document.getElementById('subject').value;
        const grade = document.getElementById('grade').value;
        const semester = document.getElementById('semester').value;
        const isOpen = document.getElementById('isOpen').value;
        const isIntro = document.getElementById('isIntro').value;
        const searchKey = document.getElementById('searchKey').value;
        const search = document.getElementById('search').value;
        const page = new URLSearchParams(window.location.search).get('page') || '1';

        let queryParams = '?page=' + page + '&perPage=' + document.getElementById('perPage').value;

        if (sdate != null || sdate !== undefined) {
            queryParams += '&sdate=' + sdate;
        }

        if (edate != null || edate !== undefined) {
            queryParams += '&edate=' + edate;
        }

        if (clazz != null || clazz !== undefined) {
            queryParams += '&clazz=' + clazz;
        }

        if (subject != null || subject !== undefined) {
            queryParams += '&subject=' + subject;
        }

        if (grade != null || grade !== undefined) {
            queryParams += '&grade=' + grade;
        }

        if (semester != null || semester !== undefined) {
            queryParams += '&semester=' + semester;
        }

        if (isOpen != null || isOpen !== undefined) {
            queryParams += '&isOpen=' + isOpen;
        }

        if (isIntro != null || isIntro !== undefined) {
            queryParams += '&isIntro=' + isIntro;
        }

        if (searchKey != null || searchKey !== undefined) {
            queryParams += '&searchKey=' + searchKey;
        }

        if (search != null || search !== undefined) {
            queryParams += '&search=' + search;
        }
        const url = '/textbook/textbook/' + uid + queryParams;
        window.location.href = url;
    }


</script>
<style>
    .center {
        text-align: center; /* 텍스트 중앙 정렬 */
    }

    .vertical_center {
        vertical-align: middle;
        height: 90px;
    }

    .form-select-solid {
        background-color: #ffffff;
        background-clip: padding-box;
        border: 1px solid #E4E6EF;
    }

    .table {
        width: 100%; /* 테이블의 전체 너비를 100%로 설정 */
        table-layout: fixed; /* 테이블 레이아웃을 고정으로 설정 */
    }

    .table th, .table td {
        width: 80px; /* 각 셀의 기본 너비를 80px로 설정 */
        white-space: nowrap; /* 텍스트가 줄 바꿈되지 않도록 설정 */
        /*overflow: hidden; !* 넘치는 텍스트를 숨김 *!*/
        /*text-overflow: ellipsis; !* 넘치는 텍스트를 ...으로 표시 *!*/
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
    .table th.min-w-50px, .table td.min-w-50px {
        width: 50px; /* 노출여부 및 인트로 노출여부 열의 너비를 40px로 설정 */
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

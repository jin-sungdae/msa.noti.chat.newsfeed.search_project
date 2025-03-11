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
                        <form class="form" id="faqForm">
                            <input type="hidden" value="<c:out value='${page.currentPage < 1 ? 1 : page.currentPage}'/>" name="page" id="page"/>
                            <input type="hidden" value="<c:out value='${page.pageListSize < 1 ? 30 : page.pageListSize}'/>" name="perPage"/>
                            <div class="card-body">
                                <div class="row g-8">
                                    <div class="col-xxl-3 fv-row">
                                        <label class="fs-6 form-label fw-bolder text-dark">기간</label>
                                        <div class="row fv-row fv-plugins-icon-container">
                                            <div class="col-6">
                                                <div class="input-group">
                                                    <input
                                                            id="startDate"
                                                            name="startDate"
                                                            class="form-control flatpickr-input"
                                                            placeholder="시작일"
                                                            autocomplete="off"
                                                            value="<c:out value='${search.startDate}'/>"
                                                    />
                                                    <span class="input-group-text" id="basic-addon3">
                                                    <i class="bi bi-calendar-check fs-1"></i>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="input-group">
                                                    <input
                                                            id="endDate"
                                                            name="endDate"
                                                            class="form-control flatpickr-input"
                                                            placeholder="종료일"
                                                            autocomplete="off"
                                                            value="<c:out value='${search.endDate}'/>"
                                                    />
                                                    <span class="input-group-text" id="basic-addon3">
                                                    <i class="bi bi-calendar-check fs-1"></i>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <label class="fs-6 form-label fw-bolder text-dark">응대여부</label>
                                        <select
                                                id="isResponse"
                                                name="isResponse"
                                                class="form-select form-select-solid"
                                                data-control="select2"
                                                data-hide-search="true"
                                                data-placeholder="전체"
                                        >
                                            <option value="전체">전체</option>
                                            <option value='Y' <c:if test="${search.isResponse eq 'Y'}">selected</c:if>>Y</option>
                                            <option value='N' <c:if test="${search.isResponse eq 'N'}">selected</c:if>>N</option>
                                        </select>
                                    </div>

                                    <div class="col-lg-5">
                                        <div class="row g-8">
                                            <div class="col-lg-12">
                                                <label class="fs-6 form-label fw-bolder text-dark">검색어</label>
                                                <input
                                                        type="text"
                                                        id="searchValue"
                                                        name="searchValue"
                                                        class="form-control"
                                                        placeholder="검색어 입력"
                                                        maxlength="100"
                                                        value="<c:out value="${search.searchValue}"/>"
                                                />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="card-footer">
                                <div class="d-flex justify-content-end" data-kt-customer-table-toolbar="base">
                                    <div>
                                        <a href="/customer/partnership-inquiry" class="btn btn-light" style="color: #181c32; background-color : #fff3cd">
                                            <i class="fas bi-arrow-repeat fs-2 me-2"></i>
                                            초기화
                                        </a>
                                        <button type="button" class="btn btn-m btn-warning" id="searchBtn" style="background-color: #ffcd39; color: #181C32">
                                            검색
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="card">
                        <div class="card-header border-0 pt-6L">
                            <div class="card-title">
                                <div class="row d-flex align-items-center justify-content-between">
                                    <div class="col d-flex align-items-center justify-content-between">
                                        <h3 class="fs-6 fw-bold mt-3 mb-3" style="flex-grow: 1; min-width: 0; white-space: nowrap;">총 <span class="fw-bolder"><c:out value='${listNum}'/></span> 개</h3>
                                    </div>
                                    <div class="col">
                                        <select
                                                id="perPage"
                                                name="perPage"
                                                class="form-select form-select-solid"
                                                data-control="select2"
                                                data-hide-search="true"
                                                onchange="changePerPage(this)"
                                                style="margin-left: 10px;"
                                        >

                                            <option
                                                    value="10"
                                                    <c:if test="${page.pageListSize eq '10'}">
                                                        selected
                                                    </c:if>>
                                                10
                                            </option>
                                            <option
                                                    value="30"
                                                    <c:if test="${empty page.pageListSize || page.pageListSize eq '30'}">
                                                        selected
                                                    </c:if>>
                                                30
                                            </option>
                                            <option
                                                    value="50"
                                                    <c:if test="${page.pageListSize eq '50'}">
                                                        selected
                                                    </c:if>>
                                                50
                                            </option>
                                        </select>
                                    </div>
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
                                    <th class="min-w-70px">No.</th>
                                    <th class="min-w-70px">제목</th>
                                    <th class="min-w-60px">작성자</th>
                                    <th class="min-w-50px">작성일시</th>
                                    <th class="min-w-50px">응대여부</th>
                                </tr>
                                <!--end::Table row-->
                                </thead>
                                <!--end::Table head-->
                                <!--begin::Table body-->
                                <tbody>
                                <c:if test="${not empty partnershipInquiryList}">
                                    <c:forEach items="${partnershipInquiryList}" var="list" varStatus="status">
                                        <tr>
                                            <td class="text-dark fw-bold">
                                                ${((listNum - (page.pageListSize * (page.currentPage - 1))) - status.index)}
                                            </td>
                                            <td class="text-dark text-hover-warning fw-bold hoverable"
                                                data-idx="<c:out value='${list.uid}'/>"
                                                onclick="loadView(this)">
                                                <c:out value="${list.title}"/>
                                            </td>
                                            <td class="text-dark fw-bold">
                                                <c:out value="${list.name}"/>
                                            </td>
                                            <td class="text-dark fw-bold">
                                                <c:out value="${list.regDate}"/>
                                            </td>
                                            <td class="text-dark fw-bold">
                                                <c:out value="${list.isResponse}"/>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty partnershipInquiryList}">
                                    <tr>
                                        <td class="center" colspan="5">
                                            데이터가 없습니다.
                                        </td>
                                    </tr>
                                </c:if>
                                </tbody>
                                <!--end::Table body-->
                            </table>
                            <!--end::Table-->
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="d-flex justify-content-center flex-grow-1">
                                    <%@ include file="/WEB-INF/views/common/inc/Paging.jsp" %>
                                </div>
<%--                                <div>--%>
<%--                                    <a href="/customer/faq-reg-form" class="btn btn-m" style=" color: #fff; background-color: #343a40;" id="registerBtn">--%>
<%--                                        등록--%>
<%--                                    </a>--%>
<%--                                </div>--%>
                            </div>
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
<script src="https://cdn.jsdelivr.net/npm/sortablejs@1.15.2/Sortable.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script type="text/javascript">

    function initializeFlatpickr() {
        const today = new Date();
        const oneMonthBefore = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());

        const startDateInput = document.getElementById('startDate');
        const endDateInput = document.getElementById('endDate');
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

    // 버튼 세팅 registerBtn
    // 로드시점 동작
    document.addEventListener('DOMContentLoaded', function () {
        const targetNode = document.querySelectorAll('.form-select');
        targetNode.forEach((node) => {
            node.style.backgroundColor = '#ffffff';
            node.style.backgroundClip = 'padding-box';
            node.style.border = '1px solid #E4E6EF';
        });
        initializeFlatpickr();
        document.getElementById('searchBtn').addEventListener('click', () => search());

        document.getElementById('searchValue').addEventListener('keydown', (evt) => {
        let searchValue = document.getElementById('searchValue').value.trim();
            if(evt.key == "Enter" && searchValue) {
                search()
            }
        });
    })
    const search = () => {
        let searchValue = document.getElementById('searchValue').value.trim();

//        if(!searchValue) {
//            Swal.fire({
//                title: '검색어를 입력해주세요.',
//                text: '',
//                icon: 'error',
//                confirmButtonText: '확인'
//            })
//            return false;
//        }

        document.getElementById('faqForm').submit();
    }

    const updateUrlParam = (url, paramName, paramValue) => {
        const urlObject = new URL(url);
        urlObject.searchParams.set(paramName, paramValue);
        return urlObject.toString();
    }

    const changePage = (page) => {
        document.getElementById('page').value = page;
        let returnUrl = updateUrlParam(window.location.href, 'page', page);
        location.href = returnUrl;
    }

    const changePerPage = (select) => {
        const perPage = select.value;
        let params = updateUrlParam(window.location.href, 'page', 1);
        let returnUrl = updateUrlParam(params, 'perPage', perPage);
        location.href = returnUrl;
    }

    const loadView = (element) => {
        const idx = element.getAttribute('data-idx');
        let startDate = document.getElementById('startDate').value;
        let endDate = document.getElementById('endDate').value;
        let isResponse = document.getElementById('isResponse').value;
        let searchValue = document.getElementById('searchValue').value;
        let page = document.getElementById('page').value;
        let perPage = document.getElementById('perPage').value;
        if (idx) {
            const url = '/customer/partnership-inquiry/' + idx + '?page=' + page + '&perPage='+ perPage+ '&startDate='+ startDate +'&endDate='+ endDate +'&isResponse='+ isResponse +'&searchValue='+ searchValue;
            window.location.href = url;
        }
    }
</script>

</body>
</html>

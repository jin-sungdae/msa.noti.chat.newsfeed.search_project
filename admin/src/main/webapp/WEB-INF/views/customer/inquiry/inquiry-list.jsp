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
                        <form class="form" id="customInquiryForm">
                            <input type="hidden" id="pageNo" value="<c:out value="${pageNo}"/>">
                            <input type="hidden" id="pageSize" name="pageSize" value="${page.pageListSize}">
                            <div class="card-body">
                                <div class="row g-8">
                                    <div class="col-xxl-3 fv-row">
                                        <label class="fs-6 form-label fw-bolder text-dark">기간</label>
                                        <div class="row fv-row fv-plugins-icon-container">
                                            <input type="hidden" id="inquiryKind" value="<c:out value="${kind}"/>">
                                            <div class="col-6">
                                                <div class="input-group">
                                                    <input
                                                            id="startDate"
                                                            name="startDate"
                                                            type="text"
                                                            class="form-control flatpickr-input"
                                                            placeholder="시작일"
                                                            autocomplete="off"
                                                            value="<c:out value="${search.startDate}"/>"
                                                    />
                                                    <span class="input-group-text" >
                                                    <i class="bi bi-calendar-check fs-1"></i>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="input-group">
                                                    <input
                                                            id="endDate"
                                                            name="endDate"
                                                            type="text"
                                                            class="form-control flatpickr-input"
                                                            placeholder="종료일"
                                                            autocomplete="off"
                                                            value="<c:out value="${search.endDate}"/>"
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
                                                for="inquiryCategory"
                                        >
                                            문의 구분
                                        </label>
                                        <select
                                                id="inquiryCategory"
                                                name="inquiryCategory"
                                                class="form-select form-select-transparent"
                                                data-control="select2"
                                                data-hide-search="true"
                                                data-placeholder="전체"
                                        >
                                            <option></option>
                                            <c:choose>
                                                <c:when test="${kind eq ''}">
                                                    <option value="전체" ${(search.inquiryCategory eq '') or (search.inquiryCategory eq null)}>전체</option>
                                                    <option value="첫걸음" <c:if test="${search.inquiryCategory eq '첫걸음'}">selected</c:if>>독서평설첫걸음</option>
                                                    <option value="초등" <c:if test="${search.inquiryCategory eq '초등'}">selected</c:if>>초등독서평설</option>
                                                    <option value="중학" <c:if test="${search.inquiryCategory eq '중학'}">selected</c:if>>중학독서평설</option>
                                                    <option value="고교" <c:if test="${search.inquiryCategory eq '고교'}">selected</c:if>>고교독서평설</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach items="${customerInquiryCategoryList}" var="type" varStatus="status">
                                                        <option value="${type.getCategory() eq ''?'전체':type.getCategory()}" <c:if test="${type.getCategory() == search.inquiryCategory}">selected</c:if> >
                                                            <c:choose>
                                                                <c:when test="${type.getCategory() eq ''}">전체</c:when>
                                                                <c:otherwise>${type.getCategory()}</c:otherwise>
                                                            </c:choose>
                                                        </option>
                                                    </c:forEach>
                                                </c:otherwise>
                                            </c:choose>
                                        </select>
                                    </div>

                                    <div class="col-lg-2">
                                        <label class="fs-6 form-label fw-bolder text-dark"
                                               for="isAnswer"
                                        >
                                            답변여부</label>
                                        <select
                                                id="isAnswer"
                                                name="isAnswer"
                                                class="form-select form-select-transparent"
                                                data-control="select2"
                                                data-hide-search="true"
                                                data-placeholder="전체"
                                        >
                                            <option value="전체">전체</option>
                                            <option value='Y' ${search.isAnswer eq 'Y' ? 'selected' : ''}>Y</option>
                                            <option value='N' ${search.isAnswer eq 'N' ? 'selected' : ''}>N</option>
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
                                        <c:choose>
                                            <c:when test="${kind eq ''}">
                                                <a href="/reading-review/inquiry" class="btn btn-light" style="color: #181c32; background-color : #fff3cd">
                                                    <i class="fas bi-arrow-repeat fs-2 me-2 resetSearch"></i>
                                                    초기화
                                                </a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="/customer/inquiry/${kind}" class="btn btn-light" style="color: #181c32; background-color : #fff3cd">
                                                    <i class="fas bi-arrow-repeat fs-2 me-2 resetSearch"></i>
                                                    초기화
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
                                        <button type="submit" class="btn btn-m btn-warning" id="searchBtn" style="background-color: #ffcd39; color: #181C32">
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
                                <div class="row">
                                    <div class="col-5 d-flex align-items-center justify-content-between">
                                        <h3 class="col-lg-12 fs-4 fw-bold mt-3 mb-3" style="flex-grow: 1; min-width: 0; white-space: nowrap;">총 <span class="fw-bolder">${listNum}</span> 개</h3>
                                    </div>
                                    <div class="col-7">
                                        <select
                                                id="perPage"
                                                name="perPage"
                                                class="form-select"
                                                data-control="select2"
                                                data-hide-search="true"
                                                onchange="fetchUserList()"
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
                                    <th class="min-w-70px">문의구분</th>
                                    <th class="min-w-70px">제목</th>
                                    <th class="min-w-70px">작성자</th>
                                    <th class="min-w-60px">작성일시</th>
                                    <th class="min-w-50px">답변여부</th>
                                </tr>
                                <!--end::Table row-->
                                </thead>
                                <!--end::Table head-->
                                <!--begin::Table body-->
                                <tbody>
                                <c:if test="${not empty customerInquiryList}">
                                    <c:forEach items="${customerInquiryList}" var="list" varStatus="status">
                                        <tr>
                                            <td class="text-dark fw-bold">
                                                    ${((listNum - (page.pageListSize * (page.currentPage - 1))) - status.index)}
                                            </td>
                                            <td class="text-dark fw-bold"
                                                data-uid="${list.uid}"
                                                name="inquiryCategory">
                                                <c:out value="${list.inquiryCategory}"/>
                                            </td>
                                            <td class="text-dark text-hover-warning fw-bold hoverable goView"
                                                data-uid="${list.uid}"
                                                name="title">
                                                <c:out value="${list.title}"/>
                                            </td>
                                            <td class="text-dark fw-bold"
                                                data-uid="${list.uid}"
                                                name="userId">
                                                <c:out value="${list.userName}"/>
                                            </td>
                                            <td class="text-dark fw-bold"
                                                data-uid="${list.uid}"
                                                name="modDate">
                                                <c:out value="${list.modDate}"/>
                                            </td>
                                            <td class="text-dark fw-bold"
                                                data-uid="${list.uid}"
                                                name="isAnswer">
                                                <c:out value="${list.isAnswer}"/>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty customerInquiryList}">
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
            </div>
            <%@ include file="/WEB-INF/views/common/inc/FooterINC.jsp" %>
        </div>
    </div>
</div>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
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

    document.addEventListener('DOMContentLoaded', function () {
        initializeFlatpickr();

        document.getElementById('searchBtn').addEventListener('click', () => search());
        const search = () => {
            let searchValue = document.getElementById('searchValue').value.trim();
            document.getElementById('customInquiryForm').submit();
        }

        let goViews = document.querySelectorAll('.goView');
        goViews.forEach(function(el){
            el.addEventListener('click', function(evt){
                evt.preventDefault();
                let pageNo = document.getElementById('pageNo').value;
                let startDate = document.getElementById('startDate').value;
                let endDate = document.getElementById('endDate').value;
                let inquiryCategory = document.getElementById('inquiryCategory').value;
                let searchValue = document.getElementById('searchValue').value;
                let kind = document.getElementById('inquiryKind').value;
                let uid = el.dataset.uid;
                let url = '/customer/inquiry/' + kind + '/' + uid;
                if(kind == ''){
                    url = '/reading-review/inquiry/' + uid;
                }
                location.href = url + '?pageNo=' + pageNo + '&startDate=' + startDate + '&endDate=' + endDate + '&inquiryCategory=' + inquiryCategory + '&searchValue=' + searchValue;
            })
        })

        let resetSearch = document.querySelectorAll('.resetSearch');
        resetSearch.forEach((reset) => {
            reset.addEventListener('click', function (e){
                e.preventDefault();
                let kind = '<c:out value="${kind}"/>';
                let url = '/customer/inquiry/' + kind;
                if(kind == ''){
                    url = '/reading-review/inquiry';
                }
                location.href = url;
            })
        })
    })

    const updateUrlParam = (url, paramName, paramValue) => {
        const urlObject = new URL(url);
        urlObject.searchParams.set(paramName, paramValue);
        return urlObject.toString();
    }

    const changePage = (pageNo) => {
        let returnUrl = updateUrlParam(window.location.href, 'pageNo', pageNo);
        location.href = returnUrl;
    }
    function fetchUserList() {
        document.getElementById('pageNo').value = 1;
        document.getElementById('pageSize').value = document.getElementById('perPage').value
        document.getElementById('customInquiryForm').submit();
    }
</script>

</body>
</html>

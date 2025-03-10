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
                <input type="hidden" id="pageNo" value="<c:out value="${page.currentPage}"/>">
                <div id="kt_content_container" class="container-fluid">
                    <div class="card mb-7">
                        <form id="eventForm" class="form">
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
                                                            type="text"
                                                            class="form-control flatpickr-input"
                                                            placeholder="시작일"
                                                            autocomplete="off"
                                                            value="<c:out value="${search.startDate}"/>"
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
                                    <div class="col-lg-4">
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <label
                                                        class="fs-6 form-label fw-bolder text-dark"
                                                        for="eventType"
                                                >
                                                    이벤트 구분
                                                </label>
                                                <select
                                                        id="eventType"
                                                        name="eventType"
                                                        class="form-select form-select-transparent"
                                                        data-control="select2"
                                                        data-hide-search="true"
                                                        data-placeholder="전체"
                                                >
                                                    <option value=""></option>
                                                    <option value="ALL">전체</option>
                                                    <option value="GENERAL" ${search.eventType eq 'GENERAL' ? 'selected' : ''}>일반</option>
                                                    <option value="PARTICIPATION" ${search.eventType eq 'PARTICIPATION' ? 'selected' : ''}>참여</option>
                                                    <option value="SURVEY_SHORT" ${search.eventType eq 'SURVEY_SHORT' ? 'selected' : ''}>설문(단답형)</option>
                                                    <option value="SURVEY_DUPLICATION" ${search.eventType eq 'SURVEY_DUPLICATION' ? 'selected' : ''}>설문(중복형)</option>
                                                    <option value="REPLY_PUBLIC" ${search.eventType eq 'REPLY_PUBLIC' ? 'selected' : ''}>댓글(공개형)</option>
                                                    <option value="REPLY_PRIVATE" ${search.eventType eq 'REPLY_PRIVATE' ? 'selected' : ''}>댓글(비공개형)</option>
                                                </select>
                                            </div>
                                            <div class="col-lg-4">
                                                <label
                                                        class="fs-6 form-label fw-bolder text-dark"
                                                        for="eventStatus"
                                                >
                                                    이벤트 상태
                                                </label>
                                                <select
                                                        id="eventStatus"
                                                        name="eventStatus"
                                                        class="form-select form-select-transparent"
                                                        data-control="select2"
                                                        data-hide-search="true"
                                                        data-placeholder="전체"
                                                >
                                                    <option value=""></option>
                                                    <option value="ALL">전체</option>
                                                    <option value="진행" ${search.eventStatus eq '진행' ? 'selected' : ''}>진행</option>
                                                    <option value="마감" ${search.eventStatus eq '마감' ? 'selected' : ''}>마감</option>
                                                </select>
                                            </div>
                                            <div class="col-lg-4">
                                                <label class="fs-6 form-label fw-bolder text-dark" for="isOpen">
                                                    노출 여부
                                                </label>
                                                <select
                                                        id="isOpen"
                                                        name="isOpen"
                                                        class="form-select form-select-transparent"
                                                        data-control="select2"
                                                        data-hide-search="true"
                                                        data-placeholder="전체"
                                                >
                                                    <option value=""></option>
                                                    <option value="ALL">전체</option>
                                                    <option value="Y" ${search.isOpen eq 'Y' ? 'selected' : ''}>Y</option>
                                                    <option value="N" ${search.isOpen eq 'N' ? 'selected' : ''}>N</option>
                                                </select>
                                            </div>
                                        </div>
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
                                        <a href="/customer/event" class="btn btn-light" style="color: #181c32; background-color : #fff3cd">
                                            <i class="fas bi-arrow-repeat fs-2 me-2"></i>
                                            초기화
                                        </a>
                                        <button id="searchBtn" type="button" class="btn btn-m btn-warning" style="background-color: #ffcd39; color: #181C32">
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
                                        <h3 class="fs-6 fw-bold mt-3 mb-3" style="flex-grow: 1; min-width: 0; white-space: nowrap;">총 <span class="fw-bolder">${listNum}</span> 개</h3>
                                    </div>
                                    <div class="col">
                                        <select
                                                id="pageListSize"
                                                name="pageListSize"
                                                class="form-select form-select-solid"
                                                data-control="select2"
                                                data-hide-search="true"
                                                onchange="changePerPage(this)"
                                                style="margin-left: 10px;">
                                            <option value="10"
                                                    <c:if test="${empty page.pageListSize || page.pageListSize eq '10'}">
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
                                    <th class="min-w-70px">이벤트 구분</th>
                                    <th class="min-w-70px">이벤트 상태</th>
                                    <th class="min-w-70px">배너 노출 메뉴</th>
                                    <th class="min-w-60px">제목</th>
                                    <th class="min-w-50px">이벤트 기간</th>
                                    <th class="min-w-70px">노출여부</th>
                                    <th class="min-w-70px">참여자 수</th>
                                    <th class="min-w-70px">작성자</th>
                                    <th class="min-w-70px">작성일시</th>
                                </tr>
                                <!--end::Table row-->
                                </thead>
                                <!--end::Table head-->
                                <!--begin::Table body-->
                                <tbody>
                                <c:if test="${not empty eventList}">
                                    <c:forEach items="${eventList}" var="list" varStatus="status">
                                        <tr class="">
                                            <td class="text-dark fw-bold cursor-default">
                                                    ${((listNum - (page.pageListSize * (page.currentPage - 1))) - status.index)}
                                            </td>
                                            <td class="text-dark fw-bold cursor-default" data-uid="${list.uid}" name="eventType">
                                                <c:out value="${list.eventType}"/>
                                            </td>
                                            <td class="text-dark fw-bold cursor-default" data-uid="${list.uid}" name="eventStatus">
                                                <c:out value="${list.eventStatus}"/>
                                            </td>
                                            <td class="text-dark fw-bold cursor-default" data-uid="${list.uid}" name="bannerLocation" onclick="openEventForm(this)">
                                                <c:set var="bannerLocation" value="${list.bannerLocation}" />
                                                <c:choose>
                                                    <c:when test="${fn:contains(bannerLocation, 'TEXTBOOK') && fn:contains(bannerLocation, 'REFERENCE-BOOK')}">
                                                        <c:set var="replacedBannerLocation" value="교과서, 참고서" />
                                                    </c:when>
                                                    <c:when test="${fn:contains(bannerLocation, 'TEXTBOOK')}">
                                                        <c:set var="replacedBannerLocation" value="교과서" />
                                                    </c:when>
                                                    <c:when test="${fn:contains(bannerLocation, 'REFERENCE-BOOK')}">
                                                        <c:set var="replacedBannerLocation" value="참고서" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:set var="replacedBannerLocation" value="${'-'}" />
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:out value="${replacedBannerLocation}"/>
                                            </td>
                                            <td class="text-dark text-hover-warning fw-bolder hoverable cursor-pointer" data-uid="${list.uid}" name="title" onclick="openEventForm(this)">
                                                <c:out value="${list.title}"/>
                                            </td>
                                            <td class="text-dark cursor-default" data-uid="${list.uid}">
                                                <c:out value="${list.startDate}"/> ~ <c:out value="${list.endDate}"/>
                                            </td>
                                            <td class="text-dark cursor-default" name="isOpen">
                                                <c:out value="${list.isOpen}"/>
                                            </td>
                                            <td class="text-dark cursor-default" data-uid="${list.uid}" name="firstRegistrationDateTime"/>
                                                <c:out value="${list.participantCount}"/>
                                            </td>
                                            <td class="text-dark cursor-default" data-uid="${list.uid}" name="firstRegistrationDateTime"/>
                                                <c:out value="${list.adminName}"/> (<c:out value="${list.department}"/>)
                                            </td>
                                            <td class="text-dark cursor-default" data-uid="${list.uid}"/>
                                            <c:out value="${list.regDate}"/>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty eventList}">
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
                                    <a href="/customer/event-reg-form" class="btn btn-m" style=" color: #fff; background-color: #343a40;">
                                        등록
                                    </a>
                                </div>
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
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script src="/assets/js/flatpickr/flatpickrInitial.js"></script>
<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {
        initializeFlatpickr(false);
        document.getElementById('searchBtn').addEventListener('click', () => search());

        document.getElementById('searchValue').addEventListener('keydown', (evt) => {
            let searchValue = document.getElementById('searchValue').value.trim();
            if(evt.key == "Enter" && searchValue) {
                search()
            }
        });

    })

    const search = () => {
        document.getElementById('eventForm').submit();
    }

    let pageNo = document.getElementById('pageNo').value;
    let startDate = document.getElementById('startDate').value;
    let endDate = document.getElementById('endDate').value;
    let eventType = document.getElementById('eventType').value;
    let eventStatus = document.getElementById('eventStatus').value;
    let isOpen = document.getElementById('isOpen').value;
    let searchValue = document.getElementById('searchValue').value;

    function openEventForm(element) {
        sessionStorage.setItem('pageNo', pageNo);
        sessionStorage.setItem('startDate', startDate);
        sessionStorage.setItem('endDate', endDate);
        sessionStorage.setItem('eventType', eventType);
        sessionStorage.setItem('eventStatus', eventStatus);
        sessionStorage.setItem('isOpen', isOpen);
        sessionStorage.setItem('searchValue', searchValue);

        const uid = element.getAttribute('data-uid');
        const url = '/customer/event/' + uid;
        window.location.href = url;
    }

    const updateUrlParam = (url, paramName, paramValue) => {
        const urlObject = new URL(url);
        urlObject.searchParams.set(paramName, paramValue);
        return urlObject.toString();
    }

    const goPage = (pageNo) => {
        document.getElementById("pageNo").value = pageNo;
        let returnUrl = updateUrlParam(window.location.href, 'pageNo', pageNo);
        location.href = returnUrl;
    }

    const changePerPage = (select) => {
        const pageListSize = select.value;
        let params = updateUrlParam(window.location.href, 'pageNo', 1);
        let returnUrl = updateUrlParam(params, 'pageListSize', pageListSize);
        location.href = returnUrl;
    }

    const loadView = (element) => {
        const uid = element.getAttribute('data-uid');
        const url = '/customer/event/' + uid;
        window.location.href = url;
    }

    function changePage(page) {
        const sdate = document.getElementById('startDate').value;
        const edate = document.getElementById('endDate').value;

        let queryParams = '?page=' + page + '&pageListSize=' + document.getElementById('pageListSize').value;

        if (sdate != null || sdate !== undefined) {
            queryParams += '&sdate=' + sdate;
        }

        if (edate != null || edate !== undefined) {
            queryParams += '&edate=' + edate;
        }

        location.href = '/customer/event' + queryParams;
    }
</script>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="/WEB-INF/views/common/inc/PageHeaderINC.jsp" %>
    <link href="/assets/css/modal.css" rel="stylesheet" type="text/css" />
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
                        <form class="form" id="noticePopupForm">
                            <input type="hidden" name="noticePopupLocation" value="${bannerLocation}">
                            <input type="hidden" id="pageNo" name="pageNo" value="<c:out value="1"/>">
                            <input type="hidden" id="pageSize" name="pageSize" value="${page.pageListSize}">
                            <div class="card-body">
                                <div class="row g-8">
                                    <div class="col-xxl-3 fv-row">
                                        <label class="fs-6 form-label fw-bolder text-dark">기간</label>
                                        <div class="row fv-row fv-plugins-icon-container">
                                            <div class="col-6">
                                                <div class="input-group">
                                                    <input
                                                            id="startRegDate"
                                                            name="startRegDate"
                                                            type="text"
                                                            class="form-control flatpickr-input"
                                                            placeholder="시작일"
                                                            autocomplete="off"
                                                            value="${search.startRegDate}"
                                                    />
                                                    <span class="input-group-text">
                                                    <i class="bi bi-calendar-check fs-1"></i>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="input-group">
                                                    <input
                                                            id="endRegDate"
                                                            name="endRegDate"
                                                            type="text"
                                                            class="form-control flatpickr-input"
                                                            placeholder="종료일"
                                                            autocomplete="off"
                                                            value="${search.endRegDate}"
                                                    />
                                                    <span class="input-group-text">
                                                    <i class="bi bi-calendar-check fs-1"></i>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-2">
                                        <label class="fs-6 form-label fw-bolder text-dark">노출여부</label>
                                        <select
                                                name="isOpen"
                                                class="form-select form-select-solid custom-select-box"
                                                data-control="select2"
                                                data-hide-search="true"
                                                data-placeholder="전체"
                                        >
                                            <option ${search.isOpen eq '' ? 'selected' : ''} value="전체">전체</option>
                                            <option ${search.isOpen eq 'Y' ? 'selected' : ''} value="Y">Y</option>
                                            <option ${search.isOpen eq 'N' ? 'selected' : ''} value="N">N</option>

                                        </select>
                                    </div>

                                    <div class="col-lg-7">
                                        <div class="row g-8">
                                            <div class="col-lg-12">
                                                <label class="fs-6 form-label fw-bolder text-dark">검색어</label>
                                                <input
                                                        type="text"
                                                        name="title"
                                                        class="form-control"
                                                        placeholder="검색어 입력"
                                                        maxlength="100"
                                                        value="<c:out value="${search.title}"/>"
                                                />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="card-footer">
                                <div class="d-flex justify-content-end" data-kt-customer-table-toolbar="base">
                                    <div>
                                        <a href="/${menu}/notice-popup" class="btn btn-secondary" style="color: #181c32; background-color : #fff3cd">
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
                                    <th class="w-70px">No.</th>
                                    <th class="w-900px">제목</th>
                                    <th class="min-w-70px">노출여부</th>
                                    <th class="min-w-70px">작성자</th>
                                    <th class="min-w-60px">작성일시</th>
                                    <th class="min-w-60px">미리보기</th>
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
                                                <c:choose>
                                                    <c:when test="${list.isOpen eq 'Y'}">
                                                        <span class="badge badge-warning text-dark">노출</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${((listNum - (page.pageListSize * (page.currentPage - 1))) - status.index)}
                                                    </c:otherwise>
                                                </c:choose>

                                            </td>
                                            <td class="text-dark fw-bold text-hover-warning hoverable"
                                                data-uid="${list.uid}"
                                                name="userType"
                                                onclick="openUserForm(this)">
                                                <c:out value="${list.adminTitle}"/>
                                            </td>
                                            <td class="text-hover-warning hoverable"
                                                data-uid="${list.uid}"
                                                name="name"
                                                onclick="openUserForm(this)">
                                                <c:out value="${list.isOpen}"/>
                                            </td>
                                            <td class="text-hover-warning hoverable"
                                                data-uid="${list.uid}"
                                                name="userId"
                                                onclick="openUserForm(this)">
                                                <c:out value="${list.adminName}"/>
                                            </td>
                                            <td class="text-hover-warning hoverable"
                                                data-uid="${list.uid}"
                                                name="userPhoneNumber"
                                                onclick="openUserForm(this)">
<%--                                                <c:out value="${list.modDate eq null ? list.regDate : list.modDate}"/>--%>
                                                <c:out value="${list.regDate}"/>
                                            </td>
                                            <td class="text-hover-warning hoverable">
                                                <span class="badge badge-secondary text-dark openPopup" data-uid="${list.uid}">선택</span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty list}">
                                    <tr>
                                        <td class="center" colspan="6">
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
                                    <a href="/${menu}/notice-popup-reg-form" class="btn btn-m" style=" color: #fff; background-color: #343a40;">
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

<%--<div class="base-modal modal popover main-popup" id="popupModal" aria-hidden="false">--%>

<%--</div>--%>
<div id="modalContainer">

</div>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script type="text/javascript">
    function initializeFlatpickr() {
        const today = new Date();
        const oneMonthBefore = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());

        const startDateInput = document.getElementById('startRegDate');
        const endDateInput = document.getElementById('endRegDate');
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

    function changePage(page) {
        document.getElementById('pageNo').value = page;
        document.getElementById('noticePopupForm').submit();
    }

    function openUserForm(element) {
        const uid = element.getAttribute('data-uid');
        const url = '/${menu}/notice-popup/'+uid + location.search
        window.location.href = url;
    }

    document.querySelectorAll('.openPopup').forEach(el => {
        el.addEventListener('click', async () => {
            const response = await fetch(`/popup/commonPopup?uid=\${el.dataset.uid}`, {
                method: 'GET',
            });

            const res = await response.text();
            document.getElementById('modalContainer').innerHTML  = res;
            const popupModal = new bootstrap.Modal(document.getElementById("popupModal"), {});
            popupModal.show()
        })
    })

    function fetchUserList() {
        document.getElementById('pageNo').value = 1;
        document.getElementById('pageSize').value = document.getElementById('perPage').value
        document.getElementById('noticePopupForm').submit();
    }
</script>

</body>
</html>

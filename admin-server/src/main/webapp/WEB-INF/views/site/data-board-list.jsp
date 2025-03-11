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
                        <form class="form" id="dataBoardForm">
                            <input type="hidden" id="categoryCode" name="categoryCode" value="${categoryCode}">
                            <input type="hidden" id="pageSize" name="pageSize" value="${page.pageListSize}">
                            <input type="hidden" id="pageNo" name="pageNo" value="<c:out value="1"/>">
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

                                    <c:if test="${menu eq 'reading-review' || menu eq 'reference-book'}">
                                        <div class="col-lg-2">
                                            <label class="fs-6 form-label fw-bolder text-dark">
                                                <c:if test="${menu eq 'reference-book'}">
                                                    과목
                                                </c:if>
                                                <c:if test="${menu eq 'reading-review'}">
                                                    구분
                                                </c:if>
                                            </label>
                                            <select
                                                    id="categoryIndex1"
                                                    name="categoryIndex1"
                                                    class="form-select form-select-solid custom-select-box"
                                                    data-control="select2"
                                                    data-hide-search="true"
                                                    data-placeholder="전체"
                                            >
                                                <option ${search.isOpen eq '' ? 'selected' : ''} value="전체">전체</option>
                                                <c:forEach items="${category1Depth}" var="depth1">
                                                    <option value="${depth1.categoryIndex}"  ${search.categoryIndex1 eq depth1.categoryIndex ? 'selected' : ''} >${depth1.categoryName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-lg-2">
                                            <label class="fs-6 form-label fw-bolder text-dark">자료구분</label>
                                            <select
                                                    id="categoryIndex2"
                                                    name="categoryIndex2"
                                                    class="form-select form-select-solid custom-select-box"
                                                    data-control="select2"
                                                    data-hide-search="true"
                                                    data-placeholder="전체"
                                                    ${empty category2Depth ? 'disabled' :''}
                                            >
                                                <option ${search.isOpen eq '' ? 'selected' : ''} value="전체">전체</option>
                                                <c:forEach items="${category2Depth}" var="depth2">
                                                    <option value="${depth2.categoryIndex}"  ${search.categoryIndex2 eq depth2.categoryIndex ? 'selected' : ''} >${depth2.categoryName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-lg-2">
                                            <label class="fs-6 form-label fw-bolder text-dark">노출여부</label>
                                            <select
                                                    name="isOpen"
                                                    class="form-select form-select-solid custom-select-box"
                                                    data-control="select2"
                                                    data-hide-search="true"
                                            >
                                                <option ${search.isOpen eq '' ? 'selected' : ''} value="전체">전체</option>
                                                <option ${search.isOpen eq 'Y' ? 'selected' : ''} value="Y">Y</option>
                                                <option ${search.isOpen eq 'N' ? 'selected' : ''} value="N">N</option>

                                            </select>
                                        </div>
                                        <div class="col-lg-3">
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
                                    </c:if>
                                    <c:if test="${menu eq 'arbol' || menu eq 'book-trigger'}">
                                        <div class="col-lg-2">
                                            <label class="fs-6 form-label fw-bolder text-dark">노출여부</label>
                                            <select
                                                    name="isOpen"
                                                    class="form-select form-select-solid custom-select-box"
                                                    data-control="select2"
                                                    data-hide-search="true"
                                            >
                                                <option ${search.isOpen eq '' ? 'selected' : ''} value="">전체</option>
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
                                    </c:if>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="d-flex justify-content-end" data-kt-customer-table-toolbar="base">
                                    <div>
                                        <a href="/${menu}/data-board" class="btn btn-secondary" style="color: #181c32; background-color : #fff3cd">
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
                                    <c:if test="${menu eq 'reading-review' || menu eq 'reference-book'}">
                                        <th class="min-w-140px">${menu eq 'reading-review' ? '구분' : '과목' }</th>
                                        <th class="min-w-140px">자료구분</th>
                                    </c:if>
                                    <th class="w-700px">자료명</th>
                                    <th class="min-w-60px">자료유형</th>
                                    <th class="min-w-60px">노출여부</th>
                                    <th class="min-w-60px">작성자</th>
                                    <th class="min-w-60px">작성일시</th>
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
                                                    <c:when test="${list.isTop eq 'Y'}">
                                                        <span class="badge badge-warning text-dark">노출</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${((listNum - (page.pageListSize * (page.currentPage - 1))) - status.index)}
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <c:if test="${menu eq 'reading-review' || menu eq 'reference-book'}">
                                                <td class="text-hover-warning hoverable"
                                                    data-uid="${list.uid}"
                                                    onclick="openUserForm(this)">
                                                    <c:out value="${list.category1Name}"/>
                                                </td>
                                                <td class="text-hover-warning hoverable"
                                                    data-uid="${list.uid}"
                                                    onclick="openUserForm(this)">
                                                    <c:out value="${list.category2Name}"/>
                                                </td>
                                            </c:if>
                                            <td class="text-dark fw-bold text-hover-warning hoverable"
                                                data-uid="${list.uid}"
                                                name="userType"
                                                onclick="openUserForm(this)">
                                                <c:out value="${list.title}"/>
                                            </td>
                                            <td class="text-hover-warning hoverable"
                                                data-uid="${list.uid}">
                                                <a target="_blank" href="/FileDownload?uid=${list.fileUid}"><c:out value="${list.fileExtension}"/></a>
                                            </td>
                                            <td class="text-hover-warning hoverable"
                                                data-uid="${list.uid}"
                                                name="userId"
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
                                                <c:out value="${list.modDate eq null ? list.regDate : list.modDate}"/>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty list}">
                                    <tr>
                                        <td class="center" colspan="3">
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
                                    <a href="/${menu}/data-board-reg-form" class="btn btn-m" style=" color: #fff; background-color: #343a40;">
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

    function openUserForm(element) {
        const uid = element.getAttribute('data-uid');
        const url = '/${menu}/data-board/'+uid + location.search
        window.location.href = url;
    }

    $('#categoryIndex1').on('select2:select', async function () {
        const category1DepthIndex = $('#categoryIndex1').val();
        if(category1DepthIndex === '전체') {
            $('#categoryIndex2').empty().trigger("change");
            document.getElementById('categoryIndex2').classList.remove('custom-select-box');
            document.getElementById('categoryIndex2').disabled = true;
            const defaultOption = new Option('전체', '전체', false, false);
        } else {
            let category2DepthData = await getCategoryList(3, category1DepthIndex);
            makeCategoryList(category2DepthData);
            document.getElementById('categoryIndex2').classList.add('custom-select-box');
            document.getElementById('categoryIndex2').disabled = false;
        }

    });

    const getCategoryList = async (depth, categoryIndex) => {
        const response = await fetch('/api/v1/reading-review/data-board-category-list', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                depth : depth,
                categoryCode : document.getElementById('categoryCode').value,
                parentCategoryIndex: categoryIndex
            })
        });

        const res = await response.json();
        return res.data.data;
    }

    const makeCategoryList = (data) => {
        $('#categoryIndex2').empty().trigger("change");
        const defaultOption = new Option('전체', '전체', false, false);
        $('#categoryIndex2').append(defaultOption).trigger('change');
        if(data) {
            data.forEach(category => {
                const newOption = new Option(category.categoryName, category.categoryIndex, false, false);
                $('#categoryIndex2').append(newOption).trigger('change');
            })
        }
    }
    function changePage(page) {
        document.getElementById('pageNo').value = page;
        document.getElementById('dataBoardForm').submit();
    }

    function fetchUserList() {
        document.getElementById('pageNo').value = 1;
        document.getElementById('pageSize').value = document.getElementById('perPage').value
        document.getElementById('dataBoardForm').submit();
    }
</script>

</body>
</html>

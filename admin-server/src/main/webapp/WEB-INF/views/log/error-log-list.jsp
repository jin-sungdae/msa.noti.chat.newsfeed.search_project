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
                                        <label class="fs-6 form-label fw-bolder text-dark">구분</label>
                                        <select
                                                id="location"
                                                name="location"
                                                class="form-select form-select-transparent"
                                                data-control="select2"
                                                data-hide-search="true"
                                                data-placeholder="전체"
                                        >
                                            <option></option>
                                            <option value='사용자' ${param.location eq '사용자' ? 'selected' : ''}>사용자</option>
                                            <option value='관리자' ${param.location eq '관리자' ? 'selected' : ''}>관리자</option>
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
                                        <a href="/log/error-log" class="btn btn-secondary" style="color: #181c32; background-color : #fff3cd">
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
                            <table class="table table-row-bordered gy-5" id="errorLogTable">
                                <!--begin::Table head-->
                                <thead>
                                <!--begin::Table row-->
                                <tr class="fw-semibold fs-6 text-muted w-sm-250px">
                                    <th class="min-w-25px">No.</th>
                                    <th class="min-w-60px">구분</th>
                                    <th class="min-w-125px">클래스 명</th>
                                    <th class="min-w-60px">SERVER IP</th>
                                    <th class="min-w-60px">CLIENT IP</th>
                                    <th class="min-w-70px">일자</th>
                                </tr>
                                <!--end::Table row-->
                                </thead>
                                <!--end::Table head-->
                                <!--begin::Table body-->
                                <tbody>
                                <c:if test="${not empty list}">
                                    <c:forEach items="${list}" var="list" varStatus="status">
                                        <tr class="data-row" data-uid="${list.errorLogIndex}" data-content="${list.errorMessage}">
                                            <td class="text-dark fw-bold">
                                                    ${((listNum - (page.pageListSize * (page.currentPage - 1))) - status.index)}
                                            </td>
                                            <td class="text-dark fw-bold text-hover-warning hoverable" data-uid="${list.errorLogIndex}">
                                                <c:choose>
                                                    <c:when test="${list.location eq 'ADMIN'}"><c:out value="${'관리자'}"/></c:when>
                                                    <c:otherwise><c:out value="${'사용자'}"/></c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="text-hover-warning hoverable title-cell" data-uid="${list.errorLogIndex}">
                                                <c:out value="${list.className}"/>
                                            </td>
                                            <td class="text-hover-warning hoverable" data-uid="${list.errorLogIndex}">
                                                <c:out value="${list.serverIp}"/>
                                            </td>
                                            <td class="text-hover-warning hoverable" data-uid="${list.errorLogIndex}">
                                                <c:out value="${list.clientIp}"/>
                                            </td>
                                            <td class="text-hover-warning hoverable" data-uid="${list.errorLogIndex}">
                                                <c:out value="${list.regDate}"/>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty list}">
                                    <tr>
                                        <td colspan="8" class="text-center text-dark fw-bold">
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
<script src="/assets/js/flatpickr/flatpickrInitial.js"></script>
<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {
        initializeFlatpickr(false);

        document.querySelectorAll('.text-hover-warning.hoverable').forEach(function(cell) {
            cell.addEventListener('click', function() {
                const currentRow = cell.parentElement;
                const content = currentRow.getAttribute('data-content');
                const existingContentRow = currentRow.nextElementSibling;

                if (existingContentRow && existingContentRow.classList.contains('content-row')) {
                    existingContentRow.remove();
                } else {
                    const contentRow = document.createElement('tr');
                    contentRow.classList.add('content-row');
                    const contentCell = document.createElement('td');
                    contentCell.setAttribute('colspan', '5');

                    // 스타일 적용을 위해 div 생성
                    const contentDiv = document.createElement('div');
                    contentDiv.classList.add('content-cell');
                    contentDiv.textContent = content;

                    // contentCell에 contentDiv 추가
                    contentCell.appendChild(contentDiv);
                    contentRow.appendChild(contentCell);
                    currentRow.parentNode.insertBefore(contentRow, currentRow.nextSibling);
                }
            });
        });
    })


    function fetchUserList() {
        const sdate = document.getElementById('sdate').value;
        const edate = document.getElementById('edate').value;
        const locationType = document.getElementById('location').value;
        const search = document.getElementById('search').value;
        let queryParams = '?perPage=' + document.getElementById('perPage').value;

        if (sdate != null || sdate !== undefined) {
            queryParams += '&sdate=' + sdate;
        }

        if (edate != null || edate !== undefined) {
            queryParams += '&edate=' + edate;
        }

        if (locationType != null || locationType !== undefined) {
            queryParams += '&location=' + locationType;
        }

        if (search != null || search !== undefined) {
            queryParams += '&search=' + search;
        }

        location.href = '/log/error-log' + queryParams;
    }

    function changePage(page) {
        const sdate = document.getElementById('sdate').value;
        const edate = document.getElementById('edate').value;
        const locationType = document.getElementById('location').value;
        const search = document.getElementById('search').value;

        let queryParams = '?page=' + page + '&perPage=' + document.getElementById('perPage').value;

        if (sdate != null || sdate !== undefined) {
            queryParams += '&sdate=' + sdate;
        }

        if (edate != null || edate !== undefined) {
            queryParams += '&edate=' + edate;
        }

        if (locationType != null || locationType !== undefined) {
            queryParams += '&location=' + locationType;
        }

        if (search != null || search !== undefined) {
            queryParams += '&search=' + search;
        }

        location.href = '/log/error-log' + queryParams;
    }

    function openUserForm(element) {
        const uid = element.getAttribute('data-uid');
        // const url = '/user/user-form?uid=' + uid;
        // window.location.href = url;
    }


</script>
<style>
    .content-cell {
        max-width: 100%; /* 원하는 최대 너비 설정 */
        overflow-wrap: break-word;
        white-space: pre-wrap;
        padding: 10px;
        border: 1px solid #ddd; /* 원하는 스타일로 변경 가능 */
        box-sizing: border-box; /* 패딩 포함 고정 너비 */
    }
</style>
</body>
</html>

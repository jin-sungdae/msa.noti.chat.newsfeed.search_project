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
                                <input type="hidden" id="pageNo" value="<c:out value="${pageNo}"/>">
                                <input type="hidden" id="school" value="<c:out value="${school}"/>">
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
                                            <div class="col-lg-6">
                                                <label class="fs-6 form-label fw-bolder text-dark">구분</label>
                                                <select
                                                        id="categoryIndex"
                                                        name="categoryIndex"
                                                        class="form-select form-select-transparent"
                                                        data-control="select2"
                                                        data-hide-search="true"
                                                        data-placeholder="전체"
                                                >
                                                    <option value="전체">전체</option>
                                                    <c:forEach items="${readerParticipationCategoryList}" var="list" varStatus="status">
                                                        <option value=${list.categoryIndex} <c:if test="${search.categoryIndex eq list.categoryIndex}">selected</c:if>><c:out value="${list.categoryName}"/></option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-lg-6">
                                                <label class="fs-6 form-label fw-bolder text-dark">노출여부</label>
                                                <select
                                                        id="isOpen"
                                                        name="isOpen"
                                                        class="form-select form-select-transparent"
                                                        data-control="select2"
                                                        data-hide-search="true"
                                                        data-placeholder="전체"
                                                >
                                                    <option value="전체">전체</option>
                                                    <option value='Y' ${search.isOpen eq 'Y' ? 'selected' : ''}>Y</option>
                                                    <option value='N' ${search.isOpen eq 'N' ? 'selected' : ''}>N</option>
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
                                        <a href="/reading-review/reader-participation/<c:out value="${school}"/>" class="btn btn-light" style="color: #181c32; background-color : #fff3cd">
                                            <i class="fas bi-arrow-repeat fs-2 me-2"></i>
                                            초기화
                                        </a>
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
                   <%@ include file="/WEB-INF/views/common/SelectPaging.jsp" %>
                        </div>

                        <div class="card-body pt-0 table-responsive">
                            <!--begin::Table-->
                            <table class="table table-row-bordered gy-5">
                                <!--begin::Table head-->
                                <thead>
                                <!--begin::Table row-->
                                <tr class="fw-semibold fs-6 text-muted">
                                    <th class="col-xxl-1" style="flex: 0 0 auto;width: 5%; !important;">No.</th>
                                    <th class="col-xxl-1">구분</th>
                                    <th class="col-xxl-4">제목</th>
                                    <th class="col-xxl-1">노출여부</th>
                                    <th class="col-xxl-1">참여/댓글</th>
                                    <th class="col-xxl-1">작성자</th>
                                    <th class="col-xxl-1">작성일시</th>
                                    <th class="col-xxl-1">조회수</th>
                                </tr>
                                <!--end::Table row-->
                                </thead>
                                <!--end::Table head-->
                                <!--begin::Table body-->
                                <tbody>
                                <c:if test="${not empty readerParticipationList}">
                                    <c:forEach items="${readerParticipationList}" var="list" varStatus="status">
                                        <tr>
                                            <td class="text-dark fw-bold">
                                                <c:choose>
                                                    <c:when test="${(list.isBoard eq 'N') and (list.isOpen eq 'Y')}">
                                                        <span class="badge badge-warning text-dark">공지</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${((listNum - (page.pageListSize * (page.currentPage - 1))) - status.index)}
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="text-dark fw-bold">
                                                <c:out value="${list.categoryName}"/>
                                            </td>
                                            <td class="text-dark text-hover-warning fw-bold hoverable goView"
                                                data-uid="${list.uid}">
                                                <c:out value="${list.title}"/>
                                            </td>
                                            <td class="text-dark fw-bold">
                                                <c:out value="${list.isOpen}"/>
                                            </td>
                                            <td class="text-dark fw-bold">
                                                <c:out value="${list.voteReplyCount}"/>
                                            </td>
                                            <td class="text-darkfw-bold">
                                                <c:out value="${list.isBoard eq 'Y'? list.userName : list.partiBoard}"/>
                                            </td>
                                            <td class="text-dark fw-bold">
                                                <c:out value="${list.modDate}"/>
                                            </td>
                                            <td class="text-dark fw-bold">
                                                <c:out value="${list.viewCount}"/>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty readerParticipationList}">
                                    <tr>
                                        <td class="center" colspan="8">
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
                                    <a href="/reading-review/reader-participation/<c:out value="${school}"/>-reg-form" class="btn btn-m btn-dark">
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
<script src="/assets/js/flatpickr/flatpickrInitial.js"></script>
<script type="text/javascript">
    let pageNo = document.getElementById('pageNo').value;
    let startDate = document.getElementById('startDate').value;
    let endDate = document.getElementById('endDate').value;
    let categoryIndex = document.getElementById('categoryIndex').value;
    let isOpen = document.getElementById('isOpen').value;
    let searchValue = document.getElementById('searchValue').value;

    document.addEventListener('DOMContentLoaded', function () {
        initializeFlatpickr(false);

        document.getElementById('searchBtn').addEventListener('click', () => search());
        const search = () => {
            document.getElementById('customInquiryForm').submit();
        }

        let goViews = document.querySelectorAll('.goView');
        goViews.forEach(function(el){
            el.addEventListener('click', function(){
                let school = document.getElementById('school').value;
                let uid = el.dataset.uid;
                location.href = '/reading-review/reader-participation/'+ school + '/' + uid + '?pageNo=' + pageNo + '&startDate=' + startDate + '&endDate=' + endDate + '&categoryIndex=' + categoryIndex + '&isOpen=' + isOpen + '&searchValue=' + searchValue;
            })
        })
    })

    function fetchUserList() {
        let perPage = document.getElementById('perPage').value;
        let params = updateUrlParam(window.location.href, 'pageNo', 1);
        let returnUrl = updateUrlParam(params, 'perPage', perPage);
        location.href = returnUrl;
    }

    const updateUrlParam = (url, paramName, paramValue) => {
        const urlObject = new URL(url);
        urlObject.searchParams.set(paramName, paramValue);
        return urlObject.toString();
    }

    const changePage = (pageNo) => {
        let returnUrl = updateUrlParam(window.location.href, 'pageNo', pageNo);
        location.href = returnUrl;
    }
</script>

</body>
</html>
<style>

</style>

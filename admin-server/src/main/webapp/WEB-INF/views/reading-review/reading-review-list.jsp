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
                        <form name="searchForm" method="get" class="form">
                            <div class="card-body">
                                <input type="hidden" name="pageNo" value="<c:out value="${pageNo}"/>">
                                <input type="hidden" name="pageListSize" value="<c:out value="${pageListSize}"/>">
                                <input type="hidden" name="uid" value="">
                                <div class="row g-8">
                                    <div class="col-lg-4 fv-row">
                                        <label class="fs-6 form-label fw-bolder text-dark" for="startDate">기간</label>
                                        <div class="row fv-row fv-plugins-icon-container">
                                            <div class="col">
                                                <div class="input-group">
                                                    <input type="text" id="startDate" name="startDate" class="form-control flatpickr-input" placeholder="시작일" autocomplete="off" value="<c:out value="${search.startDate}"/>"/>
                                                    <span class="input-group-text">
                                                    <i class="bi bi-calendar-check fs-1"></i>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="col">
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
                                    <div class="col-lg-5">
                                        <div class="row">
                                            <div class="col-5">
                                                <label class="fs-6 form-label fw-bolder text-dark" for="readingReviewType">구분</label>
                                                <select id="readingReviewType" name="readingReviewType" class="form-select form-select-transparent"
                                                        data-control="select2"
                                                        data-hide-search="true"
                                                        data-placeholder="전체"
                                                        data-allow-clear="false">
                                                    <option>전체</option>
                                                    <c:forEach items="${readingReviewTypeList}" var="list" varStatus="status">
                                                        <option value=${list} <c:if test="${search.readingReviewType eq list}">selected</c:if>><c:out value="${list.value}"/></option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col">
                                                <label class="fs-6 form-label fw-bolder text-dark" for="isOpen">노출여부</label>
                                                <select
                                                        id="isOpen"
                                                        name="isOpen"
                                                        class="form-select form-select-transparent"
                                                        data-control="select2"
                                                        data-hide-search="true"
                                                >
                                                    <option>전체</option>
                                                    <option value='Y' ${search.isOpen eq 'Y' ? 'selected' : ''}>Y</option>
                                                    <option value='N' ${search.isOpen eq 'N' ? 'selected' : ''}>N</option>
                                                </select>
                                            </div>
                                            <div class="col">
                                                <label class="fs-6 form-label fw-bolder text-dark" for="isIntro">인트로 노출여부</label>
                                                <select
                                                        id="isIntro"
                                                        name="isIntro"
                                                        class="form-select form-select-transparent"
                                                        data-control="select2"
                                                        data-hide-search="true"
                                                >
                                                    <option>전체</option>
                                                    <option value='Y' ${search.isIntro eq 'Y' ? 'selected' : ''}>Y</option>
                                                    <option value='N' ${search.isIntro eq 'N' ? 'selected' : ''}>N</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="row g-8">
                                            <div class="col-lg-10">
                                                <label class="fs-6 form-label fw-bolder text-dark" for="searchWord">검색어</label>
                                                <input
                                                        type="text"
                                                        id="searchWord"
                                                        name="searchWord"
                                                        class="form-control"
                                                        placeholder="검색어 입력"
                                                        maxlength="100"
                                                        value="<c:out value="${search.searchWord}"/>"
                                                />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="card-footer">

                                <div class="d-flex justify-content-end" data-kt-customer-table-toolbar="base">
                                    <div>
                                        <a href="/reading-review/reading-review" class="btn btn-light" style="color: #181c32; background-color : #fff3cd">
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
                            <jsp:include page="/WEB-INF/views/common/inc/paging-option-inc.jsp" flush="true" >
                                <jsp:param name="totalCount" value="${ totalCount}"/>
                                <jsp:param name="pageListSize" value="${ pageListSize}"/>
                                <jsp:param name="function" value="global.changePageListSize"/>
                            </jsp:include>
                        </div>

                        <div class="card-body pt-0 table-responsive">
                            <!--begin::Table-->
                            <table class="table table-row-bordered gy-5 table-hover">
                                <!--begin::Table head-->
                                <thead>
                                <!--begin::Table row-->
                                <tr class="fw-semibold fs-6 text-muted text-md-center">
                                    <th class="min-w-70px mw-sm-10px w-sm-70px">No.</th>
                                    <th class="min-w-120px">구분</th>
                                    <th class="min-w-70px">발행월호</th>
                                    <th class="min-w-70px">썸네일</th>
                                    <th class="min-w-80px">노출여부</th>
                                    <th class="min-w-80px">인트로</th>
                                    <th class="min-w-125px w-sm-125px">작성자</th>
                                    <th class="min-w-150px w-sm-175px">작성일시</th>
                                </tr>
                                <!--end::Table row-->
                                </thead>
                                <!--end::Table head-->
                                <!--begin::Table body-->
                                <tbody>
                                <c:if test="${not empty readingReviewList}">
                                    <c:forEach items="${readingReviewList}" var="item" varStatus="status">
                                        <tr data-nt-action="goView"  data-uid="${item.uid}" class="text-md-center hoverable">
                                            <td class="text-dark fw-bold text-md-center">
                                                ${((totalCount - (page.pageListSize * (page.currentPage - 1))) - status.index)}
                                            </td>
                                            <td class="text-dark fw-bold">
                                                <c:out value="${item.readingReviewType.value}"/>
                                            </td>
                                            <td class="text-dark fw-bold text-md-center">
                                                <c:out value="${item.year}"/>년 <c:out value="${item.month}"/>월
                                            </td>
                                            <td class="text-dark fw-bold text-md-center">
                                                <c:if test="${not empty item.thumbnail}">
                                                    <img src="${item.thumbnail}" style="width: 54px; height: 70px; margin: 0px"/>
                                                </c:if>
                                            </td>
                                            <td class="text-dark fw-bold text-md-center">
                                                <c:out value="${item.isOpen}"/>
                                            </td>
                                            <td class="text-dark fw-bold text-md-center">
                                                <c:out value="${item.isIntro}"/>
                                            </td>
                                            <td class="text-dark fw-bold text-md-center">
                                                <c:out value="${item.adminName}"/>
                                            </td>
                                            <td class="text-dark fw-bold text-md-center">
                                                <c:out value="${item.regDate}"/>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty readingReviewList}">
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
                                    <jsp:include page="/WEB-INF/views/common/inc/paging-inc.jsp" flush="true" >
                                        <jsp:param name="currentPage" value="${ page.currentPage}"/>
                                        <jsp:param name="startOfPageBlock" value="${ page.startOfPageBlock}"/>
                                        <jsp:param name="endOfPageBlock" value="${ page.endOfPageBlock}"/>
                                        <jsp:param name="totalPage" value="${ page.totalPage}"/>
                                        <jsp:param name="totalCount" value="${ page.totalCount}"/>
                                        <jsp:param name="listFunction" value="global.changePage"/>
                                    </jsp:include>

                                </div>
                                <div>
                                    <a href="/reading-review/reading-review-reg-form" class="btn btn-m btn-dark">
                                        등록
                                    </a>
                                </div>
                            </div>
                            <!--end::Table-->
                        </div>
                    </div>
                </div>ㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈ
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

        let goViews = document.querySelectorAll('[data-nt-action=goView]');
        goViews.forEach(function(el) {
            el.addEventListener('click', function() {
                let uid = el.dataset.uid;
                location.href = '/reading-review/reading-review/' + uid + location.search;
            })
        })
    })
</script>

</body>
</html>
<style>

</style>

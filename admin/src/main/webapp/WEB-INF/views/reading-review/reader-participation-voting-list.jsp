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
<div class="d-flex flex-column flex-root">
    <div class="page d-flex flex-row flex-column-fluid">
        <%@ include file="/WEB-INF/views/common/inc/BodyAsideINC.jsp" %>
        <div class="wrapper d-flex flex-column flex-row-fluid">
            <%@ include file="/WEB-INF/views/common/inc/BodyHeaderINC.jsp" %>
            <div class="content d-flex flex-column flex-column-fluid">
                <c:set value="샘플 등록/수정" var="menuTitle"/>
                <%@ include file="/WEB-INF/views/common/inc/ToolbarINC.jsp" %>
                <div class="post d-flex flex-column-fluid">
                    <div class="container-fluid">
                        <!-- 본문 내용 START -->
                        <div class="card mb-5 mb-xl-10">
                            <input type="hidden" id="school" value="<c:out value="${school}"/>">
                            <input type="hidden" id="uid" value="<c:out value="${uid}"/>">
                            <div class="card-header card-header-stretch border-0 pt-5">
                                <h3 class="card-title text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                    <c:if test="${school eq 'first-step'}">첫걸음</c:if>
                                    <c:if test="${school eq 'elementary'}">초등</c:if>
                                    <c:if test="${school eq 'middle'}">중학</c:if>
                                    <c:if test="${school eq 'high'}">고교</c:if>
                                </h3>
                                <c:if test="${readerParticipationVotingList != null}">
                                    <div class="card-toolbar">
                                        <ul class="nav nav-tabs nav-line-tabs nav-stretch fs-6 border-0">
                                            <li class="nav-item">
                                                <a class="nav-link fw-bolder text-dark detailTab" data-bs-toggle="tab" data-page-type="detail" style="cursor: pointer">상세정보</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link fw-bolder detailTab text-dark active" data-bs-toggle="tab" data-page-type="participation" style="cursor: pointer">참여현황</a>
                                            </li>
                                        </ul>
                                    </div>
                                </c:if>
                            </div>
                            <div class="card-body">
                                <div class="card-body pt-0 table-responsive">
                                    <!--begin::Table-->
                                    <table class="table table-row-bordered gy-5">
                                        <!--begin::Table head-->
                                        <thead>
                                        <!--begin::Table row-->
                                        <tr class="fw-semibold fs-6 text-muted">
                                            <th class="min-w-10px">No.</th>
                                            <th class="min-w-30px">참여자</th>
                                            <th class="min-w-60px">참여일시</th>
                                            <th class="min-w-100px">투표한 기사</th>
                                            <th class="min-w-100px">기사 선정 이유</th>
                                        </tr>
                                        <!--end::Table row-->
                                        </thead>
                                        <!--end::Table head-->
                                        <!--begin::Table body-->
                                        <tbody>
                                        <c:if test="${not empty readerParticipationVotingList}">
                                            <c:forEach items="${readerParticipationVotingList}" var="list" varStatus="status">
                                                <tr>
                                                    <td class="text-dark fw-bold">
                                                        ${((listNum - (page.pageListSize * (page.currentPage - 1))) - status.index)}
                                                    </td>
                                                    <td class="text-dark fw-bold">
                                                        <c:out value="${list.userName}"/><br>
                                                        (<c:out value="${list.userId}"/>)
                                                    </td>
                                                    <td class="text-dark fw-bold">
                                                        <c:out value="${list.regDate}"/>
                                                    </td>
                                                    <td class="text-dark fw-bold">
                                                        <c:forEach items="${list.voteDetailList}" var="detailList">
                                                            <c:out value="${detailList.voteOption}"/><br>
                                                        </c:forEach>
                                                    </td>
                                                    <td class="text-dark fw-bold">
                                                        <c:out value="${list.reason}"/>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${empty readerParticipationVotingList}">
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
                                            <c:if test="${listNum > 10}">
                                                <%@ include file="/WEB-INF/views/common/inc/Paging.jsp" %>
                                            </c:if>
                                        </div>
                                        <div>
                                            <a href="/reading-review/reader-participation/<c:out value="${school}"/>" class="btn btn-m btn-dark">
                                                목록
                                            </a>
                                        </div>
                                    </div>
                                    <!--end::Table-->
                                </div>
                            </div>
                            <!-- 본문 내용 END -->
                        </div>
                    </div>
                </div>
            </div>
            <%@ include file="/WEB-INF/views/common/inc/FooterINC.jsp" %>
        </div>
    </div>
</div>
</body>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script type="text/javascript">
    let detailTabs = document.getElementsByClassName('detailTab');
    let school = document.getElementById('school').value;
    let uid = document.getElementById('uid').value;
    detailTabs.forEach(function (eachTab){
        eachTab.addEventListener('click', function(){
            let pageType = eachTab.dataset.pageType;
            let url = '';
            if(pageType == 'detail') {
                url = '/reading-review/reader-participation/' + school + '/' + uid;
            }else {
                url = '/reading-review/reader-participation/' + school + '/' + uid + '/voting';
            }
            location.href = url;
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
</script>
</html>
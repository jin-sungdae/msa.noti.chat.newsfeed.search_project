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
                        <form class="form" id="dashboardForm">
                            <input type="hidden" value="${dashboard.inquiryStatus.textbookInquiryStatus.completedInquiries}" id="textbookCompletedInquires"/>
                            <input type="hidden" value="${dashboard.inquiryStatus.textbookInquiryStatus.waitingForAnswer}" id="textbookWaitingForAnswer"/>
                            <input type="hidden" value="${dashboard.inquiryStatus.referenceBookInquiryStatus.completedInquiries}" id="referenceBookCompletedInquires"/>
                            <input type="hidden" value="${dashboard.inquiryStatus.referenceBookInquiryStatus.waitingForAnswer}" id="referenceBookWaitingForAnswer"/>
                            <input type="hidden" value="${dashboard.inquiryStatus.bookTriggerInquiryStatus.completedInquiries}" id="bookTriggerCompletedInquires"/>
                            <input type="hidden" value="${dashboard.inquiryStatus.bookTriggerInquiryStatus.waitingForAnswer}" id="bookTriggerWaitingForAnswer"/>
                            <input type="hidden" value="${dashboard.inquiryStatus.arbolInquiryStatus.completedInquiries}" id="arbolCompletedInquires"/>
                            <input type="hidden" value="${dashboard.inquiryStatus.arbolInquiryStatus.waitingForAnswer}" id="arbolWaitingForAnswer"/>
                            <input type="hidden" value="${dashboard.inquiryStatus.websiteInquiryStatus.completedInquiries}" id="webSiteCompletedInquires"/>
                            <input type="hidden" value="${dashboard.inquiryStatus.websiteInquiryStatus.waitingForAnswer}" id="webSiteWaitingForAnswer"/>
                            <div class="card-body">
                                <div class="row g-8">
                                    <div class="col-xxl-5 fv-row">
                                        <label class="fs-6 form-label fw-bolder text-dark">기간</label>
                                        <div class="row fv-row fv-plugins-icon-container">
                                            <input type="hidden" id="inquiryKind" value="<c:out value="${kind}"/>">
                                            <div class="col-5">
                                                <div class="input-group">
                                                    <input
                                                            id="startDate"
                                                            name="startDate"
                                                            type="text"
                                                            class="form-control flatpickr-input"
                                                            placeholder="시작일"
                                                            autocomplete="off"
                                                            value="<c:out value="${param.startDate}"/>"
                                                    />
                                                    <span class="input-group-text" >
                                                    <i class="bi bi-calendar-check fs-1"></i>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="col-5">
                                                <div class="input-group">
                                                    <input
                                                            id="endDate"
                                                            name="endDate"
                                                            type="text"
                                                            class="form-control flatpickr-input"
                                                            placeholder="종료일"
                                                            autocomplete="off"
                                                            value="<c:out value="${param.endDate}"/>"
                                                    />
                                                    <span class="input-group-text" id="basic-addon3">
                                                    <i class="bi bi-calendar-check fs-1"></i>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="col-2">
                                                <div class="d-flex justify-content-end" data-kt-customer-table-toolbar="base">
                                                    <div>
                                                        <button type="submit" class="btn btn-m btn-warning" id="searchBtn" style="background-color: #ffcd39; color: #181C32">
                                                            검색
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="row g-5 g-xl-8 table-responsive">
                        <div class="col-xl-2">
                            <div class="card bg-warning hoverable card-xl-stretch mb-xl-8">
                                <!--begin::Body-->
                                <div class="card-body">
                                    <div class="text-black fw-bolder d-flex align-items-center justify-content-center fs-2 mb-2 mt-5">
                                        회원가입 현황
                                    </div>

                                    <div class="text-black fw-bolder d-flex align-items-center justify-content-center fs-2 mb-2 mt-5">
                                        <c:out value="${dashboard.memberStatus.total}"/>
                                    </div>
                                    <hr style="border: 1px solid black;">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="text-black d-flex align-items-center justify-content-center fw-bold fs-5 mb-2 mt-5 col-lg-12">
                                                Day
                                            </div>
                                            <div class="fw-semibold d-flex align-items-center justify-content-center text-black">
                                                <c:out value="${dashboard.memberStatus.day}"/>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="text-black d-flex align-items-center justify-content-center fw-bold fs-5 mb-2 mt-5 col-lg-12">
                                                Week
                                            </div>
                                            <div class="fw-semibold d-flex align-items-center justify-content-center text-black">
                                                <c:out value="${dashboard.memberStatus.week}"/>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="text-black d-flex align-items-center justify-content-center fw-bold fs-5 mb-2 mt-5 col-lg-12">
                                                Month
                                            </div>
                                            <div class="fw-semibold d-flex align-items-center justify-content-center text-black">
                                                <c:out value="${dashboard.memberStatus.month}"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--end::Body-->
                            </div>
                        </div>
                        <div class="col-xl-2">
                            <!--begin::Statistics Widget 5-->
                            <a href="#" class="card bg-warning hoverable card-xl-stretch mb-xl-8">
                                <!--begin::Body-->
                                <div class="card-body">
                                    <div class="text-black fw-bolder d-flex align-items-center justify-content-center fs-2 mb-2 mt-5">
                                        로그인 현황
                                    </div>

                                    <div class="text-black fw-bolder d-flex align-items-center justify-content-center fs-2 mb-2 mt-5">
                                        <c:out value="${dashboard.loginStatus.total}"/>
                                    </div>
                                    <hr style="border: 1px solid black;">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="text-black d-flex align-items-center justify-content-center fw-bold fs-5 mb-2 mt-5 col-lg-12">
                                                Day
                                            </div>
                                            <div class="fw-semibold d-flex align-items-center justify-content-center text-black">
                                                <c:out value="${dashboard.loginStatus.day}"/>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="text-black d-flex align-items-center justify-content-center fw-bold fs-5 mb-2 mt-5 col-lg-12">
                                                Week
                                            </div>
                                            <div class="fw-semibold d-flex align-items-center justify-content-center text-black">
                                                <c:out value="${dashboard.loginStatus.week}"/>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="text-black d-flex align-items-center justify-content-center fw-bold fs-5 mb-2 mt-5 col-lg-12">
                                                Month
                                            </div>
                                            <div class="fw-semibold d-flex align-items-center justify-content-center text-black">
                                                <c:out value="${dashboard.loginStatus.month}"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--end::Body-->
                            </a>
                            <!--end::Statistics Widget 5-->    </div>
                        <div class="col-xl-2">
                            <a href="#" class="card bg-warning hoverable card-xl-stretch mb-xl-8">
                                <!--begin::Body-->
                                <div class="card-body">
                                    <div class="text-black fw-bolder d-flex align-items-center justify-content-center fs-2 mb-2 mt-5">
                                        제휴문의 현황
                                    </div>

                                    <div class="text-black fw-bolder d-flex align-items-center justify-content-center fs-2 mb-2 mt-5">
                                        <c:out value="${dashboard.productInquiryStatus.total}"/>
                                    </div>
                                    <hr style="border: 1px solid black;">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="text-black d-flex align-items-center justify-content-center fw-bold fs-5 mb-2 mt-5 col-lg-12">
                                                Day
                                            </div>
                                            <div class="fw-semibold d-flex align-items-center justify-content-center text-black">
                                                <c:out value="${dashboard.productInquiryStatus.day}"/>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="text-black d-flex align-items-center justify-content-center fw-bold fs-5 mb-2 mt-5 col-lg-12">
                                                Week
                                            </div>
                                            <div class="fw-semibold d-flex align-items-center justify-content-center text-black">
                                                <c:out value="${dashboard.productInquiryStatus.week}"/>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="text-black d-flex align-items-center justify-content-center fw-bold fs-5 mb-2 mt-5 col-lg-12">
                                                Month
                                            </div>
                                            <div class="fw-semibold d-flex align-items-center justify-content-center text-black">
                                                <c:out value="${dashboard.productInquiryStatus.month}"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--end::Body-->
                            </a>
                        </div>
                        <div class="col-xl-6">
                            <a href="#" class="card bg-warning hoverable card-xl-stretch mb-xl-8">
                                <!--begin::Body-->
                                <div class="card-body">


                                    <div class="text-black fw-bold fs-2 mb-2 mt-5 d-flex justify-content-between">
                                        <span class="fw-bolder">교사인증 현황</span>
                                        <!-- 승인요청과 그 갯수를 표현하는 새로운 요소 추가 -->
                                        <span class="fw-semibold text-black ml-3">승인요청: <span id="approvalCount"><c:out value="${dashboard.teacherCertificationStatus.totalRequests}"/> </span></span>
                                    </div>

                                    <div class="text-black fw-bolder d-flex align-items-center justify-content-center fs-2 mb-2 mt-5" style="visibility: hidden">
                                        0
                                    </div>
                                    <hr style="border: 1px solid black;">
                                    <div class="row">
                                        <div class="col">
                                            <div class="text-black fw-bold d-flex align-items-center justify-content-center fs-2 mb-2 mt-5">
                                                대기
                                            </div>
                                            <div class="fw-semibold d-flex align-items-center justify-content-center text-black">
                                                <c:out value="${dashboard.teacherCertificationStatus.pending}"/>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="text-black fw-bold d-flex align-items-center justify-content-center fs-2 mb-2 mt-5">
                                                검토중
                                            </div>
                                            <div class="fw-semibold d-flex align-items-center justify-content-center text-black">
                                                <c:out value="${dashboard.teacherCertificationStatus.underReview}"/>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="text-black fw-bold d-flex align-items-center justify-content-center fs-2 mb-2 mt-5">
                                                완료
                                            </div>
                                            <div class="fw-semibold d-flex align-items-center justify-content-center text-black">
                                                <c:out value="${dashboard.teacherCertificationStatus.completed}"/>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="text-black fw-bold d-flex align-items-center justify-content-center fs-2 mb-2 mt-5">
                                                반려
                                            </div>
                                            <div class="fw-semibold d-flex align-items-center justify-content-center text-black">
                                                <c:out value="${dashboard.teacherCertificationStatus.rejected}"/>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </a>
                        </div>
                    </div>
                    <!--begin::Row-->
                    <div class="row g-5 g-xl-8">
                        <div class="col-xl-6">
                            <div class="card card-xl-stretch mb-5 mb-xl-8">
                                <!--begin::Header-->
                                <div class="card-header border-0 pt-5">
                                    <h3 class="card-title align-items-start flex-column">
                                        <a href="/customer/inquiry/textbook" class="card-label fw-bold fs-3 mb-1">문의 현황</a>
                                    </h3>


                                    <!--begin::Toolbar-->
                                    <div class="card-toolbar" data-kt-buttons="true" data-kt-initialized="1">
                                        <span style="margin-left: 20px;"><strong>전체문의:</strong> <c:out value="${dashboard.inquiryStatus.totalInquiries}"/> </span>
                                        <span style="margin-left: 20px;"><strong>답변완료:</strong> <c:out value="${dashboard.inquiryStatus.answered}"/> </span>
                                        <span style="margin-left: 20px;"><strong>답변대기:</strong> <c:out value="${dashboard.inquiryStatus.waitingForAnswer}"/> </span>
                                    </div>
                                    <!--end::Toolbar-->
                                </div>
                                <!--end::Header-->

                                <!--begin::Body-->
                                <div class="card card-bordered">
                                    <div class="card-body">
                                        <canvas id="kt_amcharts_1" style="height: 350px; min-height: 365px"></canvas>
                                    </div>
                                </div>
                                <!--end::Body-->
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <!--begin::Charts Widget 2-->
                            <div class="card card-xl-stretch mb-5 mb-xl-8">
                                <!--begin::Header-->
                                <div class="card-header border-0 pt-5">
                                    <h3 class="card-title align-items-start flex-column">
                                        <a href="reference-book/sample-request" class="card-label fw-bold fs-3 mb-1">견본신청 현황</a>
                                    </h3>

                                </div>
                                <!--end::Header-->

                                <!--begin::Body-->
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-xl-3">
                                            <a  class="card card-selectable bg-warning hoverable card-xl-stretch mb-xl-8 border border-secondary">
                                                <!--begin::Body-->
                                                <div class="card-body">
                                                    <div class="text-black fw-bold fs-2 mb-2 mt-5">
                                                        신청대기
                                                    </div>

                                                    <div class="fw-semibold text-black">
                                                        <c:out value="${dashboard.sampleApplicationStatus.pendingTotal}"/>
                                                    </div>
                                                </div>
                                                <!--end::Body-->
                                            </a>
                                        </div>
                                        <div class="col-xl-3">
                                            <!--begin::Statistics Widget 5-->
                                            <a  class="card card-selectable bg-white hoverable card-xl-stretch mb-xl-8 border border-secondary">
                                                <!--begin::Body-->
                                                <div class="card-body">
                                                    <div class="text-black fw-bold fs-2 mb-2 mt-5">
                                                        발송
                                                    </div>

                                                    <div class="fw-semibold text-black">
                                                        <c:out value="${dashboard.sampleApplicationStatus.sentTotal}"/>
                                                    </div>
                                                </div>
                                                <!--end::Body-->
                                            </a>
                                            <!--end::Statistics Widget 5-->
                                        </div>
                                        <div class="col-xl-3">
                                            <a  class="card card-selectable bg-white hoverable card-xl-stretch mb-xl-8 border border-secondary">
                                                <!--begin::Body-->
                                                <div class="card-body">
                                                    <div class="text-black fw-bold fs-2 mb-2 mt-5">
                                                        취소
                                                    </div>

                                                    <div class="fw-semibold text-black">
                                                        <c:out value="${dashboard.sampleApplicationStatus.cancelledTotal}"/>
                                                    </div>
                                                </div>
                                                <!--end::Body-->
                                            </a>
                                        </div>
                                        <div class="col-xl-3">
                                            <a  class="card card-selectable bg-white hoverable card-xl-stretch mb-xl-8 border border-secondary">
                                                <!--begin::Body-->
                                                <div class="card-body">
                                                    <div class="text-black fw-bold fs-2 mb-2 mt-5">
                                                        취소요청
                                                    </div>

                                                    <div class="fw-semibold text-black">
                                                        <c:out value="${dashboard.sampleApplicationStatus.cancellationRequestedTotal}"/>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    <!--begin::Chart-->
                                    <div id="list">

                                    </div>

                                    <!--end::Chart-->
                                </div>
                                <!--end::Body-->
                            </div>
                            <!--end::Charts Widget 2-->
                        </div>
                    </div>

                    <div class="card mb-7">
                        <div class="card-header border-0 pt-5">
                            <a class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark" href="/reference-book/inquiry?startDate=&endDate=&inquiryKind=REFERENCE-BOOK&inquiryCategory=전체&school=전체&subject=전체&isAnswer=전체&searchValue=">
                                참고서 문의 현황
                            </a>
                        </div>
                        <div class="card-body">
                            <div class="container">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover custom-table">
                                        <thead>
                                        <tr>
                                            <th class="fw-bolder text-dark" colspan="2">구분</th>
                                            <th class="fw-bolder text-dark">국어</th>
                                            <th class="fw-bolder text-dark">영어</th>
                                            <th class="fw-bolder text-dark">수학</th>
                                            <th class="fw-bolder text-dark">과학</th>
                                            <th class="fw-bolder text-dark">사회</th>
                                            <th class="fw-bolder text-dark">역사</th>
                                            <th class="fw-bolder text-dark">도덕</th>
                                            <th class="fw-bolder text-dark">기술가정</th>
                                            <th class="fw-bolder text-dark">체육</th>
                                            <th class="fw-bolder text-dark">음악</th>
                                            <th class="fw-bolder text-dark">미술</th>
                                            <th class="fw-bolder text-dark">한문</th>
                                            <th class="fw-bolder text-dark">진로</th>
                                            <th class="fw-bolder text-dark">연극</th>
                                            <th class="fw-bolder text-dark">중국어</th>
                                            <th class="fw-bolder text-dark">합계</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="category" items="${fn:split('내용문의,오류신고,교재서평', ',')}">
                                            <tr>
                                                <td rowspan="2">${category}</td>
                                                <td class="d-flex align-items-center">전체문의</td>
                                                <c:set var="totalSum" value="0" />
                                                <c:forEach var="subject" items="${fn:split('국어,영어,수학,과학,사회,역사,도덕,기술가정,체육,음악,미술,한문,진로,연극,중국어', ',')}">
                                                    <c:set var="inquiries" value="0" />
                                                    <c:forEach var="item" items="${dashboard.referenceBookInquiryStatusDto}">
                                                        <c:if test="${item.subject == subject && item.inquiryCategory == category}">
                                                            <c:set var="inquiries" value="${item.totalInquiries}" />
                                                        </c:if>
                                                    </c:forEach>
                                                    <td>${inquiries}</td>
                                                    <c:set var="totalSum" value="${totalSum + inquiries}" />
                                                </c:forEach>
                                                <td>${totalSum}</td>
                                            </tr>
                                            <tr>
                                                <td class="d-flex align-items-end" style="margin-left: 10px">답변대기</td>
                                                <c:set var="waitingSum" value="0" />
                                                <c:forEach var="subject" items="${fn:split('국어,영어,수학,과학,사회,역사,도덕,기술가정,체육,음악,미술,한문,진로,연극,중국어', ',')}">
                                                    <c:set var="waiting" value="0" />
                                                    <c:forEach var="item" items="${dashboard.referenceBookInquiryStatusDto}">
                                                        <c:if test="${item.subject == subject && item.inquiryCategory == category}">
                                                            <c:set var="waiting" value="${item.totalWaitingForAnswer}" />
                                                        </c:if>
                                                    </c:forEach>
                                                    <td class="${waiting > 0 ? 'red-text' : ''}">${waiting}</td>
                                                    <c:set var="waitingSum" value="${waitingSum + waiting}" />
                                                </c:forEach>
                                                <td class="${waitingSum > 0 ? 'red-text' : ''}">${waitingSum}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="card mb-7">
                        <div class="card-header border-0 pt-5">
                            <a class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark" href="/reference-book/inquiry?startDate=&endDate=&inquiryKind=REFERENCE-BOOK-TEACHER&inquiryCategory=전체&subject=전체&isAnswer=전체&searchValue=">
                                학원선생님 문의 현황
                            </a>
                        </div>
                        <div class="card-body">
                            <div class="container">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover custom-table">
                                        <thead>
                                        <tr class="fw-bold fs-6 text-dark-800">
                                            <th class="fw-bolder text-dark" colspan="2">구분</th>
                                            <th class="fw-bolder text-dark">국어</th>
                                            <th class="fw-bolder text-dark">영어</th>
                                            <th class="fw-bolder text-dark">수학</th>
                                            <th class="fw-bolder text-dark">과학</th>
                                            <th class="fw-bolder text-dark">사회</th>
                                            <th class="fw-bolder text-dark">역사</th>
                                            <th class="fw-bolder text-dark">합계</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="category" items="${fn:split('질문답변,건의요청,오류신고,기타', ',')}">
                                            <tr>
                                                <th rowspan="2">${category}</th>
                                                <td class="d-flex align-items-center">전체문의</td>
                                                <c:set var="totalSum" value="0" />
                                                <c:forEach var="subject" items="${fn:split('국어,영어,수학,과학,사회,역사', ',')}">
                                                    <c:set var="inquiries" value="0" />
                                                    <c:forEach var="item" items="${dashboard.referenceBookTeacherInquiryStatusDto}">
                                                        <c:if test="${item.subject == subject && item.inquiryCategory == category}">
                                                            <c:set var="inquiries" value="${item.totalInquiries}" />
                                                        </c:if>
                                                    </c:forEach>
                                                    <td>${inquiries}</td>
                                                    <c:set var="totalSum" value="${totalSum + inquiries}" />
                                                </c:forEach>
                                                <td>${totalSum}</td>
                                            </tr>
                                            <tr>
                                                <td class="d-flex align-items-end" style="margin-left: 10px">답변대기</td>
                                                <c:set var="waitingSum" value="0" />
                                                <c:forEach var="subject" items="${fn:split('국어,영어,수학,과학,사회,역사', ',')}">
                                                    <c:set var="waiting" value="0" />
                                                    <c:forEach var="item" items="${dashboard.referenceBookTeacherInquiryStatusDto}">
                                                        <c:if test="${item.subject == subject && item.inquiryCategory == category}">
                                                            <c:set var="waiting" value="${item.totalWaitingForAnswer}" />
                                                        </c:if>
                                                    </c:forEach>
                                                    <td class="${waiting > 0 ? 'red-text' : ''}">${waiting}</td>
                                                    <c:set var="waitingSum" value="${waitingSum + waiting}" />
                                                </c:forEach>
                                                <td class="${waitingSum > 0 ? 'red-text' : ''}">${waitingSum}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <%@ include file="/WEB-INF/views/common/inc/FooterINC.jsp" %>
        </div>
    </div>
</div>

<template id="pendingApplications">
    <ul>
        <c:forEach var="app" items="${dashboard.sampleApplicationStatus.pendingApplications}">
            <li class="fw-bold mb-4" style="font-size: 20px; cursor:pointer" onclick="goPage('${app.uid}')">${app.title} | ${app.date}</li>
        </c:forEach>
    </ul>
</template>
<template id="sentApplications">
    <ul>
        <c:forEach var="app" items="${dashboard.sampleApplicationStatus.sentApplications}">
            <li class="fw-bold mb-4" style="font-size: 20px; cursor:pointer" onclick="goPage('${app.uid}')">${app.title} | ${app.date}</li>
        </c:forEach>
    </ul>
</template>
<template id="cancelledApplications">
    <ul>
        <c:forEach var="app" items="${dashboard.sampleApplicationStatus.cancelledApplications}">
            <li class="fw-bold mb-4" style="font-size: 20px; cursor:pointer" onclick="goPage('${app.uid}')">${app.title} | ${app.date}</li>
        </c:forEach>
    </ul>
</template>
<template id="cancellationRequestedApplications">
    <ul>
        <c:forEach var="app" items="${dashboard.sampleApplicationStatus.cancellationRequestedApplications}">
            <li class="fw-bold mb-4" style="font-size: 20px; cursor:pointer" onclick="goPage('${app.uid}')">${app.title} | ${app.date}</li>
        </c:forEach>
    </ul>
</template>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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

        document.getElementById('searchBtn').addEventListener('click', () => search());
        const search = () => {
            let searchValue = document.getElementById('searchValue').value.trim();
            document.getElementById('dashboardForm').submit();
        }

        var cards = document.querySelectorAll('.card-selectable');

        cards.forEach(function (card, index) {
            card.addEventListener('click', function () {
                // Remove 'bg-warning' class from all selectable cards
                cards.forEach(function (otherCard) {
                    otherCard.classList.remove('bg-warning');
                    otherCard.classList.add('bg-white');
                });

                // Add 'bg-warning' class to the clicked card
                this.classList.remove('bg-white');
                this.classList.add('bg-warning');

                // Get the template for the clicked card
                let templateId = ['pendingApplications', 'sentApplications', 'cancelledApplications', 'cancellationRequestedApplications'][index];
                let template = document.getElementById(templateId).content;

                // Clear the #list element and add the cloned template
                let list = document.getElementById('list');
                while (list.firstChild) {
                    list.removeChild(list.firstChild);
                }
                let clone = document.importNode(template, true);
                list.appendChild(clone);
            });
        });

        // pendingApplications 템플릿 가져오기
        var template = document.getElementById('pendingApplications').content;

        // 템플릿을 복제하여 #list 요소에 추가
        var clone = document.importNode(template, true);
        document.getElementById('list').appendChild(clone);

        let textbookCompletedInquires = document.getElementById('textbookCompletedInquires').value;
        let textbookWaitingForAnswer = document.getElementById('textbookWaitingForAnswer').value;
        let referenceBookCompletedInquires = document.getElementById('referenceBookCompletedInquires').value;
        let referenceBookWaitingForAnswer = document.getElementById('referenceBookWaitingForAnswer').value;
        let bookTriggerCompletedInquires = document.getElementById('bookTriggerCompletedInquires').value;
        let bookTriggerWaitingForAnswer = document.getElementById('bookTriggerWaitingForAnswer').value;
        let arbolCompletedInquires = document.getElementById('arbolCompletedInquires').value;
        let arbolWaitingForAnswer = document.getElementById('arbolWaitingForAnswer').value;
        let webSiteCompletedInquires = document.getElementById('webSiteCompletedInquires').value;
        let webSiteWaitingForAnswer = document.getElementById('webSiteWaitingForAnswer').value;
        console.log(textbookCompletedInquires, textbookWaitingForAnswer, referenceBookCompletedInquires, referenceBookWaitingForAnswer, bookTriggerCompletedInquires, bookTriggerWaitingForAnswer, arbolCompletedInquires, arbolWaitingForAnswer, webSiteCompletedInquires, webSiteWaitingForAnswer)
        const ctx = document.getElementById('kt_amcharts_1').getContext('2d');
        const myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['교과서 문의', '참고서 문의', '북트리거 문의', '아르볼 문의', '웹사이트 문의'],
                datasets: [{
                    label: '신규문의',
                    data: [textbookCompletedInquires, referenceBookCompletedInquires, bookTriggerCompletedInquires, arbolCompletedInquires, webSiteCompletedInquires],
                    backgroundColor: '#ffcd39',
                    borderColor: '#ffcd39',
                    borderWidth: 1
                }, {
                    label: '답변대기',
                    data: [textbookWaitingForAnswer, referenceBookWaitingForAnswer, bookTriggerWaitingForAnswer, arbolWaitingForAnswer, webSiteWaitingForAnswer],
                    backgroundColor: '#ff9a00',
                    borderColor: '#ff9a00',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    });

    function goPage(uid) {
        location.href = '/reference-book/sample-request/' + uid;
    }

</script>

</body>
<style>
    .custom-table th, .custom-table td {
        text-align: center;
        vertical-align: middle;
    }
    .custom-table td[colspan="2"] {
        vertical-align: middle;
    }
    .custom-table .red-text {
        color: red;
    }
</style>
</html>

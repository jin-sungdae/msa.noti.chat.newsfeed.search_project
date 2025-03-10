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
                    <input type="hidden" name="uid" id="uid" value="${event != null ? event.uid : uid}"/>
                    <input type="hidden" name="idx" id="idx" value="${event != null ? event.eventIndex : null}"/>
                    <input type="hidden" name="eventType" id="eventType" value="${event != null ? event.eventType : null}"/>
                    <input type="hidden" name="adminId" id="adminId" value="${list.adminId}"/>
                    <input type="hidden" name="adminIdx" id="adminIdx" value="${list.adminIndex}"/>
                    <input type="hidden" name="account" id="account" value ="${account}"/>
                    <input type="hidden" name="adminName" id="adminName" value="${account.adminName}"/>
                    <div class="container-fluid">
                        <!-- 본문 내용 START -->
                        <form>
                            <div class="card mb-5 mb-xl-10">
                                <div class="card-header card-header-stretch border-0 pt-5">
                                    <h3 class="card-title text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                        이벤트 관리
                                    </h3>
                                    <div class="card-toolbar">
                                        <ul class="nav nav-tabs nav-line-tabs nav-stretch fs-6 border-0">
                                            <li class="nav-item">
                                                <a class="nav-link fw-bolder text-dark active" data-bs-toggle="tab" href="#tab1">이벤트 상세</a>
                                            </li>
                                            <c:if test="${event != null && event.eventType ne 'GENERAL'}">
                                                <li class="nav-item">
                                                    <a class="nav-link fw-bolder text-dark" data-bs-toggle="tab" href="#tab2">이벤트 참여자 내역</a>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade show active" id="tab1" role="tabpanel">
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3">작성자</label>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="col-lg-12 form-label text-dark pt-3 cursor-default">
                                                            <c:out value="${event.adminName}"/> (<c:out value="${event.department}"/>)
                                                        </div>
                                                    </div>
                                                    <c:if test="${event != null}">
                                                        <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                            <label class="col-lg-12 form-label fw-bolder text-dark pt-3">작성일시</label>
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <div class="col-lg-12 form-label text-dark pt-3 cursor-default">
                                                                <c:out value="${event.regDate}"/>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                            <label class="col-lg-12 form-label fw-bolder text-dark pt-3">조회수</label>
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <div class="col-lg-4 form-label text-dark pt-3">
                                                                <c:out value="${event.viewCount}"/>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                        <label class="col-lg-11 form-label fw-bolder text-dark pt-3">이벤트 구분</label>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="col-lg-12 form-label text-dark pt-3 cursor-default">
                                                            <c:out value="${event.eventTypeName}"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                        <label class="col-lg-11 form-label fw-bolder text-dark pt-3">제목</label>
                                                    </div>
                                                    <div class="col-lg-11">
                                                        <div class="col-lg-12 form-label text-dark pt-3 cursor-default">
                                                            <c:out value="${event.title}"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                        <label class="col-lg-11 form-label fw-bolder text-dark pt-3">이벤트 기간</label>
                                                    </div>
                                                    <div class="col-lg-11">
                                                        <div class="col-lg-12 form-label text-dark pt-3 cursor-default">
                                                            <c:out value="${event.startDate}"/> ~ <c:out value="${event.endDate}"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <c:if test="${not empty event.uid and fn:contains(event.eventType, 'SURVEY')}">
                                                <c:if test="${event.eventType eq 'SURVEY_DUPLICATION'}">
                                                    <div class="row mb-8 surveySelect">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                                <label class="col-lg-11 form-label fw-bolder text-dark pt-3">설문문항 수</label>
                                                            </div>
                                                            <div class="col-lg-5 row">
                                                                <div class="col-lg-3 form-label text-dark pt-3 d-flex justify-content-start align-items-center">
                                                                    <span class="me-1 fw-bolder"><c:out value="${fn:length(questionList)}"/></span> 개 문항
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                                <label class="col-lg-11 form-label fw-bolder text-dark pt-3">설문선택 수</label>
                                                            </div>
                                                            <div class="col-lg-5 row">
                                                                <div class="col-lg-3 form-label text-dark pt-3 d-flex justify-content-start align-items-center">
                                                                   <span class="me-1 fw-bolder"><c:out value="${event.answerCount}"/></span> 개 선택
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                                <div class="row mb-8 survey">
                                                    <div class="col-lg-12 row">
                                                        <div class="col-lg-1">
                                                            <label class="col-lg-11 form-label fw-bolder text-dark pt-3">설문 내용</label>
                                                        </div>
                                                        <div class="col-lg-11 row d-flex justify-content-center align-items-center">
                                                            <div id="survey">
                                                                <c:forEach items="${questionList}" var="question" varStatus="status">
                                                                    <div id="questionDiv${status.index + 1}" class="col-lg-12 form-label text-dark">
                                                                        <div class="col-lg-12 form-label text-dark pt-3 me-5 row">
                                                                            <div class="col-1 d-flex justify-content-end align-items-center fs-4 fw-bolder">
                                                                                    ${status.index + 1}.
                                                                            </div>
                                                                            <div class="col-9 fs-4 fw-bolder">
                                                                                <input type="hidden" name="questionIndex" value="${question.EVENT_SURVEY_QUESTION_INDEX}">
                                                                                <c:out value="${question.QUESTION}"/>
                                                                            </div>
                                                                            <div class="col-2">
                                                                            </div>
                                                                        </div>
                                                                        <c:set var="answerIndex" value="0"/>
                                                                        <c:forEach items="${answerList}" var="answer" varStatus="answerStatus">
                                                                            <c:if test="${answer.EVENT_SURVEY_QUESTION_INDEX eq question.EVENT_SURVEY_QUESTION_INDEX}">
                                                                                <div class="col-12 form-label text-dark row">
                                                                                    <div class="col-lg-2 form-label text-dark text-end pt-3 ps-5 d-flex justify-content-end align-items-center">
                                                                                            ${answerIndex + 1})
                                                                                    </div>
                                                                                    <div class="col-lg-8 form-label text-dark pt-3">
                                                                                        <input type="hidden" name="answerIndex" value="${answer.EVENT_SURVEY_ANSWER_INDEX}">
                                                                                        <c:out value="${answer.ANSWER}"/>
                                                                                    </div>
                                                                                    <div class="col-lg-2 form-label text-dark pt-3">
                                                                                    </div>
                                                                                </div>
                                                                                <c:set var="answerIndex" value="${answerIndex + 1}"/>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </div>
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <c:if test="${not empty event.uid and !fn:contains(event.eventType, 'SURVEY')}">
                                                <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                        <label class="col-lg-11 form-label fw-bolder text-dark pt-3">내용</label>
                                                    </div>
                                                    <div class="col-lg-11">
                                                        <div class="col-lg-12 text-dark pt-3 cursor-default">
                                                            <div>${event.content}</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </c:if>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                        <label class="col-lg-11 form-label fw-bolder text-dark pt-3">이벤트 배너</label>
                                                    </div>
                                                    <div class="col-lg-11"id="dropzoneContainer2">
                                                        <jsp:include page="/FileFormINC" flush="false">
                                                            <jsp:param name="viewType" value="view" />
                                                            <jsp:param name="isImage" value="false" />
                                                            <jsp:param name="hasOrder" value="false" />
                                                            <jsp:param name="parentTable" value="EVENT"/>
                                                            <jsp:param name="parentIndex" value="${event == null ? '' : event.eventIndex}"/>
                                                            <jsp:param name="parentUid" value="${event == null ? uid : event.uid}"/>
                                                            <jsp:param name="parentType" value="BANNER"/>
                                                            <jsp:param name="maxFileCount" value="1"/>
                                                            <jsp:param name="isSecure" value="N"/>
                                                            <jsp:param name="DZID" value="dz0"/>
                                                        </jsp:include>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1">
                                                        <div class="col-lg-12">
                                                            <label class="form-label fw-bolder text-dark pt-3">이벤트 배너<br/>노출 메뉴</label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-11">
                                                        <div class="col-lg-12 text-dark pt-3 cursor-default">
                                                            <div>
                                                                <c:set var="bannerLocation" value="${event.bannerLocation}" />
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
                                                                        <c:set var="replacedBannerLocation" value="${bannerLocation}" />
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <c:out value="${replacedBannerLocation}" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                        <label class="col-lg-11 form-label fw-bolder text-dark pt-3">이벤트 배너<br/>Target</label>
                                                    </div>
                                                    <div class="col-lg-11">
                                                        <div class="col-lg-12 text-dark pt-3 cursor-default">
                                                            <div>
                                                                <c:choose>
                                                                    <c:when test="${event.linkType eq '_blank'}">
                                                                        새 창
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        본창 이동
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <c:if test="${event.eventType eq 'GENERAL' or event.eventType eq 'PARTICIPATION'}">
                                                <div class="row mb-8">
                                                    <div class="col-lg-12 row">
                                                        <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                            <label class="col-lg-11 form-label fw-bolder text-dark pt-3">첨부파일</label>
                                                        </div>
                                                        <div class="col-lg-11" id="dropzoneContainer">
                                                            <!-- 파일 업로드 섹션 -->
                                                            <jsp:include page="/FileFormINC" flush="false">
                                                                <jsp:param name="viewType" value="view" />
                                                                <jsp:param name="isImage" value="false" />
                                                                <jsp:param name="hasOrder" value="false" />
                                                                <jsp:param name="parentTable" value="EVENT"/>
                                                                <jsp:param name="parentIndex" value="${event == null ? '' : event.eventIndex}"/>
                                                                <jsp:param name="parentUid" value="${event == null ? uid : event.uid}"/>
                                                                <jsp:param name="parentType" value="FILE"/>
                                                                <jsp:param name="maxFileCount" value="1"/>
                                                                <jsp:param name="isSecure" value="N"/>
                                                                <jsp:param name="DZID" value="dz1"/>
                                                            </jsp:include>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                        <label class="col-lg-11 form-label fw-bolder text-dark pt-3">노출여부</label>
                                                    </div>
                                                    <div class="fv-row fv-plugins-icon-container col-lg-11">
                                                        <div class="col-lg-12 text-dark pt-3 cursor-default">
                                                            <c:out value="${event.isOpen}"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <c:if test="${event != null}">
                                            <div class="tab-pane fade" id="tab2" role="tabpanel">
                                                <div class="card">
                                                    <div class="card-header border-0 pt-6L">
                                                    <div class="card-title">
                                                        <div class="row">
                                                            <div class="col d-flex align-items-center justify-content-between">
                                                                <h3 class="fs-6 fw-bold mt-3 mb-3" style="flex-grow: 1; min-width: 0; white-space: nowrap;">Total : <span class="fw-bolder">${listNum}</span> 개</h3>
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
                                                    <c:if test="${!empty participantList}">
                                                        <div class="card-toolbar">
                                                            <div class="d-flex justify-content-end" data-kt-customer-table-toolbar="base">
                                                                <button type="button" class="btn btn-m" style="color: #fff; background-color: #1aa179"  onclick="excelDownload('${event.eventType}', '${event.uid}')">
                                                                    엑셀 다운로드
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </div>
                                                    <div class="card-body pt-0 table-responsive">
                                                    <!--begin::Table-->
                                                    <table class="table table-row-bordered gy-5" id="faqCommonTable">
                                                        <!--begin::Table head-->
                                                        <thead>
                                                        <!--begin::Table row-->
                                                        <tr class="fw-semibold fs-6 text-muted">
                                                            <th class="min-w-70px">No.</th>
                                                            <th class="min-w-70px">참여자명</th>
                                                            <th class="min-w-70px">아이디</th>
                                                            <th class="min-w-70px">휴대폰 번호</th>
                                                            <c:if test="${event.eventType eq 'SURVEY_SHORT' or event.eventType eq 'SURVEY_DUPLICATION'}">
                                                            <th class="min-w-70px">설문문항</th>
                                                            <th class="min-w-70px">선택</th>
                                                            </c:if>
                                                            <c:if test="${event.eventType eq 'REPLY_PUBLIC' or event.eventType eq 'REPLY_PRIVATE'}">
                                                                <th class="min-w-70px ">참여댓글</th>
                                                            </c:if>
                                                            <th class="min-w-60px">참여일시</th>
                                                        </tr>
                                                        <!--end::Table row-->
                                                        </thead>
                                                        <!--end::Table head-->
                                                        <!--begin::Table body-->
                                                        <tbody>
                                                        <c:choose>
                                                            <c:when test="${empty participantList}">
                                                                <tr>
                                                                    <td class="center">
                                                                        데이터가 없습니다.
                                                                    </td>
                                                                </tr>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:if test="${not empty participantList}">
                                                                    <c:forEach items="${participantList}" var="participant" varStatus="status">
                                                                        <tr>
                                                                            <td class="text-dark fw-bold">
                                                                                <c:set value="${fn:length(participantList)}" var="listNum"/>
                                                                                    ${((listNum - (page.pageListSize * (page.currentPage - 1))) - status.index)}
                                                                            </td>
                                                                            <td class="text-dark fw-bold text-hover-warning hoverable" name="userType">
                                                                                <c:out value="${participant.userName}"/>
                                                                            </td>
                                                                            <td class="text-dark text-hover-warning fw-bold hoverable" name="name">
                                                                                <c:out value="${participant.userId}"/>
                                                                            </td>
                                                                            <td class="text-dark text-hover-warning fw-bold hoverable" name="userId">
                                                                                <c:choose>
                                                                                    <c:when test="${fn:length(participant.phoneNo) eq 11}">
                                                                                        <c:set var="phoneNo" value="${fn:substring(participant.phoneNo,0,3)}-${fn:substring(participant.phoneNo,3,7)}-${fn:substring(participant.phoneNo,7,12)}"/>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <c:set var="phoneNo" value="${fn:substring(participant.phoneNo,0,3)}-${fn:substring(participant.phoneNo,3,6)}-${fn:substring(participant.phoneNo,6,11)}"/>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                                <c:out value="${phoneNo}"/>
                                                                            </td>
                                                                            <c:if test="${event.eventType eq 'SURVEY_SHORT' or event.eventType eq 'SURVEY_DUPLICATION'}">
                                                                                <td class="text-dark text-hover-warning fw-bold hoverable" name="name">
                                                                                    <c:out value="${participant.question}"/>
                                                                                </td>
                                                                                <td class="text-dark text-hover-warning fw-bold hoverable" data-uid="${list.uid}" name="userId">
                                                                                    <c:out value="${participant.answer}"/>
                                                                                </td>
                                                                            </c:if>
                                                                            <c:if test="${event.eventType eq 'REPLY_PUBLIC' or event.eventType eq 'REPLY_PRIVATE'}">
                                                                                <td class="text-dark text-hover-warning fw-bold hoverable" name="name">
                                                                                    <c:out value="${participant.reply}"/>
                                                                                </td>
                                                                            </c:if>
                                                                            <td class="text-dark text-hover-warning fw-bold hoverable" data-uid="${list.uid}" name="userPhoneNumber">
                                                                                <c:out value="${fn:replace(participant.regDate, 'T', ' ')}"/>
                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </c:if>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        </tbody>
                                                        <!--end::Table body-->
                                                    </table>
                                                    <c:if test="${!empty participantList}">
                                                        <%@ include file="/WEB-INF/views/common/inc/Paging.jsp" %>
                                                    </c:if>
                                                    <!--end::Table-->
                                                </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="card-footer" id="footerIdx">
                                    <div class="row">
                                        <div id="listGroup" class="col-3">
                                            <a id="back-button" onclick="goList()" class="btn btn-light-primary" style="background-color: #343a40; color: #FFFFFF">목록</a>
                                        </div>
                                            <div id="editGroup" class="col-9 d-flex justify-content-end">
                                                <div class="col-9 d-flex justify-content-end">
                                                    <c:if test="${event.eventStatus ne '진행' or event.isOpen eq 'N'}">
                                                        <button type="button" class="btn btn-light-primary me-2" id="deleteBtn">
                                                            삭제
                                                        </button>
                                                    </c:if>
                                                    <button type="button" class="btn btn-warning" style="background-color: #ffcd39; color: #181C32" id="modifyBtn">
                                                        수정
                                                    </button>
                                                </div>
                                            </div>
                                        <div id="saveGroup" style="display: none;">
                                            <button type="button" id="cancelBtn" class="btn btn-light-primary me-2" style="background-color: #fff3cd; color: #181C32" onclick="cancel()">
                                                취소
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <!-- 본문 내용 END -->
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.5/jszip.min.js"></script>
<script type="text/javascript">

    document.addEventListener('DOMContentLoaded', function () {

        function showActiveTabFromHash() {
            let hash = window.location.hash;
            if (hash) {
                let tab = document.querySelector('.nav-link[href="' + hash + '"]');
                if (tab) {
                    let tabInstance = new bootstrap.Tab(tab);
                    tabInstance.show();
                }
            }
        }

        let backButton = document.getElementById('back-button');
        let footerIdx = document.getElementById('footerIdx');

        function toggleBackButton() {
            let activeTab = document.querySelector('.nav-link.active');
            if (activeTab && activeTab.getAttribute('href') === '#tab2') {
                backButton.style.display = 'none';
                footerIdx.style.display = 'none';
            } else {
                backButton.style.display = 'inline-block'; // or 'block' depending on your layout
                footerIdx.style.display = 'inline-block'; // or 'block' depending on your layout
            }
        }

        showActiveTabFromHash();
        toggleBackButton();

        document.querySelectorAll('a[data-bs-toggle="tab"]').forEach(function(tab) {
            tab.addEventListener('shown.bs.tab', function(event) {
                window.location.hash = event.target.getAttribute('href');
                toggleBackButton();
            });
        });

        // 페이지가 해시로 로드되는 경우 처리하기
        window.addEventListener('hashchange', showActiveTabFromHash);

        if (document.getElementById('deleteBtn')) {
            document.getElementById('deleteBtn').addEventListener('click', () => remove());
        }
        if (document.getElementById('modifyBtn')) {
            document.getElementById('modifyBtn').addEventListener('click', () => modify());
        }

        if (document.getElementById('phone-number')) {
            let phoneElement = document.getElementById('phone-number');
            let phoneNumber = phoneElement.textContent;
            phoneElement.textContent = formatPhoneNumber(phoneNumber);
        }
    });

    let uid = document.getElementById('uid').value;
    let surveyQuestionIndices = document.querySelectorAll('[name="questionIndex"]');
    let surveyAnswerIndices = document.querySelectorAll('[name="answerIndex"]');
    let eventType = document.getElementById('eventType').value;

    const remove = async () => {
        Swal.fire({
            title: '게시물 삭제',
            text: '등록하신 게시물을 삭제 하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '확인',
            cancelButtonText: '취소'
        })
            .then(async (result) => {
                if (result.isConfirmed) {
                    let data = {
                        uid: uid
                    }
                    try {
                        const resp = await fetch('/api/v1/file/file-delete/' + uid, {
                            method: 'DELETE',
                            headers: {
                                'Content-Type': 'application/json',
                            },
                            body: JSON.stringify(data)
                        });
                    } catch (Exception) {
                        console.error(Exception);
                    }
                    const response = await fetch('/api/v1/customer/event/' + uid, {
                        method: 'DELETE',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                        body: JSON.stringify()
                    });

                    const res = await response.json();
                    if (res) {
                        if (eventType.includes('SURVEY')) {
                            // 'removeQuestion' 함수를 호출
                            for (const index of surveyQuestionIndices) {
                                await removeQuestion(index.value);
                            }
                        }
                        location.href = '/customer/event';
                    }
                }
            })
    }

    async function removeQuestion(eventSurveyQuestionIndex) {
        try {
            const response = await fetch('/api/v1/customer/event/' + uid + '/survey/' + eventSurveyQuestionIndex, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify()
            });

            const res = await response.json();
            if (res) {
                if (eventType.includes('SURVEY')) {
                    // 'removeQuestion' 함수를 호출
                    for (const index of surveyAnswerIndices) {
                        await removeAnswer(index.value);
                    }
                }
            }
        } catch (Exception) {
            console.error(Exception);
        }
    }

    async function removeAnswer(eventSurveyAnswerIndex) {
        try {
            const response = await fetch('/api/v1/customer/event/' + uid + '/survey/answer/' + eventSurveyAnswerIndex, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify()
            });
        } catch (Exception) {
            console.error(Exception);
        }
    }

    const modify = () => {
        window.location.href = '/customer/event-mod-form/${uid}';
    };

    function formatPhoneNumber(phoneNumber) {
        if (!phoneNumber || phoneNumber.length < 10) {
            return phoneNumber;
        }

        if (phoneNumber.length === 11) {
            return phoneNumber.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
        } else if (phoneNumber.length === 10) {
            return phoneNumber.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
        } else {
            return phoneNumber; // Return the original if it doesn't match expected lengths
        }
    }

    const changePerPage = (select) => {
        const pageListSize = select.value;
        let params = updateUrlParam(window.location.href, 'pageNo', 1);
        let returnUrl = updateUrlParam(params, 'pageListSize', pageListSize);
        location.href = returnUrl;
    }
    const updateUrlParam = (url, paramName, paramValue) => {
        const urlObject = new URL(url);
        urlObject.searchParams.set(paramName, paramValue);
        return urlObject.toString();
    }

    async function excelDownload(type, uid) {
        let date = new Date();
        let year = date.getFullYear();
        let month = ("0" + (date.getMonth() + 1)).slice(-2);
        let day = ("0" + date.getDate()).slice(-2);

        let formattedDate = year + "-" + month + "-" + day;
        let data;
        if (type.includes('SURVEY')) {
            data = {
                nowDay: formattedDate,
                filename: 'event_participant_list',
                type: type,
                uid: uid,
                headerMap : {
                    header1: 'No.',
                    header2: '참여자명',
                    header3: '아이디',
                    header4: '휴대폰번호',
                    header5: '설문문항',
                    header6: '선택',
                    header7: '참여일시'
                }
            }
        } else {
            data = {
                nowDay: formattedDate,
                filename: 'event_participant_list',
                type: type,
                uid: uid,
                headerMap : {
                    header1: 'No.',
                    header2: '참여자명',
                    header3: '아이디',
                    header4: '휴대폰번호',
                    header5: '참여일시'
                }
            }
        }

        try {
            const response = await fetch('/api/v1/excel', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data),
            });

            console.log(response);

            if (response.ok) {
                const blob = await response.blob();
                const fileName = await response.headers.get('Content-Disposition').split('filename=')[1];
                console.log(fileName);

                let listNum = '${listNum}';

                // 데이터 양에 따라 다르게 처리
                if (listNum > 10000) {
                    // 데이터가 10000건 이상인 경우 zip 파일로 압축
                    let zip = new JSZip();
                    zip.file(fileName, blob);
                    zip.generateAsync({type:"blob"}).then(function(content) {
                        // content를 다운로드
                        let downloadLink = document.createElement('a');
                        downloadLink.href = window.URL.createObjectURL(content);
                        downloadLink.download = fileName + '.zip';
                        downloadLink.style.display = 'none';
                        document.body.appendChild(downloadLink);
                        downloadLink.click();
                        document.body.removeChild(downloadLink);
                    });
                } else {
                    // 데이터가 10000건 미만인 경우 엑셀 파일로 다운로드
                    let downloadLink = document.createElement('a');
                    downloadLink.href = window.URL.createObjectURL(blob);
                    downloadLink.download = fileName;
                    downloadLink.style.display = 'none';
                    document.body.appendChild(downloadLink);
                    downloadLink.click();
                    document.body.removeChild(downloadLink);
                }

            } else {
                throw new Error('파일 다운로드 요청에 실패했습니다.');
            }
        } catch (error) {
            console.log("=== Excel error : " + error);
            Swal.fire({
                html: '<div>파일 다운로드 중 오류가 발생했습니다.</div>',
                icon: 'error',
                buttonsStyling: false,
                confirmButtonText: 'OK',
                customClass: { confirmButton: 'btn btn-primary' }
            });
        }
    }

    function goList() {
        let url = '/customer/event';

        let pageNo = sessionStorage.getItem('pageNo');
        let startDate = sessionStorage.getItem('startDate');
        let endDate = sessionStorage.getItem('endDate');
        let eventType = sessionStorage.getItem('eventType');
        let eventStatus = sessionStorage.getItem('eventStatus');
        let isOpen = sessionStorage.getItem('isOpen');
        let searchValue = sessionStorage.getItem('searchValue');

        location.href = url + '?pageNo=' + pageNo + '&startDate=' + startDate + '&endDate=' + endDate + '&eventType=' + eventType + '&eventStatus=' + eventStatus + '&isOpen=' + isOpen + '&searchValue=' + searchValue;
    }

</script>

<style>
    @keyframes slide-in {
        from {
            transform: translateX(-100%);
            opacity: 0;
        }
        to {
            transform: translateX(0);
            opacity: 1;
        }
    }

    .slide-in-animation {
        animation: slide-in 0.5s forwards;
    }

    p img {
        max-width: 100%;
    }
</style>
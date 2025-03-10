<%@ page import="java.util.ResourceBundle" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    ResourceBundle resourceBundle = ResourceBundle.getBundle("application");
    String froalaKey = resourceBundle.getString("froala.key");
%>

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
                    <input type="hidden" name="eventIndex" id="eventIndex" value="${event != null ? event.eventIndex : null}"/>
                    <input type="hidden" name="adminIdx" id="adminIdx" value="${event.adminIndex}"/>
                    <input type="hidden" name="adminId" id="adminId" value="${event.adminId}"/>
                    <input type="hidden" name="account" id="account" value ="${account}"/>
                    <input type="hidden" name="adminName" id="adminName" value="${account.adminName}"/>
                    <input type="hidden" id="chUid" />
                    <input type="hidden" id="regDate" />
                    <div class="container-fluid">
                        <!-- 본문 내용 START -->
                        <form id="eventForm">
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
                                            <c:if test="${event != null}">
                                                <li id="eventParticipantList" class="nav-item">
                                                    <a class="nav-link fw-bolder text-dark " data-bs-toggle="tab" href="#tab2">이벤트 참여자 내역</a>
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
                                                        <div class="col-lg-12 form-label text-dark pt-3">
                                                            <c:choose>
                                                                <c:when test="${not empty event}">
                                                                    <c:out value="${event.adminName}"/>(<c:out value="${event.department}"/>)
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <c:out value="${account.adminName}"/>(<c:out value="${account.department}"/>)
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                    </div>
                                                    <c:if test="${event != null}">
                                                        <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                            <label class="col-lg-12 form-label fw-bolder text-dark pt-3">작성일시</label>
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <div class="col-lg-12 form-label text-dark pt-3">
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
                                                        <label class="col-lg-11 form-label fw-bolder text-dark pt-3 required">이벤트 구분</label>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <c:choose>
                                                            <c:when test="${not empty event.eventType}">
                                                                <div class="col-lg-12 form-label text-dark pt-3 cursor-default">
                                                                    <input type="hidden" id="eventType" value="<c:out value="${event.eventType}"/>">
                                                                    <c:out value="${event.eventTypeName}"/>
                                                                </div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                                    <select id="eventType" name="eventType" class="form-select form-select-solid" onchange="changeForm(this)" data-control="select2" data-hide-search="true">
                                                                        <option value="GENERAL" ${event.eventType eq 'GENERAL' ? 'selected' : ''}>일반</option>
                                                                        <option value="PARTICIPATION" ${event.eventType eq 'PARTICIPATION' ? 'selected' : ''}>참여</option>
                                                                        <option value="SURVEY_SHORT" ${event.eventType eq 'SURVEY_SHORT' ? 'selected' : ''}>설문(단답형)</option>
                                                                        <option value="SURVEY_DUPLICATION" ${event.eventType eq 'SURVEY_DUPLICATION' ? 'selected' : ''}>설문(중복형)</option>
                                                                        <option value="REPLY_PUBLIC" ${event.eventType eq 'REPLY_PUBLIC' ? 'selected' : ''}>댓글(공개형)</option>
                                                                        <option value="REPLY_PRIVATE" ${event.eventType eq 'REPLY_PRIVATE' ? 'selected' : ''}>댓글(비공개형)</option>
                                                                    </select>
                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                        <label class="col-lg-11 form-label fw-bolder text-dark pt-3 required">제목</label>
                                                    </div>
                                                    <div class="col-lg-11">
                                                        <div class="col-lg-12 form-label text-dark pt-3 fv-row fv-plugins-icon-container">
                                                            <input type="text" id="title" name="title" placeholder="제목 입력" class="form-control" value="<c:out value="${event.title}"/>" maxlength="50">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                        <label class="col-lg-11 form-label fw-bolder text-dark pt-3 required">이벤트 기간</label>
                                                    </div>
                                                    <div class="col-lg-5">
                                                        <div class="row">
                                                            <div class="col-6">
                                                                <div class="input-group fv-row fv-plugins-icon-container">
                                                                    <input
                                                                            id="startDate"
                                                                            name="startDate"
                                                                            type="text"
                                                                            class="form-control flatpickr-input"
                                                                            placeholder="시작일"
                                                                            autocomplete="off"
                                                                            value="<c:out value="${event.startDate}"/>"
                                                                    />
                                                                    <span class="input-group-text" id="basic-addon3">
                                                    <i class="bi bi-calendar-check fs-1"></i>
                                                    </span>
                                                                </div>
                                                            </div>
                                                            <div class="col-6">
                                                                <div class="input-group fv-row fv-plugins-icon-container">
                                                                    <input
                                                                            id="endDate"
                                                                            name="endDate"
                                                                            type="text"
                                                                            class="form-control flatpickr-input"
                                                                            placeholder="종료일"
                                                                            autocomplete="off"
                                                                            value="<c:out value="${event.endDate}"/>"
                                                                    />
                                                                    <span class="input-group-text" id="basic-addon3">
                                                    <i class="bi bi-calendar-check fs-1"></i>
                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <c:if test="${empty event.uid || (not empty event.uid and fn:contains(event.eventType, 'SURVEY'))}">
                                                <c:if test="${empty event.uid || event.eventType eq 'SURVEY_DUPLICATION'}">
                                                    <div class="row mb-8 surveySelect" <c:if test="${empty event.uid}">style="display: none;" </c:if>>
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                                <label class="col-lg-11 form-label fw-bolder text-dark pt-3 required">설문문항 수</label>
                                                            </div>
                                                            <div class="col-lg-5 row">
                                                                <div class="col-lg-3 form-label text-dark pt-3">
                                                                    <select id="surveyQuestionCount" name="eventType" class="form-select form-select-solid" onchange="changeQuestionCount(this.value)" data-control="select2" data-hide-search="true">
                                                                        <c:forEach var="i" begin="3" end="10">
                                                                            <option value="${i}" <c:if test="${i == fn:length(questionList)}">selected</c:if>>${i}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                                <div class="col-lg-3 form-label text-dark pt-3 d-flex justify-content-start align-items-center">
                                                                    개 문항
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                                <label class="col-lg-11 form-label fw-bolder text-dark pt-3 required">설문선택 수</label>
                                                            </div>
                                                            <div class="col-lg-5 row">
                                                                <div class="col-lg-3 form-label text-dark pt-3">
                                                                    <select id="surveyAnswerCount" name="eventType" class="form-select form-select-solid" data-control="select2" data-hide-search="true">
                                                                        <c:forEach var="i" begin="1" end="10">
                                                                            <option value="${i}" <c:if test="${i == event.answerCount}">selected</c:if>>${i}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                                <div class="col-lg-3 form-label text-dark pt-3 d-flex justify-content-start align-items-center">
                                                                    개 선택
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                                <div class="row mb-8 survey" <c:if test="${empty event.uid}">style="display: none;" </c:if>>
                                                    <div class="col-lg-12 row">
                                                        <div class="col-lg-1">
                                                            <label class="col-lg-11 form-label fw-bolder text-dark pt-3 required">설문 내용</label>
                                                        </div>
                                                        <div class="col-lg-11 row d-flex justify-content-center align-items-center">
                                                            <div id="survey" name="survey" class="fv-row fv-plugins-icon-container">
                                                                <c:forEach items="${questionList}" var="question" varStatus="status">
                                                                    <div id="questionDiv${status.index + 1}" class="col-lg-12 form-label text-dark">
                                                                        <div class="col-lg-12 form-label text-dark pt-3 me-5 row">
                                                                            <div class="col-1 d-flex justify-content-center align-items-center">
                                                                                    ${status.index + 1}.
                                                                            </div>
                                                                            <div class="col-9 fv-row fv-plugins-icon-container">
                                                                                <input type="hidden" name="questionIndex" value="${question.EVENT_SURVEY_QUESTION_INDEX}">
                                                                                <input type="text" id="question${status.index + 1}" name="question${status.index + 1}" placeholder="문항 입력" class="question form-control" value="${question.QUESTION}" maxlength="100">
                                                                            </div>
                                                                            <div class="col-2">
                                                                                <c:choose>
                                                                                    <c:when test="${status.index eq 0}">
                                                                                        <button type="button" class="btn btn-light-dark me-2" style="background-color: #5E6278; color: #FFFFFF" onclick="addQuestion(${fn:length(questionList) + 1})">문항 추가 +</button>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <button type="button" class="btn btn-light-dark me-2" style="background-color: #5E6278; color: #FFFFFF" onclick="removeQuestion(${question.EVENT_SURVEY_QUESTION_INDEX}, this)">문항 삭제 -</button>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </div>
                                                                        </div>
                                                                        <c:set var="answerIndex" value="0"/>
                                                                        <c:forEach items="${answerList}" var="answer" varStatus="answerStatus">
                                                                            <c:if test="${answer.EVENT_SURVEY_QUESTION_INDEX eq question.EVENT_SURVEY_QUESTION_INDEX}">
                                                                                <div class="col-12 form-label text-dark row">
                                                                                    <div class="col-lg-2 form-label text-dark text-end pt-3 ps-5 d-flex justify-content-center align-items-center">
                                                                                            ${answerIndex + 1})
                                                                                    </div>
                                                                                    <div class="col-lg-8 form-label text-dark pt-3 fv-row fv-plugins-icon-container">
                                                                                        <input type="hidden" name="answerIndex" value="${answer.EVENT_SURVEY_ANSWER_INDEX}">
                                                                                        <input type="text" id="question${status.index + 1}answer${answerIndex + 1}" name="question${status.index + 1}answer${answerIndex + 1}" placeholder="보기 입력" class="answer form-control" value="${answer.ANSWER}" maxlength="100">
                                                                                    </div>
                                                                                    <div class="col-lg-2 form-label text-dark pt-3">
                                                                                        <c:choose>
                                                                                            <c:when test="${answerIndex eq 0}">
                                                                                                <button type="button" class="btn btn-light-dark me-2 answerAdd" data-question-index="${status.index + 1}" style="background-color: #959ea9; color: #FFFFFF" onclick="addFirstAnswers(${status.index + 1});">추가 +</button>
                                                                                            </c:when>
                                                                                            <c:otherwise>
                                                                                                <button type="button" class="btn btn-light-dark me-2" style="background-color: #959ea9; color: #FFFFFF" onclick="removeAnswer(${answer.EVENT_SURVEY_ANSWER_INDEX}, this)">삭제 -</button>
                                                                                            </c:otherwise>
                                                                                        </c:choose>
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
                                            <c:if test="${empty event.uid || (not empty event.uid and !fn:contains(event.eventType, 'SURVEY'))}">
                                                <div class="row mb-8 contentDiv">
                                                    <div class="col-lg-12 row">
                                                        <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                            <label class="col-lg-11 form-label fw-bolder text-dark pt-3 required">내용</label>
                                                        </div>
                                                        <div class="col-lg-11 fv-row fv-plugins-icon-container">
                                                        <textarea class="form-control form-control-solid contents" rows="5" id="contents" minlength="1" name="contents" placeholder="Content">
                                                                ${event.content}
                                                        </textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                        <label class="col-lg-11 form-label fw-bolder text-dark pt-3 required">이벤트 배너</label>
                                                    </div>
                                                    <div class="fv-row fv-plugins-icon-container col-lg-11" id="dz0Container">
                                                        <!-- 파일 업로드 섹션 -->
                                                        <jsp:include page="/FileFormINC" flush="false">
                                                            <jsp:param name="fileFormType" value="Y" />
                                                            <jsp:param name="isImage" value="false" />
                                                            <jsp:param name="hasOrder" value="false" />
                                                            <jsp:param name="parentTable" value="EVENT"/>
                                                            <jsp:param name="parentIndex" value="${event == null ? '' : event.eventIndex}"/>
                                                            <jsp:param name="parentUid" value="${event == null ? uid : event.uid}"/>
                                                            <jsp:param name="parentType" value="BANNER"/>
                                                            <jsp:param name="maxFileCount" value="2"/>
                                                            <jsp:param name="isSecure" value="N"/>
                                                            <jsp:param name="DZID" value="dz0"/>
                                                            <jsp:param name="dropzoneIndex" value="0"/>
                                                            <jsp:param name="description" value="파일 크기는 1MB이하, jpg, jpeg, png 형식의 파일만 가능합니다. <br> *배너 이미지는 800x396px로 업로드해 주세요."/>
                                                        </jsp:include>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                        <label class="col-lg-11 form-label fw-bolder text-dark pt-3">이벤트 배너<br>노출 메뉴</label>
                                                    </div>
                                                    <div class="col-lg-2 row">
                                                        <div class="col">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid mb-3">
                                                                <input id="customerService" name="bannerLocation" class="form-check-input" type="checkbox" value="TEXTBOOK"/>
                                                                <label class="form-check-label form-label fw-bolder text-dark pt-3" for="customerService">
                                                                    교과서
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid mb-3">
                                                                <input id="textBook" name="bannerLocation" class="form-check-input" type="checkbox" value="REFERENCE-BOOK"/>
                                                                <label class="form-check-label form-label fw-bolder text-dark pt-3" for="textBook">
                                                                    참고서
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                        <label class="col-lg-11 form-label fw-bolder text-dark pt-3 required">이벤트 배너<br>Target</label>
                                                    </div>
                                                    <div class="col-lg-2 row">
                                                        <div class="col">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                <input id="self" class="form-check-input" type="radio" name="linkType" value="_self" ${(event.linkType eq '_self' or empty event.linkType)  ? 'checked' : ''}/>
                                                                <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="self">
                                                                    본창 이동
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                <input id="blank" class="form-check-input" type="radio" name="linkType" value="_blank" ${event.linkType eq '_blank' ? 'checked' : ''}/>
                                                                <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="blank">
                                                                    새창 띄우기
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-8 fileDiv">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                        <label class="col-lg-11 form-label fw-bolder text-dark pt-3">첨부파일</label>
                                                    </div>
                                                    <div class="fv-row fv-plugins-icon-container col-lg-11" id="dz1Container">
                                                        <!-- 파일 업로드 섹션 -->
                                                        <jsp:include page="/FileFormINC" flush="false">
                                                            <jsp:param name="fileFormType" value="Y" />
                                                            <jsp:param name="viewType" value="${viewType}" />
                                                            <jsp:param name="isImage" value="false" />
                                                            <jsp:param name="hasOrder" value="false" />
                                                            <jsp:param name="parentTable" value="EVENT"/>
                                                            <jsp:param name="parentIndex" value="${event == null ? '' : event.eventIndex}"/>
                                                            <jsp:param name="parentUid" value="${event == null ? event : event.uid}"/>
                                                            <jsp:param name="parentType" value="FILE"/>
                                                            <jsp:param name="maxFileCount" value="2"/>
                                                            <jsp:param name="isSecure" value="N"/>
                                                            <jsp:param name="DZID" value="dz1"/>
                                                            <jsp:param name="dropzoneIndex" value="1"/>
                                                            <jsp:param name="description" value="파일 크기는 300MB 이하, mp3, mp4, pdf, jpg, jpeg, png, hwp, hwpx, ppt, pptx, dox, doxc, zip 형식의 파일만 가능합니다."/>
                                                        </jsp:include>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                        <label class="col-lg-11 form-label fw-bolder text-dark pt-3 required">노출여부</label>
                                                    </div>
                                                    <div class="col-lg-2 row">
                                                        <div class="col">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                <input id="isN" class="form-check-input" type="radio" name="isOpen" value="N" ${event.isOpen eq 'N' or empty event.isOpen ? 'checked' : ''}/>
                                                                <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isN">
                                                                    N
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                <input id="isY" class="form-check-input" type="radio" name="isOpen" value="Y"  ${event.isOpen eq 'Y' ? 'checked' : ''}/>
                                                                <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isY">
                                                                    Y
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 pt-3">
                                                        <span class="ms-2" style="color: gray;">* 비노출 시 이벤트 배너 노출 메뉴에도 비노출됩니다.</span>
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
                                                                <div class="col-7 d-flex align-items-center justify-content-between">
                                                                    <h3 class="fs-6 fw-bold mt-3 mb-3" style="flex-grow: 1; min-width: 0; white-space: nowrap;">Total : <span class="fw-bolder">${listNum}</span> records</h3>
                                                                </div>
                                                                <div class="col-5">
                                                                    <select
                                                                            id="perPage"
                                                                            name="perPage"
                                                                            class="form-select form-select-solid"
                                                                            data-control="select2"
                                                                            data-hide-search="true"
                                                                            onchange="fetchUserList()"
                                                                            style="margin-left: 10px;"
                                                                    >

                                                                        <option
                                                                                value="10"
                                                                                <c:if test="${param.perPage eq '10'}">
                                                                                    selected
                                                                                </c:if>>
                                                                            10
                                                                        </option>
                                                                        <option
                                                                                value="30"
                                                                                <c:if test="${empty param.perPage || param.perPage eq '30'}">
                                                                                    selected
                                                                                </c:if>>
                                                                            30
                                                                        </option>
                                                                        <option
                                                                                value="50"
                                                                                <c:if test="${param.perPage eq '50'}">
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
                                                                <th class="min-w-70px">제목</th>
                                                                <th class="min-w-70px">작성자</th>
                                                                <th class="min-w-70px">작성일시</th>
                                                                <th class="min-w-60px">응대여부</th>
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
                                                                                ${((listNum - (page.pageListSize * (page.currentPage - 1))) - status.index)}
                                                                        </td>
                                                                        <td class="text-dark fw-bold text-hover-warning hoverable"
                                                                            data-uid="${list.uid}"
                                                                            name="userType"
                                                                            onclick="openUserForm(this)">
                                                                            <c:out value="${list.userType}"/>
                                                                        </td>
                                                                        <td class="text-dark text-hover-warning fw-bold hoverable"
                                                                            data-uid="${list.uid}"
                                                                            name="name"
                                                                            onclick="openUserForm(this)">
                                                                            <c:out value="${list.userName}"/>
                                                                        </td>
                                                                        <td class="text-dark text-hover-warning fw-bold hoverable"
                                                                            data-uid="${list.uid}"
                                                                            name="userId"
                                                                            onclick="openUserForm(this)">
                                                                            <c:out value="${list.userId}"/>
                                                                        </td>
                                                                        <td class="text-dark text-hover-warning fw-bold hoverable"
                                                                            data-uid="${list.uid}"
                                                                            name="userPhoneNumber"
                                                                            onclick="openUserForm(this)">
                                                                            <c:out value="${list.phoneNo}"/>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </c:if>
                                                            <c:if test="${empty list}">
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
                                        </c:if>
                                    </div>
                                </div>
                                <div class="card-footer" id="footerIdx">
                                    <div class="row">
                                        <div id="listGroup" class="col-3">
                                        </div>
                                        <div class="col-9 d-flex justify-content-end">
                                            <button type="button" class="btn btn-light-primary me-2" style="background-color: #343a40; color: #FFFFFF" onclick="history.back()">취소</button>
                                            <c:choose>
                                                <c:when test="${not empty event}">
                                                    <button type="button" class="btn btn-warning" style="background-color: #ffcd39; color: #181C32" id="modifyBtn">
                                                        수정
                                                    </button>
                                                </c:when>
                                                <c:otherwise>
                                                    <button type="button" class="btn btn-warning" style="background-color: #ffcd39; color: #181C32" id="saveBtn">
                                                        저장
                                                    </button>
                                                </c:otherwise>
                                            </c:choose>
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
<script src="/assets/js/file.js"></script>
<script type="text/javascript">

    /***************************************************** INIT ***************************************/

    document.addEventListener('DOMContentLoaded', function () {
        initializeFlatpickr();

        if(document.getElementById('eventIndex').value) {
            document.getElementById('modifyBtn').addEventListener('click', () => save());
        } else {
            document.getElementById('saveBtn').addEventListener('click', () => save());
        }

        if (window.location.href.includes('event-mod-form')){
            document.getElementById('eventParticipantList').style.display = 'none';
        }
    });

    let ntdrop = [];
    let viewType = "${viewType}";
    let eventFv = null;

    window.onload = function () {

        eventFv = FormValidation.formValidation(document.getElementById('eventForm'), {
            fields: {
                title: {
                    validators: {
                        notEmpty: {
                            message: '* 제목을 입력해주세요.'
                        }
                    }
                },
                startDate: {
                    validators: {
                        notEmpty: {
                            message: '* 이벤트 기간을 선택해주세요.'
                        }
                    }
                },
                endDate: {
                    validators: {
                        notEmpty: {
                            message: '* 이벤트 기간을 선택해주세요.'
                        }
                    }
                },
                contents: {
                    validators: {
                        notEmpty: {
                            message: '* 내용을 입력해주세요.'
                        }
                    }
                }
            },
            plugins: {
                trigger: new FormValidation.plugins.Trigger(),
                bootstrap: new FormValidation.plugins.Bootstrap5({
                    rowSelector: ".fv-row",
                    eleInvalidClass: "is-invalid",
                    eleValidClass: ""
                })
            }
        });

        ntdrop[0] = global.genDropzone("#dz0",
            {
                params: {
                    'ParentTable': 'EVENT',
                    'ParentType': 'BANNER',
                    'ParentUid': uid,
                }, hasOrder: false, isSecure: 'N', required: 'Y',
                acceptedExt: ['.jpg', '.jpeg', '.png'],
                maxFileCount: 2,
                dropzoneIdx: 'dz0',
                containerId : 'dz0Container',
                maxFileSize : 1,
                dropzoneIndex : 0,
                messages : {
                    empty : '* 배너 이미지를 등록해주세요.',
                    accept: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.',
                    count: '',
                    size: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.'
                }
            });

        ntdrop[1] = global.genDropzone("#dz1",
            {
                params: {
                    'ParentTable': 'EVENT',
                    'ParentType': 'FILE',
                    'ParentUid': uid,
                }, hasOrder: false, isSecure: 'N',
                acceptedExt: ['.mp4', '.mp3', '.pdf', '.jpg', '.jpeg', '.png', '.hwp', '.hwpx', '.ppt', '.pptx', '.doc', '.docx', '.zip'],
                maxFileCount: 2,
                dropzoneIdx: 'dz1',
                containerId : 'dz1Container',
                maxFileSize : 300,
                dropzoneIndex : 1,
                messages : {
                    accept: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.',
                    count: '',
                    size: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.'
                }
            });
    };

    let froalaKey = <%= froalaKey %>;
    $('.contents').froalaEditor({
        key: froalaKey,
        toolbarButtons: ['fullscreen', 'bold', 'italic', 'underline', 'strikeThrough', 'subscript', 'superscript', '|', 'fontFamily', 'fontSize', 'color', 'inlineClass', 'inlineStyle', 'paragraphStyle', 'lineHeight', '|', 'paragraphFormat', 'align', 'formatOL', 'formatUL', 'outdent', 'indent', 'quote', '-', 'insertLink', 'insertImage', 'insertTable', '|', 'specialCharacters', 'insertHR', 'selectAll', 'clearFormatting', '|', 'print', 'getPDF', 'spellChecker', 'help', 'html', '|', 'undo', 'redo'],
        imageUploadURL: '/froalaeditor/upload/Image',
        imageUploadParams: {editorUploadPath: '${editorUploadPath}'},
        imageDefaultWidth: 0,
        language: 'en',
        videoUpload: false,
        fileUpload: false,
        height: 300,
        requestHeaders: {
            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        }
    });

    let isSubmitting = false;

    let uid = document.getElementById('uid').value;
    let surveyQuestionIndices = document.querySelectorAll('[name="questionIndex"]');
    let surveyAnswerIndices = document.querySelectorAll('[name="answerIndex"]');
    let eventType = document.getElementById('eventType');

    function addFirstAnswers(questionIndex) {
        const answerListSize = ${not empty answerListSize ? answerListSize : [0]};
        addAnswer(questionIndex, answerListSize[questionIndex-1] + 1);
    }

    const makeData = () => {
        const checkBannerLocation = document.querySelectorAll('input[name="bannerLocation"]:checked');
        let params = {
            uid: document.getElementById('uid').value,
            eventIndex: document.getElementById('eventIndex').value,
            eventType: document.getElementById('eventType').value,
            title: document.getElementById('title').value,
            content: document.getElementById('contents') ? document.getElementById('contents').value : '',
            startDate: document.getElementById('startDate').value,
            endDate: document.getElementById('endDate').value,
            bannerLocation: Array.from(checkBannerLocation).map((ele) => { return ele.value; }),
            linkType: document.querySelector('input[name="linkType"]:checked').value,
            isOpen: document.querySelector('input[name="isOpen"]:checked').value,
            adminIndex: document.getElementById('adminIdx').value,
            adminId: document.getElementById('adminId').value,
        };

        if (params.eventType.includes('SURVEY')) {
            // 질문들을 배열에 저장
            const questions = [];
            const questionIndex = [];
            const answers = [];
            const eventSurveyAnswerIndices = [];
            let answerType;
            let answerCount;


            if (params.eventType === 'SURVEY_SHORT') {
                answerType = 'SINGLE';
                answerCount = 1;

            } else if (params.eventType === 'SURVEY_DUPLICATION') {
                answerType = 'MULTI';
                answerCount = document.getElementById('surveyAnswerCount').value;
            }

            for (let i = 0; i < document.querySelectorAll('[id^="questionDiv"] > div > div:nth-child(2) > input.question').length; i++) {
                const questionDiv = document.querySelectorAll('[id^="questionDiv"] > div > div:nth-child(2) > input.question')[i];
                const question = document.querySelectorAll('[id^="questionDiv"] > div > div:nth-child(2) > input.question')[i].value;
                const questionId = questionDiv.id.replace('question', '')

                const answerInputs = document.querySelectorAll('#questionDiv' + questionId + ' input.answer');
                const questionAnswers = [];

                // 각 답변 input 요소에 대해 반복
                answerInputs.forEach(answerInput => {
                    questionAnswers.push(answerInput.value);
                });

                answers.push(questionAnswers);
                questions.push(question);
            }

            let questionIndexDiv = document.querySelectorAll('[name="questionIndex"]');
            if (0 < questionIndexDiv.length) {
                for(let i = 0; i < questionIndexDiv.length; i++) {
                    const answerIndex = [];
                    questionIndex.push(questionIndexDiv[i].value);
                    let answerIndexDiv = questionIndexDiv[i].parentNode.parentNode.parentNode;
                    for(let j = 0; j < answerIndexDiv.querySelectorAll('[name="answerIndex"]').length; j++) {
                        answerIndex.push(answerIndexDiv.querySelectorAll('[name="answerIndex"]')[j].value);
                    }
                    eventSurveyAnswerIndices.push(answerIndex)
                }

                params.eventSurveyQuestionIndices = questionIndex;
                params.eventSurveyAnswerIndices = eventSurveyAnswerIndices;
            }

            // 배열을 params에 추가
            params.question = questions;
            params.answer = answers;
            params.answerType = answerType;
            params.answerCount = answerCount;

        }

        return params;
    };

    function initializeFlatpickr() {
        const startDateInput = document.getElementById('startDate');
        const endDateInput = document.getElementById('endDate');

        startFlatpickr = flatpickr(startDateInput, {
            dateFormat: 'Y-m-d',
            locale: 'ko',
            onChange: function (selectedDates) {
                if (selectedDates.length > 0) {
                    const maxDate = new Date(selectedDates[0]);
                    maxDate.setFullYear(maxDate.getFullYear() + 1);
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
                    const minDate = new Date(selectedDates[0]);
                    minDate.setFullYear(minDate.getFullYear() - 1);
                    startFlatpickr.set('minDate', minDate);
                    startFlatpickr.set('maxDate', selectedDates[0]);
                }
            }
        });
    }

    // window.onbeforeunload = function() {
    //     if (isModified) {
    //         return "변경 사항을 저장하지 않았습니다. 정말 지금 나가시겠습니까?";
    //     }
    // };

    function validateSurveyAndRemoveValidation(eventFv) {

        let surveyAnswerCount;

        let passType = true;

        if (eventType.value === 'SURVEY_DUPLICATION') {
            surveyAnswerCount = parseInt(document.querySelector('#surveyAnswerCount').value, 10);
            let questions = document.querySelectorAll('.question');
            for (let i = 0; i < questions.length; i++) {
                let answers = questions[i].parentElement.parentElement.parentElement.querySelectorAll('.answer');
                if (surveyAnswerCount <= answers.length) {
                    passType = true;
                } else {
                    passType = false;

                    // Add a custom validation field dynamically
                    eventFv.addField('survey', {
                        validators: {
                            callback: {
                                message: '* 문항별 설문 보기는 선택하신 “설문선택 개수” 이상으로 등록해주셔야합니다.',
                                callback: function () {
                                    return false; // Always fail the validation
                                }
                            }
                        }
                    });

                    // Temporarily create a hidden input to trigger validation
                    let hiddenInput = document.createElement('input');
                    hiddenInput.type = 'hidden';
                    hiddenInput.name = 'survey';
                    hiddenInput.value = answers.length;
                    document.getElementById('eventForm').appendChild(hiddenInput);

                    // Trigger validation and remove the hidden input afterward
                    eventFv.validateField('survey').then(function(status) {
                        document.querySelector('input[name="survey"]').remove();
                    });

                    break;

                    eventFv.validate();
                }
            }
        }

        // Remove the survey validation if passType is true
        if (passType) {
            if (eventFv.getElements('survey')) {
                eventFv.removeField('survey');
            }
        }

        return passType;
    }

    const save = async () => {
        // 전송 데이터 생성

        dropzoneCheck();

        if (eventType.value == 'SURVEY_DUPLICATION') {
            validateSurveyAndRemoveValidation(eventFv);
        }

        eventFv.validate().then(async function (status) {

            if (status === 'Valid') {
                if (dropzoneCheck()) {
                    uploadByDropzone(0);
                }
            }
        });
    }

    const saveFormData = () => {
        let chk = document.getElementById('eventIndex').value;
        chk ? modify() : saveEvent();
    }

    const saveEvent = async () => {
        if (isSubmitting) {
            return;
        }
        isSubmitting = true;

        // 전송 데이터 생성
        let data = makeData();

        try {
            const response = await fetch('/api/v1/customer/event', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            });

            const res = await response.json();

            if (res) {
                if (res.resultCode == 0) {
                    Swal.fire({
                        title: '등록 완료',
                        text: '등록되었습니다.',
                        icon: 'error',
                        confirmButtonText: '확인'
                    });
                    return false;
                }
                if (!res.uid) {
                    Swal.fire({
                        title: '등록 실패',
                        text: '등록 처리에 실패되었습니다. \n다시 시도해주세요.',
                        icon: 'error',
                        confirmButtonText: '확인'
                    });
                    return false;
                }
                Swal.fire({
                    title: '등록 완료',
                    text: '등록되었습니다.',
                    icon: 'success',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.href = '/customer/event/' + res.uid;
                    }
                })
            }
        } catch (Exception) {
            console.error(Exception);
        } finally {
            isSubmitting = false;
        }
    }

    const modify = async () => {
        if (isSubmitting) {
            return;
        }
        isSubmitting = true;

        // 전송 데이터 생성
        let data = makeData();

        try {
            let uid = document.getElementById('uid').value;
            const response = await fetch('/api/v1/customer/event/' + uid, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            });

            const res = await response.json();

            if (res) {
                if (res.resultCode == 0) {
                    let message = validMsg(res.data);
                    Swal.fire({
                        title: '등록 완료',
                        text: '등록되었습니다.',
                        icon: 'error',
                        confirmButtonText: '확인'
                    });
                    return false;
                }
                Swal.fire({
                    title: '등록 완료',
                    text: '등록되었습니다.',
                    icon: 'success',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.href = '/customer/event/' + res.uid;
                    }

                    if (eventType.value.includes('SURVEY')) {
                        // 'removeQuestion' 함수를 호출
                        for (const index of deleteQuestionIndexList) {
                            removeQuestionAll(index);
                        }
                        for (const index of deleteAnswerIndexList) {
                            removeAnswerAll(index);
                        }
                    }
                })
            }
        } catch (Exception) {
            console.error(Exception);
        } finally {
            isSubmitting = false;
        }
    }

    // BANNER_LOCATION 값을 가져와 배열로 변환
    let bannerLocations = '${event.bannerLocation}'.split(', ');

    // 체크박스 요소들을 가져옴
    let checkboxes = document.querySelectorAll('input[name="bannerLocation"]');

    // 각 체크박스의 선택 여부를 설정
    checkboxes.forEach(function(checkbox) {
        // 체크박스의 값이 bannerLocations 배열에 포함되어 있는지 확인
        if (bannerLocations.includes(checkbox.value)) {
            // 포함되어 있다면 체크
            checkbox.checked = true;
        } else {
            // 포함되어 있지 않다면 해제
            checkbox.checked = false;
        }
    });

    function removeQuestionFields() {
        const elements = eventFv.getFields();
        if (elements) {
            Object.keys(elements).forEach(fieldName => {
                if (fieldName.startsWith('question')) {
                    eventFv.removeField(fieldName);
                }
            });
        }

        if (eventFv.getElements('survey')) {
            eventFv.removeField('survey');
        }

        if (!eventFv.getElements('contents')) {
            eventFv.addField('contents', {
                validators: {
                    notEmpty: {
                        message: '* 내용을 입력해주세요.'
                    }
                }
            });
        }
    }

    let questionDefaultDivCount = 1; // questionDiv의 번호를 나타내는 변수
    let answerDefaultDivCount = 1;

    function changeForm(element) {
        let surveyDisplay = document.querySelector('.survey');
        let surveySelectDisplay = document.querySelector('.surveySelect');
        let contentDiv = document.querySelector('.contentDiv');
        let fileDiv = document.querySelector('.fileDiv');
        let surveyContainer = document.querySelector('#survey');
        let surveyQuestionCount = document.getElementById('surveyQuestionCount');
        let title = document.getElementById('title');
        let startDate = document.getElementById('startDate');
        let endDate = document.getElementById('endDate');

        function removeValidationMessages(fieldName) {
            const validationMessages = document.querySelectorAll(`[data-field="` + fieldName + `"]`);
            validationMessages.forEach(message => message.remove());
        }

        if (document.querySelector("#dropzoneImagedz0 > td.text-center > a")) {
            global.dropzoneDeleteFile(document.querySelector("#dropzoneImagedz0 > td.text-center > a"));
        }

        if (document.querySelector("#dropzoneImagedz1 > td.text-center > a")) {
            global.dropzoneDeleteFile(document.querySelector("#dropzoneImagedz1 > td.text-center > a"));
        }

        if (document.querySelector("#tab1 .contentDiv .fr-view").innerHTML != '') {
            document.querySelector("#tab1 .contentDiv .fr-view").innerHTML = '<p><br></p>';
        }

        uncheckAllBannerLocations();
        checkLinkTypeSelf();
        checkIsOpenNo();

        title.classList.remove('is-invalid');
        startDate.classList.remove('is-invalid');
        endDate.classList.remove('is-invalid');

        removeValidationMessages('title');
        removeValidationMessages('startDate');
        removeValidationMessages('endDate');

        if (title.value) {
            title.value = '';
        }

        if (startDate.value) {
            startDate.value = '';
            initializeFlatpickr();
        }

        if (endDate.value) {
            endDate.value = '';
            initializeFlatpickr();
        }

        // 첨부파일 영역은 이벤트 타입이 '일반', '참여' 일 때만 보임
        if (element.value == 'GENERAL' || element.value == 'PARTICIPATION') {
            fileDiv.style.display = 'block';
        } else {
            fileDiv.style.display = 'none';
        }

        // formValidation field에 question으로 시작되는 요소 있으면 모두 지울 것. 그리고 설문형 외에는 다 있는 contents는 다시 추가.
        removeQuestionFields();

        if (element.value.includes('SURVEY')) {
            contentDiv.style.display = 'none';
            surveyDisplay.style.display = 'block';
            if (element.value === 'SURVEY_SHORT') {
                surveySelectDisplay.style.display = 'none';
                surveyContainer.innerHTML = '';
                addQuestion(1);

                eventFv.addField('question1', {
                    validators: {
                        notEmpty: {
                            message: '* 설문 내용을 모두 입력해주세요.'
                        }
                    }
                });

                eventFv.addField('question1answer1', {
                    validators: {
                        notEmpty: {
                            message: '* 설문 내용을 모두 입력해주세요.'
                        }
                    }
                });

                if (eventFv.getElements('contents')) {
                    eventFv.removeField('contents');
                }
            } else if (element.value === 'SURVEY_DUPLICATION') {
                contentDiv.style.display = 'none';
                surveyContainer.innerHTML = '';
                surveySelectDisplay.style.display = 'block';
                surveyDisplay.style.display = 'block';
                changeQuestionCount(surveyQuestionCount.value);

                eventFv.addField('question1', {
                    validators: {
                        notEmpty: {
                            message: '* 설문 내용을 모두 입력해주세요.'
                        }
                    }
                });

                eventFv.addField('question1answer1', {
                    validators: {
                        notEmpty: {
                            message: '* 설문 내용을 모두 입력해주세요.'
                        }
                    }
                });

                eventFv.addField('question2', {
                    validators: {
                        notEmpty: {
                            message: '* 설문 내용을 모두 입력해주세요.'
                        }
                    }
                });

                eventFv.addField('question2answer1', {
                    validators: {
                        notEmpty: {
                            message: '* 설문 내용을 모두 입력해주세요.'
                        }
                    }
                });

                eventFv.addField('question3', {
                    validators: {
                        notEmpty: {
                            message: '* 설문 내용을 모두 입력해주세요.'
                        }
                    }
                });

                eventFv.addField('question3answer1', {
                    validators: {
                        notEmpty: {
                            message: '* 설문 내용을 모두 입력해주세요.'
                        }
                    }
                });
            }

            if (eventFv.getElements('contents')) {
                eventFv.removeField('contents');
            }

        } else {
            contentDiv.style.display = 'block';
            surveyDisplay.style.display = 'none';
            surveySelectDisplay.style.display = 'none';
        }
    }

    function changeQuestionCount(value) {

        let currentQuestionCount = document.querySelectorAll('.question');

        if (currentQuestionCount.length > value) {
            for (let i = currentQuestionCount.length; i > value; i--) {
                delQuestion(currentQuestionCount[i-1].parentNode.parentNode.parentNode);
            }
        }

        // currentQuestionCount 만큼 addQuestion 호출
        for (let i = currentQuestionCount.length; i < value; i++) {
            addQuestion(i+1);
        }

        document.querySelector('#surveyQuestionCount').value = value;
        document.querySelector("#select2-surveyQuestionCount-container").innerHTML = value;

    }

    function addQuestion(count) {

        if (document.querySelectorAll('.question').length < 10) {

            // 새로운 문항을 담을 div 요소 생성
            var newQuestionDiv = document.createElement('div');
            newQuestionDiv.id = 'questionDiv' + count; // 새로운 div의 id 설정
            newQuestionDiv.className = 'col-lg-12 form-label text-dark';

            // 새로운 문항의 내용을 구성
            var questionContent;

            if (count == 1) {
                questionContent = `
        <div class="col-lg-12 form-label text-dark pt-3 me-5 row">
            <div class="col-1 d-flex justify-content-center align-items-center">
                ` + count + '. ' + `
            </div>
            <div class="col-9 fv-row fv-plugins-icon-container">
                <input type="text" id="question` + count + `" name="question` + count + `" placeholder="문항 입력" class="question form-control" value="" maxlength="100">
            </div>
            <div class="col-2">
                <button type="button" class="btn btn-light-dark me-2" style="background-color: #5E6278; color: #FFFFFF" onclick="addQuestion(2);">문항 추가 +</button>
            </div>
        </div>
        <div class="col-12 form-label text-dark row">
            <div class="col-lg-2 form-label text-dark text-end pt-3 ps-5 d-flex justify-content-center align-items-center">
                ` + 1 + `) <!-- 이미 존재하는 문항의 개수 -->
            </div>
            <div class="col-lg-8 form-label text-dark pt-3 fv-row fv-plugins-icon-container">
                <input type="text" id="question` + count + `answer` + answerDefaultDivCount + `" name="question` + count + `answer` + answerDefaultDivCount + `" placeholder="보기 입력" class="answer form-control" value="" maxlength="100">
            </div>
            <div class="col-lg-2 pt-3">
                <button type="button" class="btn btn-light-dark me-2" style="background-color: #343a40; color: #FFFFFF" onclick="addAnswer(` + count + ',' + 2 + `);validateSurveyAndRemoveValidation(eventFv);">추가 +
                </button>
            </div>
        </div>
    `;
            } else {
                questionContent = `
        <div class="col-lg-12 form-label text-dark pt-3 me-5 row">
            <div class="col-1 d-flex justify-content-center align-items-center">
                ` + count + '. ' + `
            </div>
            <div class="col-9 fv-row fv-plugins-icon-container">
                <input type="text" id="question` + count + `" name="question` + count + `" placeholder="문항 입력" class="question form-control" value="" maxlength="100">
            </div>
            <div class="col-2">
                <button type="button" class="btn btn-light-dark me-2" style="background-color: #5E6278; color: #FFFFFF" onclick="delQuestion(questionDiv` + count + `)">문항 삭제 -</button>
            </div>
        </div>
        <div class="col-12 form-label text-dark row">
            <div class="col-lg-2 form-label text-dark text-end pt-3 ps-5 d-flex justify-content-center align-items-center">
                ` + 1 + `) <!-- 이미 존재하는 문항의 개수 -->
            </div>
            <div class="col-lg-8 form-label text-dark pt-3 fv-row fv-plugins-icon-container">
                <input type="text" id="question` + count + `answer` + answerDefaultDivCount + `" name="question` + count + `answer` + answerDefaultDivCount + `" placeholder="보기 입력" class="answer form-control" value="" maxlength="100">
            </div>
            <div class="col-lg-2 pt-3">
                <button type="button" class="btn btn-light-dark me-2" style="background-color: #343a40; color: #FFFFFF" onclick="addAnswer(` + count + ',' + 2 + `);validateSurveyAndRemoveValidation(eventFv);">추가 +
                </button>
            </div>
        </div>
    `;
            }

            // 새로운 문항의 내용을 새로 생성한 div에 추가
            newQuestionDiv.innerHTML = questionContent;

            // 문항을 추가할 div 요소를 questionDiv에 추가
            document.getElementById('survey').appendChild(newQuestionDiv);

            eventFv.addField('question' + count, {
                validators: {
                    notEmpty: {
                        message: '* 설문 내용을 모두 입력해주세요.'
                    }
                }
            }, {
                // 플러그인 설정 객체
                trigger: new FormValidation.plugins.Trigger(),
                bootstrap: new FormValidation.plugins.Bootstrap5({
                    rowSelector: ".fv-row",
                    eleInvalidClass: "is-invalid",
                    eleValidClass: ""
                })
            });

            eventFv.addField('question' + count + 'answer1', {
                validators: {
                    notEmpty: {
                        message: '* 설문 내용을 모두 입력해주세요.'
                    }
                }
            }, {
                // 플러그인 설정 객체
                trigger: new FormValidation.plugins.Trigger(),
                bootstrap: new FormValidation.plugins.Bootstrap5({
                    rowSelector: ".fv-row",
                    eleInvalidClass: "is-invalid",
                    eleValidClass: ""
                })
            });

            // questionDiv의 번호를 증가시킴
            count++;

            document.querySelector('#questionDiv1 button').onclick = function () {
                addQuestion(count); // 새로운 파라미터로 addQuestion 함수 호출
            };

            reorderQuestionIndexes();
        }
    }

    function addAnswer(questionCount, count) {

        if (document.querySelectorAll('#questionDiv' + questionCount + '> :nth-child(n + 2) > div:nth-child(1)').length < 10) {
            // 새로운 문항을 담을 div 요소 생성
            var newQuestionDiv = document.createElement('div');
            newQuestionDiv.className = 'col-12 form-label text-dark row';

            // 새로운 문항의 내용을 구성
            var questionContent = `
        <div class="col-lg-2 form-label text-dark text-end pt-3 ps-5 d-flex justify-content-center align-items-center">
            ` + count + `) <!-- 이미 존재하는 문항의 개수 -->
        </div>
        <div class="col-lg-8 form-label text-dark pt-3 fv-row fv-plugins-icon-container">
            <input type="text" id="question` + questionCount + `answer` + count + `" name="question` + questionCount + `answer` + count + `" placeholder="보기 입력" class="answer form-control" value="" maxlength="100">
        </div>
        <div class="col-lg-2 form-label text-dark pt-3">
            <button type="button" class="btn btn-light-dark me-2" style="background-color: #959ea9; color: #FFFFFF" onclick="delAnswer(question` + questionCount + `answer` + count + `)">삭제 -</button>
        </div>
    `;

            // 새로운 문항의 내용을 새로 생성한 div에 추가
            newQuestionDiv.innerHTML = questionContent;

            // 문항을 추가할 div 요소를 questionDiv에 추가
            document.getElementById('questionDiv' + questionCount).appendChild(newQuestionDiv);

            eventFv.addField('question' + questionCount + 'answer' + count, {
                validators: {
                    notEmpty: {
                        message: '* 설문 내용을 모두 입력해주세요.'
                    }
                }
            }, {
                // 플러그인 설정 객체
                trigger: new FormValidation.plugins.Trigger(),
                bootstrap: new FormValidation.plugins.Bootstrap5({
                    rowSelector: ".fv-row",
                    eleInvalidClass: "is-invalid",
                    eleValidClass: ""
                })
            });

            count++;
            document.querySelector('#questionDiv' + questionCount + ' > div:nth-child(2) button').onclick = function () {
                addAnswer(questionCount, count); // 새로운 파라미터로 addQuestion 함수 호출
                validateSurveyAndRemoveValidation(eventFv);
            };

            for (var i = 0; i < document.querySelectorAll('#questionDiv' + questionCount + ' .answer').length; i++) {
                document.querySelectorAll('#questionDiv' + questionCount + '> :nth-child(n + 2) > div:nth-child(1)')[i].innerText = (i + 1) + ')'
            }
        }
    }

    function delAnswer(id) {
        let parentDivId = '#' + id.parentNode.parentNode.parentNode.id;

        if (eventFv.getElements(id.name)) {
            eventFv.removeField(id.name)
        }

        id.parentNode.parentNode.remove();

        for(var i = 0; i < document.querySelectorAll(parentDivId + ' .answer').length; i++) {
            document.querySelectorAll(parentDivId + '> :nth-child(n + 2) > div:nth-child(1)')[i].innerText = (i+1) + ')'
        }

        validateSurveyAndRemoveValidation(eventFv);
    }

    function delQuestion(id) {
        for (var i = 0; i < document.querySelector('#' + id.id).querySelectorAll('input').length; i++) {
            eventFv.removeField(document.querySelector('#' + id.id).querySelectorAll('input')[i].name);
        }

        id.remove();

        for(var i = 0; i < document.querySelectorAll('.question').length; i++) {
            document.querySelectorAll('[id^="questionDiv"] > div.col-lg-12.form-label.text-dark.pt-3.me-5.row > div.col-1.d-flex.justify-content-center.align-items-center')[i].innerText = (i+1) + '.'
        }

        validateSurveyAndRemoveValidation(eventFv);
    }

    function reorderQuestionIndexes() {
        // 질문 번호 재정렬
        for (var i = 0; i < document.querySelectorAll('.question').length; i++) {
            document.querySelectorAll('[id^="questionDiv"] > div.col-lg-12.form-label.text-dark.pt-3.me-5.row > div.col-1.d-flex.justify-content-center.align-items-center')[i].innerText = (i + 1) + '.'
        }
    }

    let deleteQuestionIndexList = [];
    let deleteAnswerIndexList = [];

    async function removeQuestion(eventSurveyQuestionIndex, div) {
        let questionDivCount = div.parentNode.parentNode.parentNode.id;

        if (!deleteQuestionIndexList.includes(eventSurveyQuestionIndex)) {
            deleteQuestionIndexList.push(eventSurveyQuestionIndex);
        }

        for (var i = 0; i < document.querySelectorAll('#' + questionDivCount + ' .answer').length; i++) {
            if (!deleteAnswerIndexList.includes(document.querySelectorAll('#' + questionDivCount + ' [name="answerIndex"]')[i].value)) {
                deleteAnswerIndexList.push(document.querySelectorAll('#' + questionDivCount + ' [name="answerIndex"]')[i].value);
            }
        }

        document.querySelector('#' + questionDivCount).remove();

        reorderQuestionIndexes();
    }

    // 보기 하나씩 삭제
    async function removeAnswer(eventSurveyAnswerIndex, div) {
        let id = div.parentNode.parentNode.parentNode.id;

        if (!deleteAnswerIndexList.includes(eventSurveyAnswerIndex)) {
            deleteAnswerIndexList.push(eventSurveyAnswerIndex);
        }

        div.parentNode.parentNode.remove();

        for (var i = 0; i < document.querySelectorAll('#' + id + ' .answer').length; i++) {
            document.querySelectorAll('#' + id + ' > :nth-child(n + 2) > div:nth-child(1)')[i].innerText = (i + 1) + ')'
        }
    }

    async function removeQuestionAll(eventSurveyQuestionIndex) {
        try {
            const response = await fetch('/api/v1/customer/event/' + uid + '/survey/' + eventSurveyQuestionIndex, {
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

    async function removeAnswerAll(eventSurveyAnswerIndex) {
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

    function uncheckAllBannerLocations() {
        checkboxes.forEach(checkbox => {
            checkbox.checked = false;
        });
    }

    function checkLinkTypeSelf() {
        // Select the radio button with value '_self' and set it as checked
        let radioSelf = document.querySelector('input[name="linkType"][value="_self"]');
        if (radioSelf) {
            radioSelf.checked = true;
        }
    }

    function checkIsOpenNo() {
        // Select the radio button with value '_self' and set it as checked
        let radioOpen = document.querySelector('input[name="isOpen"][value="N"]');
        if (radioOpen) {
            radioOpen.checked = true;
        }
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

</style>
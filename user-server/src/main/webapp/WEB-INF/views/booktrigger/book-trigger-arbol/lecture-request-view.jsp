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
                    <input type="hidden" name="uid" id="uid" value="${lectureRequest.uid}"/>
                    <input type="hidden" id="regDate" />
                    <div class="container-fluid">
                        <!-- 본문 내용 START -->
                        <form>
                            <div class="card mb-5 mb-xl-10">
                                <div class="card-header border-0 pt-5">
                                    <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                        강연신청
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="row mb-8">
                                        <label class="col-lg-2 fw-bolder w-sm-175px">희망 작가명</label>
                                        <div class="col-lg-3">
                                            <c:out value="${lectureRequest.hopeWriter}"/>
                                        </div>
                                        <label class="col-lg-2 fw-bolder w-sm-175px">신청일시</label>
                                        <div class="col-lg-3">
                                            <c:out value="${lectureRequest.regDate}"/>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <label class="col-lg-2 fw-bolder w-sm-175px">도서명</label>
                                        <div class="col-lg-9 d-flex align-items-center">
                                            <c:out value="${lectureRequest.bookTitle}"/>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <label class="col-lg-2 fw-bolder w-sm-175px">강연 주제</label>
                                        <div class="col-lg-9 d-flex align-items-center">
                                            <c:out value="${lectureRequest.lectureTheme}"/>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <label class="col-lg-2 fw-bolder w-sm-175px">강연 대상</label>
                                        <div class="col-lg-9 d-flex align-items-center">
                                            <c:out value="${lectureRequest.lectureTarget}"/>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <label class="col-lg-2 fw-bolder w-sm-175px">강연 형식</label>
                                        <div class="col-lg-9 d-flex align-items-center">
                                            <c:out value="${lectureRequest.lectureType}"/>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <label class="col-lg-2 fw-bolder w-sm-175px">참석 인원</label>
                                        <div class="col-lg-9 d-flex align-items-center">
                                            <c:out value="${lectureRequest.personnel}"/> 명
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <label class="col-lg-2 fw-bolder w-sm-175px">희망 일시</label>
                                        <div class="col-lg-9">
                                            <div class="row mb-3">
                                                <label class="col-lg-1 fw-bolder w-sm-80px">1 지망</label>
                                                <div class="col-lg-9">
                                                    <c:out value="${lectureRequest.hopeDate1}"/>(<c:out value="${lectureRequest.dayOfWeek1}"/>) <c:out value="${lectureRequest.hopeStartTime1}"/> <c:out value="${lectureRequest.hopeEndTime1}"/>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <label class="col-lg-1 fw-bolder w-sm-80px">2 지망</label>
                                                <div class="col-lg-9">
                                                    <c:if test="${not empty lectureRequest.hopeDate2}">
                                                        <c:out value="${lectureRequest.hopeDate2}"/>(<c:out value="${lectureRequest.dayOfWeek2}"/>) <c:out value="${lectureRequest.hopeStartTime2}"/> <c:out value="${lectureRequest.hopeEndTime2}"/>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <label class="col-lg-1 fw-bolder w-sm-80px">3 지망</label>
                                                <div class="col-lg-9">
                                                    <c:if test="${not empty lectureRequest.hopeDate3}">
                                                        <c:out value="${lectureRequest.hopeDate3}"/>(<c:out value="${lectureRequest.dayOfWeek3}"/>) <c:out value="${lectureRequest.hopeStartTime3}"/> <c:out value="${lectureRequest.hopeEndTime3}"/>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <label class="col-lg-2 fw-bolder w-sm-175px">신청 기관명</label>
                                        <div class="col-lg-9 d-flex align-items-center">
                                            <c:out value="${lectureRequest.applicationOrganization}"/>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <label class="col-lg-2 fw-bolder w-sm-175px">강연 장소</label>
                                        <div class="col-lg-9 d-flex align-items-center">
                                            <c:out value="${lectureRequest.place}"/>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <label class="col-lg-2 fw-bolder w-sm-175px">강연료</label>
                                        <div class="col-lg-9 d-flex align-items-center">
                                            <c:out value="${lectureRequest.price}"/> 원
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <label class="col-lg-2 fw-bolder w-sm-175px">신청자명</label>
                                        <div class="col-lg-9 d-flex align-items-center">
                                            <c:out value="${lectureRequest.applicantName}"/>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <label class="col-lg-2 fw-bolder w-sm-175px">신청자 연락처</label>
                                        <div class="col-lg-9">
                                            <c:out value="${lectureRequest.applicantPhoneNo}"/>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <label class="col-lg-2 fw-bolder w-sm-175px">신청자 이메일</label>
                                        <div class="col-lg-9">
                                            <c:out value="${lectureRequest.applicantEmail}"/>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <label class="col-lg-2 fw-bolder w-sm-175px">요청 사항</label>
                                        <div class="col-lg-9">
                                            <c:out value="${lectureRequest.content}"/>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <label class="col-lg-2 fw-bolder w-sm-175px">동의</label>
                                        <div class="col-lg-9">
                                            전체 동의 완료
                                        </div>
                                    </div>
                                
                                </div>
                                <div class="card-footer" id="footerIdx">
                                    <div class="row">
                                        <div id="listGroup" class="col-3">
                                            <button type="button" class="btn btn-light-primary" style="background-color: #343a40; color: #FFFFFF" onclick="history.back()">목록</button>
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
<script type="text/javascript">
</script>

<style>
    .col-lg-15 {
        flex: 0 0 auto;
        width: 10%;
    }


</style>
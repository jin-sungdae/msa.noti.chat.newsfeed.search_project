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
                    <input type="hidden" name="uid" id="uid" value="${list.uid}"/>
                    <input type="hidden" name="adminId" id="adminId" value="${list.adminId}"/>
                    <input type="hidden" name="adminIdx" id="adminIdx" value="${list.adminIndex}"/>
                    <input type="hidden" name="account" id="account" value ="${account}" />
                    <input type="hidden" id="chUid" />
                    <input type="hidden" id="regDate" />
                    <div class="container-fluid">
                        <!-- 본문 내용 START -->
                        <form>
                            <div class="card mb-5 mb-xl-10">
                                <div class="card-header border-0 pt-5">
                                    <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                        기본 정보
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">회원구분</label>
                                            </div>

                                            <div class="col-lg-4 row">
                                                <div id="userType" class="col-lg-4 form-label text-dark pt-3 d-flex align-items-center justify-content-start">
                                                    <c:out value="${data.user.getUserTypeString()}"/>
                                                </div>
                                                <div id="selectUserType" class="col-lg-4" style="display: none;">
                                                    <select
                                                            id="subSelectUserType"
                                                            class="form-select form-select-solid"
                                                            name="userType"
                                                            data-control="select2"
                                                            data-hide-search="true"
                                                    >
                                                        <option value="3005" ${data.user.userType eq '3005' ? 'selected' : ''}>일반</option>
                                                        <option value="3002" ${data.user.userType eq '3002' ? 'selected' : ''}>학생</option>
                                                        <option value="3004" ${data.user.userType eq '3004' ? 'selected' : ''}>학부모</option>
                                                        <option value="3003" ${data.user.userType eq '3003' ? 'selected' : ''}>선생님</option>
                                                        <option value="3006" ${data.user.userType eq '3006' ? 'selected' : ''}>학원선생님</option>
                                                        <%--<option value="2001" ${data.user.userType eq '관리자' ? 'selected' : ''}>관리자<
                                                        /option>--%>
                                                    </select>
                                                </div>
                                                <div id="userTypeChange" class="col-lg-4" style="display: none;">
                                                    <button
                                                            data-uid="${data.user.uid}"
                                                            type="button"
                                                            class="btn btn-m btn-dark font-weight-bold text-white"
                                                            onclick="userTypeChange(this)"
                                                    >
                                                        변경
                                                    </button>
                                                </div>

                                            </div>
                                            <c:if test="${data.user.getUserTypeString() eq '선생님'}">
                                                <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">교사인증 상태</label>
                                                </div>
                                                <div class="col-lg-4 row">

                                                    <div class="col-lg-4 form-label text-dark pt-3 d-flex justify-content-center align-items-center">
                                                        <c:out value="${data.userDetail.getTeacherCertificationStatusString()}"/>
                                                    </div>
                                                    <c:if test="${not empty data.userDetail.teacherCertificationType}">
                                                        <div class="col-lg-6 d-flex justify-content-start align-items-center">
                                                            <a href="javascript:void(0)" class="btn btn-secondary" style="color: #181c32; background-color : #fff3cd" onclick="goCertificationPage();">인증상태 변경</a>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </c:if>
                                        </div>





                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">이름</label>
                                            </div>

                                            <div class="col-lg-8">

                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                    <c:out value="${data.user.userName}"/>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">아이디</label>
                                            </div>
                                            <div class="col-lg-8">

                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                    <c:out value="${data.user.userId}"/>
                                                </div>


                                            </div>
                                        </div>
                                    </div>

                                    <div id="password" class="row mb-8" style="display: none">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label id="passwordText" class="col-lg-12 form-label fw-bolder text-dark pt-3">비밀번호</label>
                                            </div>
                                            <div class="col-lg-8" id="passwordBtn">

                                                <div class="col-lg-6">
                                                    <button
                                                            type="button"
                                                            class="btn btn-m btn-dark font-weight-bold text-white"
                                                            onclick="passwordChange()"
                                                    >
                                                        비밀번호 변경
                                                    </button>
                                                </div>


                                            </div>
                                            <div id="passwordChangeContainer" class="col-lg-8" style="display: none;">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">생년월일</label>
                                            </div>
                                            <div class="col-lg-8">

                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                    <c:out value="${data.user.birthday}"/>
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">휴대폰번호</label>
                                            </div>
                                            <div class="col-lg-8">

                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                    <c:out value="${data.user.decPhoneNo}"/>
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">이메일 주소</label>
                                            </div>
                                            <div class="col-lg-8">

                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                    <c:out value="${data.user.decEmail}"/>
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">주소</label>
                                            </div>
                                            <div class="col-lg-8">

                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                    <c:out value="${data.user.address1} ${data.user.address2}"/>
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">SNS 계정 연동</label>
                                            </div>
                                            <div class="col-lg-8">
                                                <c:forEach var="sns" items="${data.userSNSAccounts}">
                                                    <p>${sns.snsType} : ${sns.regDate} 연결완료 (이메일: ${sns.decEmail})</p>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <c:if test="${data.user.getUserTypeString() eq '학생' || data.user.getUserTypeString() eq '선생님' || data.user.getUserTypeString() eq '학원선생님'}">
                                <div class="card mb-5 mb-xl-10">
                                    <div id=info">
                                        <div class="card-header card-header border-0 pt-5">
                                            <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                                <c:if test="${data.user.getUserTypeString() eq '학생' || data.user.getUserTypeString() eq '선생님'}">
                                                    학교 정보
                                                </c:if>
                                                <c:if test="${data.user.getUserTypeString() eq '학원선생님'}">
                                                    학원 정보
                                                </c:if>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 ">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3">
                                                            <c:if test="${data.user.getUserTypeString() eq '학생' || data.user.getUserTypeString() eq '선생님'}">
                                                                학교명
                                                            </c:if>
                                                            <c:if test="${data.user.getUserTypeString() eq '학원선생님'}">
                                                                학원명
                                                            </c:if>
                                                        </label>
                                                    </div>
                                                    <div class="col-lg-8">
                                                        <div class="col-lg-12 form-label text-dark pt-3">
                                                            <c:out value="${data.userDetail.name}"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 ">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3">
                                                            <c:if test="${data.user.getUserTypeString() eq '학생' || data.user.getUserTypeString() eq '선생님'}">
                                                                학교 주소
                                                            </c:if>
                                                            <c:if test="${data.user.getUserTypeString() eq '학원선생님'}">
                                                                학원 지역
                                                            </c:if>
                                                        </label>
                                                    </div>
                                                    <div class="col-lg-8">

                                                        <div class="col-lg-12 form-label text-dark pt-3">
                                                            <c:out value="${data.userDetail.address1} ${data.userDetail.address2}"/>
                                                        </div>


                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 ">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3">
                                                            <c:if test="${data.user.getUserTypeString() eq '학생' || data.user.getUserTypeString() eq '선생님'}">
                                                                학교 분류
                                                            </c:if>
                                                            <c:if test="${data.user.getUserTypeString() eq '학원선생님'}">
                                                                학원 사업자번호
                                                            </c:if>
                                                        </label>
                                                    </div>
                                                    <div class="col-lg-8">

                                                        <div class="col-lg-12 form-label text-dark pt-3">
                                                            <c:if test="${data.user.getUserTypeString() eq '학생' || data.user.getUserTypeString() eq '선생님'}">
                                                                <c:out value="${data.userDetail.schoolType}" />
                                                            </c:if>
                                                            <c:if test="${data.user.getUserTypeString() eq '학원선생님'}">
                                                                <c:out value="${data.userDetail.academyBusinessNumber}" />
                                                            </c:if>
                                                        </div>


                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 ">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3">
                                                            <c:if test="${data.user.getUserTypeString() eq '학생' || data.user.getUserTypeString() eq '선생님'}">
                                                                학년
                                                            </c:if>
                                                            <c:if test="${data.user.getUserTypeString() eq '학원선생님'}">
                                                                개인과외교습자 신고번호
                                                            </c:if>
                                                        </label>
                                                    </div>
                                                    <div class="col-lg-8">

                                                        <div class="col-lg-12 form-label text-dark pt-3">
                                                            <c:if test="${data.user.getUserTypeString() eq '학생' || data.user.getUserTypeString() eq '선생님'}">
                                                                <c:out value="${data.userDetail.schoolGrade}" />
                                                            </c:if>
                                                            <c:if test="${data.user.getUserTypeString() eq '학원선생님'}">
                                                                <c:out value="${data.userDetail.tutorReportNumber}" />
                                                            </c:if>
                                                        </div>


                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3">
                                                            <c:if test="${data.user.getUserTypeString() eq '학생' || data.user.getUserTypeString() eq '선생님'}">
                                                                관심과목
                                                            </c:if>
                                                            <c:if test="${data.user.getUserTypeString() eq '학원선생님'}">
                                                                담당과목
                                                            </c:if>
                                                        </label>
                                                    </div>
                                                    <div class="col-lg-8">

                                                        <div class="col-lg-12 form-label text-dark pt-3">
                                                            <c:out value="${data.userDetail.subjectName}"/>
                                                        </div>


                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>


                            <div class="card mb-5 mb-xl-10">
                                <div id="option">
                                    <div class="card-body">
                                        <div class="row mb-8">
                                            <div class="col-sm-12 row">
                                                <div class="col-sm-1 ">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">가입방식</label>
                                                </div>
                                                <div class="col-sm-2">
                                                    <div class="col-lg-12 form-label text-dark pt-3">
                                                        <c:out value="${data.user.joinRoot}"/>
                                                    </div>
                                                </div>
                                                <div class="col-sm-2 ">
                                                    <label class="col-lg-10 form-label fw-bolder text-dark pt-3">최초 가입 일시</label>
                                                </div>
                                                <div class="col-sm-2">
                                                    <div class="col-lg-12 form-label text-dark pt-3">
                                                        <c:out value="${data.user.regDate}"/>
                                                    </div>
                                                </div>
                                                <div class="col-sm-2">
                                                    <label class="col-lg-10 form-label fw-bolder text-dark pt-3">최종 로그인 일시</label>
                                                </div>
                                                <div class="col-sm-2">
                                                    <div class="col-lg-12 form-label text-dark pt-3">
                                                        <c:out value="${data.user.loginDate}"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-sm-1 ">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">약관동의(필수)</label>
                                                </div>
                                                <div class="col-sm-2">
                                                    <div class="col-lg-12 form-label text-dark pt-3">
                                                        전체 동의
                                                    </div>
                                                </div>
                                                <div class="col-sm-2 ">
                                                    <label class="col-lg-10 form-label fw-bolder text-dark pt-3">약관동의(선택)</label>
                                                </div>
                                                <div class="col-lg-3 row">

                                                    <div class="row">
                                                        <div class="col-lg-3">

                                                            <div class="form-check form-check-warning form-check-solid pt-3">
                                                                <input
                                                                        class="form-check-input"
                                                                        type="checkbox"
                                                                        value="Y"
                                                                        id="isSMS"
                                                                ${data.user.isSMS eq 'Y' ? 'checked' : ''}
                                                                        name="isSMS"
                                                                        disabled
                                                                />
                                                                <label class="form-check-label form-label text-dark" for="isSMS">
                                                                    SMS
                                                                </label>
                                                            </div>

                                                        </div>
                                                        <div class="col-lg-6">

                                                            <div class="form-check form-check-warning form-check-solid pt-3">
                                                                <input
                                                                        class="form-check-input"
                                                                        type="checkbox"
                                                                        value=""
                                                                        id="isMailing"
                                                                ${data.user.isMailing eq 'Y' ? 'checked' : ''}
                                                                        name="isMailing"
                                                                        disabled
                                                                />
                                                                <label class="form-check-label form-label text-dark" for="isMailing">
                                                                    이메일
                                                                </label>
                                                            </div>

                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-1 ">
                                                    <label id="textBookOrderCountText" class="form-label fw-bolder text-dark pt-3">교과서 주문수량</label>
                                                </div>
                                                <div class="col-lg-4">

                                                    <div class="col-lg-6">
                                                        <select
                                                                id="textbookOrderCount"
                                                                name="textbookOrderCount"
                                                                class="form-select form-select-solid"
                                                                data-control="select2"
                                                                data-hide-search="true"
                                                                disabled
                                                        >
                                                            <option value="3" ${data.user.textbookPurchaseAvailableQuantity eq '3' ? 'selected' : ''}>3개(기본)</option>
                                                            <option value="0" ${data.user.textbookPurchaseAvailableQuantity eq '0' ? 'selected' : ''}>0개</option>
                                                            <option value="10" ${data.user.textbookPurchaseAvailableQuantity eq '10' ? 'selected' : ''}>~10개</option>
                                                            <option value="20" ${data.user.textbookPurchaseAvailableQuantity eq '20' ? 'selected' : ''}>~20개</option>
                                                            <option value="30" ${data.user.textbookPurchaseAvailableQuantity eq '30' ? 'selected' : ''}>~30개</option>
                                                            <option value="40" ${data.user.textbookPurchaseAvailableQuantity eq '40' ? 'selected' : ''}>~40개</option>
                                                            <option value="50" ${data.user.textbookPurchaseAvailableQuantity eq '50' ? 'selected' : ''}>~50개</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-sm-1 ">
                                                    <label class="col-lg-10 form-label fw-bolder text-dark pt-3">수정자</label>
                                                </div>
                                                <div class="col-sm-2">
                                                    <div class="col-lg-12 form-label text-dark pt-3">
                                                        <c:if test="${not empty data.user.adminName}">
                                                            <c:out value="${data.user.adminName}"/>(<c:out value="${data.user.department}"/>)
                                                        </c:if>
                                                    </div>
                                                </div>
                                                <div class="col-lg-1 ">
                                                    <label class="col-lg-10 form-label fw-bolder text-dark pt-3">수정일시</label>
                                                </div>
                                                <div class="col-lg-3">
                                                    <div class="col-lg-12 form-label text-dark pt-3">
                                                        <c:out value="${data.user.modDate}"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer" id="footerIdx">
                                        <div class="row">
                                            <div id="listGroup" class="col-3">
                                                <button type="button" class="btn btn-light-dark" style="background-color: #343a40; color: #FFFFFF" onclick="goList()">목록</button>
                                            </div>
                                            <div id="editGroup" class="col-9 d-flex justify-content-end">
                                                <button type="button" class="btn btn-light-dark me-2"  onclick="withDraw()">
                                                    탈퇴 처리
                                                </button>
                                                <button type="button" class="btn btn-light-warning" style="background-color: #ffcd39; color: #181C32" onclick="modify()">
                                                    수정
                                                </button>
                                            </div>
                                            <div id="saveGroup" style="display: none;">
                                                <button type="button" id="cancelBtn" class="btn btn-light-warning me-2" style="background-color: #fff3cd; color: #181C32" onclick="cancel()">
                                                    취소
                                                </button>
                                                <button
                                                        data-uid="${data.user.uid}"
                                                        type="button"
                                                        class="btn btn-warning"
                                                        style="background-color: #ffcd39; color: #181C32"
                                                        onclick="save(this)"
                                                >
                                                    저장
                                                </button>
                                            </div>
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

<form name="searchForm" id="searchForm">
    <input type="hidden" name="sdate" value="${reqMap.sdate}" />
    <input type="hidden" name="edate" value="${reqMap.edate}" />
    <input type="hidden" name="userType" value="${reqMap.userType}" />
    <input type="hidden" name="joinRoot" value="${reqMap.joinRoot}" />
    <input type="hidden" name="search" value="${reqMap.search}" />
    <input type="hidden" name="perPage" value="${reqMap.perPage}" />
    <input type="hidden" name="page" value="${reqMap.page}" />
</form>

</body>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script type="text/javascript">

    /***************************************************** INIT ***************************************/




    /**************************************************** UTILS ***************************************/

    window.onbeforeunload = function() {
        if (isModified) {
            return "변경 사항을 저장하지 않았습니다. 정말 지금 나가시겠습니까?";
        }
    };

    const strongPassword = (value) => {
        return /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,12}$/.test(value);
    }

    function formatDate(strDate) {
        let date = new Date(strDate);
        let year = date.getFullYear();
        let month = ("0" + (date.getMonth() + 1)).slice(-2);
        let day = ("0" + date.getDate()).slice(-2);
        let hour = ("0" + date.getHours()).slice(-2);
        let minute = ("0" + date.getMinutes()).slice(-2);
        let second = ("0" + date.getSeconds()).slice(-2);

        return year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;
    }

    function onInputChange() {
        isModified = true;
    }

    function goCertificationPage() {
        window.location.href = '/user/teacher-auth-form?uid=' + '${param.uid}';
    }

    /********************************************************************** POST ************************************************/
    let isSubmitting = false;

    async function save(element) {
        if (isSubmitting) {
            return;
        }
        isSubmitting = true;
        let uid = '${param.uid}';
        let data = {
            isSMS: document.getElementById('isSMS').checked ? 'Y' : 'N',
            isMailing: document.getElementById('isMailing').checked ? 'Y' : 'N',
            textbookOrderCount: document.getElementById('textbookOrderCount').value,
        }


        try {
            const response = await fetch('/api/v1/user/' + uid + '/etc', {
                method: 'PATCH',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            });

            const result = await response.json();

            if (result.data == 'true') {
                Swal.fire({
                    title: '등록 완료',
                    text: '등록되었습니다.',
                    icon: 'success',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.reload();
                    }
                })
            } else if (result.data == 'false') {
                Swal.fire({
                    title: '등록 실패',
                    text: '등록 처리에 실패되었습니다. \n다시 시도해주세요.',
                    icon: 'error',
                    confirmButtonText: '확인'
                })
            }
        } catch (Exception) {
            console.error(Exception);
        } finally {
            isSubmitting = false;
        }
    }

    /******************************************************************* PUT ************************************************/

    let isModified = false;

    async function withDraw() {
        console.log('qweqweqw');
        let uid = '${param.uid}';

        try {
            const response = await fetch('/api/v1/user/' + uid + '/withdraw', {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({})
            });

            const result = await response.json();

            if (result.data == 'true') {
                Swal.fire({
                    title: '탈퇴처리 완료',
                    text: '탈퇴처리 되었습니다.',
                    icon: 'success',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        history.back();
                    }
                })
            } else if (result.data == 'false') {
                Swal.fire({
                    title: '탈퇴처리 실패',
                    text: '탈퇴 처리에 실패되었습니다. \n다시 시도해주세요.',
                    icon: 'error',
                    confirmButtonText: '확인'
                })
            }
        } catch (exception) {
            console.log('error:', exception);
        }
    }

    async function modify() {

        let editGroup = document.getElementById('editGroup');
        let saveGroup = document.getElementById('saveGroup');
        let listCroup = document.getElementById('listGroup');
        let isSMS = document.getElementById('isSMS');
        let isMailing = document.getElementById('isMailing');
        let textbookOrderCount = document.getElementById('textbookOrderCount');
        let textBookOrderCountText = document.getElementById('textBookOrderCountText');
        let password = document.getElementById('password');
        let userTypeChange = document.getElementById('userTypeChange');
        let userType = document.getElementById('userType');
        let selectUserType = document.getElementById('selectUserType');

        editGroup.style.display = 'none';
        editGroup.classList.remove('col-9', 'd-flex', 'justify-content-end');
        listCroup.style.visibility = 'hidden';
        saveGroup.style.display = 'flex';
        saveGroup.classList.add('col-9', 'd-flex', 'justify-content-end');
        textBookOrderCountText.parentElement.classList.add('required');

        selectUserType.style.display = 'flex';
        userType.style.display = 'none';
        password.style.display = 'flex';
        userTypeChange.style.display = 'flex';

        isSMS.removeAttribute('disabled');
        isMailing.removeAttribute('disabled');
        textbookOrderCount.removeAttribute('disabled');
    }

    async function cancel() {
        let editGroup = document.getElementById('editGroup');
        let saveGroup = document.getElementById('saveGroup');
        let listGroup = document.getElementById('listGroup');
        let isSMS = document.getElementById('isSMS');
        let isMailing = document.getElementById('isMailing');
        let textbookOrderCount = document.getElementById('textbookOrderCount');
        let password = document.getElementById('password');
        let userTypeChange = document.getElementById('userTypeChange');
        let userType = document.getElementById('userType');
        let selectUserType = document.getElementById('selectUserType');
        let textBookOrderCountText = document.getElementById('textBookOrderCountText');
        let passwordChangeContainer = document.getElementById('passwordChangeContainer');
        let passwordBtn = document.getElementById('passwordBtn');
        let passwordText = document.getElementById('passwordText');

        saveGroup.style.display = 'none';
        saveGroup.classList.remove('col-9', 'd-flex', 'justify-content-end');
        textBookOrderCountText.parentElement.classList.remove('required');

        passwordBtn.style.display = 'flex';
        passwordChangeContainer.style.display = 'none';
        passwordText.parentElement.classList.remove('required');

        listGroup.style.visibility = 'visible';
        editGroup.style.display = 'flex';
        editGroup.classList.add('col-9', 'd-flex', 'justify-content-end');

        password.style.display = 'none';
        userTypeChange.style.display = 'none';
        selectUserType.style.display = 'none';
        userType.style.display = 'flex';

        isSMS.setAttribute('disabled', '');
        isMailing.setAttribute('disabled', '');
        textbookOrderCount.setAttribute('disabled', '');
    }

    function passwordChange() {
        console.log('password change');

        let passwordText = document.getElementById('passwordText');
        passwordText.parentElement.classList.add('required');



        let container = document.getElementById('passwordChangeContainer');
        let passwordBtn = document.getElementById('passwordBtn');

        let htmlContent = `
        <div class="row slide-in-animation">
            <div class="col-lg-7">
                <input id="newPassword" type="password" class="form-control" placeholder="새 비밀번호" maxlength="12">
            </div>
            <div class="col-lg-5">
                <button data-uid="${data.user.uid}" type="button" class="btn btn-dark" onclick="completeChange(this)">변경완료</button>
            </div>

            <div class="col-12">
                <small class="form-text text-muted">
                    비밀번호는* 비밀번호는 8~12자 영문/숫자/특수문자로 조합하여 입력 가능합니다.
                </small>
            </div>
            <div class="fv-plugins-message-container invalid-feedback password_error" style="display:none;"><div data-field="title" data-validator="notEmpty">* 비밀번호를 입력해주세요.</div></div>
        </div>
    `;


        container.innerHTML = htmlContent;
        passwordBtn.style.display = 'none';
        container.style.display = 'block';

        document.getElementById('newPassword').addEventListener('input', (el) => {
            if (el.target.value !== '') {
                document.querySelector('.password_error').style.display = 'none';
            }
        })
    }

    async function completeChange(element) {
        if (isSubmitting) {
            return;
        }
        isSubmitting = true;
        try {
            let uid = element.getAttribute('data-uid');
            let password = document.getElementById('newPassword').value;

            if (password === '') {
                document.querySelector('.password_error').style.display = '';
                return false;
            } else {
                if (!strongPassword(password)) {
                    document.querySelector('.password_error').style.display = '';
                    document.querySelector('.password_error').querySelector('div').innerHTML = '* 비밀번호는 영문, 숫자, 특수문자 및 8~12자 조합으로 입력해주세요';
                    return false;
                }
            }

            const data = {
                password: password
            }

            const response = await fetch('/api/v1/user/' + uid + '/password', {
                method: 'PATCH',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            });

            const result = await response.json();

            console.log(result);

            if (result.data == 'true') {
                Swal.fire({
                    title: '비밀번호 변경 완료',
                    text: '비밀번호 변경이 완료되었습니다.',
                    icon: 'success',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.reload();
                    }
                })
            } else if (result.data == 'false') {
                Swal.fire({
                    title: '비밀번호 변경 실패',
                    text: '비밀번호 변경에 실패하였습니다.',
                    icon: 'error',
                    confirmButtonText: '확인'
                })
            }
        } catch (Exception) {
            console.error(Exception);
        } finally {
            isSubmitting = false;
        }
    }


    async function userTypeChange(element) {
        if (isSubmitting) {
            return;
        }
        isSubmitting = true;
        let uid = element.getAttribute('data-uid');
        let selectUserType = document.getElementById('subSelectUserType');

        try {

            const response = await fetch('/api/v1/user/' + uid + '/type', {
                method: 'PATCH',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({userType: selectUserType.value})
            });

            const result = await response.json();
            if (result.data == 'true') {
                Swal.fire({
                    title: '회원구분 변경 완료',
                    text: '회원구분 변경이 완료되었습니다.',
                    icon: 'success',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.reload();
                    }
                })
            } else if (result.data == 'false') {
                Swal.fire({
                    title: '회원구분 변경 실패',
                    text: '회원구분 변경에 실패하였습니다.',
                    icon: 'error',
                    confirmButtonText: '확인'
                })
            }

        } catch (Exception) {
            console.error(Exception);
        } finally {
            isSubmitting = false;
        }
    }

    async function deleteUser(element) {
        if (isSubmitting) {
            return;
        }
        isSubmitting = true;

        Swal.fire({
            title: '탈퇴 처리 확인',
            text: '정말로 탈퇴 처리하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '예, 탈퇴 처리합니다',
            cancelButtonText: '아니요, 취소합니다'
        }).then(async (result) => {
            if (result.isConfirmed) {
                let uid = element.getAttribute('data-uid');
                try {
                    const response = await fetch('/api/v1/user/' + uid, {
                        method: 'PATCH',
                        headers: {
                            'Content-Type': 'application/json',
                        }
                    });

                    const result = await response.json();

                    if (result.result == true) {
                        Swal.fire({
                            title: '탈퇴 처리 완료',
                            text: '탈퇴 처리가 완료되었습니다.',
                            icon: 'success',
                            confirmButtonText: '확인'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                location.href = '/user/user-list';
                            }
                        })
                    } else {
                        Swal.fire({
                            title: '탈퇴 처리 실패',
                            text: '탈퇴 처리에 실패하였습니다.',
                            icon: 'error',
                            confirmButtonText: '확인'
                        })
                    }

                } catch (Exception) {
                    console.error(Exception);
                } finally {
                    isSubmitting = false;
                }
            } else {
                isSubmitting = false;
            }
        });
    }

    function goList() {
        const form = document.querySelector('#searchForm');
        form.action = '/user/user-list';
        form.method = 'GET';
        form.submit();
    }


    /**************************************************************** DELETE ***************************************************************/




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
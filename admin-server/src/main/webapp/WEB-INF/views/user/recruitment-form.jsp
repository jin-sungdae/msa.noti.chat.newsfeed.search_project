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
                    <div class="container-fluid">
                        <!-- 본문 내용 START -->
                        <form id="saveForm">
                            <input type="hidden" name="uid" id="uid" value="${uid}"/>
                            <input type="hidden" name="recruitmentIndex" value="${recruitment.recruitmentIndex}">
                            <div class="card mb-5 mb-xl-10">
                                <div class="card-header border-0 pt-5 card-header-stretch">
                                    <div class="card-title text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                        인재 채용 관리
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade show active" id="tab1" role="tabpanel">
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3">작성자</label>
                                                    </div>
                                                    <div class="col-lg-8 row">

                                                        <div id="userType" class="col-lg-4 form-label fw-bold text-dark pt-3">
                                                            <c:if test="${formType eq 'insert'}">
                                                                <c:out value="${admin.adminNameAndDepartment}"/>
                                                            </c:if>
                                                            <c:if test="${formType eq 'update'}">
                                                                <c:out value="${recruitment.adminName}"/>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row fv-row">
                                                    <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">채용공고명</label>
                                                    </div>
                                                    <div class="col-lg-8">

                                                        <div class="col-lg-12 form-label text-dark fw-bold pt-3">
                                                            <input type="text" name="title" class="form-control" value="${recruitment.title}" maxlength="100"/>
                                                        </div>


                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row fv-row">
                                                    <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">지원자격</label>
                                                    </div>
                                                    <div class="col-lg-8">
                                                        <div class="col-lg-4 form-label text-dark fw-bold pt-3">
                                                            <select type="select" class="form-select" name="applicationEligibility">
                                                                <option value="" ${empty recruitment.applicationEligibility ? 'selected' : ''}>선택</option>
                                                                <option value="신입" ${recruitment.applicationEligibility eq '신입' ? 'selected' : ''}>신입</option>
                                                                <option value="경력" ${recruitment.applicationEligibility eq '경력' ? 'selected' : ''}>경력</option>
                                                                <option value="신입/경력" ${recruitment.applicationEligibility eq '신입/경력' ? 'selected' : ''}>신입/경력</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">모집기간</label>
                                                    </div>
                                                    <div class="col-lg-3">

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
                                                                            value="<c:out value="${recruitment.startDate}"/>"
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
                                                                            value="<c:out value="${recruitment.endDate}"/>"
                                                                    />
                                                                    <span class="input-group-text" id="basic-addon3">
                                                            <i class="bi bi-calendar-check fs-1"></i>
                                                            </span>
                                                                </div>
                                                            </div>
                                                        </div>


                                                    </div>
                                                    <div class="col-lg-2 pt-2">
                                                        <div class="form-check form-check-custom form-check-warning form-check-solid mb-3">
                                                            <input class="form-check-input" type="checkbox" value="Y" id="textBook" name="isTest" ${recruitment.isTest eq 'Y' ? 'checked' : ''} >
                                                            <label class="form-check-label form-label fw-bolder text-dark pt-3" for="textBook" >
                                                                테스트 전용
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">채용공고 상단 이미지</label>
                                                    </div>
                                                    <div class="col-lg-10 row">
                                                        <div class="col-lg-12 form-label text-dark fw-bold pt-3" id="dz1Container">
                                                            <!-- 파일 업로드 섹션 -->
                                                            <jsp:include page="/FileFormINC" flush="false">
                                                                <jsp:param name="fileFormType" value="Y" />
                                                                <jsp:param name="isImage" value="false" />
                                                                <jsp:param name="hasOrder" value="false" />
                                                                <jsp:param name="parentTable" value="RECRUITMENT"/>
                                                                <jsp:param name="parentUid" value="${uid}"/>
                                                                <jsp:param name="parentType" value="TOP"/>
                                                                <jsp:param name="maxFileCount" value="2"/>
                                                                <jsp:param name="isSecure" value="N"/>
                                                                <jsp:param name="DZID" value="dz1"/>
                                                                <jsp:param name="dropzoneIndex" value="0"/>
                                                                <jsp:param name="description" value="채용공고 상단 이미지는 1240 x 520px로 업로드해 주세요. (파일명 띄어쓰기 금지) <br>* 파일 크기는 1Mb이하, jpg, jpeg, png형식의 파일만 가능합니다."/>
                                                            </jsp:include>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-4 row">

                                                </div>
                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">모집부문 및 자격요건
                                                            <br />
                                                            <button type="button" class="btn btn-light" id="detailAddBtn">추가</button>
                                                        </label>
                                                    </div>
                                                    <div class="col-lg-10 table-responsive">
                                                        <table class="table table-row-bordered gy-5 detail_table">
                                                            <thead class="thead-light">
                                                            <tr>
                                                                <th class="text-center">모집부서</th>
                                                                <th class="text-center">업무</th>
                                                                <th class="text-center">학력</th>
                                                                <th class="text-center">자격요건</th>
                                                                <th class="text-center">구분</th>
                                                                <th class="text-center">급여</th>
                                                                <th class="text-center">인원</th>
                                                                <th class="text-center">근무지</th>
                                                                <th class="text-center">수정</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody id="detailBody">
                                                                <c:forEach var="item" items="${recruitment.recruitmentRequirements}">
                                                                    <tr>
                                                                        <td class="align-middle text-center" width="11.2%">
                                                                            <span><c:out value="${item.department}" /></span>
                                                                            <input type="hidden" class="detail_input department" data-name="department" value="${item.department}">
                                                                        </td>
                                                                        <td class="align-middle text-center" width="11.2%">
                                                                            <span><c:out value="${item.work}" /></span>
                                                                            <input type="hidden" class="detail_input work" data-name="work" value="${item.work}">
                                                                        </td>
                                                                        <td class="align-middle text-center" width="11.2%">
                                                                            <span><c:out value="${item.education}" /></span>
                                                                            <input type="hidden" class="detail_input education" data-name="work" value="${item.education}">
                                                                        </td>
                                                                        <td class="align-middle text-center" width="11.2%">
                                                                            <span><c:out value="${item.applicationEligibility}" /></span>
                                                                            <input type="hidden" class="detail_input detailApplicationEligibility" data-name="detailApplicationEligibility" value="${item.applicationEligibility}">
                                                                        </td>
                                                                        <td class="align-middle text-center" width="11.2%">
                                                                            <span><c:out value="${item.workersClassification}" /></span>
                                                                            <input type="hidden" class="detail_input workersClassification" data-name="workersClassification" value="${item.workersClassification}">
                                                                        </td>
                                                                        <td class="align-middle text-center" width="11.2%">
                                                                            <span><c:out value="${item.salary}" /></span>
                                                                            <input type="hidden" class="detail_input salary" data-name="salary" value="${item.salary}">
                                                                        </td>
                                                                        <td class="align-middle text-center" width="11.2%">
                                                                            <span><c:out value="${item.personnel}" /></span>
                                                                            <input type="hidden" class="detail_input personnel" data-name="personnel" value="${item.personnel}">
                                                                        </td>
                                                                        <td class="align-middle text-center" width="11.2%">
                                                                            <span><c:out value="${item.workPlace}" /></span>
                                                                            <input type="hidden" class="detail_input workPlace" data-name="workPlace" value="${item.workPlace}">
                                                                        </td>
                                                                        <td class="align-middle text-center" width="11.2%">
                                                                            <button type="button" class="btn btn-light detail_update_btn btn-sm">수정</button>
                                                                            <button type="button" class="btn btn-danger detail_del_btn btn-sm">삭제</button>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                        <div class="fv-plugins-message-container invalid-feedback" id="detail-empty-msg" style="display: none;"><div data-field="content" data-validator="notEmpty">모집부분 및 자격요건을 입력해주세요.</div></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">채용 내용</label>
                                                    </div>
                                                    <div class="col-lg-10 text_area_div">
                                                        <textarea class="form-control form-control-solid contents"
                                                                  type="text"
                                                                  rows="5"
                                                                  id="content"
                                                                  minlength="1"
                                                                  name="content"
                                                                  placeholder="Content"
                                                        >${recruitment.content}</textarea>
                                                        <div class="fv-plugins-message-container invalid-feedback" id="content-empty-msg" style="display: none;"><div data-field="content" data-validator="notEmpty">채용내용을 입력해주세요.</div></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3">입사지원서<br/>(다운로드)</label>
                                                    </div>
                                                    <div class="col-lg-10 row">

                                                        <div class="col-lg-12 form-label text-dark fw-bold pt-3" id="dz2Container">
                                                            <!-- 파일 업로드 섹션 -->
                                                            <jsp:include page="/FileFormINC" flush="false">
                                                                <jsp:param name="fileFormType" value="Y" />
                                                                <jsp:param name="isImage" value="false" />
                                                                <jsp:param name="hasOrder" value="false" />
                                                                <jsp:param name="parentTable" value="RECRUITMENT"/>
                                                                <jsp:param name="parentUid" value="${uid}"/>
                                                                <jsp:param name="parentType" value="APPLICATION"/>
                                                                <jsp:param name="maxFileCount" value="2"/>
                                                                <jsp:param name="isSecure" value="N"/>
                                                                <jsp:param name="DZID" value="dz2"/>
                                                                <jsp:param name="dropzoneIndex" value="1"/>
                                                                <jsp:param name="description" value="파일 크기는 30MB이하, pdf, jpg, jpeg, png, hwp, hwpx, ppt, pptx, dox, doxc, zip 형식의 파일만 가능합니다."/>
                                                            </jsp:include>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">노출여부</label>
                                                    </div>

                                                    <div class="col-lg-4">
                                                        <div class="col-lg-3 row">
                                                            <div class="col">
                                                                <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                    <input class="form-check-input" type="radio" name="isOpen" value="N"  id="urlPath" ${recruitment.isOpen eq 'N' or empty recruitment.isOpen ? 'checked' : ''} >
                                                                    <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="urlPath">
                                                                        N
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                    <input class="form-check-input" type="radio" name="isOpen" value="Y" id="isPdf" ${recruitment.isOpen eq 'Y' ? 'checked' : ''}>
                                                                    <label class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3" for="isPdf">
                                                                        Y
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="tab2" role="tabpanel">
                                            <div class="card mb-7">
                                                <form class="form">
                                                    <div class="card-body">

                                                        <div class="row mb-8">
                                                            <div class="col-lg-12 row">
                                                                <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                                    <label class="col-lg-10 form-label fw-bolder text-dark pt-3 fs-4">작성자</label>
                                                                </div>
                                                                <div class="col-lg-2 row">

                                                                    <div id="userType" class="col-lg-4 form-label text-dark pt-3 fs-6">
                                                                        <c:out value="${data.user.userType}"/>
                                                                    </div>

                                                                </div>
                                                                <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                                    <label class="col-lg-10 form-label fw-bolder text-dark pt-3 fs-4">모집기간</label>
                                                                </div>
                                                                <div class="col-lg-2 row">

                                                                    <div id="userType" class="col-lg-4 form-label text-dark pt-3 fs-6">
                                                                        <c:out value="${data.user.userType}"/>
                                                                    </div>

                                                                </div>
                                                                <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                                    <label class="col-lg-10 form-label fw-bolder text-dark pt-3 fs-4">지원자수</label>
                                                                </div>
                                                                <div class="col-lg-2 row">

                                                                    <div id="userType" class="col-lg-4 form-label text-dark pt-3 fs-6">
                                                                        <c:out value="${data.user.userType}"/>
                                                                    </div>

                                                                </div>
                                                                <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                                    <label class="col-lg-10 form-label fw-bolder text-dark pt-3 fs-4">참여자수</label>
                                                                </div>
                                                                <div class="col-lg-2 row">

                                                                    <div id="userType" class="col-lg-4 form-label text-dark pt-3 fs-6">
                                                                        <c:out value="${data.user.userType}"/>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                            <c:if test="${data.uid}">
                                                                <div class="col-lg-4 row">
                                                                    <div class="col-lg-6 ">
                                                                        <label class="col-lg-10 form-label fw-bolder text-dark pt-3">작성일시</label>
                                                                    </div>
                                                                    <div class="col-lg-8 row">

                                                                        <div id="userType" class="col-lg-4 form-label text-dark pt-3">
                                                                            <c:out value="${data.user.userType}"/>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </c:if>

                                                        </div>



                                                    </div>
                                                    <div class="card-footer">
                                                        <div class="row g-8 mb-8">
                                                            <div class="col-xxl-12 fv-row">
                                                                <div class="row">
                                                                    <div class="col-2">
                                                                        <label class="fs-6 form-label fw-bolder text-dark">검색어</label>
                                                                        <select
                                                                                id="joinRoot"
                                                                                name="joinRoot"
                                                                                class="form-select form-select-solid"
                                                                                data-control="select2"
                                                                                data-hide-search="true"
                                                                        >
                                                                            <option value="">전체</option>
                                                                            <option value='지학사' ${param.joinRoot eq '지학사' ? 'selected' : ''}>지학사</option>
                                                                            <option value='네이버' ${param.joinRoot eq '네이버' ? 'selected' : ''}>네이버</option>
                                                                            <option value='구글'   ${param.joinRoot eq '구글' ? 'selected' : ''}>구글</option>
                                                                            <option value='카카오' ${param.joinRoot eq '카카오' ? 'selected' : ''}>카카오</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-lg-8">
                                                                        <div class="row pt-8">
                                                                            <div class="col-lg-12">
                                                                                <input
                                                                                        type="text"
                                                                                        id="search"
                                                                                        name="search"
                                                                                        class="form-control"
                                                                                        placeholder="검색어 입력"
                                                                                        maxlength="100"
                                                                                        value="<c:out value="${search.search}"/>"
                                                                                />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-2 d-flex justify-content-end mt-8"  data-kt-customer-table-toolbar="base">
                                                                        <div>
                                                                            <button type="button" class="btn btn-m btn-warning" onclick="searchSeriesCode()">
                                                                                검색
                                                                            </button>
                                                                            <a class="btn btn-secondary" style="color: #181c32; background-color : #fff3cd" onclick="resetSeriesSearchForm()">
                                                                                <i class="fas bi-arrow-repeat fs-2 me-2"></i>
                                                                                초기화
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
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
                                    </div>
                                </div>
                                <div class="card-footer" id="footerIdx">
                                    <div class="row">
                                        <div id="listGroup" class="col-3">
                                            <button type="button" class="btn btn-light-dark" style="background-color: #343a40; color: #FFFFFF" onclick="goList()">목록</button>
                                        </div>
                                        <c:if test="${formType ne 'insert'}">
                                            <div id="editGroup" class="col-9 d-flex justify-content-end">
                                                <button
                                                        data-uid="${uid}"
                                                        type="button"
                                                        id="deleteBtn"
                                                        class="btn btn-light-warning me-2"
                                                        style="background-color: #fff3cd; color: #181C32"
                                                        onclick="goRegForm()">
                                                    취소
                                                </button>
                                                <button type="button" class="btn btn-light-warning" style="background-color: #ffcd39; color: #181C32" onclick="save()">
                                                    수정
                                                </button>
                                            </div>
                                        </c:if>
                                        <c:if test="${formType eq 'insert'}">
                                            <div id="saveGroup" class="col-9 d-flex justify-content-end">
                                                <button type="button" id="cancelBtn" class="btn btn-light-warning me-2" style="background-color: #fff3cd; color: #181C32" onclick="goList()">
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
                                        </c:if>
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
<!-- Modal-->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <form id="detailModalForm">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">모집부문 및 자격요건 추가</h5>
                    <div class="btn btn-m btn-icon btn-active-color-primary" data-bs-dismiss="modal">
                        <i class="bi bi-x-lg"></i>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="input-group mb-3">
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="form_department" placeholder="모집 부서 입력" aria-label="Username" maxlength="50">
                        </div>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="form_work" placeholder="업무 선택 입력" aria-label="Server" maxlength="50">
                        </div>
                    </div>
                    <div class="input-group mb-3 form-group">
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="form_education" placeholder="학력 입력" aria-label="Username" maxlength="50">
                        </div>
                        <div class="col-md-6">
                            <select type="select" class="form-select" id="form_applicationEligibility">
                                <option value="">자격요건 선택</option>
                                <option value="신입">신입</option>
                                <option value="경력">경력</option>
                                <option value="신입/경력">신입/경력</option>
                            </select>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="form_workersClassification" placeholder="구분 입력" aria-label="Username" maxlength="50">
                        </div>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="form_salary" placeholder="급여 입력" notEngEtc aria-label="Server" maxlength="50">
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="form_personnel" numberOnly placeholder="인원입력" aria-label="Username" maxlength="50">
                        </div>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="form_workPlace" placeholder="근무지 입력" aria-label="Server" maxlength="50">
                        </div>
                    </div>
                    <p>*모두 필수 항목 입니다.</p>
                </div>
            </form>
            <div class="modal-footer">
                <button type="button" class="btn btn-warning" id="detailModalSaveBtn">등록</button>
            </div>
        </div>
    </div>
</div>

<form name="searchForm" id="searchForm">
    <input type="hidden" name="sdate" value="${reqMap.sdate}" />
    <input type="hidden" name="edate" value="${reqMap.edate}" />
    <input type="hidden" name="processingType" value="${reqMap.processingType}" />
    <input type="hidden" name="applicationEligibility" value="${reqMap.applicationEligibility}" />
    <input type="hidden" name="isOpen" value="${reqMap.isOpen}" />
    <input type="hidden" name="search" value="${reqMap.search}" />
    <input type="hidden" name="perPage" value="${reqMap.perPage}" />
    <input type="hidden" name="page" value="${reqMap.page}" />
</form>

</body>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script src="/assets/js/file.js"></script>
<script src="/assets/js/jihak.common.js"></script>
<script type="text/javascript">

    /***************************************************** INIT ***************************************/
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
    $('.contents').on('froalaEditor.keydown', function (e, editor, keydownEvent) {
        if (editor.html.get() !== '') {
            document.querySelector('#content-empty-msg').style.display = 'none';
        }
    });
    $('.contents').on('froalaEditor.image.uploaded', function (e, editor, keydownEvent) {
        if (editor.html.get() !== '') {
            document.querySelector('#content-empty-msg').style.display = 'none';
        }
    });
    let ntdrop = [];
    let viewType = '${viewType}';
    let modalType = 'default';
    let modalUpdateElement = null;
    const form = document.querySelector('#saveForm');
    const modal = new bootstrap.Modal(document.querySelector('#exampleModal'));

    const validator = FormValidation.formValidation(
        form,
        {
            fields: {
                'title': {
                    validators: {
                        notEmpty: {
                            message : '채용공고명을 입력해주세요.'
                        },
                        regexp: {
                            //regexp: /^[ㄱ-ㅎ가-힣a-zA-Z0-9]/g,
                            regexp: /^[ㄱ-ㅎ가-힣a-zA-Z0-9\s]+$/i,
                            message: '채용공고명은 영문,숫자,한글만 입력가능합니다.'
                        }
                    }
                },
                'startDate': {
                    validators: {
                        notEmpty: {
                            message : '모집기간을 선택해주세요.'
                        }
                    }
                },
                'endDate': {
                    validators: {
                        notEmpty: {
                            message : '모집기간을 선택해주세요.'
                        }
                    }
                },
                'applicationEligibility': {
                    validators: {
                        notEmpty: {
                            message : '지원자격을 선택해주세요.'
                        }
                    }
                }

            },

            plugins: {
                trigger: new FormValidation.plugins.Trigger(),
                bootstrap: new FormValidation.plugins.Bootstrap5({
                    rowSelector: '.fv-row',
                    eleInvalidClass: '',
                    eleValidClass: ''
                })
            }
        }
    );

    const uid = '${uid}';
    ntdrop[0] = global.genDropzone("#dz1",
        {
            params: {
                'ParentTable': 'RECRUITMENT',
                'ParentType': 'TOP',
                'ParentUid': uid,
            },hasOrder: false, isSecure: 'N', required: 'Y',
            acceptedExt : ['.jpg', '.jpeg', '.png'],
            maxFileCount: 2,
            dropzoneIdx: 'dz1',
            containerId : 'dz1Container',
            maxFileSize : 1,
            dropzoneIndex : 0,
            messages : {
                empty : '이미지 파일을 등록해주세요.',
                accept: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.',
                count: '',
                size: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.'
            }
        });

    ntdrop[1] = global.genDropzone("#dz2",
        {
            params: {
                'ParentTable': 'RECRUITMENT',
                'ParentType': 'APPLICATION',
                'ParentUid': uid,
            }, hasOrder: false, isSecure: 'N', maxFileCount: 2, required: 'N', dropzoneIdx: 'dz2',
            containerId : 'dz2Container',
            maxFileSize : 30,
            dropzoneIndex : 1,
            acceptedExt: ['.pdf', '.jpg', '.jpeg', '.png', '.hwp', '.hwpx', '.ppt', '.pptx', '.doc', '.docx', '.zip'],
            messages : {
                empty : '',
                accept: '* 파일용량 및 파일유형을 다시 확인해주세요.',
                count: '',
                size: '* 파일용량 및 파일유형을 다시 확인해주세요.'
            }
        });

    document.querySelector('#detailAddBtn').addEventListener('click', () => {
        document.querySelector('#detailModalForm').reset();
        modalType = 'default';
        modal.show();
    });

    document.addEventListener('click', (e) => {
        if (e.target && e.target.classList.contains('detail_del_btn')) {
            console.log('del!');
            e.target.parentElement.parentElement.remove();
        }
        if (e.target && e.target.classList.contains('detail_update_btn')) {
            e.target.parentElement.parentElement.querySelectorAll('input').forEach((el, index) => {
                console.log(el.dataset.name);
            })

            document.querySelector('#detailModalForm').reset();

            const department = e.target.parentElement.parentElement.querySelector('.department').value;
            const target = e.target.parentElement.parentElement;

            document.querySelector('#form_department').value = target.querySelector('.department').value;
            document.querySelector('#form_work').value = target.querySelector('.work').value;
            document.querySelector('#form_education').value = target.querySelector('.education').value;
            document.querySelector('#form_applicationEligibility').value = target.querySelector('.detailApplicationEligibility').value;
            document.querySelector('#form_workersClassification').value = target.querySelector('.workersClassification').value;
            document.querySelector('#form_salary').value = target.querySelector('.salary').value;
            document.querySelector('#form_personnel').value = target.querySelector('.personnel').value;
            document.querySelector('#form_workPlace').value = target.querySelector('.workPlace').value;

            modalType = 'update';
            modalUpdateElement = target;
            modal.show();
        }
    })

    document.querySelector('#detailModalSaveBtn').addEventListener('click', () => {
        let isNext = true;
        const form = document.querySelector('#detailModalForm');
        const els = form.elements;
        for (const el of els) {
            if (el.type === 'text') {
                if (el.value === '') {
                    swal.fire('필수 항목을 모두 입력해주세요.');
                    isNext = false;
                }
            } else if (el.type === 'select-one') {
                if (el.value === '') {
                    swal.fire('필수 항목을 모두 입력해주세요.');
                    isNext = false;
                }
            }
        }

        if (isNext) {
            const department = document.querySelector('#form_department').value;
            const work = document.querySelector('#form_work').value;
            const education = document.querySelector('#form_education').value;
            const detailApplicationEligibility = document.querySelector('#form_applicationEligibility').value;
            const workersClassification = document.querySelector('#form_workersClassification').value;
            const salary = document.querySelector('#form_salary').value;
            const personnel = document.querySelector('#form_personnel').value;
            const workPlace = document.querySelector('#form_workPlace').value;

            if (modalType === 'default') {
                const tr = document.createElement('tr');

                tr.appendChild(makeTd(department, 'department', '11.2%'));
                tr.appendChild(makeTd(work, 'work', '11.2%'));
                tr.appendChild(makeTd(education, 'education', '11.2%'));
                tr.appendChild(makeTd(detailApplicationEligibility, 'detailApplicationEligibility', '11.2%'));
                tr.appendChild(makeTd(workersClassification, 'workersClassification', '11.2%'));
                tr.appendChild(makeTd(salary, 'salary', '11.2%'));
                tr.appendChild(makeTd(personnel, 'personnel', '11.2%'));
                tr.appendChild(makeTd(workPlace, 'workPlace', '11.2%'));

                const lastTd = document.createElement('td');
                lastTd.setAttribute('class', 'align-middle text-center');
                const updBtn = document.createElement('button');
                updBtn.setAttribute('type', 'button');
                updBtn.setAttribute('class', 'btn btn-light detail_update_btn btn-sm');
                updBtn.textContent = '수정';
                const delBtn = document.createElement('button');
                delBtn.setAttribute('type', 'button');
                delBtn.setAttribute('class', 'btn btn-danger detail_del_btn btn-sm');
                delBtn.textContent = '삭제';
                lastTd.appendChild(updBtn);
                lastTd.appendChild(delBtn);
                lastTd.setAttribute('width', '10%')
                tr.appendChild(lastTd);

                document.querySelector('#detailBody').appendChild(tr);
            } else {
                modalUpdateElement.querySelector('.department').value = department;
                modalUpdateElement.querySelector('.department').parentElement.querySelector('span').textContent = department;

                modalUpdateElement.querySelector('.work').value = work;
                modalUpdateElement.querySelector('.work').parentElement.querySelector('span').textContent = work;

                modalUpdateElement.querySelector('.education').value = education;
                modalUpdateElement.querySelector('.education').parentElement.querySelector('span').textContent = education;

                modalUpdateElement.querySelector('.detailApplicationEligibility').value = detailApplicationEligibility;
                modalUpdateElement.querySelector('.detailApplicationEligibility').parentElement.querySelector('span').textContent = detailApplicationEligibility;

                modalUpdateElement.querySelector('.workersClassification').value = workersClassification;
                modalUpdateElement.querySelector('.workersClassification').parentElement.querySelector('span').textContent = workersClassification;

                modalUpdateElement.querySelector('.salary').value = salary;
                modalUpdateElement.querySelector('.salary').parentElement.querySelector('span').textContent = salary;

                modalUpdateElement.querySelector('.personnel').value = personnel;
                modalUpdateElement.querySelector('.personnel').parentElement.querySelector('span').textContent = personnel;

                modalUpdateElement.querySelector('.workPlace').value = workPlace;
                modalUpdateElement.querySelector('.workPlace').parentElement.querySelector('span').textContent = workPlace;
            }

            modal.hide();

            document.querySelector('#detail-empty-msg').style.display = 'none';
        }
    });

    function makeTd(value, name, width) {
        const td = document.createElement('td');
        td.setAttribute('class', 'align-middle text-center');
        const span = document.createElement('span');
        span.textContent = value;
        const hidden = document.createElement('input');
        hidden.setAttribute('type', 'hidden');
        hidden.setAttribute('class', 'detail_input ' + name);
        hidden.setAttribute('data-name', name);
        hidden.setAttribute('value', value);
        td.appendChild(span);
        td.appendChild(hidden);
        td.setAttribute('width', width);
        return td;
    }

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

    /**************************************************** UTILS ***************************************/

    document.addEventListener('DOMContentLoaded', function () {
        initializeFlatpickr();
    })

    window.onbeforeunload = function() {
        if (isModified) {
            return "변경 사항을 저장하지 않았습니다. 정말 지금 나가시겠습니까?";
        }
    };

    async function save(element) {
        document.querySelector('#detail-empty-msg').style.display = 'none';
        if (validator) {
            validator.validate().then(function (status) {
                let isNext = true;
                const len = document.querySelector('#detailBody').querySelectorAll('tr').length;
                if (len === 0) {
                    document.querySelector('#detail-empty-msg').style.display = '';
                    isNext = false;
                }

                const contentInput = document.querySelector('#content');
                if (contentInput.value === '') {
                    document.querySelector('#content-empty-msg').style.display = '';
                    isNext = false;
                }

                if(dropzoneCheck()) {
                    if (isNext) {
                        uploadByDropzone(0);
                    }
                }
            })
        }
    }

    async function saveFormData() {
        let formData = makeJsonData();

        const arr = [];
        document.querySelector('#detailBody').querySelectorAll('tr').forEach((el) => {
            const obj = {
                department: el.querySelector('.department').value,
                work: el.querySelector('.work').value,
                education: el.querySelector('.education').value,
                applicationEligibility: el.querySelector('.detailApplicationEligibility').value,
                workersClassification: el.querySelector('.workersClassification').value,
                salary: el.querySelector('.salary').value,
                personnel: el.querySelector('.personnel').value,
                workPlace: el.querySelector('.workPlace').value
            };
            arr.push(obj);
        })

        formData = {
            ...formData,
            details: arr
        }

        let url = '/api/v1/recruitment';
        let method = 'POST';

        if(viewType === 'edit') {
            method = 'PUT';
            url = '/api/v1/recruitment/${uid}';
        }

        const response = await fetch(url, {
            method: method,
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(formData)
        });

        const res = await response.json();
        if(res) {
            Swal.fire({
                title: '등록 완료',
                text: '등록되었습니다.',
                icon: 'success',
                buttonsStyling: !1,
                confirmButtonText: '확인',
                customClass: {confirmButton: 'btn btn-primary'}
            }).then((result) => {
                if (result.isConfirmed) {
                    location.href = '/user/recruit-list';
                }
            });
        }
    }

    const makeJsonData = () => {
        const bannerData = new FormData(document.getElementById('saveForm'));
        let jsonObject = {};
        bannerData.forEach(function (value, key) {
            jsonObject[key] = value;
        });
        return jsonObject;
    }

    function deleteFile (element) {
        console.log('hih')

    }

    function goList() {
        const form = document.querySelector('#searchForm');
        form.action = '/user/recruit-list';
        form.method = 'GET';
        form.submit();
    }

    function goRegForm() {
        const form = document.querySelector('#searchForm');
        form.action = '/user/recruitment/${uid}';
        form.method = 'GET';
        form.submit();
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
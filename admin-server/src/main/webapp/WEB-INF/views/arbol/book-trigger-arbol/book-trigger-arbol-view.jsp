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
                <%@ include file="/WEB-INF/views/common/inc/ToolbarINC.jsp" %>
                <div class="post d-flex flex-column-fluid">
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
                                    <div class="row mb-12">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">대상</label>
                                            </div>
                                            <div class="col-lg-3 row pt-4">
                                                <c:forEach var="target" items="${list.targetList}" varStatus="status">
                                                    ${target}<c:if test="${!status.last}">, </c:if>&nbsp;
                                                </c:forEach>
                                            </div>
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">분야</label>
                                            </div>
                                            <div class="col-lg-3 row pt-4">
                                                <c:forEach var="field" items="${list.fieldList}" varStatus="status">
                                                    ${field}<c:if test="${!status.last}">, </c:if>&nbsp;
                                                </c:forEach>
                                            </div>
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">시리즈</label>
                                            </div>
                                            <div class="col-lg-3 row pt-4">
                                                <c:forEach var="series" items="${list.seriesList}" varStatus="status">
                                                    ${series}<c:if test="${!status.last}">, </c:if>&nbsp;
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-12">
                                        <div class="col-lg-12 row existUid">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">도서명</label>
                                            </div>
                                            <div class="col-lg-11 row pt-3">
                                                <c:out value="${list.bookName}"/>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="row mb-12">
                                        <div class="col-lg-12 row existUid">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center ">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">저자</label>
                                            </div>
                                            <div class="col-lg-11 row">

                                                <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">글</label>
                                                </div>
                                                <div class="col-lg-3 pt-3">
                                                    <c:out value="${list.authorWriting}"/>
                                                </div>
                                                <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">그림</label>
                                                </div>
                                                <div class="col-lg-3 pt-3">
                                                    <c:out value="${list.authorPicture}"/>
                                                </div>
                                                <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">옮김</label>
                                                </div>
                                                <div class="col-lg-3 pt-3">
                                                    <c:out value="${list.authorTranslation}"/>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-12">
                                        <div class="col-lg-12 row existUid">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">도서형태</label>
                                            </div>
                                            <div class="col-lg-11 row">
                                                <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">쪽수</label>
                                                </div>
                                                <div class="col-lg-3 pt-3">
                                                    <c:out value="${list.totalPage}"/> <span>쪽</span>
                                                </div>
                                                <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">가로</label>
                                                </div>
                                                <div class="col-lg-3 pt-3">
                                                    <c:out value="${list.width}"/> <span>mm</span>
                                                </div>
                                                <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">세로</label>
                                                </div>
                                                <div class="col-lg-3 pt-3">
                                                    <c:out value="${list.height}"/> <span>mm</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-12">
                                        <div class="col-lg-12 row existUid">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">발행일</label>
                                            </div>
                                            <div class="col-lg-8">
                                                <div class="col-4 pt-3">
                                                    <c:out value="${list.publicationDate}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-12">
                                        <div class="col-lg-12 row existUid">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">태그</label>
                                            </div>
                                            <div class="col-lg-10 pt-3">
                                                <c:forEach var="tag" items="${list.tagList}" varStatus="status">
                                                    <c:out value="${tag}"/><c:if test="${!status.last}">, </c:if>&nbsp;
                                                </c:forEach>
                                            </div>
                                            <c:forEach var="target" items="${list.targetList}" varStatus="status">
                                            </c:forEach>
                                        </div>
                                    </div>

                                    <div class="row mb-12">
                                        <div class="col-lg-12 row existUid">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">금액</label>
                                            </div>
                                            <div class="col-lg-8 row">
                                                <div class="col-lg-5 pt-3">
                                                    <c:out value="${list.formatPrice}"/> <span>원</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-12">
                                        <div class="col-lg-12 row existUid">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">ISBN</label>
                                            </div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-5 pt-3">
                                                    <c:out value="${list.isbn}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-12">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">도서 섬네일</label>
                                            </div>
                                            <div class="col-lg-11">
                                                <div class="col-lg-12 form-label text-dark">
                                                    <div class="col-lg-12 form-label text-dark">
                                                        <jsp:include page="/FileFormINC" flush="false">
                                                            <jsp:param name="isImage" value="false" />
                                                            <jsp:param name="hasOrder" value="false" />
                                                            <jsp:param name="parentTable" value="ARBOL"/>
                                                            <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                            <jsp:param name="parentType" value="THUMBNAIL"/>
                                                            <jsp:param name="maxFileCount" value="1"/>
                                                            <jsp:param name="isSecure" value="N"/>
                                                            <jsp:param name="DZID" value="dz0"/>
                                                            <jsp:param name="viewType" value="view"/>
                                                            <jsp:param name="description" value="파일 크기는 1MB이하, jpg, jpeg, png 형식의 파일만 가능합니다.__섬네일 이미지는 470 * 807 px 로 업로드 해주세요."/>
                                                        </jsp:include>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-12">
                                        <div class="col-lg-12 row existUid" style="display: ${not empty list ? 'flex' : 'none'}">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark  pt-3">미리보기</label>
                                            </div>
                                            <div class="col-lg-11">
                                                <c:if test="${empty list.previewUrl || list.previewUrl eq ''}">
                                                    <div class="col-lg-12 form-label text-dark">
                                                        <jsp:include page="/FileFormINC" flush="false">
                                                            <jsp:param name="isImage" value="false" />
                                                            <jsp:param name="hasOrder" value="false" />
                                                            <jsp:param name="parentTable" value="ARBOL"/>
                                                            <jsp:param name="parentUid" value="${empty list ? '' : list.uid}"/>
                                                            <jsp:param name="parentType" value="PDF"/>
                                                            <jsp:param name="maxFileCount" value="1"/>
                                                            <jsp:param name="isSecure" value="N"/>
                                                            <jsp:param name="DZID" value="dz100"/>
                                                            <jsp:param name="viewType" value="view"/>
                                                            <jsp:param name="description" value="pdf 파일만 등록."/>
                                                        </jsp:include>
                                                    </div>
                                                </c:if>
                                                <c:if test="${not empty list.previewUrl}">
                                                    <div class="col-lg-12 pt-3 row">
                                                        <div class="fw-bolder text-dark col-lg-1">URL 경로</div>
                                                        <a class="col-lg-11" href="${list.previewUrl}" target="_blank">
                                                            <c:out value="${list.previewUrl}"/>
                                                        </a>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-12">
                                        <div class="col-lg-12 row existUid">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">노출여부</label>
                                            </div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-3 pt-3 ${list.isUse eq 'Y' ? 'text-danger' : 'text-primary'}">
                                                    <c:out value="${list.isUse}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-12" id="onlineStoreLine1">
                                        <div class="col-lg-12 row existUid">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">온라인 서점</label>
                                            </div>
                                            <div class="col-lg-11">
                                                <table class="table table-striped">
                                                    <tbody  class="seriesLine">
                                                    <c:forEach var="onlineStore" items="${list.onlineStoreDataList}" varStatus="status">
                                                        <tr>
                                                            <td class=" num form-label fw-bolder text-blue">
                                                                <fmt:formatNumber value="${status.index + 1}" pattern="00."/>
                                                            </td>
                                                            <td class="text-dark fw-bolder">
                                                                <c:out value="${onlineStore.storeName}"/>
                                                            </td>
                                                            <td class="text-dark fw-bolder" onclick="goPage('${onlineStore.storeUrl}')">
                                                                <c:out value="${onlineStore.storeUrl}"/>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>


                            <div class="card mb-5 mb-xl-10">
                                <div>
                                    <div class="card-header border-0 pt-5">
                                        <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                            상세 정보
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="row mb-12">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">소개</label>
                                                </div>
                                                <div class="col-lg-11">
                                                    <div class="fr-element fr-view scroll-froala" style="display: ${empty list ? 'none' : ''}; padding: 16px; border-radius:20px 20px 20px 20px ; background-clip: padding-box; border: 1px solid #E4E6EF">
                                                        ${list.introduction}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-12">
                                            <div class="col-lg-12 row existUid">
                                                <div class="col-lg-1 d-flex justify-content-center align-items-center ">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">수상 및 선정 <br/>사례</label>
                                                </div>
                                                <div class="col-lg-11 row">
                                                    <div class="col-lg-11 row">
                                                        <div class="col-lg-1 d-flex justify-content-start align-items-center mb-3 pt-3 ${list.isAwards eq 'Y' ? 'text-danger' : 'text-primary'}">
                                                            <c:out value="${list.isAwards}"/>
                                                        </div>
                                                    </div>
                                                    <c:if test="${not empty list.awardList}">
                                                        <hr class="my-4">
                                                    </c:if>
                                                    <c:forEach var="award" items="${list.awardList}" varStatus="status">
                                                        <div class="col-lg-11 mb-2 row">
                                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                                <label class="col-lg-12 form-label fw-bolder text-blue d-flex align-items-center justify-content-start pt-2">
                                                                    <fmt:formatNumber value="${status.index + 1}" pattern="00."/>
                                                                </label>
                                                            </div>
                                                            <div class="col-lg-11 text-dark fw-bolder pt-2 mb-2">

                                                                <c:out value="${award}"/>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row existUid" style="display: ${not empty list ? 'flex' : 'none'}">
                                                <div class="col-lg-1 d-flex justify-content-center align-items-center ">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">관련 시리즈<br/>도서</label>
                                                </div>

                                                <div class="col-lg-11 row">
                                                    <div class="col-lg-11 row">
                                                        <div class="col-lg-1 d-flex justify-content-start align-items-center mb-3 pt-3 ${list.isSeries eq 'Y' ? 'text-danger' : 'text-primary'}">
                                                            <c:out value="${list.isSeries}"/>
                                                        </div>
                                                    </div>
                                                    <c:if test="${not empty list.seriesBookList}">
                                                        <hr class="my-4">
                                                    </c:if>
                                                    <c:forEach var="series" items="${list.seriesBookList}" varStatus="status">
                                                        <div class="col-lg-11 row">
                                                            <table class="table table-striped" id="seriesTable">
                                                                <tbody id="seriesTableBody" class="seriesLine">
                                                                <tr>
                                                                    <td class=" num form-label fw-bolder text-blue">
                                                                        <fmt:formatNumber value="${status.index + 1}" pattern="00."/>
                                                                    </td>
                                                                    <td class="text-dark fw-bolder">
                                                                            ${series.bookName}
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </c:forEach>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="card mb-5 mb-xl-10">
                                <div id="option">
                                    <div class="card-header border-0 pt-5">
                                        <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                            인트로 관리
                                        </div>

                                    </div>
                                    <div class="card-body">
                                        <div class="row mb-8">
                                            <div class="existUid">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">인트로 노출 여부</label>
                                                    </div>
                                                    <div class="col-lg-11 row">
                                                        <div class="col-lg-11 row">
                                                            <div class="col-lg-1 d-flex justify-content-start align-items-center ${list.isIntro eq 'Y' ? 'text-danger' : 'text-primary'}">
                                                                <c:out value="${list.isIntro}"/>
                                                            </div>
                                                            <div class="col-lg-6">
                                                            </div>
<%--                                                            <div class="col-lg-1 d-flex justify-content-center align-items-center ">--%>
<%--                                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">노출 순서</label>--%>
<%--                                                            </div>--%>
<%--                                                            <div class="col-lg-2 d-flex justify-content-start align-items-center ">--%>
<%--                                                                <c:out value="${list.introSortOrder}"/>--%>
<%--                                                            </div>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


<%--                                        <div class="row mb-8">--%>
<%--                                            <div class="col-lg-12 row existUid">--%>
<%--                                                <div class="col-lg-1 d-flex justify-content-center align-items-center">--%>
<%--                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">언론보도</br>인트로 노출 여부</label>--%>
<%--                                                </div>--%>
<%--                                                <div class="col-lg-11 row">--%>
<%--                                                    <div class="col-lg-11 row">--%>
<%--                                                        <div class="col-lg-1 d-flex justify-content-start align-items-center mb-3 pt-3 ${list.isPressIntro eq 'Y' ? 'text-danger' : 'text-primary'}">--%>
<%--                                                            <c:out value="${list.isPressIntro}"/>--%>
<%--                                                        </div>--%>
<%--                                                    </div>--%>
<%--                                                    <c:if test="${not empty list.pressMain}">--%>
<%--                                                        <hr class="my-4">--%>
<%--                                                        <label class=" form-label fw-bolder text-dark pt-3 ">--%>
<%--                                                            <c:out value="${list.pressMain}"/>--%>
<%--                                                        </label>--%>

<%--                                                    </c:if>--%>
<%--                                                    <c:if test="${not empty list.pressTitleList}">--%>
<%--                                                        <hr class="my-4">--%>
<%--                                                    </c:if>--%>
<%--                                                    <c:forEach var="press" items="${list.pressTitleList}" varStatus="status">--%>
<%--                                                        <div class="col-lg-11 row">--%>
<%--                                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">--%>
<%--                                                                <label class="col-lg-12 form-label fw-bolder text-blue d-flex align-items-center justify-content-start pt-2">--%>
<%--                                                                    <fmt:formatNumber value="${status.index + 1}" pattern="00."/>--%>
<%--                                                                </label>--%>
<%--                                                            </div>--%>
<%--                                                            <div class="col-lg-4 text-dark fw-bolder pt-2 mb-2">--%>
<%--                                                                <c:out value="${press}"/>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </c:forEach>--%>
<%--                                                </div>--%>

<%--                                            </div>--%>
<%--                                        </div>--%>

                                    </div>
                                </div>
                            </div>

                            <div class="card mb-5 mb-xl-10">
                                <div id="option">
                                    <div class="card-body">
                                        <div class="row mb-8">
                                            <div class="col-lg-6 row">
                                                <div class="col-lg-2 d-flex justify-content-center align-items-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">최초 작성자</label>
                                                </div>
                                                <div class="col-lg-10 row d-flex align-items-center">
                                                    <c:out value="${list.firstAdminName}(${list.firstAdminDepartment})"/>
                                                </div>

                                            </div>
                                            <div class="col-lg-6 row">
                                                <div class="col-lg-2 d-flex justify-content-center align-items-center ">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">작성일시</label>
                                                </div>
                                                <div class="col-lg-10 d-flex align-items-center">
                                                    <c:out value="${list.regDate}"/>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row mb-8">
                                            <div class="col-lg-6 row">
                                                <div class="col-lg-2 d-flex justify-content-center align-items-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">수정자</label>
                                                </div>
                                                <div class="col-lg-10 row d-flex align-items-center">
                                                    <c:if test="${not empty list.adminName}">
                                                        <c:out value="${list.adminName}(${list.adminDepartment})" />
                                                    </c:if>
                                                </div>

                                            </div>
                                            <div class="col-lg-6 row">
                                                <div class="col-lg-2 d-flex justify-content-center align-items-center ">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">수정일시</label>
                                                </div>
                                                <div class="col-lg-10 d-flex align-items-center">
                                                    <c:out value="${list.modDate}" />
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="card-footer" id="footerIdx">
                                        <div class="row" id="modifyButton">
                                            <div class="col-3">
                                                <a type="button" class="btn btn-light-dark" style="background-color: #343a40; color: #FFFFFF" href="/arbol/arbol?page=${reqParam.page}&perPage=${reqParam.perPage}&sdate=${reqParam.sdate}&target=${reqParam.target}&field=${reqParam.field}&series=${reqParam.series}&isOpen=${reqParam.isOpen}&isIntro=${reqParam.isIntro}&isPressIntro=${reqParam.isPressIntro}&search=${reqParam.search}">목록</a>
                                            </div>
                                            <div id="editGroup" class="col-9 d-flex justify-content-end">
                                                <button
                                                        data-uid="${list.uid}"
                                                        data-idx="${list.idx}"
                                                        data-isUse="${list.isUse}"
                                                        type="button"
                                                        id="deleteBtn"
                                                        class="btn btn-light-warning me-2"
                                                        <c:if test="${list.isUse eq 'Y'}">
                                                            disabled
                                                            style="background-color: #3F4254; color: #FFFFFF"
                                                        </c:if>
                                                        <c:if test="${list.isUse eq 'N'}">
                                                            style="background-color: #fff3cd; color: #181C32"
                                                        </c:if>
                                                        onclick="deleteBookTrigger(this)"
                                                >
                                                    삭제
                                                </button>
                                                <a type="button" class="btn btn-light-warning" style="background-color: #ffcd39; color: #181C32" href="/arbol/arbol-mod-form?uid=${list.uid}">
                                                    수정
                                                </a>
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

<div id="loadingBar" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5); z-index: 1000;">
    <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
        <div class="loader"></div>
        <p style="color: white; text-align: center;">탐색중...</p>
    </div>
</div>

</body>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script type="text/javascript">


    /***************************************************** INIT ***************************************/


    function goPage(url) {

        window.open(url, '_blank');
    }

    let isSubmitting = false;
    /*********************************************************** DELETE *******************************************************/
    async function deleteBookTrigger(element) {
        if (isSubmitting) {
            return;
        }
        isSubmitting = true;

        const isUse = element.getAttribute('data-isUse');
        console.log(isUse)

        if (isUse === 'Y') {
            Swal.fire({
                title: '삭제 불가',
                text: '공개된 북트리거는 삭제할 수 없습니다.',
                icon: 'error',
                confirmButtonText: '확인'
            });
            isSubmitting = false;
            return;
        } else {
            // 탈퇴 처리 전에 사용자에게 확인 요청
            Swal.fire({
                title: '게시물 삭제',
                text: '등록하신 게시물을 삭제 하시겠습니까?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '확인',
                cancelButtonText: '취소'
            }).then(async (result) => {
                if (result.isConfirmed) {
                    let idx = element.getAttribute('data-idx');
                    try {
                        const response = await fetch('/api/v1/arbol-registration/' + idx, {
                            method: 'DELETE',
                            headers: {
                                'Content-Type': 'application/json',
                            }
                        });

                        const result = await response.json();

                        if (result.result == true) {
                            location.href = '/arbol/arbol';
                        } else {
                            location.reload();
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


    }
</script>

<style>

    .delete-btn {
        cursor: pointer;
        padding: 2px 5px;
        border-radius: 50%;
    }

    .delete-btn:hover {
        background-color: red;
        color: white;
    }


    .loader {
        border: 16px solid #f3f3f3; /* Light grey */
        border-top: 16px solid #ffff00; /* Yellow */
        border-radius: 50%;
        width: 120px;
        height: 120px;
        animation: spin 2s linear infinite;
    }

    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }

    /* 테이블의 열 너비를 고정하여 일관된 레이아웃 유지 */
    #seriesTable .num { width: 50px; text-align: left; }  /* 번호 열 */
    #seriesTable .text-dark { width: 200px; }                /* 도서명 열 */
    #seriesTable .button { width: 100px; text-align: center; }  /* 버튼 열 */

    /* 테이블의 최소 너비를 설정하여 내용이 줄어들어도 레이아웃 유지 */
    #seriesTable {
        min-width: 350px; /* 전체 테이블의 최소 너비 */
        width: 100%; /* 테이블 너비를 부모 요소에 맞춤 */
        table-layout: fixed; /* 테이블 레이아웃을 고정하여 열 너비가 고정됨 */
    }

    /* Froala 전체 에디터의 너비 확장 */
    .fr-box, .fr-wrapper {
        width: 100%; /* 전체 화면에 맞추기 */
        max-width: 1500px; /* 원하는 최대 너비 설정 */

    }


    .fr-view {
        max-width: 820px; /* 콘텐츠 가로 길이 제한 */
        margin: 0 auto; /* 가운데 정렬 */
    }


</style>
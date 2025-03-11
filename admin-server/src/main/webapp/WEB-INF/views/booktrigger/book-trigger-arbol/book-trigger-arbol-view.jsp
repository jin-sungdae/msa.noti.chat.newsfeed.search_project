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
                                                            <jsp:param name="parentTable" value="BOOK_TRIGGER"/>
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
                                                            <jsp:param name="parentTable" value="BOOK_TRIGGER"/>
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


                                        <div class="row mb-8">
                                            <div class="col-lg-12 row existUid">
                                                <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">언론보도</br>인트로 노출 여부</label>
                                                </div>
                                                <div class="col-lg-11 row">
                                                    <div class="col-lg-11 row">
                                                        <div class="col-lg-1 d-flex justify-content-start align-items-center mb-3 pt-3 ${list.isPressIntro eq 'Y' ? 'text-danger' : 'text-primary'}">
                                                            <c:out value="${list.isPressIntro}"/>
                                                        </div>
                                                    </div>
                                                    <c:if test="${list.isPressIntro eq 'Y'}">
                                                        <hr class="my-4">
                                                        <label class=" form-label fw-bolder text-dark pt-3 ">
                                                            <c:out value="${list.pressMain}"/>
                                                        </label>

<%--                                                    </c:if>--%>
<%--                                                    <c:if test="${not empty list.pressTitleList}">--%>
<%--                                                        <hr class="my-4">--%>
<%--                                                    </c:if>--%>
                                                    <c:forEach var="press" items="${list.pressTitleList}" varStatus="status">
                                                        <c:set var="pressParts" value="${fn:split(press, ':')}"/>
                                                        <div class="col-lg-11 row">
                                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                                <label class="col-lg-12 form-label fw-bolder text-blue d-flex align-items-center justify-content-start pt-2">
                                                                    <fmt:formatNumber value="${status.index + 1}" pattern="00."/>
                                                                </label>
                                                            </div>
                                                            <div class="col-lg-4 text-dark fw-bolder pt-2 mb-2">
                                                                <c:out value="${pressParts[0]}"/>
                                                            </div>
                                                            <div class="col-lg-4 text-dark fw-bolder pt-2 mb-2">
                                                                <c:out value="${pressParts[1]}"/>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                    </c:if>
                                                </div>

                                            </div>
                                        </div>

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
                                                <a type="button" class="btn btn-light-dark" style="background-color: #343a40; color: #FFFFFF" href="/book-trigger/book-trigger?page=${reqParam.page}&perPage=${reqParam.perPage}&sdate=${reqParam.sdate}&target=${reqParam.target}&field=${reqParam.field}&series=${reqParam.series}&isOpen=${reqParam.isOpen}&isIntro=${reqParam.isIntro}&isPressIntro=${reqParam.isPressIntro}&search=${reqParam.search}">목록</a>
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
                                                <a type="button" class="btn btn-light-warning" style="background-color: #ffcd39; color: #181C32" href="/book-trigger/book-trigger-mod-form?uid=${list.uid}">
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

    let itemCnt = 1;

    function goPage(url) {

        window.open(url, '_blank');
    }

    /**************************************************** UTILS ***************************************/

    window.onbeforeunload = function() {
        if (isModified) {
            return "변경 사항을 저장하지 않았습니다. 정말 지금 나가시겠습니까?";
        }
    };



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

    function getSelectedValues(selectElement) {
        let values = [];
        for (let i = 0; i < selectElement.options.length; i++) {
            let option = selectElement.options[i];
            values.push(option.value);

        }
        return values;
    }

    function getAllTagsText() {
        const tags = document.querySelectorAll('.tags');
        const tagList = Array.from(tags)
            .map(tag => tag.textContent.trim())
            .filter(value => value !== '');

        return tagList;
    }



    function getAllOnlineStores() {
        const stores = [];
        const rows = document.querySelectorAll('.row[id^="onlineStoreLine"]');

        rows.forEach(row => {
            const select = row.querySelector('select');
            const input = row.querySelector('input[type="text"]');

            if (select.value.trim() !== '' && input.value.trim() !== '') {
                const store = {
                    storeName: select.value,
                    storeUrl: input.value
                };

                stores.push(store);
            }
        });

        return stores;
    }

    function getAllAward() {
        const awards = document.querySelectorAll('.awards');
        const awardList = Array.from(awards)
            .map(award => award.value.trim())
            .filter(value => value !== '');

        return awardList;
    }


    function getAllPressIntroTitle() {
        const pressMain = document.querySelectorAll('.pressTitle');
        const pressMainList = Array.from(pressMain)
            .map(pressMain => pressMain.value.trim())
            .filter(value => value !== '');

        return pressMainList;
    }

    function getRandomAlphanumeric(length) {
        const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        let result = '';
        for (let i = 0; i < length; i++) {
            result += characters.charAt(Math.floor(Math.random() * characters.length));
        }
        return result;
    }


    /***************************************************** GET ***************************************/
    async function showAwards() {

        const isAwards = document.querySelector('input[name="isAwards"]:checked').value;
        if (isAwards === 'Y') {
            document.querySelectorAll('.awardLine').forEach(element => {
                element.style.display = 'block';
            });
        } else {
            document.querySelectorAll('.awardLine').forEach(element => {
                element.style.display = 'none';
            });
        }

    }

    async function showIsSeries() {
        const isSeries = document.querySelector('input[name="isSeries"]:checked').value;

        if (isSeries === 'Y') {
            document.getElementById('seriesBtn').style.display = 'block';
        } else {
            document.getElementById('seriesBtn').style.display = 'none';
        }
    }

    async function showIntro() {
        const intro = document.querySelector('input[name="isIntro"]:checked').value;
        const introOrder = document.getElementById('introOrder');
        if (intro === 'Y') {
            introOrder.disabled = false;
        } else {
            introOrder.disabled = true;
        }

    }

    async function showPressIntro() {
        const pressIntro = document.querySelector('input[name="isPressIntro"]:checked').value;
        if (pressIntro === 'Y') {
            document.getElementById('showIsMainPress').style.display = 'block';
            document.querySelectorAll('.pressLine').forEach(element => {
                element.style.display = 'flex';
            });
            // document.getElementById('showIsPress1').style.display = 'flex';
        } else {
            document.getElementById('showIsMainPress').style.display = 'none';
            document.querySelectorAll('.pressLine').forEach(element => {
                element.style.display = 'none';
            });
            // document.getElementById('showIsPress1').style.display = 'none';
        }
    }

    async function fileFormData(uid) {

        const dropzones = [
            ntdrop[0].files, ntdrop[1].files
        ];

        const previewYN = document.querySelector('input[name="preview"]:checked').value;
        console.log(previewYN);

        const fileSettings = {
            'THUMBNAIL': {
                DZID : '0',
                maxSizeMB: 1,
                allowedExtensions: /\.(jpg)$/i,
                type: 'THUMBNAIL',
                description: '교과서 섬네일',
                extension: '.jpg'
            },
            'PDF': {
                DZID : '1',
                maxSizeMB: 300,
                allowedExtensions: /\.(pdf)$/i,
                type: 'PDF',
                description: '미리보기 - PDF 등록',
                extension: '.pdf'
            },
        };

        const fileData = new FormData();
        fileData.append('ParentUid', uid);

        let allFilesProcessed = true;

        // 각 dropzone 처리
        for (let i = 0; i < dropzones.length; i++) {

            if (i === 1 && previewYN === 'URL') {
                continue;
            }

            const files = dropzones[i];
            if (files.length > 0) {
                const lastFile = files[files.length - 1];  // 마지막 파일 선택

                // 각 파일 세팅 찾기
                const settingKey = Object.keys(fileSettings).find(key => fileSettings[key].DZID == i.toString());
                if (settingKey) {
                    let processResult = await processFile(lastFile, fileSettings[settingKey], fileData, i + 1);
                    if (!processResult) {
                        allFilesProcessed = false;
                    }
                }
            }
        }

        // 파일 처리 결과를 반영
        if (!allFilesProcessed) {
            return null;
        }

        return fileData;
    }

    async function processFile(file, settings, fileData, sortOrder) {
        const fileSizeMB = file.size / (1024 * 1024);


        if (fileSizeMB <= settings.maxSizeMB && settings.allowedExtensions.test(file.name)) {
            fileData.append("files", file);
            fileData.append('sortOrder', sortOrder.toString());
            fileData.append('ParentTable', 'BOOK_TRIGGER');
            fileData.append('ParentType', settings.type);
            fileData.append('isSecure', 'N');
            fileData.append('description', settings.description);


            return true;
        } else {
            Swal.fire({
                title: '파일 업로드 오류',
                text: `파일은` +  settings.maxSizeMB + `MB 이하이며, ` + settings.extension + ` 형식만 가능합니다.`,
                icon: 'error',
                confirmButtonText: '확인'
            });
            return false;
        }
    }


    /********************************************************************** POST ************************************************/
    let isSubmitting = false;







    /******************************************************************* PUT ************************************************/

    let isModified = false;





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
                        const response = await fetch('/api/v1/book-trigger-registration/' + idx, {
                            method: 'DELETE',
                            headers: {
                                'Content-Type': 'application/json',
                            }
                        });

                        const result = await response.json();

                        if (result.result == true) {
                            location.href = '/book-trigger/book-trigger';
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

    /**************************************************** SERIES CODE MODAL UTILS ******************************************/

    let isSearching = false;
    async function searchSeriesCode() {
        if (isSearching) {
            return;
        }

        isSearching = true;

        const seriesSearch = document.getElementById('seriesSearch').value;
        const seriesKeyword = document.getElementById('seriesKeyword').value;


        let queryParams = '?page=1';

        if (seriesKeyword) {
            queryParams += '&keyword=' + seriesKeyword;
        }
        if (seriesSearch) {
            queryParams += '&search=' + seriesSearch;
        }



        try {
            const response = await fetch('/api/v1/textbook/series-code' + queryParams, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                }
            });

            const result = await response.json();

            if (result.result === true) {
                updateSeriesCodeTable(result.data.responseBookCodeDtoList);
                updateSeriesCodeForm(result.data.listNum);
                updateSeriesCodePagination(result.data.pageHtml);
            } else {
                Swal.fire({
                    title: '검색 실패',
                    text: '검색에 실패하였습니다.',
                    icon: 'error',
                    confirmButtonText: '확인'
                })
            }

        } catch (e) {

        } finally {
            isSearching = false;
        }


    }

    async function resetSeriesSearchForm() {
        if (isSubmitting) {
            return;
        }
        isSubmitting = true;

        let selects = document.querySelectorAll('.form-select');
        selects.forEach(function(select) {
            select.selectedIndex = 0;
            $(select).select2({
                minimumResultsForSearch: Infinity
            }).trigger('change');

        })


        try {
            const response = await fetch('/api/v1/textbook/series-code', {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                }
            });

            const result = await response.json();


            if (result.result === true) {
                updateSeriesCodeTable(result.data.responseBookCodeDtoList);
                updateSeriesCodeForm(result.data.listNum);
                updateSeriesCodePagination(result.data.pageHtml);
            } else {
                Swal.fire({
                    title: '검색 실패',
                    text: '검색에 실패하였습니다.',
                    icon: 'error',
                    confirmButtonText: '확인'
                })
            }

        } catch (e) {

        } finally {
            isSubmitting = false;
        }
    }


    async function changePageSeries(page) {

        if (isSearching) {
            return;
        }

        isSearching = true;

        const seriesSearch = document.getElementById('seriesSearch').value;
        const seriesKeyword = document.getElementById('seriesKeyword').value;


        let queryParams = '?page=' + page;

        if (seriesKeyword) {
            queryParams += '&keyword=' + seriesKeyword;
        }
        if (seriesSearch) {
            queryParams += '&search=' + seriesSearch;
        }



        try {
            const response = await fetch('/api/v1/textbook/series-code' + queryParams, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                }
            });

            const result = await response.json();
            console.log(result);

            if (result.result === true) {
                console.log('result.data.======', result.data.responseBookCodeDtoList)
                updateSeriesCodeTable(result.data.responseBookCodeDtoList);
                updateSeriesCodeForm(result.data.listNum);
                updateSeriesCodePagination(result.data.pageHtml);
            } else {
                Swal.fire({
                    title: '검색 실패',
                    text: '검색에 실패하였습니다.',
                    icon: 'error',
                    confirmButtonText: '확인'
                })
            }

        } catch (e) {

        } finally {
            isSearching = false;
        }

    }


    function updateSeriesCodePagination(html) {

        let pagination = document.getElementById('seriesPagination');


        pagination.innerHTML = '';
        pagination.innerHTML = html;

        console.log('hhh' , pagination.innerHTML);


    }


    function updateSeriesCodeForm(listNum) {

        document.getElementById('seriesCodeListNum').innerHTML = `검색결과 총 <span class="fw-bolder">` + listNum  + ` </span> 개`;

    }

    function updateSeriesCodeTable(data) {
        const tableBody = document.getElementById('seriesCodeModalTableBody');

        tableBody.innerHTML = ''; // 기존의 테이블 내용을 비웁니다.

        data.forEach(function(item) {
            const row = tableBody.insertRow();
            const NM_CLASS = row.insertCell(0);
            const CD_SERIES = row.insertCell(1);
            const CD_BRAND = row.insertCell(2);
            const NM_SERIES = row.insertCell(3);
            const choice = row.insertCell(4);

            NM_CLASS.textContent = item.nm_CLASS;
            CD_SERIES.textContent = item.cd_SERIES;
            CD_BRAND.textContent = item.cd_BRAND;
            NM_SERIES.textContent = item.nm_SERIES;


            choice.innerHTML = `
                <span class="badge badge-secondary"  data-code="` + item.cd_SERIES + `" data-name="` + item.cd_BRAND + `" data-year="` + item.nm_SERIES + `" onclick="selectSeriesCode(this)">선택</span>
        `;

            // 추가적인 클래스나 이벤트 리스너 설정 가능
            NM_CLASS.className = 'text-dark fw-bold text-hover-warning hoverable';
            CD_SERIES.className = 'text-hover-warning hoverable';
            CD_BRAND.className = 'text-hover-warning hoverable';
            NM_SERIES.className = 'text-hover-warning hoverable';
            choice.className = 'text-hover-warning hover-scale hoverable';
        });
    }

    /**
     * 선택한 교재 코드를 입력 폼에 적용합니다.
     * @param element
     * @returns {Promise<void>}
     */
    async function selectSeriesCode(element) {
        let code = element.getAttribute('data-code');
        let name = element.getAttribute('data-name');
        let dataYear = element.getAttribute('data-year');

        console.log(code, name, dataYear);



        let seriesCode1 = document.getElementById('seriesCode1');
        let seriesCode2 = document.getElementById('seriesCode2');
        let year = document.getElementById('year');

        console.log(code, name, dataYear);

        seriesCode1.value = code;
        seriesCode2.value = name;
        year.value = dataYear;

        // 년도 는 disabled 처리
        year.disabled = false;

        // modal 창 닫기
        let modal = document.getElementById('seriesCodeModalLayout');
        modal.remove();
        closeModalBackdrop();
        document.body.classList.remove('modal-open'); // modal-open 클래스 제거
        document.body.style.overflow = ''; // 스크롤 스타일 초기화

    }


    /*********************************************************** Modal 영역 ********************************************/


    function attachModalEventListeners() {

        const seriesModalElements = document.querySelectorAll('.seriesCodeModal:not(.modal-attached)');

        seriesModalElements.forEach(function (element) {

            element.classList.add('modal-attached');
            element.addEventListener('click', openSeriesModalHandler);
        });
    }

    function openSeriesModalHandler(event) {
        const modalLayout = document.createElement('div');
        modalLayout.classList.add('modal', 'fade');
        modalLayout.id = 'seriesCodeModalLayout';
        modalLayout.tabIndex = '-1';
        modalLayout.setAttribute('aria-hidden', 'true');

        const modalDialog = document.createElement('div');
        modalDialog.classList.add('modal-dialog', 'modal-dialog-centered', 'modal-xl');
        modalDialog.id = 'modalContent';

        modalLayout.appendChild(modalDialog);
        document.body.appendChild(modalLayout);
        let modal = new bootstrap.Modal(modalLayout, {
            keyboard: false
        });

        modalLayout.addEventListener('hidden.bs.modal', function() {
            modalLayout.remove();
        });

        let series = document.getElementById('series');
        series = getSelectedValues(series);

        console.log(series);
        document.getElementById('loadingBar').style.display = 'block';
        NTUtil.ajax({
            url: '/book-trigger/book-trigger-series-search-modal?series=' + series,
            method: 'GET',
            success: function (data) {
                modalDialog.innerHTML = '';
                modalDialog.insertAdjacentHTML('beforeend', data);
                $(modalDialog).find('select').select2({
                    minimumResultsForSearch: Infinity
                });
                document.getElementById('loadingBar').style.display = 'none';
                modal.show();
            }
        })
    }

    function closeSeriesCodeModal() {
        let modal = document.getElementById('seriesCodeModalLayout');
        modal.remove();
        closeModalBackdrop();
    }

    function closeModalBackdrop() {
        let backdrops = document.querySelectorAll('.modal-backdrop');

        if (!document.querySelector('.modal.show')) {

            backdrops.forEach(backdrop => backdrop.remove());
        }
    }

    attachModalEventListeners();


    function deleteFile (element) {
        console.log('hih')
        let idx = element.getAttribute('data-id');

        let replaceImageIdx = idx.replace('dropzone', 'dropzoneImage');
        console.log(replaceImageIdx);
        const test = document.getElementById(replaceImageIdx);
        test.remove();

        test.style.display = 'none';

        let replaceIdx = idx.replace('dropzone', '');
        console.log(idx);
        var parentElement = document.getElementById(replaceIdx);

        if (parentElement) {
            var dropzone = parentElement.querySelector('#' + idx);
            console.log(dropzone);
            if (dropzone) {
                // 'display' 속성을 토글합니다.
                if (dropzone.style.display === 'none') {
                    dropzone.style.display = 'block';
                } else {
                    dropzone.style.display = 'none';
                }

            } else {

            }
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

    /* 에디터 내부 콘텐츠 영역의 가로 길이 제한 */
    .fr-view {
        max-width: 820px; /* 콘텐츠 가로 길이 제한 */
        margin: 0 auto; /* 가운데 정렬 */
    }

</style>
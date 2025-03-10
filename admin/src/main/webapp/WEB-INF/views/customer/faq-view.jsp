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
<%--                    <input type="hidden" name="uid" id="uid" value="${faq.uid}"/>--%>
                    <input type="hidden" name="adminId" id="adminId" value="<c:out value="${faq.adminId}"/>"/>
                    <input type="hidden" name="adminIdx" id="adminIdx" value="<c:out value="${faq.adminIndex}"/>"/>
                    <input type="hidden" name="adminName" id="adminName" value="<c:out value="${faq.adminName}"/>"/>
                    <input type="hidden" name="account" id="account" value ="<c:out value="${account}" />"/>
                    <input type="hidden" name="faqIndex" id="faqIndex" value="<c:out value="${faq.faqIndex}"/>"/>
                    <input type="hidden" name="uid" id="uid" value="<c:out value="${faq.uid}"/>"/>

                    <div class="container-fluid">
                        <!-- 본문 내용 START -->
                        <form>
                            <div class="card mb-5 mb-xl-10">
                                <div class="card-header border-0 pt-5">
                                    <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                        <c:choose>
                                            <c:when test="${faqCase eq 1}">자주하는 질문</c:when>
                                            <c:otherwise>FAQ 관리</c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-lg-6 row mb-8">
                                            <div class="col-lg-2">
                                                <label class="col-lg-10 fw-bolder text-dark pt-3">작성자</label>
                                            </div>
                                            <div class="col-lg-10">
                                                <div class="col-lg-12 text-dark pt-3">
                                                    <c:out value="${faq.adminName}"/>(<c:out value="${faq.department}"/>)
                                                </div>
                                            </div>
                                        </div>
                                        <c:if test="${faq != null}">
                                            <div class="col-lg-6 row mb-8">
                                                <div class="col-lg-2">
                                                    <label class="col-lg-10 fw-bolder text-dark pt-3">작성일시</label>
                                                </div>
                                                <div class="col-lg-10">
                                                    <div class="col-lg-12 text-dark pt-3">
                                                        <c:choose>
                                                            <c:when test="${faq.modDate ne null and faq.modDate != ''}">
                                                                <c:out value="${faq.modDate}"/>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:out value="${faq.regDate}"/>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3 ">질문</label>
                                            </div>
                                            <div class="col-lg-11">
                                                <div class="col-lg-12 text-dark pt-3 maxImagesize">
                                                    <c:out value="${faq.question}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 ">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 ">구분</label>
                                            </div>
                                            <div class="col-lg-11">
                                                <div class="col-lg-12 text-dark pt-3">
                                                    <c:set value="0" var="firstVal"/>
                                                    <c:forEach items="${faqType}" var="type" varStatus="status">
                                                        <c:if test="${fn:contains(faq.faqType, type.getName()) && type.getValue() != ''}">
                                                            <c:if test="${firstVal eq '1'}">,</c:if>
                                                            <c:out value="${type.getValue()}"/>
                                                            <c:set value="1" var="firstVal"/>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1">
                                                <div class="col-lg-12">
                                                    <label class="form-label fw-bolder text-dark pt-3 ">답변</label>
                                                </div>
                                            </div>

                                            <div class="col-lg-11">
                                                <div class="col-lg-12 text-dark pt-3 maxImagesize">
                                                    <div>${faq.answer}</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 row mb-8">
                                            <div class="col-lg-2 ">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3 ">노출여부</label>
                                            </div>
                                            <div class="col-lg-10 pt-3 row">
                                                <div class="col-lg-12">
                                                    <c:out value="${faq.isOpen}"/>
                                                </div>
                                            </div>
                                        </div>
<%--                                        <div class="col-lg-6 row mb-8">--%>
<%--                                            <div class="col-lg-2 ">--%>
<%--                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3 ">노출 순서</label>--%>
<%--                                            </div>--%>
<%--                                            <div class="col-lg-10 pt-3 row">--%>
<%--                                                <div class="col-lg-12">--%>
<%--                                                    <c:out value='${faq.sortOrder}'/>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
                                    </div>
                                </div>
                                <div class="card-footer" id="footerIdx">
                                    <div class="row">
                                        <div id="listGroup" class="col-3">
                                            <c:choose>
                                                <c:when test="${not empty faqCase}">
                                                    <a href="/reading-review/faq?faqCase=1&faqType=<c:out value='${param.faqType}'/>&isOpen=<c:out value='${param.isOpen}'/>&searchValue=<c:out value='${param.searchValue}'/>" class="btn btn-light-primary" style="background-color: #343a40; color: #FFFFFF">목록</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="/customer/faq?faqCase=0&faqType=<c:out value='${param.faqType}'/>&isOpen=<c:out value='${param.isOpen}'/>&searchValue=<c:out value='${param.searchValue}'/>" class="btn btn-light-primary" style="background-color: #343a40; color: #FFFFFF">목록</a>
                                                </c:otherwise>
                                            </c:choose>
<%--                                            <button type="button" class="btn btn-light-primary" style="background-color: #343a40; color: #FFFFFF" onclick="history.back()">목록</button>--%>
                                        </div>
                                        <div class="col-9 d-flex justify-content-end">
                                            <button type="button" class="btn btn-light-warning me-2" id="deleteBtn" style="color: #181C32" data-faq-case="<c:out value='${faqCase}'/>">
                                                삭제
                                            </button>
                                            <button type="button" class="btn btn-warning" data-faq-case="<c:out value='${faqCase}'/>" style="background-color: #ffcd39; color: #181C32" id="modifyBtn">
                                                수정
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
<style>
    .maxImagesize img {max-width: 100%;}
</style>
</body>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script type="text/javascript">
    const remove = async (faqCase) => {
        let uid = document.getElementById('uid').value;
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
                const response = await fetch('/api/v1/customer/faq/'+uid, {
                    method: 'DELETE',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify()
                });

                const res = await response.json();
                if (res) {
                    location.href = faqCase ? '/reading-review/faq' : '/customer/faq';
                }
            }
        })
    }
    const modify = (faqCase) => {
        let uid = document.getElementById('uid').value;
        location.href = faqCase ? '/reading-review/faq-mod-form/'+uid : '/customer/faq-mod-form/'+uid;
    };

    document.addEventListener('DOMContentLoaded', function () {
        const modifyBtn = document.getElementById('modifyBtn');
        const deleteBtn = document.getElementById('deleteBtn');
        if(deleteBtn) {
            deleteBtn.addEventListener('click', () => remove(deleteBtn.dataset.faqCase));
        }
        modifyBtn.addEventListener('click', () => modify(modifyBtn.dataset.faqCase));
    })
    </script>
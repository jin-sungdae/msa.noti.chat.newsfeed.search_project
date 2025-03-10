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
                    <input type="hidden" name="uid" id="uid" value="<c:out value="${agreement.uid}"/>"/>
                    <input type="hidden" name="adminId" id="adminId" value="<c:out value="${agreement.adminId}"/>"/>
                    <input type="hidden" name="adminIdx" id="adminIdx" value="<c:out value="${agreement.adminIndex}"/>"/>
                    <input type="hidden" name="isOpen" id="isOpen" value ="<c:out value="${agreement.isOpen}" />"/>
                    <input type="hidden" name="account" id="account" value ="${account}" />
                    <div class="container-fluid">
                        <!-- 본문 내용 START -->
                        <form>
                            <div class="card mb-5 mb-xl-10">
                                <div class="card-header border-0 pt-5">
                                    <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                        약관 관리
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
                                                    <c:out value="${agreement.adminName}"/>(<c:out value="${agreement.department}"/>)
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 row mb-8">
                                            <div class="col-lg-2">
                                                <label class="col-lg-10 fw-bolder text-dark pt-3">작성일시</label>
                                            </div>
                                            <div class="col-lg-10">
                                                <div class="col-lg-12 text-dark pt-3">
                                                    <c:out value="${agreement.regDate}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 row mb-8">
                                            <div class="col-lg-2">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3">약관구분</label>
                                            </div>
                                            <div class="col-lg-10">
                                                <div class="col-lg-12 text-dark pt-3">
                                                    <c:forEach items="${agreementType}" var="type" varStatus="status">
                                                        <c:if test="${type.getName() == agreement.agreementType}"><c:out value="${type.getValue()}"/></c:if>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                        <c:if test="${agreement.modDate ne null and agreement.modDate != ''}">
                                        <div class="col-lg-6 row mb-8">
                                            <div class="col-lg-2">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3">수정일시</label>
                                            </div>
                                            <div class="col-lg-10">
                                                <div class="col-lg-12 text-dark pt-3">
                                                    <c:out value="${agreement.modDate}"/>
                                                </div>
                                            </div>
                                        </div>
                                        </c:if>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 ">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">개정일</label>
                                            </div>
                                            <div class="col-lg-11">
                                                <div class="col-lg-12 text-dark pt-3">
                                                    <c:out value="${agreement.revisionDate}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1">
                                                <div class="col-lg-12">
                                                    <label class="form-label fw-bolder text-dark pt-3">내용</label>
                                                </div>
                                            </div>

                                            <div class="col-lg-11">
                                                <div class="col-lg-12 text-dark pt-3">
                                                    <div>${agreement.content}</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 ">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3">노출여부</label>
                                            </div>
                                            <div class="col-lg-11 pt-3 row">
                                                <div class="col-lg-12">
                                                    <c:out value="${agreement.isOpen}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer" id="footerIdx">
                                    <div class="row">
                                        <div id="listGroup" class="col-3">
                                            <a href="/site/agreement?page=<c:out value='${page}'/>&perPage=<c:out value='${perPage}'/>&startDate=<c:out value='${param.startDate}'/>&endDate=<c:out value='${param.endDate}'/>&agreementType=<c:out value='${param.agreementType}'/>&isOpen=<c:out value='${param.isOpen}'/>&searchValue=<c:out value='${param.searchValue}'/>" class="btn btn-light-primary" style="background-color: #343a40; color: #FFFFFF">목록</a>
                                        </div>
                                        <div class="col-9 d-flex justify-content-end">
                                            <c:choose>
                                                <c:when test="${agreement.isOpen == 'N'}">
                                                    <button type="button" class="btn btn-light-warning me-2" style="color: #181C32" id="deleteBtn">
                                                        삭제
                                                    </button>
                                                </c:when>
                                                <c:otherwise>
                                                    <button type="button" class="btn btn-dark me-2" disabled>
                                                        삭제
                                                    </button>
                                                </c:otherwise>
                                            </c:choose>
                                            <button type="button" class="btn btn-warning" style="background-color: #ffcd39; color: #181C32" id="modifyBtn">
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

</body>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script type="text/javascript">
    const remove = async () => {
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
                const response = await fetch('/api/v1/site/agreement/' + uid, {
                    method: 'DELETE',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify()
                });

                const res = await response.json();
                if (res) {
                    location.href = '/site/agreement'
                }
            }
        })
    }
    const modify = () => {
        const uid = document.getElementById('uid').value;
        window.location.href = '/site/agreement-mod-form/' + uid;
    };

    document.addEventListener('DOMContentLoaded', function () {
        const isOpen = document.getElementById('isOpen').value;
        if (isOpen == 'N') {
            document.getElementById('deleteBtn').addEventListener('click', () => remove());
        }
        document.getElementById('modifyBtn').addEventListener('click', () => modify());
    })
    </script>
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
                <c:set value="${menuTitle}" var="menuTitle"/>
                <%@ include file="/WEB-INF/views/common/inc/ToolbarINC.jsp" %>
                <div class="post d-flex flex-column-fluid">
                    <div class="container-fluid">
                        <!-- 본문 내용 START -->
                        <input type="hidden" name="menu" id="menu" value="${menu}">
                        <form id="dataBoardForm">
                            <input type="hidden" name="uid" id="uid" value="${uid}"/>
                            <input type="hidden" id="categoryCode" name="categoryCode" value="${categoryCode}">
                            <div class="card mb-5 mb-xl-10">
                                <div class="card-header border-0 pt-5">
                                    <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                        ${menu eq 'reference-book' ? '기출ㆍ평가자료 관리' : '자료실'}
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="row mb-8">
                                        <div class="col-lg-6 row">
                                            <div class="col-lg-2 d-flex justify-content-center align-items-center">
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3">작성자</label>
                                            </div>
                                            <div class="col-lg-10 row">
                                                <div id="userType" class="col-lg-4 form-label text-dark pt-3">
                                                    <c:out value="${data.adminName}"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 row">
                                            <div class="col-lg-2 d-flex justify-content-center align-items-center">
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3">작성일시</label>
                                            </div>
                                            <div class="col-lg-10 row">
                                                <div class="col-lg-4 form-label text-dark pt-3">
                                                    <c:out value="${data.modDate eq null ? data.regDate : data.modDate}"/>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <c:if test="${menu ne 'reference-book'}">
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                    <label class="col-lg-9 form-label fw-bolder text-dark pt-3 ">자료명</label>
                                                </div>

                                                <div class="col-lg-10 d-flex align-items-center">
                                                    <c:out value="${data.title}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>

                                    <c:if test="${menu eq 'reading-review' || menu eq 'reference-book'}">
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                    <label class="col-lg-9 form-label fw-bolder text-dark pt-3 ">
                                                        <c:if test="${menu eq 'reference-book'}">
                                                            과목
                                                        </c:if>
                                                        <c:if test="${menu eq 'reading-review'}">
                                                            구분
                                                        </c:if>
                                                    </label>
                                                </div>
                                                <div class="col-lg-10 d-flex align-items-center">
                                                    <c:forEach items="${category1Depth}" var="depth1">
                                                        <c:if test="${data.categoryIndex1 eq depth1.categoryIndex}">
                                                            <span><c:out value="${depth1.categoryName}"/></span>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                    <label class="col-lg-9 form-label fw-bolder text-dark pt-3 ">자료구분</label>
                                                </div>
                                                <div class="col-lg-10 d-flex align-items-center">
                                                    <c:forEach items="${category2Depth}" var="depth2">
                                                        <c:if test="${data.categoryIndex2 eq depth2.categoryIndex}">
                                                            <span><c:out value="${depth2.categoryName}"/></span>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3 ">노출 여부</label>
                                            </div>
                                            <div class="col-lg-2 d-flex align-items-center">
                                                <span>
                                                    ${data.isOpen}
                                                </span>
                                            </div>
                                        </div>
                                    </div>

                                    <c:if test="${menu eq 'arbol' || menu eq 'book-trigger'}">
                                        <div class="row mb-8">
                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3 ">상단 고정</label>
                                            </div>
                                            <div class="col-lg-2 d-flex align-items-center">
                                                <span>${data.isTop}</span>
                                            </div>
                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                <label class="form-label fw-bolder text-dark pt-3">노출순서</label>
                                            </div>
                                            <div class="col-lg-2 d-flex align-items-center">
                                                <span>${data.sortOrder}</span>
                                            </div>
                                        </div>
                                    </c:if>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1  d-flex align-items-center justify-content-center">
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3 ">${menu ne 'reference-book' ? '자료유형' : '자료명'}</label>
                                            </div>
                                            <div class="col-lg-10">
                                                <div class="col-lg-12 pt-3">
                                                    <jsp:include page="/FileFormINC" flush="false">
                                                        <jsp:param name="fileFormType" value="Y" />
                                                        <jsp:param name="viewType" value="view" />
                                                        <jsp:param name="isImage" value="false" />
                                                        <jsp:param name="hasOrder" value="false" />
                                                        <jsp:param name="parentTable" value="DATA_BOARD"/>
                                                        <jsp:param name="parentUid" value="${uid}"/>
                                                        <jsp:param name="parentType" value="FILE"/>
                                                        <jsp:param name="maxFileCount" value="1"/>
                                                        <jsp:param name="isSecure" value="N"/>
                                                        <jsp:param name="DZID" value="dz1"/>
                                                        <jsp:param name="description" value="파일 크기는 300mb 이하, mp3, mp4, pdf, jpg, jpeg, png, hwp, hwpx, ppt, pptx, dox, doxc, zip 형식의 파일만 가능합니다."/>
                                                    </jsp:include>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer" id="footerIdx">
                                    <div class="row">
                                        <div id="listGroup" class="col-3">
                                            <button type="button" data-nt-action="goList" href="/${menu}/data-board" class="btn btn-light-primary" style="background-color: #343a40; color: #FFFFFF">목록</button>
                                        </div>
                                        <div id="editGroup" class="col-9 d-flex justify-content-end">
                                            <c:choose>
                                                <c:when test="${data.isOpen == 'N' and menu eq 'reference-book'}">
                                                    <button
                                                        type="button"
                                                        class="btn btn-light-warning me-2"
                                                        style="color: #181C32"
                                                        onclick="deleteDataBoardData()">
                                                        삭제
                                                    </button>
                                                </c:when>
                                                <c:when test="${data.isOpen != 'N' and menu eq 'reference-book'}">
                                                    <button type="button" class="btn btn-dark me-2" disabled>
                                                        삭제
                                                    </button>
                                                </c:when>
                                                <c:otherwise>
                                                    <button
                                                        type="button"
                                                        class="btn btn-light-warning me-2"
                                                        style="color: #181C32"
                                                        onclick="deleteDataBoardData()">
                                                        삭제
                                                    </button>
                                                </c:otherwise>
                                            </c:choose>
                                            <button id="saveButton" type="button" class="btn btn-warning" style="background-color: #ffcd39; color: #181C32">
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

<div class="modal fade" id="modalLayout" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered mw-900px" id="modalContent">

    </div>
</div>

</body>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script src="/assets/js/file.js"></script>
<script type="text/javascript">

    let dataBoardPopupFv = null;
    const uid = document.getElementById('uid').value;
    const menu = document.getElementById('menu').value;
    let viewType = "${viewType}";
    let ntdrop = [];

   const deleteDataBoardData = () => {
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
               const response = await fetch(`/api/v1/reading-review/data-board/\${uid}`, {
                   method: 'DELETE',
                   headers: {
                       'Content-Type': 'application/json',
                   },
               });
               const res = await response.json();
               if(res.result) {
                   const url = `/\${menu}/data-board`;
                   window.location.href = url;
               }
           }
       });
   }

    document.getElementById('saveButton').addEventListener('click', () => {
        const url = `/\${menu}/data-board-mod-form?uid=\${uid}`;
        window.location.href = url;
    });

    document.querySelectorAll('[data-nt-action="goList"]').forEach(el => {
        el.addEventListener('click', function () {
            const url = '/${menu}/data-board' + location.search;
            location.href = url;
        })
    })

</script>
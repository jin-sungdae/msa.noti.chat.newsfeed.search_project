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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lipis/flag-icons@6.6.6/css/flag-icons.min.css"/>
<div class="d-flex flex-column flex-root">
    <div class="page d-flex flex-row flex-column-fluid">
        <%@ include file="/WEB-INF/views/common/inc/BodyAsideINC.jsp" %>
        <div class="wrapper d-flex flex-column flex-row-fluid" id="kt_wrapper">
            <%@ include file="/WEB-INF/views/common/inc/BodyHeaderINC.jsp" %>
            <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
                <%@ include file="/WEB-INF/views/common/inc/ToolbarINC.jsp" %>

                <div id="kt_content_container" class="container-fluid">
                    <div class="card mb-7">
                        <form class="form" id="faqForm">
                            <input type="hidden" value="<c:out value='${page.currentPage < 1 ? 1 : page.currentPage}'/>" name="page" id="page"/>
                            <input type="hidden" value="<c:out value='${page.pageListSize < 1 ? 30 : page.pageListSize}'/>" name="perPage"/>
                            <input type="hidden" value="<c:out value='${faqCase}'/>" name="faqCase" id="faqCase"/>
                            <div class="card-body">
                                <div class="row g-8">
<%--                                    <div class="col-xxl-3 fv-row">--%>
<%--                                        <label class="fs-6 form-label fw-bolder text-dark">기간</label>--%>
<%--                                        <div class="row fv-row fv-plugins-icon-container">--%>
<%--                                            <div class="col-6">--%>
<%--                                                <div class="input-group">--%>
<%--                                                    <input--%>
<%--                                                            id="startDate"--%>
<%--                                                            name="startDate"--%>
<%--                                                            class="form-control flatpickr-input"--%>
<%--                                                            placeholder="시작일"--%>
<%--                                                            autocomplete="off"--%>
<%--                                                            value="${search.startDate}"--%>
<%--                                                    />--%>
<%--                                                    <span class="input-group-text" id="basic-addon3">--%>
<%--                                                    <i class="bi bi-calendar-check fs-1"></i>--%>
<%--                                                    </span>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="col-6">--%>
<%--                                                <div class="input-group">--%>
<%--                                                    <input--%>
<%--                                                            id="endDate"--%>
<%--                                                            name="endDate"--%>
<%--                                                            class="form-control flatpickr-input"--%>
<%--                                                            placeholder="종료일"--%>
<%--                                                            autocomplete="off"--%>
<%--                                                            value="${search.endDate}"--%>
<%--                                                    />--%>
<%--                                                    <span class="input-group-text" id="basic-addon">--%>
<%--                                                    <i class="bi bi-calendar-check fs-1"></i>--%>
<%--                                                    </span>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
                                    <div class="col-lg-2">
                                        <label
                                                class="fs-6 form-label fw-bolder text-dark"
                                                for="faqType"
                                        >
                                            구분
                                        </label>
                                        <select
                                                id="faqType"
                                                name="faqType"
                                                class="form-select form-select-solid"
                                                data-control="select2"
                                                data-hide-search="true"
                                                data-placeholder="전체"
                                        >
                                            <c:forEach items="${faqType}" var="type" varStatus="status">
                                                <option value="<c:out value="${type}"/>" <c:if test="${type.getValue() == search.faqType.getValue()}">selected</c:if> >
                                                    <c:choose>
                                                        <c:when test="${type.getValue() eq ''}">전체</c:when>
                                                        <c:otherwise>${type.getValue()}</c:otherwise>
                                                    </c:choose>
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="col-lg-2">
                                        <label class="fs-6 form-label fw-bolder text-dark">노출여부</label>
                                        <select
                                                id="isOpen"
                                                name="isOpen"
                                                class="form-select form-select-solid"
                                                data-control="select2"
                                                data-hide-search="true"
                                                data-placeholder="전체"
                                        >
                                            <option value="전체">전체</option>
                                            <option value='Y' <c:if test="${search.isOpen eq 'Y'}">selected</c:if>>Y</option>
                                            <option value='N' <c:if test="${search.isOpen eq 'N'}">selected</c:if>>N</option>
                                        </select>
                                    </div>

                                    <div class="col-lg-5">
                                        <div class="row g-8">
                                            <div class="col-lg-12">
                                                <label class="fs-6 form-label fw-bolder text-dark">검색어</label>
                                                <input
                                                        type="text"
                                                        id="searchValue"
                                                        name="searchValue"
                                                        class="form-control"
                                                        placeholder="검색어 입력"
                                                        maxlength="100"
                                                        value="<c:out value="${search.searchValue}"/>"
                                                />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="card-footer">
                                <div class="d-flex justify-content-end" data-kt-customer-table-toolbar="base">
                                    <div>
                                        <a href="javascript:;" id="resetBtn" class="btn btn-light" style="color: #181c32; background-color : #fff3cd">
                                            <i class="fas bi-arrow-repeat fs-2 me-2"></i>
                                            초기화
                                        </a>
                                        <button type="button" class="btn btn-m btn-warning" id="searchBtn" style="background-color: #ffcd39; color: #181C32">
                                            검색
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="card">
                        <div class="card-header border-0 pt-6L">
                            <div class="card-title">
                                <div class="row d-flex align-items-center justify-content-between">
                                    <div class="col d-flex align-items-center justify-content-between">
                                        <h3 class="fs-6 fw-bold mt-3 mb-3" style="flex-grow: 1; min-width: 0; white-space: nowrap;">총 <span class="fw-bolder"><c:out value="${listNum}"/></span> 개</h3>
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
                                    <th class="min-w-70px" style="display: none;">노출순서</th>
                                    <th class="min-w-70px">구분</th>
                                    <th class="min-w-70px">질문</th>
                                    <th class="min-w-70px">노출여부</th>
                                    <th class="min-w-60px">작성자</th>
                                    <th class="min-w-50px">작성일시</th>
                                </tr>
                                <!--end::Table row-->
                                </thead>
                                <!--end::Table head-->
                                <!--begin::Table body-->
                                <tbody id="faqList">
                                <c:if test="${not empty faqList}">
                                    <c:forEach items="${faqList}" var="list" varStatus="status">
                                        <tr>
                                            <td class="text-dark fw-bold" style="display: none;">
                                                <span class="btn btn-icon btn-sm btn-hover-light-primary draggable-handle align-items-center">
                                                    <i class="las la-arrows-alt"></i>
                                                </span>
                                                <span class="sortOrder"><c:out value="${list.sortOrder}"/></span>
                                            </td>
                                            <td class="text-dark fw-bold">
                                                <c:set value="0" var="firstVal"/>
                                                <c:forEach items="${faqType}" var="type" varStatus="status">
                                                    <c:if test="${fn:contains(list.faqType, type.getName()) && type.getValue() != ''}">
                                                        <c:if test="${firstVal eq '1'}">,</c:if>
                                                        <c:out value="${type.getValue()}"/>
                                                        <c:set value="1" var="firstVal"/>
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td class="text-dark text-hover-warning fw-bold hoverable"
                                                data-idx="<c:out value='${list.uid}'/>"
                                                data-faq-case="<c:out value='${faqCase}'/>"
                                                onclick="loadView(this)">
                                                <c:out value="${list.question}"/>
                                            </td>
                                            <td class="text-dark fw-bold">
                                                <c:out value="${list.isOpen}"/>
                                            </td>
                                            <td class="text-dark fw-bold">
                                                <c:out value="${list.adminName}"/> (<c:out value="${list.department}"/>)
                                            </td>
                                            <td class="text-dark fw-bold">
                                                <c:out value="${list.regDate}"/>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty faqList}">
                                    <tr>
                                        <td class="center" colspan="7">
                                            데이터가 없습니다.
                                        </td>
                                    </tr>
                                </c:if>
                                </tbody>
                                <!--end::Table body-->
                            </table>
                            <!--end::Table-->
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <c:if test="${not empty faqList}">
                                        <c:if test="${search.searchValue == null && search.isOpen == null}">
                                            <button type="button" class="btn btn-m" style=" color: #fff; background-color: #343a40;" id="sortListBtn">
                                                 순서 변경
                                            </button>
                                        </c:if>
                                    </c:if>
                                    <button type="button" class="btn btn-m btn-warning" style="color: #181C32; background-color: #ffcd39; display: none;" id="saveChangeOrderBtn">
                                        저장
                                    </button>
                                </div>
<%--                                    <div class="d-flex justify-content-center flex-grow-1">--%>
<%--                                        <%@ include file="/WEB-INF/views/common/inc/Paging.jsp" %>--%>
<%--                                    </div>--%>
                                <div>
                                    <button type="button" class="btn btn-light-primary" style="display: none;"  id="cancelBtn">
                                        취소
                                    </button>
                                    <c:choose>
                                        <c:when test="${faqCase eq 1}">
                                            <a href="/reading-review/faq-reg-form" class="btn btn-m" style=" color: #fff; background-color: #343a40;" id="registerBtn">
                                                등록
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="/customer/faq-reg-form" class="btn btn-m" style=" color: #fff; background-color: #343a40;" id="registerBtn">
                                                등록
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/sortablejs@1.15.2/Sortable.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script type="text/javascript">
    const resetForm = () => {
        let faqCase = document.getElementById('faqCase').value;
        location.href = faqCase ? '/reading-review/faq' : '/customer/faq';
    };
    // 버튼 세팅 registerBtn
    const saveChangeOrderBtn = document.getElementById('saveChangeOrderBtn');
    const registerBtn = document.getElementById('registerBtn');
    const sortListBtn = document.getElementById('sortListBtn');
    const cancelBtn = document.getElementById('cancelBtn');
    const resetBtn = document.getElementById('resetBtn');
    const searchBtn = document.getElementById('searchBtn');
    // 로드시점 동작
    document.addEventListener('DOMContentLoaded', function () {
        // initializeFlatpickr();
        const targetNode = document.querySelectorAll('.form-select');
        targetNode.forEach((node) => {
            node.style.backgroundColor = '#ffffff';
            node.style.backgroundClip = 'padding-box';
            node.style.border = '1px solid #E4E6EF';
        });
        searchBtn.addEventListener('click', () => search());
        document.getElementById('searchValue').addEventListener('keydown', (evt) => {
            let searchValue = document.getElementById('searchValue').value.trim();
            if(evt.key == "Enter" && searchValue) {
                search()
            }
        });
        resetBtn.addEventListener('click', () => resetForm());
        sortListBtn.addEventListener('click', () => {
            setSortList();
            sortListBtn.style.display = 'none';
            registerBtn.style.display = 'none';
            searchBtn.disabled = true;
            saveChangeOrderBtn.style.display = 'block';
            cancelBtn.style.display = 'block';
        });
        saveChangeOrderBtn.addEventListener('click', () => modifyOrder());
        cancelBtn.addEventListener('click', () => {
            Swal.fire({
                title: '순서 변경을 취소하시겠습니까?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: '확인',
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.isConfirmed) {
                    location.reload();
                }
            })
        });
    })
    const search = () => {
        // let faqTypeVal = document.getElementById('faqType').value.toLowerCase();
        // let faqCase = document.getElementById('faqCase').value;
        // if(faqCase && faqTypeVal === 'none') {
        //     Swal.fire({
        //        title: '구분을 선택해주세요.',
        //        text: '',
        //        icon: 'error',
        //        confirmButtonText: '확인'
        //     })
        //     return false;
        // }

        document.getElementById('faqForm').submit();
    }

    const updateUrlParam = (url, paramName, paramValue) => {
        const urlObject = new URL(url);
        urlObject.searchParams.set(paramName, paramValue);
        return urlObject.toString();
    }

    const changePage = (page) => {
        document.getElementById('page').value = page;
        let returnUrl = updateUrlParam(window.location.href, 'page', page);
        location.href = returnUrl;
    }

    const loadView = (element) => {
        const uid = element.getAttribute('data-idx');
        const faqCase = element.getAttribute('data-faq-case');
        let faqType = document.getElementById('faqType').value;
        let isOpen = document.getElementById('isOpen').value;
        let searchValue = document.getElementById('searchValue').value;
        if (uid) {
            let url = faqCase ? '/reading-review/faq/' + uid + '?faqCase=1': '/customer/faq/' + uid +'?faqCase=0';
            url += '&faqType='+ faqType +'&isOpen='+ isOpen +'&searchValue='+ searchValue;
            window.location.href = url;
        }
    }
    // 순서 변경
    const setSortList = async () => {
        await initSortList();
        loadDraggableElement();
    };
    const initSortList = async () => {
        const faqList = document.querySelectorAll('#faqList tr');
        document.querySelectorAll('#faqCommonTable th')[0].style.display = 'block';
        // ready draggable Area
        faqList.forEach((list) => {
            // 핸들 생성
            const order = list.querySelector('.sortOrder');
            const handle = list.querySelector('.draggable-handle');
            order.style.display = 'none';
            handle.style.display = 'flex';
            handle.parentElement.style.display = 'block';

        });
    }

    const loadDraggableElement = () => {
        const swappable = new Sortable(faqList, {
            swap: true, // Enable swap plugin
            handle: '.draggable-handle',
            animation: 150,
        });
    };

    let isSubmitting = false;
    // 순서 변경 api
    const modifyOrder = async () => {
        if (isSubmitting) return;

        isSubmitting = true;
        // 데이터 세팅
        let faqUidList = document.querySelectorAll('[data-idx]');

        let faqUidArr = Array.from(faqUidList).map(function(element) {
            return element.getAttribute('data-idx');
        });

        if (!faqUidArr.length) return false;

        let data = {
            uidList: faqUidArr,
            page: document.getElementById('page') ? document.getElementById('page').value : 1,
            perPage: document.getElementById('perPage') ? document.getElementById('perPage').value :100,
        }
        // 전송 데이터 생성
        try {
            const response = await fetch('/api/v1/customer/faq/sort', {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            });

            const res = await response.json();
            if (res) {
                if(res.resultCode == 0) {
                    Swal.fire({
                        title: res.data,
                        icon: 'error',
                        confirmButtonText: '확인'
                    });
                    return false;
                }
                Swal.fire({
                    title: '등록 완료',
                    text: '순서가 변경 되었습니다.',
                    icon: 'success',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.reload();
                    }
                })
            }
        } catch (Exception) {
            console.error(Exception);
        } finally {
            isSubmitting = false;
        }
    }
</script>

</body>
</html>

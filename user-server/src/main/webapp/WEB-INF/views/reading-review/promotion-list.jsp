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
                        <form class="form">
                            <div class="card-body">

                                <div class="row g-8">
                                    <div class="col-xxl-3 fv-row">
                                        <label class="fs-6 form-label fw-bolder text-dark">기간</label>
                                        <div class="row fv-row fv-plugins-icon-container">
                                            <div class="col-6">
                                                <div class="input-group">
                                                    <input
                                                            id="sdate"
                                                            name="sdate"
                                                            type="text"
                                                            class="form-control flatpickr-input"
                                                            placeholder="시작일"
                                                            autocomplete="off"
                                                            value="<c:out value="${param.sdate}"/>"
                                                    />
                                                    <span class="input-group-text" id="basic-addon3">
                                                    <i class="bi bi-calendar-check fs-1"></i>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="input-group">
                                                    <input
                                                            id="edate"
                                                            name="edate"
                                                            type="text"
                                                            class="form-control flatpickr-input"
                                                            placeholder="종료일"
                                                            autocomplete="off"
                                                            value="<c:out value="${param.edate}"/>"
                                                    />
                                                    <span class="input-group-text" id="basic-addon3">
                                                    <i class="bi bi-calendar-check fs-1"></i>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <label class="fs-6 form-label fw-bolder text-dark">상태</label>
                                                <select
                                                        id="promotionStatus"
                                                        name="promotionStatus"
                                                        class="form-select form-select-solid unselect-form"
                                                        data-control="select2"
                                                        data-hide-search="true"
                                                >
                                                    <option>전체</option>
                                                    <option value='진행중' ${param.promotionStatus eq '진행중' ? 'selected' : ''}>진행중</option>
                                                    <option value='대기중' ${param.promotionStatus eq '대기중' ? 'selected' : ''}>대기중</option>
                                                    <option value='종료' ${param.promotionStatus eq '종료' ? 'selected' : ''}>종료</option>
                                                </select>
                                            </div>
                                            <div class="col-lg-4">
                                                <label class="fs-6 form-label fw-bolder text-dark">구분</label>
                                                <select
                                                        id="promotionCategory"
                                                        name="promotionCategory"
                                                        class="form-select form-select-solid unselect-form"
                                                        data-control="select2"
                                                        data-hide-search="true"
                                                >
                                                    <option>전체</option>
                                                    <option value='NEW' ${param.promotionCategory eq 'NEW' ? 'selected' : ''}>신규</option>
                                                    <option value='EXTENSION' ${param.promotionCategory eq 'EXTENSION' ? 'selected' : ''}>연장</option>
                                                    <option value='NEW_EXTENSION' ${param.promotionCategory eq 'NEW_EXTENSION' ? 'selected' : ''}>신규 + 연장</option>
                                                    <option value='CONVERSION' ${param.promotionCategory eq 'CONVERSION' ? 'selected' : ''}>전환</option>
                                                </select>
                                            </div>
                                            <div class="col-lg-4">
                                                <label class="fs-6 form-label fw-bolder text-dark">사용여부</label>
                                                <select
                                                        id="isUse"
                                                        name="isUse"
                                                        class="form-select form-select-solid unselect-form"
                                                        data-control="select2"
                                                        data-hide-search="true"
                                                >
                                                    <option>전체</option>
                                                    <option value='Y' ${param.isUse eq 'Y' ? 'selected' : ''}>Y</option>
                                                    <option value='N' ${param.isUse eq 'N' ? 'selected' : ''}>N</option>
                                                </select>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="col-lg-5">
                                        <div class="row g-8">
                                            <div class="col-lg-12">
                                                <label class="fs-6 form-label fw-bolder text-dark">검색어</label>
                                                <input
                                                        type="text"
                                                        id="search"
                                                        name="search"
                                                        class="form-control"
                                                        placeholder="검색어 입력"
                                                        maxlength="100"
                                                        value="<c:out value="${param.search}"/>"
                                                />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="card-footer">
                                <div class="d-flex justify-content-end" data-kt-customer-table-toolbar="base">
                                    <div>
                                        <a href="/reading-review/promotion" class="btn btn-secondary" style="color: #181c32; background-color : #fff3cd">
                                            <i class="fas bi-arrow-repeat fs-2 me-2"></i>
                                            초기화
                                        </a>
                                        <button type="submit" class="btn btn-m btn-warning" style="background-color: #ffcd39; color: #181C32">
                                            검색
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="card">
                        <div class="card-header border-0 pt-6L">
                            <%@ include file="/WEB-INF/views/common/SelectPaging.jsp" %>
                        </div>

                        <div class="card-body pt-0 table-responsive">
                            <!--begin::Table-->
                            <table class="table table-row-bordered gy-5  table-hover" id="faqCommonTable">
                                <!--begin::Table head-->
                                <thead>
                                <!--begin::Table row-->
                                <tr class="fw-semibold fs-6 text-muted">
                                    <th class="min-w-70px mw-sm-10px w-sm-70px">No.</th>
                                    <th class="min-w-70px w-sm-80px">상태</th>
                                    <th class="min-w-70px w-sm-80px">구분</th>
                                    <th class="min-w-70px w-sm-80px">유형</th>
                                    <th class="min-w-100px w-sm-125px" colspan="2">프로모션 금액</th>
                                    <th class="min-w-80px w-sm-100px" colspan="2">프로모션 기간</th>
                                    <th class="min-w-150px w-sm-175px">프로모션 명</th>
                                    <th class="min-w-60px  w-sm-80px">사용여부</th>
                                    <th class="min-w-150px w-sm-175px">작성일시</th>
                                </tr>
                                <tr class="fw-semibold fs-6 text-muted">
                                    <th class="min-w-70px mw-sm-10px w-sm-70px"></th>
                                    <th class="min-w-70px w-sm-80px"></th>
                                    <th class="min-w-70px w-sm-80px"></th>
                                    <th class="min-w-120px"></th>
                                    <th class="min-w-100px w-sm-125px">기본형</th>
                                    <th class="min-w-100px w-sm-125px">프리미엄</th>
                                    <th class="min-w-80px w-sm-100px">시작일시</th>
                                    <th class="min-w-80px w-sm-100px">종료일시</th>
                                    <th class="min-w-150px w-sm-175px"></th>
                                    <th class="min-w-60px  w-sm-80px"></th>
                                    <th class="min-w-150px w-sm-175px"></th>
                                </tr>
                                </thead>
                                <!--end::Table row-->
                                <!--end::Table head-->
                                <!--begin::Table body-->
                                <tbody>
                                <c:if test="${not empty list}">
                                    <c:forEach items="${list}" var="list" varStatus="status">
                                        <tr data-uid="${list.uid}" onclick="openPromotion(this)" class="hoverable fw-bold">
                                            <td>
                                                    ${((listNum - (page.pageListSize * (page.currentPage - 1))) - status.index)}
                                            </td>
                                            <td>
                                                <c:out value="${list.promotionStatus}"/>
                                            </td>
                                            <td>
                                                <c:out value="${list.promotionCategory}"/>
                                            </td>
                                            <td class="text-dark fw-bolder">
                                                <c:out value="${list.promotionType}"/>
                                            </td>
                                            <td class="text-dark">
                                                <c:set var="basicOriginalPrice" value="${list.basicOriginalPrice}" />
                                                <c:set var="basicDiscountPrice" value="${list.basicDiscountPrice}" />
                                                <c:set var="basicTotalPrice" value="${basicOriginalPrice - basicDiscountPrice}" />

                                                <fmt:formatNumber value="${basicTotalPrice}" type="number" groupingUsed="true" /> 원
                                            </td>
                                            <td>
                                                <c:set var="premiumOriginalPrice" value="${list.premiumOriginalPrice}" />
                                                <c:set var="premiumDiscountPrice" value="${list.premiumDiscountPrice}" />
                                                <c:set var="premiumTotalPrice" value="${premiumOriginalPrice - premiumDiscountPrice}" />

                                                <fmt:formatNumber value="${premiumTotalPrice}" type="number" groupingUsed="true" /> 원
                                            </td>

                                            <td class="text-dark fw-bolder">
                                                <c:out value="${list.promotionStartDate}"/>
                                            </td>
                                            <td class="text-dark fw-bolder">
                                                <c:out value="${list.promotionEndDate}"/>
                                            </td>
                                            <td class="text-dark fw-bolder">
                                                <c:out value="${list.promotionName}"/>
                                            </td>
                                            <td class="text-danger fw-bolder">
                                                <c:out value="${list.isUse}"/>
                                            </td>
                                            <td class="text-dark fw-bolder">
                                                <c:out value="${list.regDate}"/>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty list}">
                                    <tr>
                                        <td class="center" colspan="9">
                                            데이터가 없습니다.
                                        </td>
                                    </tr>
                                </c:if>
                                </tbody>
                                <!--end::Table body-->
                            </table>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="d-flex justify-content-center flex-grow-1">
                                    <%@ include file="/WEB-INF/views/common/inc/Paging.jsp" %>
                                </div>
                                <div>
                                    <a href="/reading-review/promotion-reg-form" class="btn btn-m" style=" color: #fff; background-color: #343a40;">
                                        등록
                                    </a>
                                </div>
                            </div>
                            <!--end::Table-->
                        </div>
                    </div>
                </div>
                <%--                    </div>--%>
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
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script type="text/javascript">

    function initializeFlatpickr() {
        const today = new Date();
        const oneMonthBefore = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());

        const startDateInput = document.getElementById('sdate');
        const endDateInput = document.getElementById('edate');
        const initialStartDate = startDateInput.value;
        const initialEndDate = endDateInput.value;

        startFlatpickr = flatpickr(startDateInput, {
            dateFormat: 'Y-m-d',
            locale: 'ko',
            onChange: function (selectedDates) {
                if (selectedDates.length > 0) {
                    const maxDate = new Date(selectedDates[0]);
                    maxDate.setFullYear(maxDate.getFullYear() + 3);
                    endFlatpickr.latestSelectedDateObj = maxDate; // 연도 버그 처리
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
                    startFlatpickr.set('maxDate', selectedDates[0]);
                }
            }
        });
    }

    document.addEventListener('DOMContentLoaded', function () {
        let classSelectElement = document.querySelector('select[name="clazz"]');

        initializeFlatpickr();


        const targetNode = document.querySelectorAll('.form-select.unselect-form');
        targetNode.forEach((node) => {
            node.style.backgroundColor = '#ffffff';
            node.style.backgroundClip = 'padding-box';
            node.style.border = '1px solid #E4E6EF';
        });

        const unselectedNode = document.querySelectorAll('.form-select.renewal-form');
        unselectedNode.forEach((node) => {
            node.style.backgroundColor = '##F5F8FA';
            node.style.backgroundClip = 'padding-box';
        });
    });


    function fetchUserList(page) {
        const sdate = document.getElementById('sdate').value;
        const edate = document.getElementById('edate').value;
        const promotionStatus = document.getElementById('promotionStatus').value;
        const promotionCategory = document.getElementById('promotionCategory').value;
        const isUse = document.getElementById('isUse').value;
        const search = document.getElementById('search').value;

        let queryParams = '?page=1' + '&perPage=' + document.getElementById('perPage').value;

        queryParams += '&sdate=' + sdate;
        queryParams += '&edate=' + edate;
        queryParams += '&promotionStatus=' + promotionStatus;
        queryParams += '&promotionCategory=' + promotionCategory;
        queryParams += '&isUse=' + isUse;
        queryParams += '&search=' + search;
        location.href = '/reading-review/promotion' + queryParams;
    }

    function changePage(page) {
        const sdate = document.getElementById('sdate').value;
        const edate = document.getElementById('edate').value;
        const promotionStatus = document.getElementById('promotionStatus').value;
        const promotionCategory = document.getElementById('promotionCategory').value;
        const isUse = document.getElementById('isUse').value;
        const search = document.getElementById('search').value;

        let queryParams = '?page=' + page + '&perPage=' + document.getElementById('perPage').value;

        queryParams += '&sdate=' + sdate;
        queryParams += '&edate=' + edate;
        queryParams += '&promotionStatus=' + promotionStatus;
        queryParams += '&promotionCategory=' + promotionCategory;
        queryParams += '&isUse=' + isUse;
        queryParams += '&search=' + search;
        location.href = '/reading-review/promotion' + queryParams;
    }

    function openPromotion(element) {
        const sdate = document.getElementById('sdate').value;
        const edate = document.getElementById('edate').value;
        const promotionStatus = document.getElementById('promotionStatus').value;
        const promotionCategory = document.getElementById('promotionCategory').value;
        const isUse = document.getElementById('isUse').value;
        const search = document.getElementById('search').value;
        const uid = element.getAttribute('data-uid');
        const page = new URLSearchParams(window.location.search).get('page') || '1';

        let queryParams = '?page=' + page + '&perPage=' + document.getElementById('perPage').value;


            queryParams += '&sdate=' + sdate;


            queryParams += '&edate=' + edate;



            queryParams += '&promotionStatus=' + promotionStatus;



            queryParams += '&promotionCategory=' + promotionCategory;



            queryParams += '&isUse=' + isUse;



            queryParams += '&search=' + search;


        const url = '/reading-review/promotion/' + uid + queryParams;
        window.location.href = url;
    }

    async function inputDownload() {
        const getValue = id => document.getElementById(id) ? document.getElementById(id).value : '';

        const sdate = getValue('sdate');
        const edate = getValue('edate');
        let clazz = getValue('clazz');
        let subject = getValue('subject');
        let requestStatus = getValue('requestStatus');
        const search = getValue('search');

        let date = new Date();
        let year = date.getFullYear();
        let month = ("0" + (date.getMonth() + 1)).slice(-2);
        let day = ("0" + date.getDate()).slice(-2);

        if (clazz === '전체') {
            clazz = '';
        } else if (clazz === '초등') {
            clazz = 'ELEMENTARY-SCHOOL';
        } else if (clazz === '중학') {
            clazz = 'MIDDLE-SCHOOL';
        } else if (clazz === '고등') {
            clazz = 'HIGH-SCHOOL';
        }

        if (subject === '전체') {
            subject = '';
        }

        if (requestStatus === '전체') {
            requestStatus = '';
        }

        let formattedDate = year + "-" + month + "-" + day;

        const data = {
            nowDay: formattedDate,
            sdate: sdate,
            edate: edate,
            clazz: clazz,
            subject: subject,
            requestStatus: requestStatus,
            search: search,
            filename: '참고서_견본신청_목록',
            headerMap : {
                header1: 'No.',
                header2: '학급',
                header3: '과목',
                header4: '교재명',
                header5: '북코드',
                header6: '신청자',
                header7: '신청일시',
                header8: '상태',
                header9: '발송/취소일시',
                header10: '배송-이름',
                header11: '배송-휴대폰번호',
                header12: '배송-전화번호',
                header13: '배송-우편번호',
                header14: '배송-주소',
                header15: '배송-상세주소',
                header16: '배송-학교/학원명'
            }
        }
        try {
            const response = await fetch('/api/v1/excel', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data),
            });

            console.log(response);

            if (response.ok) {
                const blob = await response.blob();
                const fileName = decodeURIComponent(response.headers.get('Content-Disposition').split('filename*=UTF-8\'\'')[1]);
                console.log(fileName);


                let listNum = '${listNum}';
                // 데이터 양에 따라 다르게 처리
                if (listNum > 10000) {
                    // 데이터가 10000건 이상인 경우 zip 파일로 압축
                    let zip = new JSZip();
                    zip.file(fileName, blob);
                    zip.generateAsync({type:"blob"}).then(function(content) {
                        // content를 다운로드
                        let downloadLink = document.createElement('a');
                        downloadLink.href = window.URL.createObjectURL(content);
                        downloadLink.download = fileName + '.zip';
                        downloadLink.style.display = 'none';
                        document.body.appendChild(downloadLink);
                        downloadLink.click();
                        document.body.removeChild(downloadLink);
                    });
                } else {
                    // 데이터가 10000건 미만인 경우 엑셀 파일로 다운로드
                    let downloadLink = document.createElement('a');
                    downloadLink.href = window.URL.createObjectURL(blob);
                    downloadLink.download = fileName;
                    downloadLink.style.display = 'none';
                    document.body.appendChild(downloadLink);
                    downloadLink.click();
                    document.body.removeChild(downloadLink);
                }

            } else {
                throw new Error('파일 다운로드 요청에 실패했습니다.');
            }
        } catch (error) {
            console.log("=== Excel error : " + error);
            Swal.fire({
                html: '<div>파일 다운로드 중 오류가 발생했습니다.</div>',
                icon: 'error',
                buttonsStyling: false,
                confirmButtonText: 'OK',
                customClass: { confirmButton: 'btn btn-primary' }
            });
        }
    }


</script>

</body>
</html>
<style>

    .table {
        table-layout: fixed;
    }
</style>

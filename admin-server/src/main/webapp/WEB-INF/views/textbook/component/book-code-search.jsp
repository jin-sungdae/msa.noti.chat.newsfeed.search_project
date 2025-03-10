<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<body>
<div class="modal-content">

    <div class="card mb-7">
        <div class="card-header border-0 pt-5">
            <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                북코드 검색
            </div>
            <div class="btn btn-m btn-icon btn-active-color-primary" data-bs-dismiss="modal">
                <i class="bi bi-x-lg"></i>
            </div>
        </div>
        <div class="card-body">

            <div class="row g-8 mb-8">
                <div class="col-xxl-3 fv-row">
                    <label class="fs-6 form-label fw-bolder text-dark required">년도</label>
                    <div class="row fv-row fv-plugins-icon-container">
                        <div class="col-12">
                            <select
                                    id="bookCodeSearchSdate"
                                    name="bookCodeSearchSdate"
                                    class="form-select form-select-solid unselect-form"
                                    data-placeholder="선택"
                            >
                            </select>
                        </div>
                    </div>
                </div>

                <div class="col-lg-2">
                    <label class="fs-6 form-label fw-bolder text-dark">학급</label>
                    <select
                            id="bookCodeSearchClazz"
                            name="clazz"
                            class="form-select form-select-solid unselect-form"
                            data-control="select2"
                            data-hide-search="true"
                            onchange="changeSelectDataOption(this)"
                            data-placeholder="선택"
                    >
                        <option value=""></option>
                        <option value='초등학교' ${param.clazz eq '초등' ? 'selected' : ''}>초등</option>
                        <option value='중학교' ${param.clazz eq '중등' ? 'selected' : ''}>중학</option>
                        <option value='고등학교' ${param.clazz eq '고등' ? 'selected' : ''}>고등</option>
                    </select>
                </div>

                <div class="col-lg-3">
                    <label class="fs-6 form-label fw-bolder text-dark">과목</label>
                    <select
                            id="bookCodeSearchSubject"
                            name="subject"
                            class="form-select form-select-solid renewal-form"
                            data-control="select2"
                            data-hide-search="true"
                            disabled
                    >
                        <option value="">-</option>
                    </select>
                </div>

                <div class="col-lg-2">
                    <label class="fs-6 form-label fw-bolder text-dark">학년</label>
                    <select
                            id="bookCodeSearchGrade"
                            name="grade"
                            class="form-select form-select-solid renewal-form"
                            data-control="select2"
                            data-hide-search="true"
                            disabled
                    >
                        <option value="">-</option>
                    </select>
                </div>

                <div class="col-lg-2">
                    <label class="fs-6 form-label fw-bolder text-dark">학기</label>
                    <select
                            id="bookCodeSearchSemester"
                            name="semester"
                            class="form-select form-select-solid renewal-form"
                            data-control="select2"
                            data-hide-search="true"
                            disabled
                    >
                        <option value="">-</option>
                    </select>
                </div>

            </div>
            <div class="row g-8 mb-8">
                <div class="col-xxl-12 fv-row">
                    <div class="row">
                        <div class="col-2">
                            <label class="fs-6 form-label fw-bolder text-dark">검색어</label>
                            <select
                                    id="bookCodeSearchKeyword"
                                    name="bookCodeSearchKeyword"
                                    class="form-select form-select-solid unselect-form"
                                    data-control="select2"
                                    data-hide-search="true"
                                    data-placeholder="전체"
                            >
                                <option></option>
                                <c:if test="${textBook eq 'Y'}">
                                    <option value="전체">전체</option>
                                    <option value='BOOK_CODE'>북코드</option>
                                    <option value='PRODUCT_CODE'>제품코드</option>
                                    <option value='SERIES_CODE'>시리즈코드</option>
                                    <option value='BOOK_NAME'>북코드명</option>
                                </c:if>
                                <c:if test="${referenceBook eq 'Y'}">
                                    <option value="전체">전체</option>
                                    <option value='BOOK_CODE'>북코드</option>
                                    <option value='SERIES_CODE'>시리즈코드</option>
                                    <option value='BOOK_NAME'>북코드명</option>
                                </c:if>
                            </select>
                        </div>
                        <div class="col-lg-7">
                            <div class="row pt-8">
                                <div class="col-lg-12">
                                    <input
                                            type="text"
                                            id="bookCodeSearchSearch"
                                            name="search"
                                            class="form-control"
                                            placeholder="검색어 입력"
                                            maxlength="50"
                                            value="<c:out value="${search.search}"/>"
                                    />
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 d-flex justify-content-end mt-8"  data-kt-customer-table-toolbar="base">
                            <div>
                                <button type="button" class="btn btn-m btn-warning" id="searchBtn" onclick="searchBookCode()">
                                    검색
                                </button>
                                <a class="btn btn-secondary" style="color: #181c32; background-color : #fff3cd" onclick="resetBookSearchForm()">
                                    <i class="fas bi-arrow-repeat fs-2 me-2"></i>
                                    초기화
                                </a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>

    </div>
    <div class="card">
        <div class="card-header border-0 pt-6L">
            <div class="card-title">
                <div class="row">
                    <div class="col-7 d-flex align-items-center justify-content-between">
                        <h3 class="fs-6 fw-bold mt-3 mb-3" id="bookCodeListNum" style="flex-grow: 1; min-width: 0; white-space: nowrap;">검색결과 총 <span class="fw-bolder">${listNum}</span> 개</h3>
                    </div>
                </div>
            </div>
        </div>

        <div class="card-body pt-0 table-responsive">
            <!--begin::Table-->
            <table class="table table-row-bordered gy-5" id="bookCodeModalTable">
                <colgroup>
                    <col width="12%">
                    <c:if test="${textBook eq 'Y'}">
                        <col width="12%">
                    </c:if>
                    <col width="7%">
                    <col width="5%">
                    <col width="7%">
                    <col width="5%">
                    <col >
                    <col width="5%">
                </colgroup>
                <!--begin::Table head-->
                <thead>
                <!--begin::Table row-->
                <tr class="fw-semibold fs-6 text-muted">
                    <th >북코드</th>
                    <c:if test="${textBook eq 'Y'}">
                    <th >제품코드</th>
                    </c:if>
                    <th >시리즈코드</th>
                    <th >년도</th>
                    <th >학급</th>
                    <th >과목</th>
                    <th >북코드명</th>
                    <th >선택</th>
                </tr>
                <!--end::Table row-->
                </thead>
                <!--end::Table head-->
                <!--begin::Table body-->
                <tbody id="bookCodeModalTableBody">
                <c:if test="${not empty list}">
                    <c:forEach items="${list}" var="list" varStatus="status">
                        <tr>
                            <td class="text-dark fw-bold text-hover-warning hoverable">
                                <c:out value="${list.CD_ITEM}"/>
                            </td>
                            <c:if test="${textBook eq 'Y'}">
                                <td class="text-hover-warning hoverable">
                                    <c:out value="${list.CD_GOODS}"/>
                                </td>
                            </c:if>
                            <td class="text-hover-warning hoverable">
                                <c:out value="${list.CD_SERIES}" />
                            </td>
                            <td class="text-hover-warning hoverable">
                                <c:out value="${list.YY_ITEM}"/>
                            </td>
                            <td class="text-hover-warning hoverable">
                                <c:out value="${list.NM_GB_SUBJ}"/>
                            </td>
                            <td class="text-hover-warning hoverable">
                                <c:out value="${list.NM_CD_SUBJ}"/>
                            </td>
                            <td class="text-hover-warning hoverable">
                                <c:out value="${list.sliceName}"/>
                            </td>
                            <td class="text-hover-warning hover-scale hoverable"
                                data-code="${list.CD_ITEM}"
                                data-name="${list.NM_GOODS}"
                                data-productCode="${list.CD_GOODS}"
                                data-school="${list.NM_GB_SUBJ}"
                                data-subject="${list.NM_CD_SUBJ}"
                                data-grade="${list.GB_GRAD}"
                                data-semester="${list.GB_TERM}"
                                data-year="${list.YY_ITEM}"
                                data-seriesCode="${list.CD_SERIES}"
                                data-seriesCodeName="${list.NM_SERIES}"
                                data-seriesDescription="시리즈 코드 설명 테스트"
                                data-author="${list.TX_AUTH}"
                                data-width="${list.TX_LSPEC}"
                                data-height="${list.TX_VSPEC}"
                                data-chromacity="${list.CNT_COLOR}"
                                data-page="${list.CNT_PAGE}"
                                data-saleYN="${list.SALE_YN}"
                                data-saleDay="${list.DT_SALE_FR}"
                                data-saleTime="${list.TM_SALE_FR}"
                                date-saleEndDay="${list.DT_SALE_TO}"
                                data-saleEndTime="${list.TM_SALE_TO}"
                                data-jego="${list.jego}"
                                data-price="${list.AMT_LISTPRC}"
                                onclick="selectBookCode(this)">
                                <span class="badge badge-secondary">선택</span>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${empty list}">
                    <tr><td colspan="8" class="text-center">데이터가 없습니다.</td></tr>
                </c:if>
                </tbody>
                <!--end::Table body-->
            </table>

                <div class="d-flex justify-content-between align-items-center">
                    <div class="d-flex justify-content-center flex-grow-1">

                        <div class="pt-3 d-flex justify-content-center">
                            <ul class="pagination" id="pagination">
                                <c:if test="${not empty list}">
                                <li class="page-item previous <c:if test="${page.currentPage <= 1}">disabled</c:if>">
                                    <a href="javascript:;"
                                       class="page-link"
                                       data-taget="firstPage"
                                       onclick="changePage(1)">
                                        <<
                                    </a>
                                </li>

                                <li class="page-item previous <c:if test="${page.currentPage <= 1}">disabled</c:if>">
                                    <a href="javascript:;"
                                       class="page-link"
                                       onclick="changePage('${page.currentPage - 1}')">
                                        <i class="previous"> </i>
                                    </a>
                                </li>

                                <c:forEach
                                        var="i"
                                        begin="${page.startOfPageBlock}"
                                        end="${page.endOfPageBlock}"
                                        step="1" >
                                    <li class="page-item <c:if test="${i eq page.currentPage}">active</c:if>">
                                        <a href="javascript:;"
                                           onclick="changePage('${i}')"
                                           class="page-link">
                                                ${i}
                                        </a>
                                    </li>
                                </c:forEach>

                                <li class="page-item next <c:if test="${page.currentPage >= page.totalPage}">disabled</c:if>">
                                    <a href="javascript:;"
                                       onclick="changePage('${page.currentPage + 1}')"
                                       class="page-link" >
                                        <i class="next"> </i>
                                    </a>
                                </li>

                                <li class="page-item next <c:if test="${page.currentPage >= page.totalPage}">disabled</c:if>">
                                    <a href="javascript:;"
                                       class="page-link"
                                       data-taget="lastPage"
                                       onclick="changePage('${page.totalPage}')">
                                        >>
                                    </a>
                                </li>
                                </c:if>
                            </ul>
                        </div>

                    </div>
                </div>
            <!--end::Table-->
        </div>
    </div>

</div>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script type="text/javascript">

</script>
</body>

<style>

    .page-item.active .page-link {
        background-color: #ffd800;
        border-color: #ffd800;
    }

    /* 월과 일을 선택하는 드롭다운을 숨깁니다. */
    .flatpickr-monthDropdown-months, .flatpickr-day {
        display: none;
    }

    /* 년도 선택 부분만을 남깁니다. */
    .flatpickr-month {
        display: none;
    }

    /* flatpickr 캘린더의 여백을 조정합니다. */
    .flatpickr-calendar {
        padding: 0;
    }

    /* "오늘" 버튼을 숨깁니다. */
    .flatpickr-current-month .flatpickr-current-month {
        display: none;
    }

    .hover-scale {
        transition: transform 0.3s ease; /* 부드러운 변환 효과 */
    }

    .hover-scale:hover {
        transform: scale(1.1); /* 마우스 오버 시 확대 */
    }

    .table thead th {
        width: 100px; /* 각 열에 원하는 너비를 설정합니다 */
        white-space: nowrap; /* 텍스트 줄바꿈 방지 */
    }
    .table tbody td {
        width: 100px; /* 각 열에 원하는 너비를 설정합니다 */
        white-space: nowrap; /* 텍스트 줄바꿈 방지 */
    }

</style>
</html>
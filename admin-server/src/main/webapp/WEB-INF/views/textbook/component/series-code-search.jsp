<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<body>
<div class="modal-content">
    <div class="card mb-5 mb-xl-10">
        <div class="card-header border-0 pt-5">
            <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                시리즈코드 검색
            </div>
            <div class="btn btn-m btn-icon btn-active-color-primary" data-bs-dismiss="modal">
                <i class="bi bi-x"></i>
            </div>
        </div>
        <div class="card-body">
            <div class="row g-8 mb-8">
                <div class="col-xxl-12 fv-row">
                    <div class="row">
                        <div class="col-2">
                            <label class="fs-6 form-label fw-bolder text-dark">검색어</label>
                            <select
                                    id="seriesKeyword"
                                    name="seriesKeyword"
                                    class="form-select form-select-solid"
                                    data-control="select2"
                                    data-hide-search="true"
                                    data-placeholder="전체"
                            >
                                <option></option>
                                <option value='국정도서' ${param.seriesKeyword eq '국정도서' ? 'selected' : ''}>국정도서</option>
                                <option value='검정도서' ${param.seriesKeyword eq '검정도서' ? 'selected' : ''}>검정도서</option>
                                <option value='인정도서'   ${param.seriesKeyword eq '인정도서' ? 'selected' : ''}>인정도서</option>
                                <option value='참고서' ${param.seriesKeyword eq '참고서' ? 'selected' : ''}>참고서</option>
                            </select>
                        </div>
                        <div class="col-lg-7">
                            <div class="row pt-8">
                                <div class="col-lg-12">
                                    <input
                                            type="text"
                                            id="seriesSearch"
                                            name="seriesSearch"
                                            class="form-control form-control-solid"
                                            placeholder="검색어 입력"
                                            maxlength="100"
                                            value="<c:out value="${param.search}"/>"
                                    />
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 d-flex justify-content-end mt-8"  data-kt-customer-table-toolbar="base">
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

    </div>
    <div class="card">
        <div class="card-header border-0 pt-6L">
            <div class="card-title">
                <div class="row">
                    <div class="col-7 d-flex align-items-center justify-content-between">
                        <h3 class="fs-6 fw-bold mt-3 mb-3" id="seriesCodeListNum" style="flex-grow: 1; min-width: 0; white-space: nowrap;">Total : <span class="fw-bolder">${listNum}</span> records</h3>
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
                    <th class="min-w-70px">학급</th>
                    <th class="min-w-70px">코드번호</th>
                    <th class="min-w-70px">시리즈명</th>
                    <th class="min-w-120px">시리즈설명</th>
                    <th class="min-w-60px">선택</th>
                </tr>
                <!--end::Table row-->
                </thead>
                <!--end::Table head-->
                <!--begin::Table body-->
                <tbody id="seriesCodeModalTableBody">
                <c:if test="${not empty list}">
                    <c:forEach items="${list}" var="list" varStatus="status">
                        <tr>
                            <td class="text-dark fw-bold text-hover-warning hoverable">
                                <c:out value="${list.NM_CLASS}"/>
                            </td>
                            <td class="text-hover-warning hoverable">
                                <c:out value="${list.CD_SERIES}"/>
                            </td>
                            <td class="text-hover-warning hoverable">
                                <c:out value="${list.CD_BRAND}"/>
                            </td>
                            <td class="text-hover-warning hoverable">
                                <c:out value="${list.NM_SERIES}"/>
                            </td>

                            <td class="text-hover-warning hover-scale hoverable"
                                data-code="${list.CD_SERIES}"
                                data-name="${list.CD_BRAND}"
                                data-year="${list.NM_SERIES}"
                                onclick="selectSeriesCode(this)">
                                <span class="badge badge-secondary">선택</span>
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
            <div class="d-flex justify-content-between align-items-center">
                <div class="d-flex justify-content-center flex-grow-1">
                    <div class="pt-3 d-flex justify-content-center">
                        <ul class="pagination" id="seriesPagination">
                            <li class="page-item previous <c:if test="${page.currentPage <= 1}">disabled</c:if>">
                                <a href="javascript:;"
                                   class="page-link"
                                   data-taget="firstPage"
                                   onclick="changePageSeries(1)">
                                    <<
                                </a>
                            </li>

                            <li class="page-item previous <c:if test="${page.currentPage <= 1}">disabled</c:if>">
                                <a href="javascript:;"
                                   class="page-link"
                                   onclick="changePageSeries('${page.currentPage - 1}')">
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
                                       onclick="changePageSeries('${i}')"
                                       class="page-link">
                                            ${i}
                                    </a>
                                </li>
                            </c:forEach>

                            <li class="page-item next <c:if test="${page.currentPage >= page.totalPage}">disabled</c:if>">
                                <a href="javascript:;"
                                   onclick="changePageSeries('${page.currentPage + 1}')"
                                   class="page-link" >
                                    <i class="next"> </i>
                                </a>
                            </li>

                            <li class="page-item next <c:if test="${page.currentPage >= page.totalPage}">disabled</c:if>">
                                <a href="javascript:;"
                                   class="page-link"
                                   data-taget="lastPage"
                                   onclick="changePageSeries('${page.totalPage}')">
                                    >>
                                </a>
                            </li>
                        </ul>
                    </div>


                </div>
            </div>
            <!--end::Table-->
        </div>
    </div>

</div>

</body>
<style>
    .page-item.active .page-link {
        background-color: #ffd800;
        border-color: #ffd800;
    }

    .hover-scale {
        transition: transform 0.3s ease; /* 부드러운 변환 효과 */
    }

    .hover-scale:hover {
        transform: scale(1.1); /* 마우스 오버 시 확대 */
    }


</style>

</html>
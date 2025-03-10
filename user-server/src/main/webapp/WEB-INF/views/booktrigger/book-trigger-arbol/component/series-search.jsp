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
                관련 시리즈 도서 검색
            </div>
            <div class="btn btn-m btn-icon btn-active-color-primary" data-bs-dismiss="modal">
                <i class="bi bi-x-lg"></i>
            </div>
        </div>
        <div class="card-body">

            <div class="row g-8 mb-8">
                <div class="col-xxl-12 fv-row">
                    <div class="row">
                        <div class="col-lg-9">
                            <label class="fs-6 form-label fw-bolder text-dark">검색어</label>

                                <div class="col-lg-12">
                                    <input
                                            type="text"
                                            id="bookCodeSearchSearch"
                                            name="search"
                                            class="form-control form-control-solid"
                                            placeholder="검색어 입력"
                                            maxlength="50"
                                            value="<c:out value="${search.search}"/>"
                                            autocomplete="off"
                                    />
                                </div>

                        </div>
                        <div class="col-lg-3 d-flex justify-content-end mt-8"  data-kt-customer-table-toolbar="base">
                            <div>
                                <button type="button" class="btn btn-m btn-warning" onclick="searchSeriesBook()">
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
                        <h3 class="fs-6 fw-bold mt-3 mb-3" id="bookCodeListNum" style="flex-grow: 1; min-width: 0; white-space: nowrap;">검색결과 총 <span class="fw-bolder">${listNum}</span> 개</h3>
                    </div>
                </div>
            </div>
        </div>

        <div class="card-body pt-0 table-responsive">
            <!--begin::Table-->
            <table class="table table-row-bordered gy-5" id="bookCodeModalTable">
                <!--begin::Table head-->
                <thead>
                <!--begin::Table row-->
                <tr class="fw-semibold fs-6 text-muted">
                    <th class="min-w-70px">No.</th>
                    <th class="min-w-120px">도서명</th>
                    <th class="min-w-70px">선택</th>
                </tr>
                <!--end::Table row-->
                </thead>
                <!--end::Table head-->
                <!--begin::Table body-->
                <tbody id="bookCodeModalTableBody">
                <c:if test="${not empty list}">
                    <c:forEach items="${list}" var="list" varStatus="status">
                        <tr>
                            <td class="text-dark fw-bold">
                                    ${((listNum - (page.pageListSize * (page.currentPage - 1))) - status.index)}
                            </td>
                            <td class="text-hover-warning hoverable">
                                <c:out value="${list.bookName}"/>
                            </td>
                            <td class="form-check form-check-custom form-check-warning form-check-solid"
                                data-idx="${list.bookTriggerArbolIndex}"
                                data-uid="${list.uid}"
                                data-bookName="${list.bookName}"

                                onclick="selectSeriesBook(this)"


                            >
                                <input class="form-check-input" type="checkbox" value="" ${list.check eq 'Y'? 'checked' : ''}/>
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
                        <ul class="pagination" id="pagination">
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
                        </ul>
                    </div>
                </div>
                <div>
                    <a class="btn btn-m btn-warning"  onclick="postSeriesBook()">
                        선택완료
                    </a>
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


</style>
</html>
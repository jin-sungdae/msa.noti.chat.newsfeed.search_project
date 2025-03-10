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
                        <form class="form" id="referenceBookInquiryForm">
                            <input type="hidden" id="pageNo" value="<c:out value="${pageNo}"/>">
                            <div class="card-body">
                                <div class="row g-8">
                                    <div class="col-lg-4">
                                        <label class="fs-6 form-label fw-bolder text-dark">기간</label>
                                        <div class="row fv-row fv-plugins-icon-container">
                                            <div class="col-6">
                                                <div class="input-group">
                                                    <input
                                                            id="startDate"
                                                            name="startDate"
                                                            type="text"
                                                            class="form-control flatpickr-input"
                                                            placeholder="시작일"
                                                            autocomplete="off"
                                                            value="<c:out value="${search.startDate}"/>"
                                                    />
                                                    <span class="input-group-text">
                                                    <i class="bi bi-calendar-check fs-1"></i>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="input-group">
                                                    <input
                                                            id="endDate"
                                                            name="endDate"
                                                            type="text"
                                                            class="form-control flatpickr-input"
                                                            placeholder="종료일"
                                                            autocomplete="off"
                                                            value="<c:out value="${search.endDate}"/>"
                                                    />
                                                    <span class="input-group-text">
                                                    <i class="bi bi-calendar-check fs-1"></i>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <label
                                                class="fs-6 form-label fw-bolder text-dark"
                                                for="inquiryKind"
                                        >
                                            구분
                                        </label>
                                        <select
                                                id="inquiryKind"
                                                name="inquiryKind"
                                                class="form-select form-select-transparent"
                                                data-control="select2"
                                                data-hide-search="true"
                                                data-placeholder="전체"
                                                onchange="loadNextSelect(0, this.value)"
                                        >
                                            <option value="전체">전체</option>
                                            <option value="REFERENCE-BOOK" <c:if test="${search.inquiryKind eq 'REFERENCE-BOOK'}">selected</c:if>>참고서 문의</option>
                                            <option value="REFERENCE-BOOK-TEACHER" <c:if test="${search.inquiryKind eq 'REFERENCE-BOOK-TEACHER'}">selected</c:if> >선생님 참고서 문의</option>
                                        </select>
                                    </div>
                                    <div class="col-lg-2">
                                        <label
                                                class="fs-6 form-label fw-bolder text-dark"
                                                for="inquiryCategory"
                                        >
                                            문의구분
                                        </label>
                                        <select
                                                id="inquiryCategory"
                                                name="inquiryCategory"
                                                class="form-select form-select-transparent"
                                                data-control="select2"
                                                data-hide-search="true"
                                                data-placeholder="전체"
                                                onchange="loadNextSelect(1, this.value)"
                                                <c:if test="${param.inquiryCategory eq null}">disabled</c:if>
                                        >
                                            <option value="전체">전체</option>
                                            <c:forEach items="${categoryList}" var="type" varStatus="status">
                                                <option value="${type.getCategory()}" <c:if test="${type.getCategory() == search.inquiryCategory}">selected</c:if> >
                                                    <c:choose>
                                                        <c:when test="${type.getCategory() eq ''}">전체</c:when>
                                                        <c:otherwise>${type.getCategory()}</c:otherwise>
                                                    </c:choose>
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-lg-2">
                                        <label
                                                class="fs-6 form-label fw-bolder text-dark"
                                                for="school"
                                        >
                                            학급
                                        </label>
                                        <select
                                                id="school"
                                                name="school"
                                                class="form-select form-select-transparent"
                                                data-control="select2"
                                                data-hide-search="true"
                                                data-placeholder="전체"
                                                onchange="loadNextSelect(2, this.value)"
                                                <c:if test="${param.school eq null}">disabled</c:if>
                                        >
                                            <option value="전체">전체</option>
                                            <option value="초등" <c:if test="${param.school eq '초등'}">selected</c:if>>초등</option>
                                            <option value="중등" <c:if test="${param.school eq '중등'}">selected</c:if>>중등</option>
                                            <option value="고등" <c:if test="${param.school eq '고등'}">selected</c:if>>고등</option>
                                        </select>
                                    </div>
                                    <div class="col-lg-2">
                                        <label
                                                class="fs-6 form-label fw-bolder text-dark"
                                                for="subject"
                                        >
                                            과목
                                        </label>
                                        <select
                                                id="subject"
                                                name="subject"
                                                class="form-select form-select-transparent"
                                                data-control="select2"
                                                data-hide-search="true"
                                                data-placeholder="전체"
                                                <c:if test="${param.subject eq null}">disabled</c:if>
                                        >
                                            <option value="전체">전체</option>
                                            <c:forEach items="${subjectList}" var="type" varStatus="status">
                                                <option value="${type.getSubject()}" <c:if test="${type.getSubject() == param.subject}">selected</c:if> >
                                                    <c:choose>
                                                        <c:when test="${type.getSubject() eq ''}">전체</c:when>
                                                        <c:otherwise>${type.getSubject()}</c:otherwise>
                                                    </c:choose>
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-lg-2">
                                        <label class="fs-6 form-label fw-bolder text-dark"
                                               for="isAnswer"
                                        >
                                            답변여부</label>
                                        <select
                                                id="isAnswer"
                                                name="isAnswer"
                                                class="form-select form-select-transparent"
                                                data-control="select2"
                                                data-hide-search="true"
                                                data-placeholder="전체"
                                        >
                                            <option value='전체'>전체</option>
                                            <option value='Y' ${search.isAnswer eq 'Y' ? 'selected' : ''}>Y</option>
                                            <option value='N' ${search.isAnswer eq 'N' ? 'selected' : ''}>N</option>
                                        </select>
                                    </div>

                                    <div class="col-lg-10">
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
                                        <a href="/reference-book/inquiry" class="btn btn-light" style="color: #181c32; background-color : #fff3cd">
                                            <i class="fas bi-arrow-repeat fs-2 me-2"></i>
                                            초기화
                                        </a>
                                        <button type="submit" class="btn btn-m btn-warning" id="searchBtn" style="background-color: #ffcd39; color: #181C32">
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
                            <table class="table table-row-bordered gy-5" id="faqCommonTable">
                                <!--begin::Table head-->
                                <thead>
                                <!--begin::Table row-->
                                <tr class="fw-semibold fs-6 text-muted">
                                    <th class="min-w-10px">No.</th>
                                    <th class="min-w-10px">구분</th>
                                    <th class="min-w-20px">문의구분</th>
                                    <th class="min-w-20px">학급</th>
                                    <th class="min-w-20px">과목</th>
                                    <th class="min-w-70px">교재명</th>
                                    <th class="min-w-80px">제목</th>
                                    <th class="min-w-20px">작성자</th>
                                    <th class="min-w-40px">작성일시</th>
                                    <th class="min-w-10px">답변여부</th>
                                </tr>
                                <!--end::Table row-->
                                </thead>
                                <!--end::Table head-->
                                <!--begin::Table body-->
                                <tbody>
                                <c:if test="${not empty referenceBookInquiryList}">
                                    <c:forEach items="${referenceBookInquiryList}" var="list" varStatus="status">
                                        <tr>
                                            <td class="text-dark fw-bold">
                                                <c:out value="${((listNum - (page.pageListSize * (page.currentPage - 1))) - status.index)}"/>
                                            </td>
                                            <td class="text-dark fw-bold"
                                                name="inquiryKind">
                                                <c:out value="${list.inquiryKind eq 'REFERENCE-BOOK'? '참고서 문의': '선생님 참고서 문의'}"/>
                                            </td>
                                            <td class="text-dark fw-bold">
                                                <c:out value="${list.inquiryCategory}"/>
                                            </td>
                                            <td class="text-dark fw-bold">
                                                <c:out value="${((list.school ne null) and (list.school ne ''))? list.school : '-'}"/>
                                            </td>
                                            <td class="text-dark fw-bold">
                                                <c:out value="${list.subject}"/>
                                            </td>
                                            <td class="text-dark fw-bold">
                                                <c:out value="${((list.referenceBookTitle ne '') and (list.referenceBookTitle ne null))? list.referenceBookTitle : '-'}"/>
                                            </td>
                                            <td class="text-dark text-hover-warning fw-bold hoverable goView"
                                                data-uid="<c:out value="${list.uid}"/>"
                                                data-kind="<c:out value="${param.inquiryKind}"/>"
                                                data-category="<c:out value="${list.inquiryCategory}"/>"
                                                data-school="<c:out value="${param.school}"/>"
                                                data-subject="<c:out value="${param.subject}"/>"
                                                data-is-answer="<c:out value="${param.isAnswer}"/>"
                                                data-search-value="<c:out value="${param.searchValue}"/>"
                                                <c:if test="${list.inquiryCategory eq '교재서평'}">data-review-index="${list.referenceBookReviewIndex}"</c:if>>
                                                <c:out value="${list.title}"/>
                                            </td>
                                            <td class="text-dark fw-bold">
                                                <c:out value="${list.userName}"/>
                                            </td>
                                            <td class="text-dark fw-bold">
                                                <c:out value="${list.modDate}"/>
                                            </td>
                                            <td class="text-dark fw-bold">
                                                <c:out value="${list.isAnswer eq null? '-' : list.isAnswer}"/>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty referenceBookInquiryList}">
                                    <tr>
                                        <td class="center">
                                            데이터가 없습니다.
                                        </td>
                                    </tr>
                                </c:if>
                                </tbody>
                                <!--end::Table body-->
                            </table>
                            <%@ include file="/WEB-INF/views/common/inc/Paging.jsp" %>
                            <!--end::Table-->
                        </div>
                    </div>
                </div>
            </div>
            <%@ include file="/WEB-INF/views/common/inc/FooterINC.jsp" %>
        </div>
    </div>
</div>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script type="text/javascript">
    let subjectParam = '${param.subject}';
    let pageNo = '${pageNo}';

    function initializeFlatpickr() {
        const today = new Date();
        const oneMonthBefore = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());

        const startDateInput = document.getElementById('startDate');
        const endDateInput = document.getElementById('endDate');
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
        initializeFlatpickr();

        document.getElementById('searchBtn').addEventListener('click', () => search());
        const search = () => {
            let searchValue = document.getElementById('searchValue').value.trim();
            document.getElementById('referenceBookInquiryForm').submit();
        }

        let goViews = document.querySelectorAll('.goView');
        goViews.forEach(function(el){
            el.addEventListener('click', function(evt){
                let startDate = document.getElementById('startDate').value;
                let endDate = document.getElementById('endDate').value;
                let uid = el.dataset.uid;
                let kind = el.dataset.kind;
                let category = el.dataset.category;
                let school = el.dataset.school;
                let subject = el.dataset.subject;
                let isAnswer = el.dataset.isAnswer;
                let searchValue = el.dataset.searchValue;
                let url = '/reference-book/inquiry/' + uid + '?startDate=' + startDate + '&endDate=' + endDate + '&inquiryKind=' + kind + '&inquiryCategory=' + category + '&school=' + school + '&subject=' + subject + '&isAnswer=' + isAnswer + '&searchValue=' + searchValue + '&pageNo=' + pageNo;
                if(category == '교재서평'){
                    let reviewIndex = el.dataset.reviewIndex;
                    url = '/reference-book/inquiry-review/' + reviewIndex + '?startDate=' + startDate + '&endDate=' + endDate + '&inquiryKind=' + kind + '&inquiryCategory=' + category + '&school=' + school + '&subject=' + subject + '&isAnswer=' + isAnswer + '&searchValue=' + searchValue + '&pageNo=' + pageNo;
                }
                location.href = url
            })
        })
    })

    function loadNextSelect(step, value) {
        const inquiryCategory = document.getElementById('inquiryCategory');
        const school = document.getElementById('school');
        const subject = document.getElementById('subject');
        const inquiryKind = document.getElementById('inquiryKind').value;

        if (step === 0) {
            inquiryCategory.innerHTML = '';
            if (value === 'REFERENCE-BOOK') {
                inquiryCategory.innerHTML = `
                <option value="전체">전체</option>
                <option value="내용문의">내용문의</option>
                <option value="교재서평">교재서평</option>
                <option value="오류신고">오류신고</option>
            `;
                school.innerHTML = `
                <option value="전체">전체</option>
                <option value="초등">초등</option>
                <option value="중등">중등</option>
                <option value="고등">고등</option>
            `;
                subject.innerHTML = `
                <option value="전체">전체</option>
                <option value="국어">국어</option>
                <option value="영어">영어</option>
                <option value="수학">수학</option>
                <option value="과학">과학</option>
                <option value="사회">사회</option>
                <option value="역사">역사</option>
                <option value="도덕">도덕</option>
                <option value="기술ㆍ가정">기술ㆍ가정</option>
                <option value="한문">한문</option>
                <option value="중국어">중국어</option>
                <option value="공통">공통</option>
            `;
                inquiryCategory.disabled = false;
                school.disabled = false;
                subject.disabled = false;
            } else if (value === 'REFERENCE-BOOK-TEACHER') {
                inquiryCategory.innerHTML = `
                <option value="전체">전체</option>
                <option value="질문답변">질문답변</option>
                <option value="건의요청">건의요청</option>
                <option value="오류신고">오류신고</option>
            `;
                school.innerHTML = `
                <option value="전체">전체</option>
                <option value="초등">초등</option>
                <option value="중등">중등</option>
                <option value="고등">고등</option>
            `;
                subject.innerHTML = `
            <option value="전체">전체</option>
            <option value="국어">국어</option>
            <option value="영어">영어</option>
            <option value="수학">수학</option>
            <option value="사회">사회</option>
            <option value="역사">역사</option>
            <option value="과학">과학</option>
            `;
                inquiryCategory.disabled = false;
                school.disabled = true;
                subject.disabled = false;
            } else {
                inquiryCategory.innerHTML = `
                <option value="전체">전체</option>
                <option value="질문답변">질문답변</option>
                <option value="건의요청">건의요청</option>
                <option value="오류신고">오류신고</option>
            `;
                school.innerHTML = `
                <option value="전체">전체</option>
                <option value="초등">초등</option>
                <option value="중등">중등</option>
                <option value="고등">고등</option>
            `;
                subject.innerHTML = `
                <option value="전체">전체</option>
                <option value="국어">국어</option>
                <option value="영어">영어</option>
                <option value="수학">수학</option>
                <option value="과학">과학</option>
                <option value="사회">사회</option>
                <option value="역사">역사</option>
                <option value="도덕">도덕</option>
                <option value="기술ㆍ가정">기술ㆍ가정</option>
                <option value="한문">한문</option>
                <option value="중국어">중국어</option>
                <option value="공통">공통</option>
            `;
                inquiryCategory.disabled = true;
                school.disabled = true;
                subject.disabled = true;
            }
        } else if (step === 1) {
            if (inquiryKind === 'REFERENCE-BOOK') {
                school.innerHTML = `
                <option value="전체">전체</option>
                <option value="초등">초등</option>
                <option value="중등">중등</option>
                <option value="고등">고등</option>
            `;
            } else {
                subject.innerHTML = `
                <option value="전체">전체</option>
                <option value="국어">국어</option>
                <option value="영어">영어</option>
                <option value="수학">수학</option>
                <option value="사회">사회</option>
                <option value="역사">역사</option>
                <option value="과학">과학</option>
            `;
            }
        } else if (step === 2) {
            // 선생님 문의 과목
            subject.innerHTML = `
            <option value="전체">전체</option>
            <option value="국어">국어</option>
            <option value="영어">영어</option>
            <option value="수학">수학</option>
            <option value="사회">사회</option>
            <option value="역사">역사</option>
            <option value="과학">과학</option>
        `;
            if (inquiryKind === 'REFERENCE-BOOK') {
                if (value === '초등') {
                    subject.innerHTML = `
                    <option value="전체">전체</option>
                    <option value="국어">국어</option>
                    <option value="수학">수학</option>
                    <option value="과학">과학</option>
                    <option value="사회">사회</option>
                    <option value="공통">공통</option>
                `;
                } else if (value === '중등') {
                    subject.innerHTML = `
                    <option value="전체">전체</option>
                    <option value="국어">국어</option>
                    <option value="영어">영어</option>
                    <option value="수학">수학</option>
                    <option value="사회">사회</option>
                    <option value="역사">역사</option>
                    <option value="도덕">도덕</option>
                    <option value="과학">과학</option>
                    <option value="기술ㆍ가정">기술ㆍ가정</option>
                    <option value="한문">한문</option>
                `;
                } else if (value === '고등') {
                    subject.innerHTML = `
                    <option value="전체">전체</option>
                    <option value="국어">국어</option>
                    <option value="영어">영어</option>
                    <option value="수학">수학</option>
                    <option value="사회">사회</option>
                    <option value="역사">역사</option>
                    <option value="과학">과학</option>
                    <option value="기술ㆍ가정">기술ㆍ가정</option>
                    <option value="한문">한문</option>
                    <option value="중국어">중국어</option>
                `;
                } else {
                    subject.innerHTML = `
                    <option value="전체">전체</option>
                    <option value="국어">국어</option>
                    <option value="영어">영어</option>
                    <option value="수학">수학</option>
                    <option value="과학">과학</option>
                    <option value="사회">사회</option>
                    <option value="역사">역사</option>
                    <option value="도덕">도덕</option>
                    <option value="기술ㆍ가정">기술ㆍ가정</option>
                    <option value="한문">한문</option>
                    <option value="중국어">중국어</option>
                    <option value="공통">공통</option>
                `;
                }
            }
        }
    }

    function fetchUserList() {
        let perPage = document.getElementById('perPage').value;
        let params = updateUrlParam(window.location.href, 'pageNo', 1);
        let returnUrl = updateUrlParam(params, 'perPage', perPage);
        location.href = returnUrl;
    }

    const updateUrlParam = (url, paramName, paramValue) => {
        const urlObject = new URL(url);
        urlObject.searchParams.set(paramName, paramValue);
        return urlObject.toString();
    }

    const changePage = (pageNo) => {
        let returnUrl = updateUrlParam(window.location.href, 'pageNo', pageNo);
        location.href = returnUrl;
    }
</script>

</body>
<style>


</style>
</html>

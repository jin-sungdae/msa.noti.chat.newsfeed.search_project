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
                <c:set value="샘플 등록/수정" var="menuTitle"/>
                <%@ include file="/WEB-INF/views/common/inc/ToolbarINC.jsp" %>
                <div class="post d-flex flex-column-fluid">
                    <div class="container-fluid">
                        <!-- 본문 내용 START -->
                        <form id="saveForm">
                            <input type="hidden" name="uid" id="uid" value="${param.uid}"/>
                            <div class="card mb-5 mb-xl-10">
                                <div class="card-header border-0 pt-5 card-header-stretch">
                                    <div class="card-title text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                        기본 정보
                                    </div>
                                    <div class="card-toolbar">
                                        <ul class="nav nav-tabs nav-line-tabs nav-stretch fs-6 border-0">
                                            <li class="nav-item">
                                                <a class="nav-link fw-bolder text-dark " href="/user/recruitment/${recruitment.uid}">인재채용 상세</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link fw-bolder text-dark active" href="${pageContext.request.contextPath}/user/recruitment/applicant-list?uid=${recruitment.uid}">지원자 정보</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade show active" id="tab2" role="tabpanel">
                                            <div class="card mb-7">
                                                <form class="form">
                                                    <div class="card-body">
                                                        <div class="row mb-8">
                                                            <div class="col-lg-12 row">
                                                                <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">공고</label>
                                                                </div>
                                                                <div class="col-lg-3 row">
                                                                    <div class="col-lg-12 form-label fw-bold text-dark pt-3">
                                                                        <c:out value="${recruitment.title}"/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">모집기간</label>
                                                                </div>
                                                                <div class="col-lg-3 row">
                                                                    <div class="col-lg-12 form-label fw-bold text-dark pt-3">
                                                                        <c:out value="${recruitment.startDate}"/> ~ <c:out value="${recruitment.endDate}"/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">지원자수</label>
                                                                </div>
                                                                <div class="col-lg-1 row">
                                                                    <div class="col-lg-12 form-label fw-bold text-dark pt-3">
                                                                        <c:out value="${recruitment.applicantCnt}"/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-1 d-flex align-items-center justify-content-start">
                                                                    <label class="col-lg-12 form-label fw-bolder text-dark pt-3">합격자수</label>
                                                                </div>
                                                                <div class="col-lg-1 row">
                                                                    <div class="col-lg-12 form-label fw-bold text-dark pt-3">
                                                                        <c:out value="${recruitment.passCnt}"/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr /> <br />
                                                        <div class="row g-8">
                                                            <div class="col-lg-2">
                                                                <div class="row">
                                                                    <div class="col-lg-12">
                                                                        <label
                                                                                class="fs-6 form-label fw-bolder text-dark"
                                                                                for="status"
                                                                        >
                                                                            진행상태
                                                                        </label>
                                                                        <select
                                                                                id="status"
                                                                                name="status"
                                                                                class="form-select form-select-solid"
                                                                                data-control="select2"
                                                                                data-hide-search="true"
                                                                                data-placeholder="전체"
                                                                        >
                                                                            <option value="default">전체</option>
                                                                            <option value="01" ${param.status eq '01' ? 'selected' : ''} >입사지원</option>
                                                                            <option value="02" ${param.status eq '02' ? 'selected' : ''}>서류심사</option>
                                                                            <option value="03" ${param.status eq '03' ? 'selected' : ''}>면접심사</option>
                                                                            <option value="04" ${param.status eq '04' ? 'selected' : ''}>최종합격</option>
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
                                                            <div class="col-lg-5">
                                                                <div class="col-lg-12 row">
                                                                    <div class="d-flex justify-content-end" data-kt-customer-table-toolbar="base">
                                                                        <div>
                                                                            <a href="/user/recruitment/applicant-list?uid=${param.uid}" class="btn btn-secondary" style="color: #181c32; background-color : #fff3cd">
                                                                                <i class="fas bi-arrow-repeat fs-2 me-2"></i>
                                                                                초기화
                                                                            </a>
                                                                            <button type="submit" class="btn btn-m btn-warning" style="background-color: #ffcd39; color: #181C32">
                                                                                검색
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="card">
                                                <div class="card-header border-0 pt-6L">
                                                    <%@ include file="/WEB-INF/views/common/SelectPaging.jsp" %>
                                                    <c:if test="${recruitment.applicantCnt > 0}">
                                                        <div class="card-toolbar">
                                                            <div class="d-flex justify-content-end" data-kt-customer-table-toolbar="base">
                                                                <button type="button" class="btn btn-m" style="color: #fff; background-color: #1aa179" onclick="excelDownload()">
                                                                    엑셀 다운로드
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </div>

                                                <div class="card-body pt-0 table-responsive">
                                                    <!--begin::Table-->
                                                    <table class="table table-row-bordered gy-5" id="faqCommonTable">
                                                        <!--begin::Table head-->
                                                        <thead>
                                                        <!--begin::Table row-->
                                                        <tr class="fw-semibold fs-6 text-muted">
                                                            <th class="min-w-70px">No.</th>
                                                            <th class="min-w-70px">이름</th>
                                                            <th class="min-w-70px">휴대폰 번호</th>
                                                            <th class="min-w-70px">이메일 주소</th>
                                                            <th class="min-w-60px">지원 일시</th>
                                                            <th class="min-w-50px">진행 상태</th>
                                                            <th class="min-w-70px">지원서 다운로드</th>
                                                        </tr>
                                                        <!--end::Table row-->
                                                        </thead>
                                                        <!--end::Table head-->
                                                        <!--begin::Table body-->
                                                        <tbody>
                                                        <c:if test="${not empty recruitmentApplicantList}">
                                                            <c:forEach items="${recruitmentApplicantList}" var="list" varStatus="status">
                                                                <tr>
                                                                    <td class="align-middle">
                                                                            ${((listNum - (page.pageListSize * (page.currentPage - 1))) - status.index)}
                                                                    </td>
                                                                    <td class="text-hover-warning align-middle"
                                                                        data-uid="${list.uid}"
                                                                        name="name">
                                                                    <c:out value="${list.applicationName}" />
                                                                    </td>
                                                                    <td class="text-hover-warning align-middle"
                                                                        data-uid="${list.uid}"
                                                                        name="name">
                                                                        <c:out value="${list.phoneNoString}"/>
                                                                    </td>
                                                                    <td class="text-hover-warning align-middle"
                                                                        data-uid="${list.uid}"
                                                                        name="userId">
                                                                        <c:out value="${list.emailString}"/>
                                                                    </td>
                                                                    <td class="text-hover-warning align-middle"
                                                                        data-uid="${list.uid}"
                                                                        name="userPhoneNumber">
                                                                        <c:out value="${list.regDate}"/>
                                                                    </td>
                                                                    <td class="text-hover-warning align-middle"
                                                                        data-uid="${list.uid}"
                                                                        name="email">
                                                                        <%--입사지원--%>
                                                                        <div class="form-group">
                                                                            <select type="select" class="form-select" id="form_applicationEligibility" data-uid="${list.uid}" onchange="changeStatus(this)">
                                                                                <option value="01" ${list.status eq '01' ? 'selected' : ''} >입사지원</option>
                                                                                <option value="02" ${list.status eq '02' ? 'selected' : ''}>서류심사</option>
                                                                                <option value="03" ${list.status eq '03' ? 'selected' : ''}>면접심사</option>
                                                                                <option value="04" ${list.status eq '04' ? 'selected' : ''}>최종합격</option>
                                                                            </select>
                                                                        </div>
                                                                    </td>
                                                                    <td class="text-hover-warning align-middle"
                                                                        data-uid="${list.uid}"
                                                                        name="firstRegistrationType">
                                                                        <button type="button" class="btn btn-light"
                                                                                onclick="window.location.href='/api/v1/file/file-download/${list.appFileUid}'"
                                                                        >다운로드</button>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </c:if>
                                                        <c:if test="${empty recruitmentApplicantList}">
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
                                                            <%@ include file="/WEB-INF/views/common/inc/Paging.jsp" %>
                                                        </div>
                                                    </div>
                                                    <!--end::Table-->
                                                </div>
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

</body>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script src="/assets/js/file.js"></script>
<script src="https://unpkg.com/axios@1.6.7/dist/axios.min.js"></script>

<script type="text/javascript">

    // 진행 상태 셀렉트박스 이벤트
    const changeStatus = async (el) => {
        const body = {
            uid: el.dataset.uid,
            status: el.value
        }

        await axios.put('/api/v1/recruitment/applicant/' + el.dataset.uid, body)
            .then((res) => {
                if (res.data) {
                    window.location.reload();
                }
            });
    }

    function fetchUserList(page) {
        const status = document.getElementById('status').value;
        const search = document.getElementById('search').value;

        let queryParams = '?perPage=' + document.getElementById('perPage').value;
        queryParams += '&uid=${param.uid}';

        if (status != null || status !== undefined) {
            queryParams += '&status=' + status;
        }

        if (search != null || search !== undefined) {
            queryParams += '&search=' + search;
        }

        location.href = '/user/recruitment/applicant-list' + queryParams;
    }

    function changePage(page) {
        const status = document.getElementById('status').value;
        const search = document.getElementById('search').value;


        let queryParams = '?page=' + page + '&perPage=' + document.getElementById('perPage').value;
        queryParams += '&uid=${param.uid}';

        if (status != null || status !== undefined) {
            queryParams += '&status=' + status;
        }

        if (search != null || search !== undefined) {
            queryParams += '&search=' + search;
        }

        location.href = '/user/recruitment/applicant-list' + queryParams;
    }

    // 엑셀 다운로드
    const excelDownload = async () => {
        const status = document.getElementById('status').value;
        const search = document.getElementById('search').value;

        let date = new Date();
        let year = date.getFullYear();
        let month = ("0" + (date.getMonth() + 1)).slice(-2);
        let day = ("0" + date.getDate()).slice(-2);

        let formattedDate = year + "-" + month + "-" + day;

        const data = {
            nowDay: formattedDate,
            uid: '${param.uid}',
            status: status,
            search: search,
            filename: 'recruitmentApplicantList',
            headerMap: {
                header1: '이름',
                header2: '휴대폰 번호',
                header3: '이메일 주소',
                header4: '지원일시',
                header5: '진행상태'
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

            if (response.ok) {
                const blob = await response.blob();
                const fileName = await response.headers.get('Content-Disposition').split('filename=')[1];
                console.log(fileName);
                // 파일 다운로드 링크 변경 (선택 사항)
                let downloadLink = document.createElement('a');
                downloadLink.href = window.URL.createObjectURL(blob);
                downloadLink.download = fileName;
                downloadLink.style.display = 'none';
                document.body.appendChild(downloadLink);
                downloadLink.click();
                document.body.removeChild(downloadLink);

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
                customClass: {confirmButton: 'btn btn-primary'}
            });
        }
    }

</script>

<style>
    @keyframes slide-in {
        from {
            transform: translateX(-100%);
            opacity: 0;
        }
        to {
            transform: translateX(0);
            opacity: 1;
        }
    }

    .slide-in-animation {
        animation: slide-in 0.5s forwards;
    }

</style>
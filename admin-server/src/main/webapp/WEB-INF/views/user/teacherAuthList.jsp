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
                            <input type="hidden" name="page" id="page" value="${pageNo}">
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
                                    <div class="col-lg-2">
                                        <label
                                                class="fs-6 form-label fw-bolder text-dark"
                                        >
                                            교사 유형
                                        </label>
                                        <select
                                                id="teacherType"
                                                name="teacherType"
                                                class="form-select form-select-solid"
                                                data-control="select2"
                                                data-hide-search="true"
                                                data-placeholder="전체"
                                        >
                                            <option value="default">전체</option>
                                            <option value="01" ${param.teacherType eq '01' ? 'selected' : ''}>일반교사</option>
                                            <option value="02" ${param.teacherType eq '02' ? 'selected' : ''}>기간제 교사</option>
                                            <option value="03" ${param.teacherType eq '03' ? 'selected' : ''}>해외 이용 교사</option>
                                            <option value="04" ${param.teacherType eq '04' ? 'selected' : ''}>대안학교/예술강사</option>
                                        </select>
                                    </div>

                                    <div class="col-lg-2">
                                        <label class="fs-6 form-label fw-bolder text-dark">인증상태</label>
                                        <select
                                                id="teacherCertificationStatus"
                                                name="teacherCertificationStatus"
                                                class="form-select form-select-solid"
                                                data-control="select2"
                                                data-hide-search="true"
                                                data-placeholder="전체"
                                        >
                                            <option value="default">전체</option>
                                            <option value='01' ${param.teacherCertificationStatus eq '01' ? 'selected' : ''}>미완료</option>
                                            <option value='02' ${param.teacherCertificationStatus eq '02' ? 'selected' : ''}>대기</option>
                                            <option value='03' ${param.teacherCertificationStatus eq '03' ? 'selected' : ''}>검토중</option>
                                            <option value='04' ${param.teacherCertificationStatus eq '04' ? 'selected' : ''}>완료</option>
                                            <option value='05' ${param.teacherCertificationStatus eq '05' ? 'selected' : ''}>반려</option>
                                        </select>
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
                                        <a href="/user/teacher-auth-list" class="btn btn-secondary" style="color: #181c32; background-color : #fff3cd">
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
                            <div class="card-toolbar">
                                <div class="d-flex justify-content-end" data-kt-customer-table-toolbar="base">
                                    <button type="button" class="btn btn-m" style="color: #fff; background-color: #1aa179"  onclick="inputDownload()">
                                        엑셀 다운로드
                                    </button>
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
                                    <th class="min-w-70px">No.</th>
                                    <th class="min-w-70px">이름</th>
                                    <th class="min-w-70px">아이디</th>
                                    <th class="min-w-70px">학교명</th>
                                    <th class="min-w-70px">교사유형</th>
                                    <th class="min-w-70px">교사인증 방식</th>
                                    <th class="min-w-70px">첨부파일</th>
                                    <th class="min-w-70px">인증 요청 일시</th>
                                    <th class="min-w-70px">인증상태</th>
                                </tr>
                                <!--end::Table row-->
                                </thead>
                                <!--end::Table head-->
                                <!--begin::Table body-->
                                <tbody>
                                <c:if test="${not empty list}">
                                    <c:forEach items="${list}" var="list" varStatus="status">
                                        <tr>
                                            <td class="text-dark fw-bold">
                                                    ${((listNum - (page.pageListSize * (page.currentPage - 1))) - status.index)}
                                            </td>
                                            <td class="text-hover-warning hoverable"
                                                data-uid="${list.uid}"
                                                name="userName"
                                                onclick="openAuthTeacherForm(this)">
                                                <c:out value="${list.userName}"/>
                                            </td>
                                            <td class="text-hover-warning hoverable"
                                                data-uid="${list.uid}"
                                                name="userId"
                                                onclick="openAuthTeacherForm(this)">
                                                <c:out value="${list.userId}"/>
                                            </td>
                                            <td class="text-hover-warning hoverable"
                                                data-uid="${list.uid}"
                                                name="name"
                                                onclick="openAuthTeacherForm(this)">
                                                <c:out value="${not empty list.name ? list.name : '-'}"/>
                                            </td>
                                            <td class="text-hover-warning hoverable"
                                                data-uid="${list.uid}"
                                                name="teacherType"
                                                onclick="openAuthTeacherForm(this)">
                                                <c:out value="${not empty list.teacherType ? list.teacherType : '-'}"/>
                                            </td>
                                            <td class="text-hover-warning hoverable"
                                                data-uid="${list.uid}"
                                                name="teacherCertificationType"
                                                onclick="openAuthTeacherForm(this)">
                                                <c:out value="${not empty list.teacherCertificationType and list.teacherCertificationType ne '' ? list.teacherCertificationType : '-'}"/>
                                            </td>
                                            <td class="text-hover-warning hoverable"
                                                data-uid="${list.uid}"
                                                name="teacherCertificationFileUrl"
                                                >
                                                <c:if test="${not empty list.teacherCertificationFileUrl}">
                                                    <%--<a href="/api/v1/file/file-download/6s1RxTyFDqdhlU4y"></a>--%>
                                                    <i class="fas bi-file-earmark-pdf fs-1 me-2" onclick="location.href = '/api/v1/file/file-download/${list.teacherCertificationFileUrl}'"/>
                                                </c:if>
                                                <c:if test="${empty list.teacherCertificationFileUrl}">
                                                    -
                                                </c:if>
                                            </td>
                                            <td class="text-hover-warning hoverable"
                                                data-uid="${list.uid}"
                                                name="firstRegistrationDateTime"
                                                onclick="openAuthTeacherForm(this)"
                                            />
                                            <c:out value="${not empty list.teacherCertificationDate ? list.teacherCertificationDate : '-'}"/>
                                            </td>
                                            <td class="text-hover-warning hoverable"
                                                data-uid="${list.uid}"
                                                name="firstRegistrationDateTime"
                                                onclick="openAuthTeacherForm(this)"
                                            />${list.teacherCertificationStatus}</td>
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
                            <%@ include file="/WEB-INF/views/common/inc/Paging.jsp" %>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.5/jszip.min.js"></script>
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
                    maxDate.setFullYear(maxDate.getFullYear() + 5);
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
    })


    function fetchUserList(page) {
        const sdate = document.getElementById('sdate').value;
        const edate = document.getElementById('edate').value;
        const teacherType = document.getElementById('teacherType').value;
        const teacherCertificationStatus = document.getElementById('teacherCertificationStatus').value;
        const search = document.getElementById('search').value;
        let queryParams = '?perPage=' + document.getElementById('perPage').value;

        if (sdate != null || sdate !== undefined) {
            queryParams += '&sdate=' + sdate;
        }

        if (edate != null || edate !== undefined) {
            queryParams += '&edate=' + edate;
        }

        if (teacherType != null || teacherType !== undefined) {
            queryParams += '&teacherType=' + teacherType;
        }

        if (teacherCertificationStatus != null || teacherCertificationStatus !== undefined) {
            queryParams += '&teacherCertificationStatus=' + teacherCertificationStatus;
        }

        if (search != null || search !== undefined) {
            queryParams += '&search=' + search;
        }

        location.href = '/user/teacher-auth-list' + queryParams;
    }

    function changePage(page) {
        const sdate = document.getElementById('sdate').value;
        const edate = document.getElementById('edate').value;
        const teacherType = document.getElementById('teacherType').value;
        const teacherCertificationStatus = document.getElementById('teacherCertificationStatus').value;
        const search = document.getElementById('search').value;


        let queryParams = '?page=' + page + '&perPage=' + document.getElementById('perPage').value;

        if (sdate != null || sdate !== undefined) {
            queryParams += '&sdate=' + sdate;
        }

        if (edate != null || edate !== undefined) {
            queryParams += '&edate=' + edate;
        }

        if (teacherType != null || teacherType !== undefined) {
            queryParams += '&teacherType=' + teacherType;
        }

        if (teacherCertificationStatus != null || teacherCertificationStatus !== undefined) {
            queryParams += '&teacherCertificationStatus=' + teacherCertificationStatus;
        }

        if (search != null || search !== undefined) {
            queryParams += '&search=' + search;
        }

        location.href = '/user/teacher-auth-list' + queryParams;
    }

    function openAuthTeacherForm(element) {
        const sdate = document.getElementById('sdate').value;
        const edate = document.getElementById('edate').value;
        const teacherType = document.getElementById('teacherType').value;
        const teacherCertificationStatus = document.getElementById('teacherCertificationStatus').value;
        const search = document.getElementById('search').value;
        const page = document.querySelector('#page').value;


        let queryParams = '?page=' + page + '&perPage=' + document.getElementById('perPage').value;

        if (sdate != null || sdate !== undefined) {
            queryParams += '&sdate=' + sdate;
        }

        if (edate != null || edate !== undefined) {
            queryParams += '&edate=' + edate;
        }

        if (teacherType != null || teacherType !== undefined) {
            queryParams += '&teacherType=' + teacherType;
        }

        if (teacherCertificationStatus != null || teacherCertificationStatus !== undefined) {
            queryParams += '&teacherCertificationStatus=' + teacherCertificationStatus;
        }

        if (search != null || search !== undefined) {
            queryParams += '&search=' + search;
        }

        const uid = element.getAttribute('data-uid');
        queryParams += '&uid=' + uid

        const url = '/user/teacher-auth-form' + queryParams;
        window.location.href = url;
    }



    async function inputDownload() {
        const sdate = document.getElementById('sdate').value;
        const edate = document.getElementById('edate').value;
        const teacherType = document.getElementById('teacherType').value;
        const teacherCertificationStatus = document.getElementById('teacherCertificationStatus').value;
        const search = document.getElementById('search').value;

        let date = new Date();
        let year = date.getFullYear();
        let month = ("0" + (date.getMonth() + 1)).slice(-2);
        let day = ("0" + date.getDate()).slice(-2);

        let formattedDate = year + "-" + month + "-" + day;

        const data = {
            nowDay: formattedDate,
            sdate: sdate,
            edate: edate,
            teacherType : teacherType,
            teacherCertificationStatus: teacherCertificationStatus,
            search: search,
            filename: 'teacherAuthList',
            headerMap : {
                header1: 'No.',
                header2: '이름',
                header3: '아이디',
                header4: '학교명',
                header5: '교사유형',
                header6: '교사인증 방식',
                header7: '첨부파일명',
                header8: '인증 요청 일시',
                header9: '인증상태'
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
                const contentDisposition = await response.headers.get('Content-Disposition');
                const fileName = contentDisposition.split('filename=')[1];
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

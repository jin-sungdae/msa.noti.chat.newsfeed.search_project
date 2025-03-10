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
                    <input type="hidden" name="uid" id="uid" value="<c:out value="${partnershipInquiry.uid}"/>"/>
                    <input type="hidden" name="account" id="account" value ="${account}" />

                    <div class="container-fluid">
                        <!-- 본문 내용 START -->
                        <form>
                            <div class="card mb-5 mb-xl-10">
                                <div class="card-header border-0 pt-5">
                                    <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                        제휴 문의 관리
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-lg-6 row mb-8">
                                            <div class="col-lg-2">
                                                <label class="col-lg-10 fw-bolder text-dark pt-3">회사명</label>
                                            </div>
                                            <div class="col-lg-10">
                                                <div class="col-lg-12 text-dark pt-3">
                                                    <c:out value="${partnershipInquiry.companyName}"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 row mb-8">
                                            <div class="col-lg-2">
                                                <label class="col-lg-10 fw-bolder text-dark pt-3">작성일시</label>
                                            </div>
                                            <div class="col-lg-10">
                                                <div class="col-lg-12 text-dark pt-3">
                                                    <c:out value="${partnershipInquiry.regDate}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 row mb-8">
                                            <div class="col-lg-2">
                                                <label class="col-lg-10 fw-bolder text-dark pt-">이름</label>
                                            </div>
                                            <div class="col-lg-10">
                                                <div class="col-lg-12 text-dark pt-3">
                                                    <c:out value="${partnershipInquiry.name}"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 row mb-8">
                                            <div class="col-lg-2">
                                                <label class="col-lg-10 fw-bolder text-dark pt-3">부서/직책 명</label>
                                            </div>
                                            <div class="col-lg-10">
                                                <div class="col-lg-12 text-dark pt-3">
                                                    <c:out value="${partnershipInquiry.departmentPosition}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 row mb-8">
                                            <div class="col-lg-2">
                                                <label class="col-lg-10 fw-bolder text-dark pt-3">전화번호</label>
                                            </div>
                                            <div class="col-lg-10">
                                                <div class="col-lg-12 text-dark pt-3">
                                                    <c:out value="${partnershipInquiry.phoneNo}"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 row mb-8">
                                            <div class="col-lg-2">
                                                <label class="col-lg-10 fw-bolder text-dark pt-3">휴대폰 번호</label>
                                            </div>
                                            <div class="col-lg-10">
                                                <div class="col-lg-12 text-dark pt-3">
                                                    <c:out value="${partnershipInquiry.getMobileNoDecrypted()}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 ">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">이메일</label>
                                            </div>
                                            <div class="col-lg-11">
                                                <div class="col-lg-12 text-dark pt-3">
                                                    <c:out value="${partnershipInquiry.getEmailDecrypted()}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1">
                                                <div class="col-lg-12">
                                                    <label class="form-label fw-bolder text-dark pt-3">관련 URL 주소</label>
                                                </div>
                                            </div>

                                            <div class="col-lg-11">
                                                <div class="col-lg-12 text-dark pt-3">
<%--                                                    <a href="${partnershipInquiry.url}" target="_blank">--%>
                                                        <c:out value="${partnershipInquiry.url}"/>
<%--                                                    </a>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 row mb-8">
                                            <div class="col-lg-2 ">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3">제목</label>
                                            </div>
                                            <div class="col-lg-10 pt-3 row">
                                                <div class="col-lg-12">
                                                    <c:out value="${partnershipInquiry.title}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1">
                                                <div class="col-lg-12">
                                                    <label class="form-label fw-bolder text-dark pt-3">제안 내용</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-11">
                                                <div class="col-lg-12 text-dark pt-3">
                                                    <div>${partnershipInquiry.content}</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">첨부파일</label>
                                            </div>
                                            <div class="fv-row fv-plugins-icon-container col-lg-11">
                                                <div class="col-lg-12 row">
                                                    <div class="fv-row fv-plugins-icon-container col-lg-11" id="dropzoneContainer">
                                                        <!-- 파일 업로드 섹션 -->
                                                        <jsp:include page="/FileFormINC" flush="false">
                                                            <jsp:param name="viewType" value="view" />
                                                            <jsp:param name="isImage" value="false" />
                                                            <jsp:param name="hasOrder" value="false" />
                                                            <jsp:param name="parentTable" value="PARTNERSHIP_INQUIRY"/>
                                                            <jsp:param name="parentIndex" value="${partnershipInquiry == null ? '' : partnershipInquiry.partnershipInquiryIndex}"/>
                                                            <jsp:param name="parentUid" value="${partnershipInquiry == null ? uid : partnershipInquiry.uid}"/>
                                                            <jsp:param name="parentType" value="FILE"/>
                                                            <jsp:param name="maxFileCount" value="1"/>
                                                            <jsp:param name="isSecure" value="Y"/>
                                                            <jsp:param name="DZID" value="dz0"/>
                                                        </jsp:include>
                                                        <!--end::Dropzone-->
                                                        <script type="text/javascript">
                                                            let ntdrop = [];
                                                            ntdrop[0]= global.genDropzone("#dz0",
                                                                { params :
                                                                        {
                                                                            'ParentTable' : 'PARTNERSHIP_INQUIRY',
                                                                            'ParentUid' : '${partnershipInquiry == null ? uid : partnershipInquiry.uid}',
                                                                            'ParentIndex' : '${partnershipInquiry == null ? '' : partnershipInquiry.partnershipInquiryIndex}',
                                                                            'ParentType' : 'FILE',
                                                                        },
                                                                    hasOrder : false,
                                                                    isSecure : 'N',
                                                                    maxFileCount : 1
                                                                });
                                                        </script>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card mb-5 mb-xl-10">
                                <div id=info">
                                    <div class="card-header card-header border-0 pt-5">
                                        <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                            응대 내용
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <table class="table table-row-bordered gy-5" id="faqCommonTable">
                                            <colgroup>
                                                <col width="7%">
                                                <col width="14%">
                                                <col width="14%">
                                                <col width="21%">
                                                <col width="45%">
                                            </colgroup>
                                            <!--begin::Table head-->
                                            <thead>
                                            <!--begin::Table row-->
                                                <tr class="fw-semibold fs-6 text-muted">
                                                    <th class="min-w-30px form-label fw-bolder text-dark" style="text-align: center;">선택</th>
                                                    <th class="min-w-80px form-label fw-bolder text-dark" style="text-align: center;">작성자</th>
                                                    <th class="min-w-70px form-label fw-bolder text-dark" style="text-align: center;">작성일시</th>
                                                    <th class="min-w-120px form-label fw-bolder text-dark" style="text-align: center;">응대방법</th>
                                                    <th class="min-w-200px form-label fw-bolder text-dark" style="text-align: center;">응대내용</th>
                                                </tr>
                                            <!--end::Table row-->
                                            </thead>
                                            <!--end::Table head-->
                                            <!--begin::Table body-->
                                            <tbody>
                                                <c:if test="${not empty partnershipInquiry.partnershipInquiryResponse}">
                                                    <c:forEach items="${partnershipInquiry.partnershipInquiryResponse}" var="list" varStatus="status">
                                                    <tr>
                                                        <td style="text-align: center;" style="text-align: center;">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid mb-3 d-flex justify-content-center align-items-center">
                                                                <input class="form-check-input" type="checkbox" name="responseUid" value="<c:out value="${list.uid}"/>"/>
                                                            </div>
                                                        </td>

                                                        <td style="text-align: center;">
                                                            <c:out value="${list.adminName}"/>(<c:out value="${list.department}"/>)
                                                        </td>
                                                        <td style="text-align: center;">
                                                            <c:out value="${list.regDate}"/>
                                                        </td>
                                                        <td style="text-align: center;">
                                                            <c:out value="${list.responseType}"/>
                                                        </td>
                                                        <td style="text-align: center;">
                                                            <c:out value="${list.responseContent}"/>
                                                        </td>
                                                    </tr>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${empty partnershipInquiry.partnershipInquiryResponse}">
                                                    <tr>
                                                        <td class="center" style="text-align: center;" colspan="5">
                                                            데이터가 없습니다.
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </tbody>
                                        <!--end::Table body-->
                                        </table>
                                    </div>

                                    <c:if test="${not empty partnershipInquiry.partnershipInquiryResponse}">
                                        <div class="card-footer" >
                                            <div class="row">
                                                <div class="col d-flex justify-content-end">
                                                    <button type="button" class="btn btn-warning" style="background-color: #ffcd39; color: #181C32" id="removeResponseBtn">
                                                        응대 내용 삭제
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                            </div>

                            <div class="card mb-5 mb-xl-10">
                                <div id="option">
                                    <div class="card-header card-header border-0 pt-5">
                                        <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                            응대 내용 등록
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                    <label class="col-lg-10 form-label fw-bolder text-dark pt-3 required">응대 방법</label>
                                                </div>
                                                <div class="col-lg-7">
                                                    <div class="col-lg-12 text-dark pt-3">
                                                        <input type="text" class="form-control" name="responseType" id="responseType" maxlength="50">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                    <label class="col-lg-10 form-label fw-bolder text-dark pt-3 required">응대 내용</label>
                                                </div>
                                                <div class="col-lg-9">
                                                    <textarea class="form-control" rows="3" name="responseContent" id="responseContent" maxlength="200"></textarea>
                                                </div>
                                                <div class="col-lg-2 d-flex justify-content-end">
                                                    <button type="button" class="btn btn-warning" style="background-color: #ffcd39; color: #181C32" id="saveBtn">응대 등록</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer" id="footerIdx">
                                        <div class="row">
                                            <div id="listGroup" class="col-3">
                                                <a href="/customer/partnership-inquiry?page=<c:out value='${page}'/>&perPage=<c:out value='${perPage}'/>&startDate=<c:out value='${param.startDate}'/>&endDate=<c:out value='${param.endDate}'/>&isResponse=<c:out value='${param.isResponse}'/>&searchValue=<c:out value='${param.searchValue}'/>" class="btn btn-light-primary" style="background-color: #343a40; color: #FFFFFF">목록</a>
                                            </div>
                                            <div id="editGroup" class="col-9 d-flex justify-content-end">
                                                <button type="button" class="btn btn-warning" style="background-color: #ffcd39; color: #181C32" id="removeBtn">
                                                    제안 삭제
                                                </button>
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
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script type="text/javascript">
    const removeResponseBtn = document.getElementById('removeResponseBtn');
    const uid = document.getElementById('uid').value;
    let isSubmitting = false;

    const makeData = () => {
        return {
            responseType: document.querySelector('input[name=responseType]').value,
            responseContent: document.querySelector('textarea[name=responseContent]').value,
        }
    }
    const makeDeleteData = () => {
        let uidList = document.querySelectorAll('input[name=responseUid]:checked');
        return {
            uid: Array.from(uidList).map((ele) => { return ele.value; }),
        }
    }

    const validMessage = {
        responseType: {elem: null, msg: ' * 응대방법을 입력해주세요.'},
        responseContent: {elem: null, msg: ' * 응대내용을 입력해주세요.'},
    };

    const clearInputIfInvalid = (input) => {
        const name = input.name;
        const isValid = input.value;
        if (!isValid) {
            input.disabled = true;
            if (!validMessage[name].elem) {
                validMessage[name].elem = document.createElement('small');
                validMessage[name].elem.style.color = '#F1416C';
                // 분기처리
                input.parentNode.insertBefore(validMessage[name].elem, input.nextSibling);
                validMessage[name].elem.textContent = validMessage[name].msg;
            }
            input.disabled = false;
            return false;
        } else {
            if (validMessage[name].elem) {
                validMessage[name].elem.remove();
                validMessage[name].elem = null;
            }
            return true;
        }
    }

    const validData = async (data) => {
        let t1 = clearInputIfInvalid(document.getElementById('responseType'));
        let t2 = clearInputIfInvalid(document.getElementById('responseContent'));

        return t1 && t2;
    }
    // 응대 입력
    const save = async () => {
        if (isSubmitting) {
            return;
        }
        isSubmitting = true;

        let url = '/api/v1/customer/partnership-inquiry/'+ uid +'/response';
        let data = makeData();
        // validation 추가
        if(!await validData(data)) {
            isSubmitting = false;
            return false;
        }
        try {
            const response = await fetch(url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            });

            const res = await response.json();
            // console.log(res);
            if (res.resultCode != 0) {
                location.reload();
            }
        } catch (Exception) {
            console.error(Exception);
        } finally {
            isSubmitting = false;
        }
    };
    // 삭제 공통
    const remove = (type) => {
        let url = '/api/v1/customer/partnership-inquiry/' + uid;
        let data = makeDeleteData();

        if (type == 'response') {
            url += '/response'
            if (!data.uid.length) {
                // 삭제 체크 안할시 출력되는 에러
                Swal.fire({
                    title: '삭제할 응대 내용을 선택해주세요.',
                    icon: 'warning',
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: '확인',
                })
                return false;
            };
        }

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
                const response  = await removeFetch(url, data);
                if (response) {
                    if(type == 'response') {
                        location.reload();
                    } else {
                        location.href = '/customer/partnership-inquiry';
                    }
                }
            }
        });
    };
    const removeFetch = async (url, data) => {
        const response = await fetch(url, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(data)
        });

        const res = await response.json();
        return res;
    }

    document.getElementById('responseType').addEventListener('input', (evt) => {
        let name = evt.target.name;
        validMessage[name].elem.remove();
        validMessage[name].elem = null;
    });
    document.getElementById('responseContent').addEventListener('input', (evt) => {
        let name = evt.target.name;
        validMessage[name].elem.remove();
        validMessage[name].elem = null;
    });
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById('saveBtn').addEventListener('click', () => save());
        document.getElementById('removeBtn').addEventListener('click', () => remove('inquiry'));
        if (removeResponseBtn) removeResponseBtn.addEventListener('click', () => remove('response'));
    })
    </script>
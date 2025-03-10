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


                    <div class="container-fluid">
                        <!-- 본문 내용 START -->
                        <form id="userForm" action="/api/v1/user" method="POST">
                            <div class="card mb-5 mb-xl-10">
                                <div class="card-header border-0 pt-5">
                                    <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                        기본 정보
                                    </div>
                                </div>
                                <div class="card-body">

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">이름</label>
                                            </div>

                                            <div class="col-lg-8">

                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                    <input type="text"  class="form-control"  name="name" placeholder="이름 입력" value="${user.name}" maxlength="20" required autocomplete="off">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">아이디</label>
                                            </div>
                                            <div class="col-lg-8">

                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                 <input type="text"  class="form-control" name="userId" placeholder="아이디 입력" value="${user.userId}" maxlength="20" required autocomplete="off">
                                                </div>


                                            </div>
                                        </div>
                                    </div>

                                    <div id="password" class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label id="passwordText" class="col-lg-12 form-label fw-bolder text-dark pt-3">비밀번호</label>
                                            </div>
                                              <div class="col-lg-8">

                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                 <input type="text"  class="form-control" name="password" placeholder="비밀번호 입력" value="${user.password}" maxlength="20" required autocomplete="off">
                                                </div>


                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">생년월일</label>
                                            </div>
                                            <div class="col-lg-8">

                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                  <input type="text"  class="form-control" name="birth" placeholder="생년월일 입력" value="${user.birth}" maxlength="20" required autocomplete="off">
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">휴대폰번호</label>
                                            </div>
                                            <div class="col-lg-8">

                                                <div class="col-lg-12 form-label text-dark pt-3">
                                             <input type="text"  class="form-control" name="phoneNumber" placeholder="휴대폰번호 입력" value="${user.phoneNumber}" maxlength="20" required autocomplete="off">
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">이메일 주소</label>
                                            </div>
                                            <div class="col-lg-8">

                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                 <input type="text"  class="form-control" name="email" placeholder="이메일주소 입력" value="${user.email}" maxlength="20" required autocomplete="off">
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">주소</label>
                                            </div>
                                            <div class="col-lg-8">

                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                      <input type="text"  class="form-control" name="address" placeholder="주소 입력" value="${user.address}" maxlength="20" required autocomplete="off">
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">SNS 계정 연동</label>
                                            </div>
                                            <div class="col-lg-8">
                                                <c:forEach var="sns" items="${data.userSNSAccounts}">
                                                    <p>${sns.snsType} : ${sns.regDate} 연결완료 (이메일: ${sns.decEmail})</p>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>


                                </div>

                              <div class="card-footer" id="footerIdx">
                                            <div class="row">
                                                <div id="listGroup" class="col-3">

                                                </div>
                                                <div id="editGroup" class="col-9 d-flex justify-content-end">
                                                    <a

                                                            type="button"
                                                            id="deleteBtn"
                                                            class="btn btn-light-warning me-2"
                                                            style="background-color: #fff3cd; color: #181C32"
                                                            href="/textbook/textbook-list">
                                                        취소
                                                    </a>
                                                    <button type="button" class="btn btn-warning" style="background-color: #ffcd39; color: #181C32" onclick="save()">
                                                        저장
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

        </div>
    </div>
</div>



</body>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script type="text/javascript">

    let isSubmitting = false;
    async function save(element) {
        if (isSubmitting) return;

        isSubmitting = true;

        const formData = {};
        document.querySelectorAll(".card-body input").forEach(input => {
            formData[input.name] = input.value;
        });

        const response = await fetch('/api/v1/user', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(formData)
        });
        const result = await response.json();
        if (result.result === true) {
            Swal.fire({
                title: '등록 완료',
                text: '등록되었습니다.',
                icon: 'success',
                confirmButtonText: '확인'
            }).then((result) => {
                if (result.isConfirmed) {
                    location.href = '/user/join';
                }
            });
        } else {
            Swal.fire({
                title: '등록 실패',
                text: '등록 처리에 실패하였습니다. 다시 시도해주세요.',
                icon: 'error',
                confirmButtonText: '확인'
            });
        }
    }


</script>
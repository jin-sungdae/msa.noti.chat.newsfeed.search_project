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
                <div id="kt_content_container">
                    <input type="hidden" name="idx" id="idx" value="<c:if test="${agreement != null}"><c:out value="${agreement.agreementIndex}"/></c:if>"/>
                    <input type="hidden" name="uid" id="uid" value="<c:choose><c:when test="${agreement != null}"><c:out value="${agreement.uid}"/></c:when><c:otherwise><c:out value="${uid}"/></c:otherwise></c:choose>"/>
                    <input type="hidden" id="chUid" />
                    <input type="hidden" id="regDate" />
                    <div class="container-fluid">
                        <!-- 본문 내용 START -->
                        <form>
                            <div class="card mb-5 mb-xl-10">
                                <div class="card-header border-0 pt-5">
                                    <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                        약관 관리
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-lg-6 row mb-8">
                                            <div class="col-lg-2">
                                                <label class="col-lg-10 fw-bolder text-dark pt-3">작성자</label>
                                            </div>
                                            <div class="col-lg-10">
                                                <div class="col-lg-12 text-dark pt-3">
                                                    <c:choose>
                                                        <c:when test="${not empty agreement}">
                                                            <c:out value="${agreement.adminName}"/>(<c:out value="${agreement.department}"/>)
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:out value="${account.adminName}"/>(<c:out value="${account.department}"/>)
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                        <c:if test="${agreement != null}">
                                            <div class="col-lg-6 row mb-8">
                                                <div class="col-lg-2">
                                                    <label class="col-lg-10 fw-bolder text-dark pt-3">작성일시</label>
                                                </div>
                                                <div class="col-lg-10">
                                                    <div class="col-lg-12 text-dark pt-3">
                                                        <c:out value="${agreement.regDate}"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-6 row mb-8">
                                            <div class="col-lg-2 ">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3 required">약관구분</label>
                                            </div>
                                            <div class="col-lg-10">
                                                <div class="col-lg-6 form-label text-dark">
                                                    <select
                                                        id="agreementType"
                                                        name="agreementType"
                                                        class="form-select form-select-solid"
                                                        data-control="select2"
                                                        data-hide-search="true"
                                                        data-placeholder="전체"
                                                    >
                                                        <c:forEach items="${agreementType}" var="type" varStatus="status">
                                                            <option value="${type.getName()}"
                                                                    <c:if
                                                                        test="${type.getName() == agreement.agreementType}">selected</c:if> >
                                                                <c:choose>
                                                                    <c:when test="${type.getValue() eq ''}">전체</c:when>
                                                                    <c:otherwise>${type.getValue()}</c:otherwise>
                                                                </c:choose>
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <c:if test="${agreement != null and agreement.modDate ne null and agreement.modDate != ''}">
                                            <div class="col-lg-6 row mb-8">
                                                <div class="col-lg-2">
                                                    <label class="col-lg-10 form-label fw-bolder text-dark pt-3">수정일시</label>
                                                </div>
                                                <div class="col-lg-10">
                                                    <div class="col-lg-12 text-dark pt-3">
                                                        <c:out value="${agreement.modDate}"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 ">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3 required">개정일</label>
                                            </div>

                                            <div class="col-lg-11">
                                                <div class="col-lg-6 form-label text-dark pt-3">

                                                    <div class="input-group">
                                                        <input
                                                            id="revisionDate"
                                                            name="revisionDate"
                                                            type="text"
                                                            class="form-control flatpickr-input"
                                                            placeholder="개정일"
                                                            autocomplete="off"
                                                            value="<c:out value='${agreement.revisionDate}'/>"
                                                        />
                                                        <span class="input-group-text" id="basic-addon3">
                                                            <i class="bi bi-calendar-check fs-1"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1">
                                                <div class="col-lg-12">
                                                    <label class="form-label fw-bolder text-dark pt-3 required">약관내용</label>
                                                </div>
                                            </div>

                                            <div class="col-lg-11">
                                                <textarea class="form-control form-control-solid contents"
                                                          rows="5"
                                                          id="contents"
                                                          minlength="1"
                                                          name="contents"
                                                          readonly="readonly"
                                                          placeholder="Content"><c:out value='${agreement.content}'/></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 ">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3 required">노출여부</label>
                                            </div>
                                            <div class="col-lg-11 pt-3 row">
                                                <div class="col-lg-3">
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                <input
                                                                    class="form-check-input"
                                                                    type="radio"
                                                                    name="isOpen"
                                                                    id="isOpen"
                                                                    <c:if test="${empty agreement || agreement.isOpen == 'N'}">checked</c:if>
                                                                    value="N"
                                                                />
                                                                <label for="isOpen" class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3">
                                                                    N
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                <input
                                                                    class="form-check-input"
                                                                    type="radio"
                                                                    name="isOpen"
                                                                    id="isOpenY"
                                                                    <c:if test="${agreement.isOpen == 'Y'}">checked</c:if>
                                                                    value="Y"
                                                                />
                                                                <label for="isOpenY" class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3">
                                                                    Y
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer" id="footerIdx">
                                    <div class="row">
                                        <div id="listGroup" class="col-3">
                                        </div>
                                        <div class="col-9 d-flex justify-content-end">
                                            <button type="button" class="btn btn-light-warning me-2" style="color:#181C32" onclick="history.back()">취소</button>
                                            <c:choose>
                                                <c:when test="${not empty agreement}">
                                                    <button type="button" class="btn btn-warning" style="background-color: #ffcd39; color: #181C32" id="modifyBtn">
                                                        저장
                                                    </button>
                                                </c:when>
                                                <c:otherwise>
                                                    <button type="button" class="btn btn-warning" style="background-color: #ffcd39; color: #181C32" id="saveBtn">
                                                        저장
                                                    </button>
                                                </c:otherwise>
                                            </c:choose>
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
<script type="text/javascript">
    let froalaKey = <%= froalaKey %>;
    $('.contents').froalaEditor({
        key: froalaKey,
        toolbarButtons: ['fullscreen', 'bold', 'italic', 'underline', 'strikeThrough', 'subscript', 'superscript', '|', 'fontFamily', 'fontSize', 'color', 'inlineClass', 'inlineStyle', 'paragraphStyle', 'lineHeight', '|', 'paragraphFormat', 'align', 'formatOL', 'formatUL', 'outdent', 'indent', 'quote', '-', 'insertLink', 'insertImage', 'insertTable', '|', 'specialCharacters', 'insertHR', 'selectAll', 'clearFormatting', '|', 'print', 'getPDF', 'spellChecker', 'help', 'html', '|', 'undo', 'redo'],
        imageUploadURL: '/froalaeditor/upload/Image',
        imageUploadParams: {editorUploadPath: '<c:out value="${editorUploadPath}"/>'},
        imageDefaultWidth: 0,
        language: 'en',
        videoUpload: false,
        fileUpload: false,
        height: 300,
        requestHeaders: {
            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        }
    });

    /***************************************************** INIT ***************************************/
    function initializeFlatpickr() {
        const revisionDateInput = document.getElementById('revisionDate');

        revisionFlatpickr = flatpickr(revisionDateInput, {
            dateFormat: 'Y-m-d',
            locale: 'ko',
        });
    }


    let isSubmitting = false;
    // data 생성
    const makeData = () => {
        const checkAgreementType = document.querySelector('select[name="agreementType"]');
        let params = {
            uid: document.getElementById('uid').value,
            agreementType: checkAgreementType.value,
            revisionDate: document.getElementById('revisionDate').value,
            content: document.getElementById('contents').value,
            isOpen: document.querySelector('input[name="isOpen"]:checked').value,
        };
        return params;
    };
    /*************************************** start: Valid ********************************************/
    // 메세지 관리
    const validMessage = {
        agreementType: {elem: null, msg: '* 약관구분을 선택해주세요.'},
        revisionDate: {elem: null, msg: '* 개정일을 선택해주세요.'},
        contents: {elem: null, msg: '* 약관내용을 입력해주세요.'},
    };
    // 에러메세지 제작
    const setMessage = (elem, isValid) => {
        const name = elem.name;

        // 에러 메세지 생성
        if (!isValid) {
            elem.disabled = true;
            if (!validMessage[name].elem) {
                validMessage[name].elem = document.createElement('small');
                validMessage[name].elem.style.color = '#F1416C';
                if(name == 'revisionDate') {
                    elem.parentNode.parentNode.insertBefore(validMessage[name].elem, null);
                } else if(name == 'agreementType') {
                    elem.parentNode.insertBefore(validMessage[name].elem, null);
                } else {
                    elem.parentNode.insertBefore(validMessage[name].elem, elem.nextSibling);
                }
                validMessage[name].elem.textContent = validMessage[name].msg;
            }
            elem.disabled = false;
            return
        }
        // 메세지 제거
        if (validMessage[name].elem) {
            validMessage[name].elem.remove();
            validMessage[name].elem = null;
        }
    }

    const validForm = async () => {
        const revisionDate = document.querySelector('input[name="revisionDate"]');
        const agreementType = document.querySelector('select[name="agreementType"]');
        const contents = document.querySelector('textarea[name="contents"]');
        let revisionDateBol = true;
        let agreementTypeBol = true;
        let contentsBol = true;
        if (!revisionDate.value) revisionDateBol = false;
        if (!agreementType.value) agreementTypeBol = false;
        if (!contents.value) contentsBol = false;

        setMessage(revisionDate, revisionDateBol);
        setMessage(agreementType, agreementTypeBol);
        setMessage(contents, contentsBol);

        return revisionDateBol && agreementTypeBol && contentsBol;
    }
    // 저장
    const saveNotice = async () => {
        if (isSubmitting) {
            return;
        }
        isSubmitting = true;

        // 전송 데이터 생성
        let data = makeData();

        if(!await validForm()) {
            isSubmitting = false;
            return false;
        }
        try {
            const response = await fetch('/api/v1/site/agreement', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            });

            const res = await response.json();

            if (res) {
                if(!res.uid) {
                    Swal.fire({
                        title: '등록 실패',
                        text: '등록 처리에 실패되었습니다. \n다시 시도해주세요.',
                        icon: 'error',
                        confirmButtonText: '확인'
                    });
                    return false;
                }
                Swal.fire({
                    title: '등록 완료',
                    text: '등록 되었습니다.',
                    icon: 'success',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.href = '/site/agreement';
                    }
                })
            }
        } catch (Exception) {
            console.error(Exception);
        } finally {
            isSubmitting = false;
        }
    }
    const modify = async () => {
        if (isSubmitting) {
            return;
        }
        isSubmitting = true;

        // 전송 데이터 생성
        let data = makeData();

        if(!await validForm()) {
            isSubmitting = false;
            return false;
        }
        try {
            let uid = document.getElementById('uid').value;
            const response = await fetch('/api/v1/site/agreement/' + uid, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            });

            const res = await response.json();

            if (res) {
                Swal.fire({
                    title: '등록 완료',
                    text: '등록되었습니다.',
                    icon: 'success',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.href = '/site/agreement/' + res.uid;
                    }
                })
            }
        } catch (Exception) {
            console.error(Exception);
        } finally {
            isSubmitting = false;
        }
    }

    const save = () => {
        let chk = document.getElementById('idx').value;
        chk ? modify() : saveNotice();
    }
    document.addEventListener('DOMContentLoaded', function () {
        const targetNode = document.querySelectorAll('.form-select');
        targetNode.forEach((node) => {
            node.style.backgroundColor = '#ffffff';
            node.style.backgroundClip = 'padding-box';
            node.style.border = '1px solid #E4E6EF';
        });
        initializeFlatpickr();
        if(document.getElementById('idx').value) {
            document.getElementById('modifyBtn').addEventListener('click', () => save());
        } else {
            document.getElementById('saveBtn').addEventListener('click', () => save());
        }
    });

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
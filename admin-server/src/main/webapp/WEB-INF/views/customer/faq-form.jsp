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
                    <input type="hidden" name="uid" id="uid" value="<c:out value='${faq != null ? faq.uid : uid}'/>"/>
                    <div class="container-fluid">
                        <!-- 본문 내용 START -->
                        <form>
                            <input type="hidden" name="sortOrder" id="sortOrder" value="<c:out value='${faq.sortOrder}'/>" />
                            <input type="hidden" name="faqIndex" id="faqIndex" value="<c:out value='${faq.faqIndex}'/>" />
                            <div class="card mb-5 mb-xl-10">
                                <div class="card-header border-0 pt-5">
                                    <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                        <c:choose>
                                            <c:when test="${faqCase eq 1}">자주하는 질문</c:when>
                                            <c:otherwise>FAQ 관리</c:otherwise>
                                        </c:choose>
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
                                                        <c:when test="${not empty faq}">
                                                            <c:out value="${faq.adminName}"/>(<c:out value="${faq.department}"/>)
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:out value="${account.adminName}"/>(<c:out value="${account.department}"/>)
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                        <c:if test="${faq != null}">
                                            <div class="col-lg-6 row mb-8">
                                                <div class="col-lg-2">
                                                    <label class="col-lg-10 fw-bolder text-dark pt-3">작성일시</label>
                                                </div>
                                                <div class="col-lg-10">
                                                    <div class="col-lg-12 text-dark pt-3">
                                                        <c:choose>
                                                            <c:when test="${faq.modDate ne null and faq.modDate != ''}">
                                                                <c:out value="${faq.modDate}"/>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:out value="${faq.regDate}"/>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 ">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3 required" for="question">질문</label>
                                            </div>
                                            <div class="col-lg-11">
                                                <div class="col-lg-12 text-dark pt-3">
                                                    <input class="form-control" type="text" name="question" id="question" value="<c:out value='${faq.question}'/>" maxlength="50"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 ">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required">구분</label>
                                            </div>
                                            <div class="col-lg-11">
                                                <div class="row">
                                                    <c:forEach items="${faqType}" var="type" varStatus="status">
                                                        <c:if test="${type.getValue() != '' || status.index != 0}">
                                                            <div class="col">
                                                                <div class="form-check form-check-custom form-check-warning form-check-solid mb-3">
                                                                    <input class="form-check-input" type="checkbox" value="<c:out value="${type.getName()}"/>" id="faqType<c:out value="${status.index}"/>" name="faqType"
                                                                        <c:if test="${fn:contains(faq.faqType, type.getName())}">checked</c:if>
                                                                    />
                                                                    <label class="form-check-label form-label fw-bolder text-dark pt-3" for="faqType<c:out value="${status.index}"/>">
                                                                        <c:out value="${type.getValue()}"/>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1">
                                                <div class="col-lg-12">
                                                    <label class="form-label fw-bolder text-dark pt-3 required">답변</label>
                                                </div>
                                            </div>

                                            <div class="col-lg-11">
                                                <textarea class="form-control form-control-solid answer"
                                                            rows="5"
                                                            id="answer"
                                                            minlength="1"
                                                            name="answer"
                                                            readonly="readonly"
                                                            placeholder="Content"><c:out value='${faq.answer}'/></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 row mb-8">
                                            <div class="col-lg-2">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3 required">노출여부</label>
                                            </div>
                                            <div class="col-lg-10 pt-3 row">
                                                <div class="col-lg-4">
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                <input
                                                                class="form-check-input"
                                                                type="radio"
                                                                name="isOpen"
                                                                id="isOpen"
                                                                <c:out value="${empty faq || faq.isOpen == 'N'  ? 'checked' : ''}"/>
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
                                                                    <c:out value="${faq.isOpen == 'Y' ? 'checked' : ''}"/>
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
                                                <c:when test="${not empty faq}">
                                                    <button type="button" class="btn btn-warning" data-faq-case="<c:out value='${faqCase}'/>" style="background-color: #ffcd39; color: #181C32" id="modifyBtn">
                                                        저장
                                                    </button>
                                                </c:when>
                                                <c:otherwise>
                                                    <button type="button" class="btn btn-warning" data-faq-case="<c:out value='${faqCase}'/>" style="background-color: #ffcd39; color: #181C32" id="saveBtn">
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

    /***************************************************** INIT ***************************************/
    let froalaKey = <%= froalaKey %>;
    $('.answer').froalaEditor({
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
        },
    });
    $('.answer').on('froalaEditor.keydown', function (e, editor, keydownEvent) {
        setMessage(document.getElementById('answer'), true);
    });

    let isSubmitting = false;
    // data 생성
    const makeData = () => {
        const checkFaqType = document.querySelectorAll('input[name="faqType"]:checked');
        let params = {
            uid: document.getElementById('uid').value,
            faqType: Array.from(checkFaqType).map((ele) => { return ele.value; }),
            question: document.getElementById('question').value,
            answer: document.getElementById('answer').value,
            isOpen: document.querySelector('input[name="isOpen"]:checked').value,
            sortOrder: document.getElementById('sortOrder').value ? document.getElementById('sortOrder').value : 1,
        };
        return params;
    };

    const validMessage = {
        question: {elem: null, msg: ' * 질문을 입력해주세요.'},
        faqType: {elem: null, msg: ' * 구분을 선택해주세요.'},
        answer: {elem: null, msg: ' * 답변을 입력해주세요.'},
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
                // 분기처리
                if (name == 'faqType') {
                    elem.parentNode.parentNode.parentNode.parentNode.insertBefore(validMessage[name].elem, null)
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
    const clearInputIfInvalid = (inputEvent) => {
        const elem = inputEvent.target
        setMessage(elem, true);
    }

    const validData = async () => {
        const question = document.getElementById('question');
        const faqType = document.querySelectorAll('input[name="faqType"]');
        const answer = document.getElementById('answer');
        let questionBol = true;
        let faqTypeBol = true;
        let answerBol = true;
        if (!question.value) questionBol = false;
        if (!answer.value) answerBol = false;
        if (document.querySelectorAll('input[name="faqType"]:checked').length < 1) {
            faqTypeBol = false;
        }

        // 메세지 세팅
        setMessage(question, questionBol);
        setMessage(faqType[0], faqTypeBol);
        setMessage(answer, answerBol);

        return questionBol && faqTypeBol && answerBol;
    }
    // 저장
    const save = async (faqCase) => {
        if (isSubmitting) {
            return;
        }
        isSubmitting = true;

        // 전송 데이터 생성
        let data = makeData();
        if(!await validData()) {
            isSubmitting = false;
            return false;
        }
        try {
            const response = await fetch('/api/v1/customer/faq', {
                method: 'POST',
                headers: {
                'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            });

            const res = await response.json();
            console.log(res);
            if (res) {
                if(res.resultCode == 0) {
                    let message = validMsg(res.data);
                    Swal.fire({
                        title: '등록 완료',
                        text: '등록되었습니다.',
                        icon: 'error',
                        confirmButtonText: '확인'
                    });
                    return false;
                }
                if(res.resultCode == '10009') {
                    Swal.fire({
                        title: '등록 실패',
                        html: '<p>FAQ는 100개까지 등록됩니다.<br> 기존 FAQ 삭제 후 등록해주세요.<p>',
                        icon: 'error',
                        confirmButtonText: '확인'
                    });
                    return false;
                }
                Swal.fire({
                    title: '등록 완료',
                    text: '등록되었습니다.',
                    icon: 'success',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        if(res.uid) {
                            let returnUrl = faqCase ? '/reading-review/faq' : '/customer/faq';
                            location.href = returnUrl;
                        }
                    }
                })
            }
        } catch (Exception) {
            console.error(Exception);
        } finally {
            isSubmitting = false;
        }
    }
    const modify = async (faqCase) => {
        if (isSubmitting)  return;

        isSubmitting = true;

        let uid = document.getElementById('uid').value;

        // 전송 데이터 생성
        let data = makeData();
        if(!await validData()) {
            isSubmitting = false;
            return false;
        }
        try {
            const response = await fetch('/api/v1/customer/faq/' + uid, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            });

            const res = await response.json();
            if (res) {
                if(res.resultCode == 0) {
                    let message = validMsg(res.data);
                    Swal.fire({
                        title: '등록 완료',
                        text: '등록되었습니다.',
                        icon: 'error',
                        confirmButtonText: '확인'
                    });
                    return false;
                }
                if(res.resultCode == '10009') {
                    Swal.fire({
                        title: '등록 실패',
                        html: '<p>FAQ는 100개까지 등록됩니다.<br> 기존 FAQ 삭제 후 등록해주세요.<p>',
                        icon: 'error',
                        confirmButtonText: '확인'
                    });
                    return false;
                }
                Swal.fire({
                    title: '등록 완료',
                    text: '등록되었습니다.',
                    icon: 'success',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        let returnUrl = faqCase ? '/reading-review/faq' : '/customer/faq';
                        let returnUid = res.uid ? '/' + res.uid : '';
                        location.href = returnUrl + returnUid;
                    }
                })
            }
        } catch (Exception) {
            console.error(Exception);
        } finally {
            isSubmitting = false;
        }
    }
    const validMsg = (msg) => {
        const messageChk = {
            question: '질문을 입력해주세요.',
            answer: '답변을 입력해주세요.',
            faqType: '구분을 선택해주세요.',
        }
        let message = '';
        const questionCheck = msg.match(new RegExp(messageChk.question, 'g'));
        if (questionCheck) {
            return questionCheck[0];
        }
        const answerCheck = msg.match(new RegExp(messageChk.answer, 'g'));
        if (answerCheck) {
            return answerCheck[0];
        }
        return message;
    };

    document.addEventListener('DOMContentLoaded', function () {
        if(document.getElementById('faqIndex').value) {
            const modifyBtn = document.getElementById('modifyBtn');
            modifyBtn.addEventListener('click', () => {
                modify(modifyBtn.dataset.faqCase);
            });
        } else {
            const saveBtn = document.getElementById('saveBtn');
            saveBtn.addEventListener('click', () => {
                save(saveBtn.dataset.faqCase);
            });
        }

        document.getElementById('question').addEventListener('input', (evt) => { clearInputIfInvalid(evt) });
        document.querySelectorAll('input[name="faqType"]').forEach(elem => {
            elem.addEventListener('input', (evt) => { clearInputIfInvalid(evt) });
        });
    })
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
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
                    <input type="hidden" name="uid" id="uid" value="<c:out value="${customerInquiry.uid}"/>"/>
                    <input type="hidden" name="kind" id="kind" value="<c:out value="${kind}"/>"/>
                    <div class="container-fluid">
                        <!-- 본문 내용 START -->
                        <form>
                            <div class="card mb-5 mb-xl-10">
                                <div class="card-header border-0 pt-5">
                                    <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                        <c:choose>
                                            <c:when test="${kind ne ''}">
                                                <c:out value="${customerInquiry.inquiryKindTitle}"/> 문의
                                            </c:when>
                                            <c:otherwise>
                                                문의내역 관리
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="row mb-8">
                                        <div class="col-lg-4 row">
                                            <div class="col-lg-3">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3">작성자</label>
                                            </div>
                                            <div class="col-lg-9 row">
                                                <div id="userType" class="col-lg-4 form-label text-dark pt-3">
                                                    <c:out value="${customerInquiry.userName}"/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 row">
                                            <div class="col-lg-3">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">작성일시</label>
                                            </div>
                                            <div class="col-lg-9 row">
                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                    <c:out value="${customerInquiry.regDate}"/>
                                                </div>
                                            </div>
                                        </div>
                                        <c:if test="${kind ne ''}">
                                            <div class="col-lg-4 row">
                                                <div class="col-lg-3">
                                                    <label class="col-lg-10 form-label fw-bolder text-dark pt-3">문의구분</label>
                                                </div>
                                                <div class="col-lg-9 row">

                                                    <div class="col-lg-4 form-label text-dark pt-3">
                                                        <c:out value="${customerInquiry.inquiryCategory}"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                    <c:if test="${kind eq ''}">
                                        <div class="row mb-8">
                                            <div class="col-lg-4 row">
                                                <div class="col-lg-3">
                                                    <label class="col-lg-10 form-label fw-bolder text-dark pt-3">구분</label>
                                                </div>
                                                <div class="col-lg-9 row">

                                                    <div class="col-lg-4 form-label text-dark pt-3">
                                                        <c:choose>
                                                            <c:when test="${customerInquiry.inquiryCategory eq '첫걸음'}">
                                                                독서평설첫걸음
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:out value="${customerInquiry.inquiryCategory}"/>독서평설
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3">제목</label>
                                            </div>
                                            <div class="col-lg-11">
                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                    <c:out value="${customerInquiry.title}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3">문의내용</label>
                                            </div>
                                            <div class="col-lg-11">
                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                <textarea class="col-lg-12 form-control form-control-solid"
                                                          id="customerInquiryTextarea"
                                                          style="padding:0px;border: none;background-color: transparent;overflow-y: auto; max-height: 500px;"
                                                          oninput="autoResize(this)"
                                                          ><c:out value="${customerInquiry.content}"/></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3">첨부파일</label>
                                            </div>
                                            <div class="fv-row fv-plugins-icon-container col-lg-11">
                                                <div class="col-lg-12 row">
                                                    <div class="fv-row fv-plugins-icon-container col-lg-11" id="dropzoneContainer">
                                                        <!-- 파일 업로드 섹션 -->
                                                        <jsp:include page="/FileFormINC" flush="false">
                                                            <jsp:param name="viewType" value="view" />
                                                            <jsp:param name="isImage" value="false" />
                                                            <jsp:param name="hasOrder" value="false" />
                                                            <jsp:param name="parentTable" value="CUSTOMER_INQUIRY"/>
                                                            <jsp:param name="parentIndex" value="${customerInquiry == null ? '' : customerInquiry.customerInquiryIndex}"/>
                                                            <jsp:param name="parentUid" value="${customerInquiry == null ? uid : customerInquiry.uid}"/>
                                                            <jsp:param name="parentType" value="FILE"/>
                                                            <jsp:param name="maxFileCount" value="1"/>
                                                            <jsp:param name="isSecure" value="N"/>
                                                            <jsp:param name="DZID" value="dz0"/>
                                                        </jsp:include>
                                                        <!--end::Dropzone-->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <c:if test="${kind eq ''}">
                                        <div class="row mb-8">
                                            <div class="col-lg-4 row">
                                                <div class="col-lg-3">
                                                    <label class="col-lg-10 form-label fw-bolder text-dark pt-3">SNS 수신여부</label>
                                                </div>
                                                <div class="col-lg-9 row form-label text-dark pt-3">
                                                    <c:out value="${customerInquiry.isSms eq 'Y'? '예':'아니오'}"/>
                                                </div>
                                            </div>

                                            <div class="col-lg-4 row">
                                                <div class="col-lg-3">
                                                    <label class="col-lg-10 form-label fw-bolder text-dark pt-3">휴대폰 번호</label>
                                                </div>
                                                <div class="col-lg-9 row form-label text-dark pt-3">
                                                    <c:out value="${customerInquiry.phoneNo}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                            <c:if test="${kind ne ''}">
                                <div class="card mb-5 mb-xl-10">
                                    <div id="option">
                                        <div class="card-header border-0 pt-5">
                                            <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                                작성자 부가 정보
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="row mb-8">
                                                <div class="col-lg-4 row">
                                                    <div class="col-lg-3 ">
                                                        <label class="col-lg-10 form-label fw-bolder text-dark pt-3">아이디</label>
                                                    </div>
                                                    <div class="col-lg-9">

                                                        <div class="col-lg-12 form-label text-dark pt-3">
                                                            <c:out value="${customerInquiry.userId}"/>
                                                        </div>


                                                    </div>
                                                </div>
                                                <div class="col-lg-4 row">
                                                    <div class="col-lg-3 ">
                                                        <label class="col-lg-10 form-label fw-bolder text-dark pt-3">SMS 수신여부 </label>
                                                    </div>
                                                    <div class="col-lg-9">
                                                        <div class="col-lg-12 form-label text-dark pt-3">
                                                            <c:out value="${customerInquiry.isSms}"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 row">
                                                    <div class="col-lg-3 ">
                                                        <label class="col-lg-10 form-label fw-bolder text-dark pt-3">휴대폰 번호</label>
                                                    </div>
                                                    <div class="col-lg-9 form-label text-dark pt-3">
                                                        <c:out value="${customerInquiry.phoneNo}"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-4 row">
                                                    <div class="col-lg-3 ">
                                                        <label class="form-label fw-bolder text-dark pt-3">주소</label>
                                                    </div>
                                                    <div class="col-lg-9">
                                                        <div class="col-lg-12 form-label text-dark pt-3">
                                                            <c:out value="${(customerInquiry.address1 eq null) and (customerInquiry.address2 eq null)?'-':customerInquiry.getFullAddress()}"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-8">
                                                <div class="col-lg-4 row">
                                                    <div class="col-lg-3 ">
                                                        <label class="form-label fw-bolder text-dark pt-3">회원구분</label>
                                                    </div>
                                                    <div class="col-lg-9">
                                                        <div class="col-lg-12 form-label text-dark pt-3">
                                                            <c:out value="${customerInquiry.userType}"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <c:if test="${customerInquiry.userType eq '학생' or customerInquiry.userType eq '선생님' or customerInquiry.userType eq '학원강사'}">
                                                <div class="row mb-8">
                                                    <div class="col-lg-4 row">
                                                        <div class="col-lg-3 ">
                                                            <label class="col-lg-10 form-label fw-bolder text-dark pt-3"><c:out value="${customerInquiry.userType eq '학원강사'? '학원명':'학교명'}"/></label>
                                                        </div>
                                                        <div class="col-lg-9">
                                                            <div class="col-lg-12 form-label text-dark pt-3">
                                                                <c:out value="${userDetail.name}"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 row">
                                                        <div class="col-lg-3 ">
                                                            <label class="col-lg-10 form-label fw-bolder text-dark pt-3"><c:out value="${customerInquiry.userType eq '학원강사'? '학원지역':'학교주소'}"/></label>
                                                        </div>
                                                        <div class="col-lg-9">
                                                            <c:set var="fullAddress" value="${userDetail.address1} ${userDetail.address2}"/>
                                                            <div class="col-lg-12 form-label text-dark pt-3">
                                                                <c:out value="${fullAddress}"/>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <div class="card mb-5 mb-xl-10">
                                <div id=info">
                                    <div class="card-header border-0 pt-5">
                                        <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                            답변 정보
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="row mb-8">
                                            <div class="col-lg-4 row">
                                                <div class="col-lg-3">
                                                    <label class="col-lg-10 form-label fw-bolder text-dark pt-3">답변자</label>
                                                </div>
                                                <div class="col-lg-8">
                                                    <div class="col-lg-12 form-label text-dark pt-3">
                                                        <c:out value="${admin.getAdminNameWithDept()}"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 row">
                                                <div class="col-lg-3">
                                                    <label class="col-lg-10 form-label fw-bolder text-dark pt-3">답변일시</label>
                                                </div>
                                                <div class="col-lg-9 row">
                                                    <div class="col-lg-12 form-label text-dark pt-3">
                                                        <c:choose>
                                                            <c:when test="${customerInquiry.isAnswer eq 'Y'}">
                                                                <c:out value="${customerInquiry.answerRegDate}"/>
                                                            </c:when>
                                                            <c:otherwise>
                                                                -
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-8">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-1">
                                                    <label class="col-lg-10 form-label fw-bolder text-dark pt-3 required"><c:if test="${kind eq ''}">답변</c:if>내용</label>
                                                </div>
                                                <div class="col-lg-11 form-label text-dark pt-3 fv-row fv-plugins-icon-container">
                                                    <textarea class="col-lg-12 form-control form-control-solid answer"
                                                              rows="5"
                                                              id="answer"
                                                              minlength="1"
                                                              name="answer"
                                                              placeholder="Answer"><c:out value="${customerInquiry.answer}"/></textarea>
                                                    <div class="fv-plugins-message-container invalid-feedback answer-empty-msg" style="display: none;"><div data-field="answer" data-validator="notEmpty">* 답변을 등록해주세요.</div></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer" id="footerIdx">
                                        <div class="row">
                                            <div id="listGroup" class="col-3">
                                                <button type="button" class="btn btn-light-primary" style="background-color: #343a40; color: #FFFFFF; <c:if test="${kind eq ''}">display: none</c:if>" onclick="goList()">목록</button>
                                            </div>
                                            <div id="saveGroup" class="col-9 d-flex justify-content-end">
                                                <button type="button" id="cancelBtn" class="btn btn-light-primary me-2" style="background-color: #fff3cd; color: #181C32" onclick="history.back();">
                                                    취소
                                                </button>
                                                <button
                                                        data-uid="${customerInquiry.uid}"
                                                        type="button"
                                                        class="btn btn-warning"
                                                        style="background-color: #ffcd39; color: #181C32"
                                                        onclick="save(this)"
                                                >
                                                    저장
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script src="/assets/js/file.js"></script>
<script type="text/javascript">

    /***************************************************** INIT ***************************************/
    let froalaKey = <%= froalaKey %>;
    $('.answer').froalaEditor({
        key: froalaKey,
        toolbarButtons: ['fullscreen', 'bold', 'italic', 'underline', 'strikeThrough', 'subscript', 'superscript', '|', 'fontFamily', 'fontSize', 'color', 'inlineClass', 'inlineStyle', 'paragraphStyle', 'lineHeight', '|', 'paragraphFormat', 'align', 'formatOL', 'formatUL', 'outdent', 'indent', 'quote', '-', 'insertLink', 'insertImage', 'insertTable', '|', 'specialCharacters', 'insertHR', 'selectAll', 'clearFormatting', '|', 'print', 'getPDF', 'spellChecker', 'help', 'html', '|', 'undo', 'redo'],
        imageUploadURL: '/froalaeditor/upload/Image',
        imageUploadParams: {editorUploadPath: '${editorUploadPath}'},
        imageDefaultWidth: 0,
        language: 'en',
        videoUpload: false,
        fileUpload: false,
        height: 300,
        requestHeaders: {
            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        }
    });
    $('.answer').on('froalaEditor.keydown', function (e, editor, keydownEvent) {
        if (editor.html.get() !== '') {
            document.querySelector('.answer-empty-msg').style.display = 'none';
        }
    });
    $('.answer').on('froalaEditor.image.uploaded', function (e, editor, keydownEvent) {
        if (editor.html.get() !== '') {
            document.querySelector('.answer-empty-msg').style.display = 'none';
        }
    });

    document.addEventListener('DOMContentLoaded', function () {
        const textarea = document.getElementById('customerInquiryTextarea');
        autoResize(textarea);
    });

    /********************************************************************** POST ************************************************/
    let isSubmitting = false;
    async function save(element) {
        isSubmitting = true;
        let uid = element.getAttribute('data-uid');
        let answer = document.getElementById('answer').value;
        if(answer == ''){
            document.querySelector('.answer-empty-msg').style.display = '';
            return;
        }
        let data = {
            uid: uid,
            answer: answer
        }
        let kind = document.getElementById('kind').value;
        try {
            const response = await fetch('/api/v1/customer/inquiry/' + kind + '-answer', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            });

            const result = await response.json();

            if (result) {
                if (result.resultCode == 0) {
                    Swal.fire({
                        title: '등록 실패',
                        text: '등록 처리에 실패되었습니다. \n다시 시도해주세요.',
                        icon: 'error',
                        confirmButtonText: '확인'
                    })
                }
                Swal.fire({
                    title: '등록 완료',
                    text: '등록되었습니다.',
                    icon: 'success',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        let url = '/customer/inquiry/' + kind + '/' + uid;
                        if(kind == ''){
                            url = '/reading-review/inquiry/' + uid;
                        }
                        location.href = url;
                    }
                })
            }
        } catch (Exception) {
            console.error(Exception);
        } finally {
            isSubmitting = false;
        }
    }

    /******************************************************************* PUT ************************************************/

    let isModified = false;

    async function modify(element) {
        isModified = true;
        let answer = document.getElementById('answer').value;
        let uid = element.getAttribute('data-uid');
        if(answer == ''){
            document.querySelector('.answer-empty-msg').style.display = '';
            return;
        }
        let data = {
            uid: uid,
            answer: answer
        }

        let kind = document.getElementById('kind').value;
        try {
            const response = await fetch('/api/v1/customer/inquiry/' + kind + '-answer', {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            });

            const result = await response.json();

            if (result) {
                if (result.resultCode == 0) {
                    Swal.fire({
                        title: '등록 실패',
                        text: '등록 처리에 실패되었습니다. \n다시 시도해주세요.',
                        icon: 'error',
                        confirmButtonText: '확인'
                    })
                }
                Swal.fire({
                    title: '등록 완료',
                    text: '등록되었습니다.',
                    icon: 'success',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.href = '/customer/inquiry/'+ kind + '/' + uid;
                    }
                })
            }
        } catch (Exception) {
            console.error(Exception);
        } finally {
            isModified = false;
        }
    }

    const deleteAnswer = async() => {
        Swal.fire({
            title: '게시물 삭제',
            text: '등록하신 게시물을 삭제 하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '확인',
            cancelButtonText: '취소'
        })
        .then(async (result) => {
            if (result.isConfirmed) {
                let uid = document.getElementById('uid').value;
                let data = {
                    uid: uid,
                    answer: 'delete answer'
                }
                let kind = document.getElementById('kind').value;
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
                        try {
                            const response = await fetch('/api/v1/customer/inquiry/' + kind + '-answer', {
                                method: 'PUT',
                                headers: {
                                    'Content-Type': 'application/json',
                                },
                                body: JSON.stringify(data)
                            });

                            const result = await response.json();

                            if (result) {
                                if (result.resultCode == 0) {
                                    Swal.fire({
                                        title: '삭제 실패',
                                        text: '삭체 처리에 실패되었습니다. \n다시 시도해주세요.',
                                        icon: 'error',
                                        confirmButtonText: '확인'
                                    })
                                }
                                if (result.isConfirmed) {
                                    let url = '/customer/inquiry/' + kind + '/' + uid;
                                    if (kind == '') {
                                        url = '/reading-review/inquiry' + '/' + uid;
                                    }
                                    location.href = url;
                                }
                            }
                        } catch (Exception) {
                            console.error(Exception);
                        }
                    } else {
                        isSubmitting = false;
                    }
                })
            }
        })
    }

    if(document.getElementById('deleteBtn') != undefined) {
        document.getElementById('deleteBtn').addEventListener('click', () => deleteAnswer());
    }
    function autoResize(textarea) {
        textarea.style.height = 'auto';
        let height = textarea.scrollHeight;


        if (height < 500) {
            textarea.style.height = height + 'px';
        } else {
            textarea.style.height = '500px';
        }
    }

    function goList(){
        let kind = document.getElementById('kind').value;
        let url = '/customer/inquiry/' + kind;
        if(kind == ''){
            url = '/reading-review/inquiry';
        }
        location.href = url;
    }
    function cancel(){
        let uid = document.getElementById('uid').value;
        let kind = document.getElementById('kind').value;
        let url = '/customer/inquiry/' + kind + '/' + uid;
        if(kind == ''){
            url = '/reading-review/inquiry/' + uid;
        }
        location.href = url;
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
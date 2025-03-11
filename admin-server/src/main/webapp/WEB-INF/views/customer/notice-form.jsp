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
                    <input type="hidden" name="uid" id="uid" value="${notice != null ? notice.uid : uid}"/>
                    <input type="hidden" name="idx" id="idx" value="${notice != null ? notice.noticeIndex : null}"/>
                    <div class="container-fluid">
                        <!-- 본문 내용 START -->
                        <form>
                            <div class="card mb-5 mb-xl-10">
                                <div class="card-header border-0 pt-5">
                                    <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                        공지사항 관리
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
                                                        <c:when test="${not empty notice}">
                                                            <c:out value="${notice.adminName}"/>(<c:out value="${notice.department}"/>)
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:out value="${account.adminName}"/>(<c:out value="${account.department}"/>)
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                        <c:if test="${notice != null}">
                                            <div class="col-lg-6 row mb-8">
                                                <div class="col-lg-2">
                                                    <label class="col-lg-10 fw-bolder text-dark pt-3">작성일시</label>
                                                </div>
                                                <div class="col-lg-10">
                                                    <div class="col-lg-12 text-dark pt-3">
                                                        <c:choose>
                                                            <c:when test="${notice.modDate ne null and notice.modDate != ''}">
                                                                <c:out value="${notice.modDate}"/>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:out value="${notice.regDate}"/>
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
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3 required">제목</label>
                                            </div>
                                            <div class="col-lg-11">
                                                <div class="col-lg-12 text-dark pt-3">
                                                    <input class="form-control" type="text" name="title" id="title" maxlength="50" value="<c:out value='${notice.title}'/>" />
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
                                                    <c:forEach items="${noticeKindType}" var="type" varStatus="status">
                                                        <c:if test="${type.getValue() != '' || status.index != 0}">
                                                            <div class="col">
                                                                <div class="form-check form-check-custom form-check-warning form-check-solid mb-3">
                                                                    <input class="form-check-input" type="checkbox" value="<c:out value="${type.getName()}"/>" id="noticeKind<c:out value="${status.index}"/>" name="noticeKind"
                                                                        <c:if test="${fn:contains(notice.noticeKind, type.getName())}">checked</c:if>
                                                                    />
                                                                    <label class="form-check-label form-label fw-bolder text-dark pt-3" for="noticeKind<c:out value="${status.index}"/>">
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
                                                    <label class="form-label fw-bolder text-dark pt-3 required">내용</label>
                                                </div>
                                            </div>

                                            <div class="col-lg-11">
                                                <textarea class="form-control form-control-solid contents"
                                                            rows="5"
                                                            id="contents"
                                                            minlength="1"
                                                            name="contents"
                                                            readonly="readonly"
                                                            placeholder="Content"><c:out value='${notice.content}'/></textarea>
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
                                                                ${empty notice || notice.isOpen == 'N'  ? 'checked' : ''}
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
                                                                    ${notice.isOpen == 'Y' ? 'checked' : ''}
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
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 ">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3 required">상단고정</label>
                                            </div>
                                            <div class="col-lg-11 pt-3 row">
                                                <div class="col-lg-3">
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                <input
                                                                    class="form-check-input"
                                                                    type="radio"
                                                                    name="isTop"
                                                                    id="isTop"
                                                                    ${empty notice || notice.isTop == 'N'  ? 'checked' : ''}
                                                                    value="N"
                                                                />
                                                                <label for="isTop" class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3">
                                                                    N
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-check form-check-custom form-check-warning form-check-solid">
                                                                <input
                                                                    class="form-check-input"
                                                                    type="radio"
                                                                    name="isTop"
                                                                    id="isTopY"
                                                                    ${notice.isTop == 'Y' ? 'checked' : ''}
                                                                    value="Y"
                                                                />
                                                                <label for="isTopY" class="form-check-label form-label fw-bolder text-dark col-lg-12 pt-3">
                                                                    Y
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-1 d-flex align-items-center">
                                                <label class="col-lg-12 form-label fw-bolder text-dark pt-3">첨부파일</label>
                                            </div>
                                            <div class="fv-row fv-plugins-icon-container col-lg-11" id="dz0Container">
                                                <!-- 파일 업로드 섹션 -->
                                                <jsp:include page="/FileFormINC" flush="false">
                                                    <jsp:param name="fileFormType" value="Y" />
                                                    <jsp:param name="isImage" value="false" />
                                                    <jsp:param name="hasOrder" value="false" />
                                                    <jsp:param name="parentTable" value="NOTICE"/>
                                                    <jsp:param name="parentIndex" value="${notice == null ? '' : notice.noticeIndex}"/>
                                                    <jsp:param name="parentUid" value="${notice == null ? uid : notice.uid}"/>
                                                    <jsp:param name="parentType" value="FILE"/>
                                                    <jsp:param name="maxFileCount" value="2"/>
                                                    <jsp:param name="isSecure" value="N"/>
                                                    <jsp:param name="DZID" value="dz0"/>
                                                    <jsp:param name="description" value="파일 크기는 300MB이하, mp3, mp4, pdf, jpg, jpeg, png, hwp, hwpx, ppt, pptx, dox, doxc, zip 형식의 파일만 가능합니다."/>
                                                </jsp:include>
                                                <!--end::Dropzone-->
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
                                                <c:when test="${not empty notice}">
                                                    <button type="button" class="btn btn-warning" style="background-color: #ffcd39; color: #181C32" id="modifyBtn">
                                                        수정
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
<script src="/assets/js/file.js"></script>
<script type="text/javascript">
    // 파일폼 변경중
    const uid = document.getElementById('uid').value;
    const noticeIndex = document.getElementById('idx').value;
    let ntdrop = [];
    let viewType = "${viewType}";

    ntdrop[0]= global.genDropzone("#dz0",
    {
        params : {
            'ParentTable' : 'NOTICE',
            'ParentUid' : uid,
            'ParentIndex' : noticeIndex,
            'ParentType' : 'FILE',
        },
        hasOrder : false,
        isSecure : 'N',
        maxFileCount : 2,
        required: 'N',
        dropzoneIdx: 'dz0',
        acceptedExt: ['.mp4', '.mp3', '.pdf', '.jpg', '.jpeg', '.png', '.hwp', '.hwpx', '.ppt', '.pptx', '.doc', '.docx', '.zip'],
        containerId : 'dz0Container',
        maxFileSize : 300,
        dropzoneIndex : 0,
        messages : {
            accept: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.',
            count: '',
            size: '* 파일용량 및 이미지 파일 유형을 다시 확인해주세요.'
        }
    });

    /***************************************************** INIT ***************************************/
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
    $('.contents').on('froalaEditor.keydown', function (e, editor, keydownEvent) {
        setMessage(document.getElementById('contents'), true);
    });
    let isSubmitting = false;
    // data 생성
    const makeData = () => {
        const checkNoticeKind = document.querySelectorAll('input[name="noticeKind"]:checked');
        let params = {
            uid: document.getElementById('uid').value,
            noticeKind: Array.from(checkNoticeKind).map((ele) => { return ele.value; }),
            title: document.getElementById('title').value,
            content: document.getElementById('contents').value,
            isOpen: document.querySelector('input[name="isOpen"]:checked').value,
            isTop: document.querySelector('input[name="isTop"]:checked').value,
        };
        return params;
    };

    const validMessage = {
        title: {elem: null, msg: ' * 제목을 입력해주세요.'},
        noticeKind: {elem: null, msg: ' * 구분을 선택해주세요.'},
        contents: {elem: null, msg: ' * 내용을 입력해주세요.'},
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
                if (name == 'noticeKind') {
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
        const title = document.getElementById('title');
        const noticeKind = document.querySelectorAll('input[name="noticeKind"]');
        const contents = document.getElementById('contents');
        let titleBol = true;
        let noticeKindBol = true;
        let contentsBol = true;
        if (!title.value) titleBol = false;
        if (!contents.value) contentsBol = false;
        if (document.querySelectorAll('input[name="noticeKind"]:checked').length < 1) {
            noticeKindBol = false;
        }

        // 메세지 세팅
        setMessage(title, titleBol);
        setMessage(noticeKind[0], noticeKindBol);
        setMessage(contents, contentsBol);

        return titleBol && noticeKindBol && contentsBol;
    }
    // 저장
    const saveNotice = async () => {
        if (isSubmitting) {
            return;
        }
        isSubmitting = true;

        // 전송 데이터 생성
        let data = makeData();
        try {
            const response = await fetch('/api/v1/customer/notice', {
                method: 'POST',
                headers: {
                'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            });

            const res = await response.json();
            // console.log(res);
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
                        title: '상단 고정 게시물은 이미 3개 모두 적용되어 있습니다.',
                        icon: 'error',
                        confirmButtonText: '확인'
                    });
                    return false;
                }
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
                    text: '등록되었습니다.',
                    icon: 'success',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.href = '/customer/notice';
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
        let uid = document.getElementById('uid').value;

        try {
            const url = '/api/v1/customer/notice/' + uid
            const response = await fetch(url, {
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
                    let message = '상단 고정 게시물은 이미 3개 모두 적용되어 있습니다.';
                    Swal.fire({
                        title: message,
                        icon: 'error',
                        confirmButtonText: '확인'
                    });
                    // 초기화가 필요하다면 주석 풀기
                    // document.querySelector('input[name="isTop"][value="N"]').checked = true;
                    return false;
                }
                Swal.fire({
                    title: '등록 완료',
                    text: '등록되었습니다.',
                    icon: 'success',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.href = '/customer/notice/' + res.uid;
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
            title: '제목을 입력해주세요.',
            content: '내용을 입력해주세요.',
            noticeKind: '구분을 선택해주세요.',
        }
        let message = '';
        const titleCheck = msg.match(new RegExp(messageChk.title, 'g'));
        if (titleCheck) {
            return titleCheck[0];
        }
        const noticeKindCheck = msg.match(new RegExp(messageChk.noticeKind, 'g'));
        if (noticeKindCheck) {
            return noticeKindCheck[0];
        }
        const contentCheck = msg.match(new RegExp(messageChk.content, 'g'));
        if (contentCheck) {
            return contentCheck[0];
        }
        return message;
    };

    const save = async () => {
        // 전송 데이터 생성
        let valid =  await validData();
        if(valid) {
            if(dropzoneCheck()) {
                uploadByDropzone(0);
            }
        }
    }
    async function saveFormData() {
        let chk = document.getElementById('idx').value;
        chk ? modify() : saveNotice();
    }
    document.getElementById('title').addEventListener('input', (evt) => {
        setMessage(evt.target, true);
    });
    document.querySelectorAll('input[name="noticeKind"]').forEach(elem => {
        elem.addEventListener('click', (evt) => {
            setMessage(evt.target, true);
        });
    });
    document.addEventListener('DOMContentLoaded', function () {
        if(document.getElementById('idx').value) {
            document.getElementById('modifyBtn').addEventListener('click', () => save());
        } else {
            document.getElementById('saveBtn').addEventListener('click', () => save());
        }
    });
    function deleteFile (element) {
        let idx = element.getAttribute('data-id');

        let replaceImageIdx = idx.replace('dropzone', 'dropzoneImage');
        const test = document.getElementById(replaceImageIdx);
        test.remove();

        test.style.display = 'none';

        let replaceIdx = idx.replace('dropzone', '');
        // console.log(idx);
        var parentElement = document.getElementById(replaceIdx);

        if (parentElement) {
            var dropzone = parentElement.querySelector('#' + idx);
            // console.log(dropzone);
            if (dropzone) {
                // 'display' 속성을 토글합니다.
                if (dropzone.style.display === 'none') {
                    dropzone.style.display = 'block';
                } else {
                    dropzone.style.display = 'none';
                }

            } else {

            }
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
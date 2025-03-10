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
                        <div class="card-body">
                            <ul class="nav nav-tabs nav-line-tabs nav-line-tabs-2x mb-5 fs-6">
                                <li class="nav-item">
                                    <a class="nav-link active fw-bolder text-dark" data-bs-toggle="tab" href="#nt_krContent">국어</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link fw-bolder text-dark" data-bs-toggle="tab" href="#nt_enContent">영어</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link fw-bolder text-dark" data-bs-toggle="tab" href="#nt_mathContent">수학</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link fw-bolder text-dark" data-bs-toggle="tab" href="#nt_societyContent">사회</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link fw-bolder text-dark" data-bs-toggle="tab" href="#nt_scienceContent">과학</a>
                                </li>
                            </ul>

                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="nt_krContent" role="tabpanel">
                                    <div class="view" style="display: ${empty list ? '' : 'none'}">
                                      <textarea class="form-control form-control-solid contents"
                                                type="text"
                                                rows="5"
                                                id="krContent"
                                                data-subject="국어"
                                                data-uid="${list[0].uid}"
                                                minlength="1"
                                                name="contents"
                                                placeholder="Content"
                                      >${list[0].content}</textarea>
                                    </div>
                                    <div class="fr-element fr-view scroll-froala" style="display: ${empty list ? 'none' : ''}; padding: 16px; border-radius:20px 20px 20px 20px ; background-clip: padding-box; border: 1px solid #E4E6EF">
                                        ${list[0].content}
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="nt_enContent" role="tabpanel">
                                    <div class="view" style="display: ${empty list ? '' : 'none'}">
                                       <textarea class="form-control form-control-solid contents"
                                                 type="text"
                                                 rows="5"
                                                 id="enContent"
                                                 data-subject="영어"
                                                 data-uid="${list[1].uid}"
                                                 minlength="1"
                                                 name="contents"
                                                 placeholder="Content"
                                       >${list[1].content}</textarea>
                                    </div>
                                    <div class="fr-element fr-view scroll-froala" style="display: ${empty list ? 'none' : ''}; padding: 16px; border-radius:20px 20px 20px 20px ; background-clip: padding-box; border: 1px solid #E4E6EF">
                                        ${list[1].content}
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="nt_mathContent" role="tabpanel">
                                    <div class="view" style="display: ${empty list ? '' : 'none'}">
                                        <textarea class="form-control form-control-solid contents"
                                                  type="text"
                                                  rows="5"
                                                  id="mathContent"
                                                  data-subject="수학"
                                                  data-uid="${list[2].uid}"
                                                  minlength="1"
                                                  name="contents"
                                                  placeholder="Content"
                                        >${list[2].content}</textarea>
                                    </div>
                                    <div class="fr-element fr-view scroll-froala" style="display: ${empty list ? 'none' : ''}; padding: 16px; border-radius:20px 20px 20px 20px ; background-clip: padding-box; border: 1px solid #E4E6EF">
                                        ${list[2].content}
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="nt_societyContent" role="tabpanel">
                                    <div class="view" style="display: ${empty list ? '' : 'none'}">
                                       <textarea class="form-control form-control-solid contents"
                                                 type="text"
                                                 rows="5"
                                                 id="societyContent"
                                                 data-subject="사회"
                                                 data-uid="${list[3].uid}"
                                                 minlength="1"
                                                 name="contents"
                                                 placeholder="Content"
                                       >${list[3].content}</textarea>
                                    </div>
                                    <div class="fr-element fr-view scroll-froala" style="display: ${empty list ? 'none' : ''}; padding: 16px; border-radius:20px 20px 20px 20px ; background-clip: padding-box; border: 1px solid #E4E6EF">
                                        ${list[3].content}
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="nt_scienceContent" role="tabpanel">
                                    <div class="view" style="display: ${empty list ? '' : 'none'}">
                                        <textarea class="form-control form-control-solid contents"
                                                  type="text"
                                                  rows="5"
                                                  id="scienceContent"
                                                  data-subject="과학"
                                                  data-uid="${list[4].uid}"
                                                  minlength="1"
                                                  name="contents"
                                                  placeholder="Content"
                                        >${list[4].content}</textarea>
                                    </div>
                                    <div class="fr-element fr-view scroll-froala" style="display: ${empty list ? 'none' : ''}; padding: 16px; border-radius:20px 20px 20px 20px ; background-clip: padding-box; border: 1px solid #E4E6EF">
                                        ${list[4].content}
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <div class="d-flex justify-content-end" data-kt-customer-table-toolbar="base">
                                <div id="modifyButton">
                                    <button
                                            type="submit"
                                            class="btn btn-m btn-warning"
                                            style="background-color: #ffcd39; color: #181C32;"
                                            onclick="modify()"
                                    >
                                        수정
                                    </button>
                                </div>
                                <div id="updateButton"  style="display: none;">
                                    <button
                                            type="button"
                                            class="btn btn-light-warning me-2"
                                            onclick="cancel()">
                                        취소
                                    </button>
                                    <button
                                            type="button"
                                            class="btn btn-warning"
                                            style="background-color: #ffcd39; color: #181C32;"
                                            onclick="selectApi(this)"
                                    >
                                        저장
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <%@ include file="/WEB-INF/views/common/inc/FooterINC.jsp" %>
        </div>
    </div>
</div>


<script type="text/javascript">
    /***************************************************** INIT ***************************************/
    let froalaKey = <%= froalaKey %>;

    $(function () {
        $('.contents').froalaEditor({
            key : froalaKey,
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

        document.querySelectorAll('.nav-link').forEach(tab => {
            tab.addEventListener('shown.bs.tab', function (event) {
                handleTabChange(event.target);
                // window.location.hash = event.target.getAttribute('href');
            });
        });

    })


    function handleTabChange(tab) {
        // 활성 탭 ID 가져오기
        const activeTabId = tab.getAttribute('href').replace('#', '');
        console.log("Active Tab ID: ", activeTabId);

        // 활성 탭 요소 가져오기
        const activeTab = document.getElementById(activeTabId);
        const view = activeTab.querySelector('.view');
        const scrollFroala = activeTab.querySelector('.scroll-froala');

        console.log(view, scrollFroala);
        view.style.display = 'none';
        scrollFroala.style.display = '';

        // 버튼 상태 설정
        const modifyButton = document.getElementById('modifyButton');
        const updateButton = document.getElementById('updateButton');
        modifyButton.style.display = 'block';
        updateButton.style.display = 'none';
    }


    /***************************************************** PUT ***************************************/

    function modify() {
        const modifyButton = document.getElementById('modifyButton');
        const updateButton = document.getElementById('updateButton');

        modifyButton.style.display = 'none';
        updateButton.style.display = 'block';

        const activeTab = document.querySelector('.tab-pane.active');
        const activeTextarea = activeTab.querySelector('textarea');
        const view = activeTab.querySelector('.view');
        const scrollFroala = activeTab.querySelector('.scroll-froala');

        if (view && scrollFroala) {
            view.style.display = '';
            scrollFroala.style.display = 'none';

        }

    }

    function cancel() {
        const modifyButton = document.getElementById('modifyButton');
        const updateButton = document.getElementById('updateButton');

        modifyButton.style.display = 'block';
        updateButton.style.display = 'none';

        const activeTab = document.querySelector('.tab-pane.active');
        const view = activeTab.querySelector('.view');
        const scrollFroala = activeTab.querySelector('.scroll-froala');

        if (view && scrollFroala) {
            view.style.display = 'none';
            scrollFroala.style.display = '';
        }

    }

    /***************************************************** UPDATE ***************************************/
    let isSubmitting = false;
    async function selectApi() {
        if (isSubmitting) {
            return;
        }
        isSubmitting = true;

        const activeTabHref = document.querySelector('.nav-link.active').getAttribute('href');
        const tabContentId = activeTabHref.replace('#nt_', '');
        const subject = document.getElementById(tabContentId).getAttribute('data-subject');
        const content = document.getElementById(tabContentId).value;
        const uid = document.getElementById(tabContentId).getAttribute('data-uid');

        if (uid) {
            updateReferenceGuide(content, subject, uid, tabContentId);
        } else {
            createReferenceGuide(content, subject, tabContentId);
        }
    }

    async function createReferenceGuide(content, subject, tabContentId) {

        let data = {
            content: content
        }

        try {
            const response = await fetch('/api/v1/reference/guide/' + subject, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            });

            const result = await response.json();
            if (result.result === false) {
                const resultData = result.message;
                if (resultData.includes("Validation error - ")) {
                    let errorMsg = resultData.split('Validation error - ')[1].replace(/\n/g, '<br>');
                    Swal.fire({
                        title : '등록 실패',
                        html : errorMsg,
                        icon : 'error',
                        confirmButtonText : '확인'
                    });
                } else  {
                    Swal.fire({
                        title: '등록 실패',
                        text: '등록 처리에 실패되었습니다. \n다시 시도해주세요.',
                        icon: 'error',
                        confirmButtonText: '확인'
                    });
                }
            } else if (result.result == true) {
                Swal.fire({
                    title: '등록 완료',
                    text: '등록되었습니다.',
                    icon: 'success',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.href = '/reference-book/guide';
                    }
                })

            }
        } catch (e) {
            console.error(e);
        } finally {
            isSubmitting = false;
        }
    }

    async function updateReferenceGuide(content, subject, uid, tabContentId) {

        let data = {
            content: content
        }


        try {
            const response = await fetch('/api/v1/reference/guide/' + subject + '/' + uid, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            });

            const result = await response.json();
            if (result.result === false) {
                const resultData = result.message;
                if (resultData.includes("Validation error - ")) {
                    let errorMsg = resultData.split('Validation error - ')[1].replace(/\n/g, '<br>');
                    Swal.fire({
                        title : '등록 실패',
                        html : errorMsg,
                        icon : 'error',
                        confirmButtonText : '확인'
                    });
                } else  {
                    Swal.fire({
                        title: '등록 실패',
                        text: '등록 처리에 실패되었습니다. \n다시 시도해주세요.',
                        icon: 'error',
                        confirmButtonText: '확인'
                    });
                }
            } else if (result.result == true) {
                Swal.fire({
                    title: '등록 완료',
                    text: '등록되었습니다.',
                    icon: 'success',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = '/reference-book/guide';
                        // location.href = '/reference-book/guide';
                    }
                })

            }
        } catch (e) {
            console.error(e);
        } finally {
            isSubmitting = false;
        }
    }


</script>

</body>
</html>

<style>
    .nav-tabs .nav-item {
        width: 20%;
        text-align: center;
    }

    .nav-tabs .nav-link {
        display: block;
        padding: 12px 15px;
        font-size: 1.5rem;
        border: 1px solid #ddd;
        background-color: #fff;
        margin-right: 2px;
    }

    .nav-tabs .nav-link.active {
        background-color: #ffa;
        border-color: #f90;
    }

    .scroll-froala{
        display: block; /* 이 부분은 상황에 맞게 조정 */
        max-height: 700px; /* 최대 높이 설정 */
        overflow-y: auto; /* 세로 스크롤바 설정 */
    }

</style>

<%@ page import="java.util.ResourceBundle" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="ko">
<head>

<body id="kt_body" class="header-fixed header-tablet-and-mobile-fixed toolbar-enabled toolbar-fixed toolbar-tablet-and-mobile-fixed aside-enabled aside-fixed" style="--kt-toolbar-height:55px;--kt-toolbar-height-tablet-and-mobile:55px">
<div class="d-flex flex-column flex-root">
    <div class="page d-flex flex-row flex-column-fluid">

        <div class="wrapper d-flex flex-column flex-row-fluid">

            <div class="content d-flex flex-column flex-column-fluid">

                <div class="post d-flex flex-column-fluid">
                    <input type="hidden" name="uid" id="uid" value="${list.uid}"/>
                    <div class="container-fluid">
                        <!-- 본문 내용 START -->
                        <div class="card mb-5 mb-xl-10">
                            <div class="card-header border-0 pt-5">
                                <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                    교과서 등록
                                </div>
                            </div>
                            <div class="card-body">
                                <!-- 북코드 섹션 -->
                                <div class="row mb-8">
                                    <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3">북코드</label>
                                    </div>
                                    <div class="col-lg-11" id="showIsBookCodeY">
                                        <div class="row">
                                            <div class="col-lg-3">
                                                <div class="row">
                                                    <div class="col-lg-4 form-label text-dark pt-3">코드번호</div>
                                                    <div class="col-lg-8 form-label text-primary pt-3">
                                                        <c:out value="${list.bookCode}"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="row">
                                                    <div class="col-lg-2 form-label text-dark pt-3">북코드명</div>
                                                    <div class="col-lg-9 form-label text-primary pt-3">
                                                        <c:out value="${list.bookCodeName}"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 제품코드 섹션 -->
                                <div class="row mb-8">
                                    <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3">제품코드</label>
                                    </div>
                                    <div class="col-lg-11" id="showIsProductCodeY">
                                        <div class="row">
                                            <div class="col-lg-3">
                                                <div class="row pt-2">
                                                    <div class="col-lg-4 form-label text-dark pt-3">코드번호</div>
                                                    <div class="col-lg-8 form-label text-primary pt-3">
                                                        <c:out value="${list.productCode}"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="row pt-2">
                                                    <div class="col-lg-2">
                                                        <div class="row">
                                                            <div class="col-lg-6 form-label text-dark pt-3">판매여부</div>
                                                            <div class="col-lg-6 form-label text-primary pt-3">
                                                                <c:out value="${list.isSale}"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-5">
                                                        <div class="row">
                                                            <div class="col-lg-3 form-label text-dark pt-3">판매일시</div>
                                                            <div class="col-lg-9 form-label text-primary pt-3">
                                                                <c:out value="${list.saleDay} ~ ${list.saleEndDay}"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <div class="row">
                                                            <div class="col-lg-7 form-label text-dark pt-3">재고현황</div>
                                                            <div class="col-lg-5 form-label text-primary pt-3">
                                                                <c:out value="${list.stockCount} 권"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="row">
                                                            <div class="col-lg-5 form-label text-dark pt-3">금액</div>
                                                            <div class="col-lg-7 form-label text-primary pt-3">
                                                                <c:out value="${list.price} 원"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 학급 섹션 -->
                                <div class="row mb-8">
                                    <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                        <label class="col-lg-12 form-label fw-bolder text-dark">학급</label>
                                    </div>

                                    <div class="col-lg-11">
                                        <div class="row">
                                            <div class="col-lg-3">
                                                <div class="row">
                                                    <div class="col-lg-4 form-label text-dark ">
                                                        <c:out value="${list.school}"/>
                                                    </div>
                                                    <div class="col-lg-8">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="row">
                                                    <div class="col-lg-5">
                                                        <div class="row">
                                                            <div class="col-lg-3 form-label text-dark ">
                                                                <label class="col-lg-10 form-label fw-bolder text-dark d-flex align-items-center justify-content-start">과목</label>
                                                            </div>
                                                            <div class="col-lg-9">
                                                                <c:out value="${list.subject}"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 학년 섹션 -->
                                <div class="row mb-8">
                                    <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                        <label class="col-lg-12 form-label fw-bolder text-dark">학년</label>
                                    </div>

                                    <div class="col-lg-11">
                                        <div class="row">
                                            <div class="col-lg-3">
                                                <div class="row">
                                                    <div class="col-lg-4 form-label text-dark">
                                                        <c:out value="${list.grade}"/>
                                                    </div>
                                                    <div class="col-lg-8">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="row">
                                                    <div class="col-lg-5">
                                                        <div class="row">
                                                            <div class="col-lg-3 form-label text-dark ">
                                                                <label class="col-lg-10 form-label fw-bolder text-dark d-flex align-items-center justify-content-start">학기</label>
                                                            </div>
                                                            <div class="col-lg-9">
                                                                <c:out value="${list.semester}"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>



                                </div>
                                <!-- 시리즈코드 섹션 -->
                                <div class="row mb-8">
                                    <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3">시리즈코드</label>
                                    </div>
                                    <div class="col-lg-11">
                                        <div class="row">
                                            <div class="col-lg-3">
                                                <div class="row">
                                                    <div class="col-lg-4 form-label text-dark pt-3">코드번호</div>
                                                    <div class="col-lg-8 form-label text-primary pt-3">
                                                        <c:out value="${list.seriesCode}"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="row">
                                                    <div class="col-lg-5">
                                                        <div class="row">
                                                            <div class="col-lg-3 form-label text-dark pt-3">시리즈명</div>
                                                            <div class="col-lg-9 form-label text-primary pt-3">
                                                                <c:out value="${list.seriesCodeName}"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-5">
                                                        <div class="row">
                                                            <div class="col-lg-5 d-flex align-items-center justify-content-start">
                                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3 d-flex align-items-center justify-content-start">년도</label>
                                                            </div>
                                                            <div class="col-lg-7">
                                                                <div class="form-label text-dark pt-3">
                                                                    <c:out value="${list.year}"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                </div>
                                <!-- 개정 교육과정 섹션 -->
                                <div class="row mb-8">
                                    <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required-check">개정 교육과정</label>
                                    </div>
                                    <div class="col-lg-10" id="showIsRevisionCurriculumY">
                                        <div class="col-lg-4">
                                            <div class="col-lg-12 form-label text-dark pt-3">
                                                <c:out value="${list.revisionCurriculum} 개정 교육과정"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 명 섹션 -->
                                <div class="row mb-8">
                                    <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required-check">교과서명</label>
                                    </div>
                                    <div class="col-lg-10" id="showIsTextBookTitleY">
                                        <div class="col-lg-12 form-label text-dark pt-3">
                                            <c:out value="${list.textbookTitle}"/>
                                        </div>
                                    </div>
                                </div>

                                <!-- 섬네일 섹션 -->
                                <div class="row mb-8" id="floatingBanner">
                                    <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required-check">섬네일</label>
                                    </div>
                                    <div class="fv-row fv-plugins-icon-container flex-column col-lg-10" id="thumbnailFile">

                                    </div>
                                </div>

                                <!-- 집필진 정보 섹션 -->
                                <div class="row mb-8">
                                    <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required-check">집필진 정보</label>
                                    </div>
                                    <div class="col-lg-10" id="showIsAuthorY">
                                        <div class="col-lg-12 form-label text-dark pt-3">
                                            <c:out value="${list.author}"/>
                                        </div>
                                    </div>

                                </div>

                                <!-- 사이즈 섹션 -->
                                <div class="row mb-8">
                                    <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required-check">사이즈</label>
                                    </div>
                                    <div class="col-lg-4 pt-3" id="showIsWidthY">
                                        <div class="row">
                                            <div class="col-lg-2 form-label text-dark pt-1">
                                                <c:out value="${list.width}"/>
                                            </div>
                                            <label class="col-lg-1 d-flex align-items-center justify-content-center">
                                                <i class="fas bi-asterisk me-2 d-flex align-items-center justify-content-center pb-3"></i>
                                            </label>
                                            <div class="col-lg-4 form-label text-dark pt-1">
                                                <c:out value="${list.height}"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                        <label class="col-lg-10 form-label fw-bolder text-dark pt-3 d-flex align-items-center justify-content-center required-check">색도</label>
                                    </div>
                                    <div class="col-lg-3 pt-2" id="showIsChromacityY">
                                        <div class="col-lg-4 form-label text-dark pt-1">
                                            <c:out value="${list.chromacity} 도"/>
                                        </div>
                                    </div>
                                </div>

                                <!-- 쪽수 섹션 -->
                                <div class="row mb-8">
                                    <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required-check">쪽수</label>
                                    </div>
                                    <div class="col-lg-6 pt-3" id="showIsTotalPageY">
                                        <div class="col-lg-4 form-label text-dark">
                                            <c:out value="${list.totalPage} 쪽"/>
                                        </div>
                                    </div>
                                </div>
                                <!-- 미리보기 섹션 -->
                                <div class="row mb-8">
                                    <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3">미리보기</label>
                                    </div>
                                    <div class="col-lg-10" id="showIsPreviewUrlY" style="display: ${(not empty list && list.previewUrl ne '') ? 'block' : 'none'}">
                                        <c:if test="${not empty list.previewUrl}">
                                            <a class="col-lg-12 form-label text-dark pt-3" href="${list.previewUrl}" target="_blank">
                                                <c:out value="URL 경로 : ${list.previewUrl}"/>
                                            </a>
                                        </c:if>
                                    </div>
                                    <div class="col-lg-10" id="showIsPreviewUrlN" style="display: ${(not empty list && list.previewUrl eq '') ? 'block' : 'none'}">
                                        <div class="row">
                                            <div id="pdf" class="col-lg-12 form-label text-dark flex-column" style="display: ${list.previewUrl eq '' ? 'block' : 'none'}">

                                                <span class="base-input__error" id="pdfError"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- 티솔루션 상세 링크 섹션 -->
                                <div class="row mb-8">
                                    <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3">티솔루션 상세<br/> 링크</label>
                                    </div>
                                    <div class="col-lg-10" id="showIsTsolUrlY">
                                        <c:if test="${not empty list.tsolUrl}">
                                            <a class="col-lg-12 form-label text-dark pt-3" href="${list.tsolUrl}" target="_blank">
                                                <c:out value="URL 경로 : ${list.tsolUrl}"/>
                                            </a>
                                        </c:if>
                                    </div>
                                </div>

                                <!-- 노출여부 섹션 -->
                                <div class="row mb-8">
                                    <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required-check">노출여부</label>
                                    </div>
                                    <div class="col-lg-7" id="showIsOpenY">
                                        <div class="${list.isOpen eq 'N' ? 'col-lg-12 form-label text-primary pt-3' : 'col-lg-12 form-label text-danger pt-3'}">
                                            <c:out value="${list.isOpen eq 'N' ? 'N' : 'Y'}"/>
                                        </div>
                                    </div>
                                </div>

                                <!-- 인트로 노출여부 섹션 -->
                                <div class="row mb-8">
                                    <div class="col-lg-1 d-flex align-items-center justify-content-center">
                                        <label class="col-lg-12 form-label fw-bolder text-dark pt-3 required-check">인트로 노출여부</label>
                                    </div>
                                    <div class="col-lg-7" id="showIsIntroY">
                                        <div class="${list.isIntro eq 'N' ? 'col-lg-12 form-label text-primary pt-3' : 'col-lg-12 form-label text-danger pt-3'}">
                                            <c:out value="${list.isIntro eq 'N' ? 'N' : 'Y'}"/>
                                        </div>
                                    </div>
                                    <div type="hidden" id="isOpen" value="${list.isOpen}"/>
                                </div>
                            </div>
                        </div>
                    </div>


                        <!-- 본문 내용 END -->
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="modalLayout" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered mw-900px" id="modalContent">

    </div>
</div>

<div id="loadingBar" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5); z-index: 1000;">
    <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
        <div class="loader"></div>
        <p style="color: white; text-align: center;">탐색중...</p>
    </div>
</div>

<div id="modalLoading" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5); z-index: 1000;">
    <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
        <div class="loader"></div>
        <p style="color: white; text-align: center;">창 띄우는중...</p>
    </div>
</div>

</body>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>

<script type="text/javascript">
    let isSubmitting = false;
    async function deleteTextBook(element) {
        if (isSubmitting) {
            return;
        }
        isSubmitting = true;

        const isOpen = document.getElementById('isOpen').value;

        if (isOpen === 'Y') {
            Swal.fire({
                title: '삭제 불가',
                text: '공개된 교과서는 삭제할 수 없습니다.',
                icon: 'error',
                confirmButtonText: '확인'
            });
            isSubmitting = false;
            return;
        } else {
            // 탈퇴 처리 전에 사용자에게 확인 요청
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
                    let idx = element.getAttribute('data-idx');
                    let uid = element.getAttribute('data-uid');
                    try {
                        const response = await fetch('/api/v1/textbook/' + idx + '/' + uid, {
                            method: 'DELETE',
                            headers: {
                                'Content-Type': 'application/json',
                            }
                        });

                        const result = await response.json();

                        if (result.result == true) {
                            Swal.fire({
                                title: '삭제 처리 완료',
                                text: '삭제 처리가 완료되었습니다.',
                                icon: 'success',
                                confirmButtonText: '확인'
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    location.href = '/textbook/textbook-list';
                                }
                            })
                        } else {
                            Swal.fire({
                                title: '삭제 실패',
                                text: '삭체 처리에 실패되었습니다. \n다시 시도해주세요.',
                                icon: 'error',
                                confirmButtonText: '확인'
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    location.reload();
                                }
                            })
                        }

                    } catch (Exception) {
                        console.error(Exception);
                    } finally {
                        isSubmitting = false;
                    }
                } else {
                    isSubmitting = false;
                }
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


    .loader {
        border: 16px solid #f3f3f3; /* Light grey */
        border-top: 16px solid #ffff00; /* Yellow */
        border-radius: 50%;
        width: 120px;
        height: 120px;
        animation: spin 2s linear infinite;
    }

    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }

    .scroll-froala{
        display: block; /* 이 부분은 상황에 맞게 조정 */
        max-height: 700px; /* 최대 높이 설정 */
        overflow-y: auto; /* 세로 스크롤바 설정 */
    }

    .select2-selection.select2-selection--single.form-select.form-select-solid.unselect-form .select2-selection__rendered .select2-selection__placeholder {
        color: #5E6278;
        font: 14.3px Poppins, Helvetica, "sans-serif";
    }

    .base-input__error {
        display: none; /* 기본적으로는 보이지 않도록 설정 */
        color: #e74c3c; /* 에러 메시지 색상 */
        font-size: 1rem; /* 에러 메시지 폰트 크기 */
        margin-top: 0.25rem; /* 입력 필드와의 간격 */
        font-weight: bold; /* 글자를 더 굵게 */
        text-shadow: 0.5px 0.5px 0.5px rgba(0, 0, 0, 0.1); /* 약간의 그림자를 추가하여 선명하게 */
        text-align: left; /* 좌측 정렬 */
    }


    .input-error {
        border-color: #e74c3c; /* 입력 필드 에러 시 테두리 색상 */
    }

    /* 에러 메시지를 보이게 하는 클래스 */
    .show-error {
        display: block;
    }

    .select2-selection.input-error {
        border: 1px solid #e74c3c !important; /* 선택된 값의 테두리 색상 */
    }

    select2-selection.select2-selection--single.form-select.form-select-solid.unselect-form.input-error {
        border-color: #e74c3c !important; /* 선택된 값의 테두리 색상 */
    }
    /* select2의 커스터마이즈된 div 요소에 대한 스타일링 */
    .select2-container--default .select2-selection--single.input-error {

    }

    .select2-container--default .select2-selection--multiple.input-error {
        border-color: #e74c3c !important; /* 다중 선택의 테두리 색상 */
    }


    /* Placeholder 스타일 변경 */
    #detailTitle3::placeholder {
        color: #5E6278; /* 원하는 색상 코드 */
        font-family: 'Poppins', Helvetica, "sans-serif"; /* 원하는 폰트 */
        font-size: 14.3px; /* 원하는 폰트 크기 */
    }

    /* Placeholder 스타일 변경 */
    #detailTitle2::placeholder {
        color: #5E6278; /* 원하는 색상 코드 */
        font-family: 'Poppins', Helvetica, "sans-serif"; /* 원하는 폰트 */
        font-size: 14.3px; /* 원하는 폰트 크기 */
    }


    /* Placeholder 스타일 변경 */
    #detailTitle1::placeholder {
        color: #5E6278; /* 원하는 색상 코드 */
        font-family: 'Poppins', Helvetica, "sans-serif"; /* 원하는 폰트 */
        font-size: 14.3px; /* 원하는 폰트 크기 */
    }

    /* Froala 전체 에디터의 너비 확장 */
    .fr-box, .fr-wrapper {
        width: 100%; /* 전체 화면에 맞추기 */
        max-width: 1500px; /* 원하는 최대 너비 설정 */

    }


    .fr-view {
        max-width: 820px; /* 콘텐츠 가로 길이 제한 */
        margin: 0 auto; /* 가운데 정렬 */
    }



</style>
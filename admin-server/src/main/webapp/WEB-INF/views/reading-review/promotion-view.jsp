<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nt" uri="tld/NTUtil.tld" %>
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
                        <form id="promotionForm" >
                            <div class="card mb-5 mb-xl-10">
                                <div class="card-header border-0 pt-5">
                                    <div class="text-gray-900 fs-2 me-1 form-label fw-bolder text-dark">
                                        기본정보
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="row mb-12">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-2 d-flex justify-content-center align-items-center">
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3 ">상태</label>
                                            </div>
                                            <div class="col-lg-10 row">

                                                <label id="promotionStatus" class="col-lg-9 form-label fw-bolder text-dark pt-3 ">${list.promotionStatus}</label>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-12">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-2 d-flex justify-content-center align-items-center">
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3 ">구분</label>
                                            </div>
                                            <div class="col-lg-10 row">

                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3 ">${list.promotionCategory}</label>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-14">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-2 d-flex justify-content-center align-items-center">
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3 ">유형</label>
                                            </div>

                                            <div class="col-lg-10 row">
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3 ">${list.promotionType}</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-12">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-2 d-flex justify-content-center align-items-center">
                                                <!-- 상위 라벨 "배너 이미지" -->
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3 ">프로모션 금액</label>
                                            </div>
                                            <div class="col-lg-10">
                                                <c:if test="${list.promotionType eq '기본형' || list.promotionType eq '기본형 + 프리미엄형'}">
                                                    <div class="row mb-12" id="basicPriceSection">
                                                        <div class="col-lg-12 d-flex align-items-center">
                                                            <c:set var="basicOriginalPrice" value="${list.basicOriginalPrice}" />
                                                            <c:set var="basicDiscountPrice" value="${list.basicDiscountPrice}" />
                                                            <c:set var="basicTotalPrice" value="${basicOriginalPrice - basicDiscountPrice}" />


                                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                                <label class="col-lg-10 form-label fw-bolder text-dark ">기본형</label>
                                                            </div>
                                                            <div class="col-lg-11">
                                                                정가
                                                                <label class="fw-bolder text-dark">
                                                                    <fmt:formatNumber value="${list.basicOriginalPrice}" type="number" groupingUsed="true" />
                                                                </label>
                                                                 원 - 할인금액
                                                                <label class="fw-bolder text-danger">
                                                                    <fmt:formatNumber value="${list.basicDiscountPrice}" type="number" groupingUsed="true" />
                                                                </label> 원 = <span id="basicSubscriptionPrice">정기구독가
                                                                <label class="fw-bolder text-primary">
                                                                    <fmt:formatNumber value="${basicTotalPrice}" type="number" groupingUsed="true" />
                                                                </label> 원</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                                <c:if test="${list.promotionCategory eq '전환' || list.promotionType eq '프리미엄형' || list.promotionType eq '기본형 + 프리미엄형'}">
                                                    <div class="row mb-12" id="premiumPriceSection">
                                                        <div class="col-lg-12 d-flex align-items-center">
                                                            <c:set var="premiumOriginalPrice" value="${list.premiumOriginalPrice}" />
                                                            <c:set var="premiumDiscountPrice" value="${list.premiumDiscountPrice}" />
                                                            <c:set var="premiumTotalPrice" value="${premiumOriginalPrice - premiumDiscountPrice}" />


                                                            <div class="col-lg-1 d-flex justify-content-center align-items-center">
                                                                <label class="col-lg-10 form-label fw-bolder text-dark ">프리미엄</label>
                                                            </div>
                                                            <div class="col-lg-11">
                                                                정가
                                                                <label class="fw-bolder text-dark">
                                                                        <fmt:formatNumber value="${list.premiumOriginalPrice}" type="number" groupingUsed="true" />
                                                                </label>
                                                                원 - 할인금액
                                                                <label class="fw-bolder text-danger">
                                                                        <fmt:formatNumber value="${list.premiumDiscountPrice}" type="number" groupingUsed="true" />
                                                                </label>
                                                                원 = <span id="premiumSubscriptionPrice">정기구독가
                                                               <label class="fw-bolder text-primary">
                                                                    <fmt:formatNumber value="${premiumTotalPrice}" type="number" groupingUsed="true" />
                                                                </label> 원</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-2 d-flex justify-content-center align-items-center">
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3">프로모션 기간</label>
                                            </div>
                                            <div class="col-lg-10 d-flex align-items-center">
                                                <span class="form-label fw-bolder text-dark pt-3">시작일시</span>
                                                <label class="form-label fw-bolder text-dark pt-3 mx-2">${list.promotionStartDate}</label>
                                                <span class="form-label fw-bolder text-dark pt-3 mx-2">~</span>
                                                <span class="form-label fw-bolder text-dark pt-3">종료일시</span>
                                                <label class="form-label fw-bolder text-dark pt-3 mx-2">${list.promotionEndDate}</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-2 d-flex justify-content-center align-items-center">
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3">프로모션명</label>
                                            </div>
                                            <div class="col-lg-10" id="showIsTsolUrlN">
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3">${list.promotionName}</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-2 d-flex justify-content-center align-items-center">
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3">프로모션 URL</label>
                                            </div>
                                            <div class="col-lg-10 row">
                                                <label id="urlId" class="col-lg-9 form-label fw-bolder text-dark pt-3" onclick="checkUrl()">/reading-review/promotion/${list.urlId}<c:if test="${list.promotionCategory eq '전환' or list.promotionCategory eq '연장'}">/promotion-subscription-view</c:if><c:if test="${list.promotionCategory eq '신규' or list.promotionCategory eq '신규 + 연장'}">/promotion-step1</c:if>
                                                </label>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-2 d-flex justify-content-center align-items-center">
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3">사용여부</label>
                                            </div>
                                            <div class="col-lg-10 row">
                                                <label class="col-lg-9 form-label fw-bolder text-dark pt-3">${list.isUse}</label>
                                            </div>

                                        </div>
                                    </div>
                                </div>



                            </div>

                            <div class="card mb-5 mb-xl-10">
                                <div class="card-body">
                                    <div class="row mb-8">
                                        <div class="col-lg-6 row">
                                            <div class="col-lg-4  d-flex align-items-center">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3">최초 작성자</label>
                                            </div>

                                            <div class="col-lg-8">
                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                    <c:out value="${list.adminName}(${list.adminDepartment})"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 row">
                                            <div class="col-lg-4  d-flex align-items-center">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3">최초 작성일시</label>
                                            </div>

                                            <div class="col-lg-8">
                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                    <c:out value="${list.regDate}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-lg-6 row">
                                            <div class="col-lg-4  d-flex align-items-center">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3">수정자</label>
                                            </div>

                                            <div class="col-lg-8">
                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                    <c:out value="${list.modAdminName}(${list.modAdminDepartment})"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 row">
                                            <div class="col-lg-4  d-flex align-items-center">
                                                <label class="col-lg-10 form-label fw-bolder text-dark pt-3">작성일시</label>
                                            </div>

                                            <div class="col-lg-8">
                                                <div class="col-lg-12 form-label text-dark pt-3">
                                                    <c:out value="${list.modDate}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-footer" id="footerIdx">
                                    <div class="row" id="modifyButton">
                                        <div class="col-3">
                                            <a type="button" class="btn btn-light-dark" style="background-color: #343a40; color: #FFFFFF" href="/reading-review/promotion?page=${reqParam.page}&perPage=${reqParam.perPage}&sdate=${reqParam.sdate}&edate=${reqParam.edate}&clazz=${reqParam.clazz}&subject=${reqParam.subject}&grade=${reqParam.grade}&semester=${reqParam.semester}&isOpen=${reqParam.isOpen}&isIntro=${reqParam.isIntro}&searchKey=${reqParam.searchKey}&search=${reqParam.search}">목록</a>
                                        </div>
                                        <div  class="col-9 d-flex justify-content-end">
                                            <button
                                                    data-uid="${list.uid}"
                                                    data-idx = "${list.readingReviewPromotionIndex}"
                                                    type="button"
                                                    id="deleteBtn"
                                                    class="btn btn-light-warning me-2"
                                                    <c:if test="${list.isUse eq 'Y'}">
                                                        disabled
                                                        style="background-color: #3F4254; color: #FFFFFF"
                                                    </c:if>
                                                    <c:if test="${list.isUse eq 'N'}">
                                                        style="background-color: #fff3cd; color: #181C32"
                                                    </c:if>
                                                    onclick="deletePromotion(this)">
                                                삭제
                                            </button>
                                            <a type="button" class="btn btn-light-warning" style="background-color: #ffcd39; color: #181C32" href="/reading-review/promotion-mod-form/${list.uid}">
                                                수정
                                            </a>
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

    let isSubmit = false;

    async function deletePromotion(el) {
        if (isSubmit) {
            return;
        }

        isSubmit = true;

        const uid = el.getAttribute('data-uid');

        Swal.fire({
            title: '삭제 확인',
            text: '등록하신 게시물을 삭제 하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: '확인',
            cancelButtonText: '취소'
        }).then(async (result) => {
            if (result.isConfirmed) {
                try {
                    const response = await fetch('/api/v1/reading-review/promotion/' + uid, {
                        method: 'DELETE',
                        headers: {
                            'Content-Type': 'application/json',
                            'Accept': 'application/json',
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
                                location.href = '/reading-review/promotion';
                            }
                        })
                    } else {
                        Swal.fire({
                            title: '삭제 실패',
                            text: '삭제 처리에 실패하였습니다. 다시 시도해주세요.',
                            icon: 'error',
                            confirmButtonText: '확인'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                location.reload();
                            }
                        })
                    }
                } catch (e) {
                    console.error(e);
                } finally {
                    isSubmit = false;
                }
            } else {
                isSubmit = false;
            }
        });
    }

    function checkUrl() {
        if (isSubmit) {
            return;
        }

        isSubmit = true;

        const promotionStatus = document.getElementById('promotionStatus').innerText;

        console.log(promotionStatus);

        if (promotionStatus === '진행중') {
            const urlId = document.getElementById('urlId').innerText;

            console.log(urlId)
            isSubmit = false;
            window.open('https://www.jihak.co.kr' + urlId, '_blank');
        } else if (promotionStatus === '종료') {
            isSubmit = false;
            Swal.fire({
                title: 'URL 이동',
                text: '해당 프로모션은 종료된 상태로 확인 불가합니다.',
                icon: 'info',
                confirmButtonText: '확인'
            });
        } else if (promotionStatus === '진행전') {
            isSubmit = false;
            Swal.fire({
                title: 'URL 이동',
                text: '해당 프로모션은 진행전으로 확인 불가합니다.',
                icon: 'info',
                confirmButtonText: '확인'
            });
        }
    }

</script>
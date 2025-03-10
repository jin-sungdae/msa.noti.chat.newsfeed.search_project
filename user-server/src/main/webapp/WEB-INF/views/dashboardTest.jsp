<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/@metronic_8/theme/dist/assets/css/style.bundle.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.jsdelivr.net/npm/@metronic_8/theme/dist/assets/plugins/global/plugins.bundle.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@metronic_8/theme/dist/assets/js/scripts.bundle.js"></script>
    <style>
        .custom-card {
            background-color: #ffcd39;
            border: none;
        }
        .custom-card .card-title {
            font-size: 1.25rem;
            font-weight: 500;
            margin-bottom: 0.5rem;
        }
        .custom-card .card-body {
            font-size: 1.5rem;
            font-weight: bold;
        }
        .custom-card .card-footer {
            font-size: 1rem;
            font-weight: 400;
        }
    </style>
</head>
<body id="kt_body" class="header-fixed header-tablet-and-mobile-fixed toolbar-enabled toolbar-fixed toolbar-tablet-and-mobile-fixed aside-enabled aside-fixed">

<!--begin::Container-->
<div class="d-flex flex-column flex-root">
    <!--begin::Page-->
    <div class="page d-flex flex-row flex-column-fluid">
        <!--begin::Wrapper-->
        <div class="wrapper d-flex flex-column flex-row-fluid" id="kt_wrapper">
            <!--begin::Content-->
            <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
                <!--begin::Post-->
                <div class="post d-flex flex-column-fluid" id="kt_post">
                    <!--begin::Container-->
                    <div class="container-xxl" id="kt_content_container">
                        <!--begin::Search-->
                        <div class="card mb-5">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="startDate" placeholder="2023-11-01">
                                            <input type="text" class="form-control" id="endDate" placeholder="2023-12-01">
                                            <button class="btn btn-warning">검색</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--end::Search-->

                        <!--begin::Stats-->
                        <div class="row g-5 g-xl-8">
                            <div class="col-xl-3">
                                <div class="card custom-card">
                                    <div class="card-body">
                                        <h3 class="card-title">회원가입 현황</h3>
                                        <p class="card-body">222,596</p>
                                        <p class="card-footer">Day 18 Week 384 Month 1,869</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3">
                                <div class="card custom-card">
                                    <div class="card-body">
                                        <h3 class="card-title">로그인 현황</h3>
                                        <p class="card-body">222,596</p>
                                        <p class="card-footer">Day 18 Week 384 Month 1,869</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3">
                                <div class="card custom-card">
                                    <div class="card-body">
                                        <h3 class="card-title">제품문의 현황</h3>
                                        <p class="card-body">222,596</p>
                                        <p class="card-footer">Day 18 Week 384 Month 1,869</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3">
                                <div class="card custom-card">
                                    <div class="card-body">
                                        <h3 class="card-title">교사인증 현황</h3>
                                        <p class="card-body">승인완료 861</p>
                                        <p class="card-footer">대기 18 검토중 4 완료 19 반려 20</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--end::Stats-->

                        <!--begin::Graphs-->
                        <div class="row g-5 g-xl-8">
                            <div class="col-xl-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h3 class="card-title">문의 현황</h3>
                                    </div>
                                    <div class="card-body">
                                        <canvas id="inquiryChart" class="h-300px"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--end::Graphs-->

                        <!--begin::Approval Status-->
                        <div class="row g-5 g-xl-8 mt-5">
                            <div class="col-xl-6">
                                <div class="card">
                                    <div class="card-header">
                                        <h3 class="card-title">견본신청 현황</h3>
                                    </div>
                                    <div class="card-body">
                                        <ul class="list-group">
                                            <li class="list-group-item">신청대기 18</li>
                                            <li class="list-group-item">발송 50</li>
                                            <li class="list-group-item">취소 19</li>
                                            <li class="list-group-item">취소요청 20</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card">
                                    <div class="card-header">
                                        <h3 class="card-title">신청 내역</h3>
                                    </div>
                                    <div class="card-body">
                                        <ul class="list-group">
                                            <li class="list-group-item">[2023] 견본 문제집 환송 [2023.11.18]</li>
                                            <li class="list-group-item">[2023] 견본 문제집 환송 [2023.11.18]</li>
                                            <li class="list-group-item">[2023] 견본 문제집 환송 [2023.11.18]</li>
                                            <li class="list-group-item">[2023] 견본 문제집 환송 [2023.11.18]</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--end::Approval Status-->

                    </div>
                    <!--end::Container-->
                </div>
                <!--end::Post-->
            </div>
            <!--end::Content-->
        </div>
        <!--end::Wrapper-->
    </div>
    <!--end::Page-->
</div>
<!--end::Container-->

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Initialize datepickers
        flatpickr('#startDate', { locale: 'ko' });
        flatpickr('#endDate', { locale: 'ko' });

        // Initialize Chart.js for inquiryChart
        const ctx = document.getElementById('inquiryChart').getContext('2d');
        const inquiryChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['교과서의', '참고서의', '부교재의', '이벤트의', '웹사이트의'],
                datasets: [{
                    label: '문의 수',
                    data: [30, 20, 60, 5, 1],
                    backgroundColor: '#ffcd39'
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    });
</script>
</body>
</html>
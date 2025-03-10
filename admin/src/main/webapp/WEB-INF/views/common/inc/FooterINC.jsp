<%@ page import="com.jihaksa.admin.environment.dto.Setting" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--begin::Footer-->
<%@ page session="true" %>
<%
    Setting setting = (Setting) request.getSession().getAttribute("setting");
    String isUseLifetime = setting.getIsUseLifetime();
	String lifeTime = "Y".equals(isUseLifetime) ? setting.getLifetime() : null;
%>

<div class="footer py-4 d-flex flex-lg-column" id="kt_footer">
    <!--begin::Container-->
    <div class="container-fluid d-flex justify-content-center">
        <!--begin::Copyright-->
        <div class="text-dark text-center">
            <span class="text-muted fw-bold me-1">COPYTRIGHT©2024</span>
            <a href="" target="_blank" class="text-gray-800 text-hover-warning">JIHAKSA PUBLISHING CO .LTD. ALL RIGHT RESERVED</a>
        </div>
        <!--end::Copyright-->
    </div>
    <!--end::Container-->
</div>
<!--end::Footer-->
<script type="text/javascript">
    let settingTime = <%= lifeTime %>;
    document.addEventListener('DOMContentLoaded', function () {
        let time = settingTime ? settingTime : 24 * 60
        startSessionCountdown(time*60);
    });

    const setCookie = (cookieName, value, exdays) => {
        let exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        let cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
        document.cookie = cookieName + "=" + cookieValue;
    }

    const startSessionCountdown = (timeout) => {
        const startTime = new Date().getTime();
        const endTime = startTime + timeout * 1000;

        setCookie('sessionEndTime', endTime, 1);

        function updateTimer() {
            const currentTime = new Date().getTime();
            const remainingTime = Math.max(0, (endTime - currentTime) / 1000);

            if (remainingTime <= 0) {
                clearInterval(tt);
                Swal.fire({
                   title: '세션이 만료되었습니다.<br /> 다시 로그인 후 시도해 주세요.',
                   icon: 'error',
                   confirmButtonText: '확인'
                }).then(async (result) => {
                    if (result.isConfirmed) {
                        window.location.href = '/logout'
                    }
                })
                return false;
            }
        }

        const tt = setInterval(updateTimer, 1000);
    }
</script>
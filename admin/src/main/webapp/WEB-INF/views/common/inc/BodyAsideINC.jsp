<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--begin::Aside-->
<div id="kt_aside" class="aside aside-dark aside-hoverable" data-kt-drawer="true" data-kt-drawer-name="aside"
     data-kt-drawer-activate="{default: true, lg: false}" data-kt-drawer-overlay="true"
     data-kt-drawer-width="{default:'200px', '300px': '250px'}" data-kt-drawer-direction="start"
     data-kt-drawer-toggle="#kt_aside_mobile_toggle">
    <!--begin::Brand-->
    <div class="aside-logo flex-column-auto" id="kt_aside_logo">
        <!--begin::Logo-->
        <a href="/">
            <%--            <img src="/assets/images/logos/logo-1.svg"/>--%>
            <img src="/assets/images/logos/logo_지학사_dark.svg" width="143" height="26"/>
        </a>
        <!--end::Logo-->
        <!--begin::Aside toggler-->
        <div id="kt_aside_toggle" class="btn btn-icon w-auto px-0 btn-active-color-primary aside-toggle"
             data-kt-toggle="true" data-kt-toggle-state="active" data-kt-toggle-target="body"
             data-kt-toggle-name="aside-minimize">
            <!--begin::Svg Icon | path: icons/duotone/Navigation/Angle-double-left.svg-->
            <span class="svg-icon svg-icon-1 rotate-180">
				<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                     width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
					<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
						<polygon points="0 0 24 0 24 24 0 24"/>
						<path
                            d="M5.29288961,6.70710318 C4.90236532,6.31657888 4.90236532,5.68341391 5.29288961,5.29288961 C5.68341391,4.90236532 6.31657888,4.90236532 6.70710318,5.29288961 L12.7071032,11.2928896 C13.0856821,11.6714686 13.0989277,12.281055 12.7371505,12.675721 L7.23715054,18.675721 C6.86395813,19.08284 6.23139076,19.1103429 5.82427177,18.7371505 C5.41715278,18.3639581 5.38964985,17.7313908 5.76284226,17.3242718 L10.6158586,12.0300721 L5.29288961,6.70710318 Z"
                            fill="#000000" fill-rule="nonzero"
                            transform="translate(8.999997, 11.999999) scale(-1, 1) translate(-8.999997, -11.999999)"/>
						<path
                            d="M10.7071009,15.7071068 C10.3165766,16.0976311 9.68341162,16.0976311 9.29288733,15.7071068 C8.90236304,15.3165825 8.90236304,14.6834175 9.29288733,14.2928932 L15.2928873,8.29289322 C15.6714663,7.91431428 16.2810527,7.90106866 16.6757187,8.26284586 L22.6757187,13.7628459 C23.0828377,14.1360383 23.1103407,14.7686056 22.7371482,15.1757246 C22.3639558,15.5828436 21.7313885,15.6103465 21.3242695,15.2371541 L16.0300699,10.3841378 L10.7071009,15.7071068 Z"
                            fill="#000000" fill-rule="nonzero" opacity="0.5"
                            transform="translate(15.999997, 11.999999) scale(-1, 1) rotate(-270.000000) translate(-15.999997, -11.999999)"/>
					</g>
				</svg>
			</span>
            <!--end::Svg Icon-->
        </div>
        <!--end::Aside toggler-->
    </div>
    <!--end::Brand-->
    <!--begin::Aside menu-->
    <div class="aside-menu flex-column-fluid">
        <div class="hover-scroll-overlay-y my-5 my-lg-5" id="kt_aside_menu_wrapper" data-kt-scroll="true"
             data-kt-scroll-activate="{default: false, lg: true}" data-kt-scroll-height="auto"
             data-kt-scroll-dependencies="#kt_aside_logo, #kt_aside_footer" data-kt-scroll-wrappers="#kt_aside_menu"
             data-kt-scroll-offset="0">
            <div
                class="menu menu-column menu-title-gray-800 menu-state-title-primary menu-state-icon-primary menu-state-bullet-primary menu-arrow-gray-500"
                id="#kt_aside_menu" data-kt-menu="true">
                <!--begin::Menu-->
                <c:forEach items="${LEFT_LIST}" var="leftMenu" varStatus="status">
                    <c:choose>
                        <c:when test="${leftMenu.depth == '2' && LEFT_LIST[status.index + 1].depth != '3'}">
                        <div class="menu-item">
                            <a class="menu-link <c:if test="${leftMenu.url == PAGE_INFO.url }">active</c:if>"
                               href="<c:out value="${leftMenu.url }"/>">
                                <span class="menu-icon">
                                       <i class="las bi-${leftMenu.icon} fs-2"></i>
                                </span>
                                <span class="menu-title"><c:out value="${leftMenu.menuName }"/></span>
                            </a>
                        </c:when>

                        <c:when test="${leftMenu.depth == '2' && LEFT_LIST[status.index + 1].depth == '3'}">
                        <div data-kt-menu-trigger="click"
                             class="menu-item menu-accordion <c:if test="${leftMenu.menuIndex == PAGE_INFO.parentIndex }">hover show</c:if>">
                            <span class="menu-link">
                                <span class="menu-icon">
                                   <i class="las bi-${leftMenu.icon} fs-2"></i>
                                </span>
                                <span class="menu-title"><c:out value="${leftMenu.menuName }"/></span>
                                <span class="menu-arrow"></span>
                            </span>
                        </c:when>

                        <c:when test="${leftMenu.depth == '3'}">
                            <c:if test="${LEFT_LIST[status.index - 1].depth == '2'}">
                            <div class="menu-sub menu-sub-accordion menu-active-bg" kt-hidden-height="80" style="">
                            </c:if>
                                <div class="menu-item menu-accordion">
                                    <a href="<c:out value="${leftMenu.url }"/>">
                                        <span class="menu-link <c:if test="${leftMenu.url == PAGE_INFO.url }">active</c:if>">
                                            <span class="menu-bullet">
                                                <span class="bullet bullet-dot"></span>
                                            </span>
                                            <span class="menu-title"><c:out value="${leftMenu.menuName }"/></span>
                                        </span>
                                    </a>

                            <c:choose>
                                <c:when test="${status.last}">
                                </div>
                            </div>
                                </c:when>
                                <c:when test="${LEFT_LIST[status.index + 1].depth != '3'}">
                                </div>
                            </div>
                                </c:when>
                                <c:when test="${LEFT_LIST[status.index + 1].depth == '3'}">
                                </div>
                                </c:when>
                            </c:choose>
                        </c:when>
                    </c:choose>
                    <c:choose>
                        <c:when test="${ (leftMenu.depth == '3' && LEFT_LIST[status.index + 1].depth != '3' && LEFT_LIST[status.index + 1].depth != '1' ) || (leftMenu.depth == '2' && LEFT_LIST[status.index + 1].depth != '3' && LEFT_LIST[status.index + 1].depth != '1' ) || status.last}">
                        </div>
                        </c:when>
                    </c:choose>
                </c:forEach>
                <!--end::Menu-->
            </div>
        </div>
        <!--begin::Footer-->
        <div class="aside-footer flex-column-auto pt-5 pb-7 px-5" id="kt_aside_footer">
        </div>
        <!--end::Footer-->
    </div>
    <!--end::Aside menu-->
</div>
<!--end::Aside-->
<style>
    .aside-dark .menu .menu-item .menu-link:hover:not(.disabled):not(.active) .menu-title {
        color: #ffd800;
    }


    .aside-dark .menu .menu-item.hover > .menu-link:not(.disabled):not(.active) .menu-icon i, .aside-dark .menu .menu-item .menu-link:hover:not(.disabled):not(.active) .menu-icon i {
        color: #ffd800; !important;
    }

    .aside-dark .menu .menu-item .menu-link.active .menu-icon i {
        color: #ffd800; !important;
    }
</style>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!--begin::Toolbar-->
<div class="base-modal modal main-popup small" id="popupModal">
    <input type="hidden" id="popupId" value="${param.popupId}">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header type02">
                <h1 id="noticePopupTitle" class="modal-title">${noticePopupTitle}</h1>
                <i class="base-icon icon-modal-close closePopup" role="button" data-bs-dismiss="modal"></i>
            </div>
            <div class="modal-body type02">
                <div class="swiper popup-swiper">
                    <div class="swiper-wrapper" style="height: 300px;">
                        <c:forEach items="${noticePopup}" var="popup" varStatus="status">
                            <input type="hidden" class="noticePopupTitle${status.index}" value="${popup.title}">
                            <div class="swiper-slide">
                                <a href="${popup.linkUrl}" target="${popup.linkType}">
                                    <img src="${uploadUrl}${popup.filePath}" alt="메인 팝업 이미지" style="height: 100%; object-fit: contain">
                                </a>
                            </div>
                        </c:forEach>
                    </div>

                    <c:if test="${not empty noticePopup}">
                        <c:set value="${fn:length(noticePopup)}" var="noticePopupLength"/>
                        <c:if test="${noticePopupLength gt 1}">
                            <div class="modal-body__paging">
                                <i class="base-icon w20 icon-allow-prev"></i>
                                <div class="swiper-pagination"></div>
                                <i class="base-icon w20 icon-allow-next"></i>
                            </div>
                        </c:if>
                    </c:if>
                </div>
            </div>
            <div class="modal-footer">
                <div class="footer__left">
                    <label class="base-checkbox">
                    </label>
                </div>
                <div class="footer__right">
                    <span class="right__close closePopup" role="button" data-bs-dismiss="modal">닫기</span>
                </div>
            </div>
        </div>
    </div>
</div>
<script>


</script>
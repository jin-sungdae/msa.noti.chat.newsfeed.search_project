<%@ page pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${param.totalCount > 0}">
    <fmt:parseNumber var="currentPage" type="number" value="${param.currentPage}" />
    <fmt:parseNumber var="totalPage" type="number" value="${param.totalPage}" />
<div class="pt-3 d-flex justify-content-center">
    <ul class="pagination" id="pagination">
        <li class="page-item previous <c:if test="${currentPage <= 1}">disabled</c:if>">
            <a href="javascript:;"
               class="page-link"
               data-taget="firstPage"
               onclick="${param.listFunction}(1)">
                <<
            </a>
        </li>

        <li class="page-item previous <c:if test="${currentPage <= 1}">disabled</c:if>">
            <a href="javascript:;"
               class="page-link"
               onclick="${param.listFunction}('${currentPage - 1}')">
                <i class="previous"> </i>
            </a>
        </li>

        <c:forEach
                var="i"
                begin="${param.startOfPageBlock}"
                end="${param.endOfPageBlock}"
                step="1" >
            <li class="page-item <c:if test="${i eq currentPage}">active</c:if>">
                <a href="javascript:;"
                   onclick="${param.listFunction}('${i}')"
                   class="page-link">
                        ${i}
                </a>
            </li>
        </c:forEach>

        <li class="page-item next <c:if test="${currentPage >= totalPage}">disabled</c:if>">
            <a href="javascript:;"
               onclick="${param.listFunction}('${currentPage + 1}')"
               class="page-link" >
                <i class="next"> </i>
            </a>
        </li>

        <li class="page-item next <c:if test="${currentPage >= totalPage}">disabled</c:if>">
            <a href="javascript:;"
               class="page-link"
               data-taget="lastPage"
               onclick="${param.listFunction}('${totalPage}')">
                >>
            </a>
        </li>
    </ul>
</div>
</c:if>
<style>
    .page-item.active .page-link {
        background-color: #ffd800;
        border-color: #ffd800;
    }

</style>
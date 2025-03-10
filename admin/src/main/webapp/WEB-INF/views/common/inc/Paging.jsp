<%@ page pageEncoding="UTF-8" language="java" %>

<div class="pt-3 d-flex justify-content-center">
    <ul class="pagination" id="pagination">
        <li class="page-item previous <c:if test="${page.currentPage <= 1}">disabled</c:if>">
            <a href="javascript:;"
               class="page-link"
               data-taget="firstPage"
               onclick="changePage(1)">
                <<
            </a>
        </li>

        <li class="page-item previous <c:if test="${page.currentPage <= 1}">disabled</c:if>">
            <a href="javascript:;"
               class="page-link"
               onclick="changePage('${page.currentPage - 1}')">
                <i class="previous"> </i>
            </a>
        </li>

        <c:forEach
                var="i"
                begin="${page.startOfPageBlock}"
                end="${page.endOfPageBlock}"
                step="1" >
            <li class="page-item <c:if test="${i eq page.currentPage}">active</c:if>">
                <a href="javascript:;"
                   onclick="changePage('${i}')"
                   class="page-link">
                        ${i}
                </a>
            </li>
        </c:forEach>

        <li class="page-item next <c:if test="${page.currentPage >= page.totalPage}">disabled</c:if>">
            <a href="javascript:;"
               onclick="changePage('${page.currentPage + 1}')"
               class="page-link" >
                <i class="next"> </i>
            </a>
        </li>

        <li class="page-item next <c:if test="${page.currentPage >= page.totalPage}">disabled</c:if>">
            <a href="javascript:;"
               class="page-link"
               data-taget="lastPage"
               onclick="changePage('${page.totalPage}')">
                >>
            </a>
        </li>
    </ul>
</div>

<style>
    .page-item.active .page-link {
        background-color: #ffd800;
        border-color: #ffd800;
    }

</style>
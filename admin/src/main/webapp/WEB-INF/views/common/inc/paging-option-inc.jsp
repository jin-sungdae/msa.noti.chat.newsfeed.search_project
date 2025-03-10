<%@ page pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
    레코드 수와 페이징 옵션을 선택하는 인클루드용 페이지
    @param  totalCount      전체 레코드 수
    @param  pageListSize    페이지 당 목록 수
    @param  listFunction    페이지 목록 옵션 변경 시 호출 함수명
--%>
<div class="card-title" data-nt-name="pageOptionComponent">
    <div class="row">
        <div class="col-5 d-flex align-items-center justify-content-between">
            <h3 class="col-lg-12 fs-4 fw-bold mt-3 mb-3" style="flex-grow: 1; min-width: 0; white-space: nowrap;">총 <span class="fw-bolder">${param.totalCount}</span> 개</h3>
        </div>
        <div class="col-7">
            <select
                    class="form-select"
                    data-control="select2"
                    data-hide-search="true"
                    onchange="${param.function}(this.value)"
                    style="margin-left: 10px;"
            >

                <option
                        value="10"
                        <c:if test="${param.pageListSize eq 10}">
                            selected
                        </c:if>>
                    10
                </option>
                <option
                        value="30"
                        <c:if test="${empty param.pageListSize || param.pageListSize eq '30'}">
                            selected
                        </c:if>>
                    30
                </option>
                <option
                        value="50"
                        <c:if test="${param.pageListSize eq '50'}">
                            selected
                        </c:if>>
                    50
                </option>
            </select>
        </div>
    </div>
</div>
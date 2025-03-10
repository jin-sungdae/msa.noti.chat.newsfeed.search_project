<%@ page pageEncoding="UTF-8" language="java" %>

<div class="card-title">
    <div class="row d-flex align-items-center justify-content-between">
        <div class="col d-flex align-items-center justify-content-between">
            <h3 class="fs-6 fw-bold mt-3 mb-3" style="flex-grow: 1; min-width: 0; white-space: nowrap;">총 <span class="fw-bolder">${listNum}</span> 개</h3>
        </div>
        <div class="col">
            <select
                    id="perPage"
                    name="perPage"
                    class="form-select"
                    data-control="select2"
                    data-hide-search="true"
                    onchange="fetchUserList()"
                    style="margin-left: 10px;"
            >

                <option
                        value="10"
                        <c:if test="${param.perPage eq '10'}">
                            selected
                        </c:if>>
                    10
                </option>
                <option
                        value="30"
                        <c:if test="${empty param.perPage || param.perPage eq '30'}">
                            selected
                        </c:if>>
                    30
                </option>
                <option
                        value="50"
                        <c:if test="${param.perPage eq '50'}">
                            selected
                        </c:if>>
                    50
                </option>
            </select>
        </div>
    </div>
</div>
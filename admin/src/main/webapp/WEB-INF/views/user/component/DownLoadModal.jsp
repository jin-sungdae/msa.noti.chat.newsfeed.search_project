<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<body>
<div class="modal-content">
  <div class="modal-header" id="modal_new_menu_header">
    <h2>사유 입력</h2>
    <div class="btn btn-sm btn-icon btn-active-color-primary" data-bs-dismiss="modal">
      <i class="bi bi-x"></i>
    </div>
  </div>
  <div class="modal-body">
    <div class="scroll-y me-n7 pe-7">
      <div class="row mb-5 d-flex align-items-center">
        <div class="col-2">
          <label class="fs-5 fw-bold mb-2">
            다운로드 사유
            <div id="downloadRequestError" class="text-danger"></div>
          </label>
        </div>
        <div class="col-10 fv-row">
          <input
                  class="form-control form-control-solid"
                  type="text"
                  id="downloadRequest"/>
        </div>
      </div>
    </div>
  </div>
  <div class="modal-footer d-flex justify-content-end">
    <button class="btn btn-primary btn-m align-center"
            type="button"
            id="ok"
            onclick="inputDownload()"
    >
      확인
    </button>
    <button class="btn btn-dark btn-m align-center"
            type="button"
            id="remove"
            onclick="cancel()">
      취소
    </button>
  </div>
</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
  <%@ include file="/WEB-INF/views/common/inc/PageHeaderINC.jsp" %>
</head>
<body>
<jsp:include page="/FileFormINC" flush="false">
  <jsp:param name="isImage" value="false" />
  <jsp:param name="hasOrder" value="false" />
  <jsp:param name="parentTable" value="product"/>
  <jsp:param name="parentIndex" value="${product == null ?uid:product.productIndex}"/>
  <jsp:param name="parentUid" value="${product == null ?uid:product.uid}"/>
  <jsp:param name="parentType" value="product"/>
  <jsp:param name="maxFileCount" value="1"/>
  <jsp:param name="isSecure" value="N"/>
  <jsp:param name="DZID" value="dz1"/>
</jsp:include>
<!--end::Dropzone-->
<script type="text/javascript">
  var ntdrop = [];
  ntdrop[0]= global.genDropzone("#dz1",
          {params:{'ParentTable':'product', 'ParentUid':'${product == null ?uid:product.uid}',  'ParentIndex':'${product == null ?'':product.productIndex}','ParentType': 'product'}, hasOrder:false, isSecure:'N', maxFileCount:1});
</script>
</body>
</html>

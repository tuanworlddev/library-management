<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  String uri = request.getRequestURL().toString();
  System.out.println("Current URI: " + uri);
%>
<div class="p-3">
  <a href="dashboard" class="d-flex align-items-center gap-3 text-decoration-none px-3 py-2 mb-2 <%= uri.contains("dashboard") ? "bg-primary text-white rounded" : "" %>">
    <i class="fa-solid fa-gauge"></i>
    <span>Tổng Quan</span>
  </a>
  <a href="muonsach" class="d-flex align-items-center gap-3 text-decoration-none px-3 py-2 mb-2 <%= uri.contains("muonsach") ? "bg-primary text-white rounded" : "" %>">
    <i class="fa-solid fa-plus"></i>
    <span>Thêm Khách Hàng</span>
  </a>
  <a href="timkiem" class="d-flex align-items-center gap-3 text-decoration-none px-3 py-2 mb-2 <%= uri.contains("timkiem") ? "bg-primary text-white rounded" : "" %>">
    <i class="fa-solid fa-search"></i>
    <span>Tìm Khách Hàng</span>
  </a>
  <a href="sachs" class="d-flex align-items-center gap-3 text-decoration-none px-3 py-2 mb-2 <%= uri.contains("sachs") ? "bg-primary text-white rounded" : "" %>">
    <i class="fa-solid fa-book"></i>
    <span>Sách</span>
  </a>
</div>

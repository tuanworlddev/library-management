<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="container my-4">
    <div class="card shadow-sm">
        <div class="card-body">
            <h2 class="card-title mb-4">Tìm kiếm thông tin mượn sách</h2>

            <!-- Form tìm kiếm -->
            <form action="${pageContext.request.contextPath}/timkiem" method="get" class="row g-2 mb-4">
                <div class="col-md-9">
                    <input type="text" name="keyword" class="form-control" placeholder="Nhập tên hoặc mã khách hàng" required />
                </div>
                <div class="col-md-3 d-grid">
                    <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                </div>
            </form>

            <!-- Bảng kết quả -->
            <c:if test="${not empty danhSachKhachHang}">
                <div class="table-responsive">
                    <table class="table table-border table-striped align-middle">
                        <thead class="text-center">
                        <tr>
                            <th rowspan="2" class="align-middle">Mã KH</th>
                            <th rowspan="2" class="align-middle">Họ tên</th>
                            <th rowspan="2" class="align-middle">SĐT</th>
                            <th rowspan="2" class="align-middle">Giới tính</th>
                            <th rowspan="2" class="align-middle">Loại KH</th>
                            <th colspan="4">Thông tin mượn sách</th>
                        </tr>
                        <tr class="text-center">
                            <th>Tên sách</th>
                            <th>Ngày mượn</th>
                            <th>Hạn trả</th>
                            <th>Xem chi tiết</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="kh" items="${danhSachKhachHang}">
                            <c:set var="rowspan" value="${fn:length(kh.muonTraSachs) > 0 ? fn:length(kh.muonTraSachs) : 1}" />
                            <c:choose>
                                <c:when test="${not empty kh.muonTraSachs}">
                                    <c:forEach var="m" items="${kh.muonTraSachs}" varStatus="loop">
                                        <tr>
                                            <c:if test="${loop.first}">
                                                <td rowspan="${rowspan}" class="text-center align-middle">${kh.maKH}</td>
                                                <td rowspan="${rowspan}" class="align-middle">${kh.tenKH}</td>
                                                <td rowspan="${rowspan}" class="text-center align-middle">${kh.soDT}</td>
                                                <td rowspan="${rowspan}" class="text-center align-middle">${kh.gioiTinh}</td>
                                                <td rowspan="${rowspan}" class="align-middle">${kh.loaiKhachHang.tenLoaiKH}</td>
                                            </c:if>
                                            <td>${m.sach.tenSach}</td>
                                            <td class="text-center"><fmt:formatDate value="${m.ngayMuon}" pattern="dd/MM/yyyy"/></td>
                                            <td class="text-center"><fmt:formatDate value="${m.hanTra}" pattern="dd/MM/yyyy"/></td>
                                            <td class="text-center">
                                                <a href="${pageContext.request.contextPath}/muontrasach/chitiet?maMT=${m.maMuon}" title="Xem chi tiết">
                                                    <i class="fa-regular fa-eye"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td class="text-center">${kh.maKH}</td>
                                        <td>${kh.tenKH}</td>
                                        <td class="text-center">${kh.soDT}</td>
                                        <td class="text-center">${kh.gioiTinh}</td>
                                        <td>${kh.loaiKhachHang.tenLoaiKH}</td>
                                        <td colspan="4" class="text-center fst-italic text-muted">Chưa mượn sách nào</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>

            <c:if test="${empty danhSachKhachHang and daTimKiem}">
                <div class="alert alert-warning text-center" role="alert">
                    Không tìm thấy khách hàng phù hợp.
                </div>
            </c:if>
        </div>
    </div>
</div>

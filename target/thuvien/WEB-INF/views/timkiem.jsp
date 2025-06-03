<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<title>Tìm kiếm</title>
<body>
<div class="container">
    <div class="form-container">
        <h2>Tìm kiếm thông tin mượn sách</h2>
        <form action="${pageContext.request.contextPath}/timkiem" method="get" class="form-group">
            <input type="text" name="keyword" placeholder="Nhập tên hoặc mã khách hàng" required/>
            <input type="submit" value="Tìm kiếm"/>
        </form>

        <c:if test="${not empty danhSachKhachHang}">
            <div>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th rowspan="2">Mã KH</th>
                        <th rowspan="2">Họ tên</th>
                        <th rowspan="2">SĐT</th>
                        <th rowspan="2">Giới tính</th>
                        <th rowspan="2">Loại KH</th>
                        <th colspan="4">Thông tin mượn sách</th>
                    </tr>
                    <tr>
                        <th>Tên sách</th>
                        <th>Ngày mượn</th>
                        <th>Hạn trả</th>
                        <th>Xem chi tiết</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="kh" items="${danhSachKhachHang}">
                        <c:set var="rowspan"
                               value="${fn:length(kh.muonTraSachs) > 0 ? fn:length(kh.muonTraSachs) : 1}"/>

                        <c:choose>
                            <c:when test="${not empty kh.muonTraSachs}">
                                <c:forEach var="m" items="${kh.muonTraSachs}" varStatus="loop">
                                    <tr>
                                        <c:if test="${loop.first}">
                                            <td rowspan="${rowspan}">${kh.maKH}</td>
                                            <td rowspan="${rowspan}">${kh.tenKH}</td>
                                            <td rowspan="${rowspan}">${kh.soDT}</td>
                                            <td rowspan="${rowspan}">${kh.gioiTinh}</td>
                                            <td rowspan="${rowspan}">${kh.loaiKhachHang.tenLoaiKH}</td>
                                        </c:if>
                                        <td>${m.sach.tenSach}</td>
                                        <td><fmt:formatDate value="${m.ngayMuon}" pattern="dd/MM/yyyy"/></td>
                                        <td><fmt:formatDate value="${m.hanTra}" pattern="dd/MM/yyyy"/></td>
                                        <td style="text-align: center;">
                                            <a href="${pageContext.request.contextPath}/muontrasach/chitiet?maMT=${m.maMuon}"
                                               title="Xem chi tiết">
                                                <img src="${pageContext.request.contextPath}/resources/icons/a1.png"
                                                     width="24" height="24"/>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>

                            <c:otherwise>
                                <tr>
                                    <td>${kh.maKH}</td>
                                    <td>${kh.tenKH}</td>
                                    <td>${kh.soDT}</td>
                                    <td>${kh.gioiTinh}</td>
                                    <td>${kh.loaiKhachHang.tenLoaiKH}</td>
                                    <td colspan="4" style="text-align: center;">Chưa mượn sách nào</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>

                    </tbody>
                </table>
            </div>

        </c:if>

        <c:if test="${empty danhSachKhachHang and daTimKiem}">
            <p class="error">Không tìm thấy khách hàng phù hợp.</p>
        </c:if>
    </div>
</div>
</body>
</html>
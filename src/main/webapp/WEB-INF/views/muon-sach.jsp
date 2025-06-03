<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="container my-4 p-4 border rounded shadow-sm bg-white" style="max-width: 700px;">
    <h2 class="mb-4">Thêm Khách Hàng Mượn Sách</h2>

    <c:if test="${param.success}">
        <div class="alert alert-success" role="alert">
            Thêm khách hàng thành công!
        </div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="alert alert-danger" role="alert">
                ${error}
        </div>
    </c:if>

    <form:form method="post" accept-charset="UTF-8" action="muonsach" modelAttribute="khachHangForm">

        <h4 class="mb-3">Thông tin khách hàng</h4>

        <div class="mb-3 row align-items-center">
            <label for="maKH" class="col-sm-4 col-form-label">Mã Khách Hàng:</label>
            <div class="col-sm-5">
                <form:input path="khachHang.maKH" id="maKH" cssClass="form-control" />
                <form:errors path="khachHang.maKH" cssClass="text-danger" />
            </div>
            <div class="col-sm-3">
                <button type="button" class="btn btn-outline-primary w-100" onclick="kiemTraKhachHang()">Kiểm tra</button>
            </div>
        </div>

        <div class="mb-3">
            <label for="khachHang.tenKH" class="form-label">Họ Tên:</label>
            <form:input path="khachHang.tenKH" id="khachHang.tenKH" placeholder="Lê Văn A" cssClass="form-control" />
            <form:errors path="khachHang.tenKH" cssClass="text-danger" />
        </div>

        <div class="mb-3 row">
            <div class="col">
                <label for="khachHang.tuoi" class="form-label">Tuổi:</label>
                <form:input path="khachHang.tuoi" id="khachHang.tuoi" placeholder="18" cssClass="form-control" />
                <form:errors path="khachHang.tuoi" cssClass="text-danger" />
            </div>
            <div class="col">
                <label for="khachHang.soDT" class="form-label">Số Điện Thoại:</label>
                <form:input path="khachHang.soDT" id="khachHang.soDT" placeholder="0312345678" cssClass="form-control" />
                <form:errors path="khachHang.soDT" cssClass="text-danger" />
            </div>
        </div>

        <div class="mb-3">
            <label for="khachHang.diaChi" class="form-label">Địa Chỉ (Số nhà, Phường, Quận, Thành Phố):</label>
            <form:input path="khachHang.diaChi" id="khachHang.diaChi" placeholder="12 Ngô Quyền, Hòa Quý, Đà Nẵng" cssClass="form-control" />
            <form:errors path="khachHang.diaChi" cssClass="text-danger" />
        </div>

        <div class="mb-3 row">
            <div class="col">
                <label for="khachHang.gioiTinh" class="form-label">Giới Tính (Nam/Nữ):</label>
                <form:input path="khachHang.gioiTinh" id="khachHang.gioiTinh" placeholder="Nam" cssClass="form-control" />
                <form:errors path="khachHang.gioiTinh" cssClass="text-danger" />
            </div>
            <div class="col">
                <label for="khachHang.ghiChu" class="form-label">Ghi Chú:</label>
                <form:input path="khachHang.ghiChu" id="khachHang.ghiChu" placeholder="abc" cssClass="form-control" />
            </div>
        </div>

        <div class="mb-4">
            <label for="maLoaiKH" class="form-label">Loại Khách Hàng <span class="text-danger">*</span>:</label>
            <form:select path="maLoaiKH" cssClass="form-select" id="maLoaiKH" required="true">
                <form:option value="" label="-- Chọn Loại Khách Hàng --" />
                <form:options items="${loaiKhachHangs}" itemValue="maLoaiKH" itemLabel="tenLoaiKH" />
            </form:select>
            <form:errors path="maLoaiKH" cssClass="text-danger" />
        </div>

        <h4 class="mb-3">Thông tin mượn sách</h4>

        <div class="mb-3">
            <label for="muonTraSach.sach.maSach" class="form-label">Mã Sách <span class="text-danger">*</span>:</label>
            <form:select path="muonTraSach.sach.maSach" cssClass="form-select" id="muonTraSach.sach.maSach" required="true">
                <form:option value="" label="-- Chọn Sách --" />
                <form:options items="${dsSach}" itemValue="maSach" itemLabel="tenSach" />
            </form:select>
            <form:errors path="muonTraSach.sach.maSach" cssClass="text-danger" />
        </div>

        <div class="mb-3 row">
            <div class="col">
                <label for="ngayMuon" class="form-label">Ngày Mượn (yyyy-MM-dd):</label>
                <form:input path="muonTraSach.ngayMuon" id="ngayMuon" type="date" cssClass="form-control" />
                <form:errors path="muonTraSach.ngayMuon" cssClass="text-danger" />
            </div>
            <div class="col">
                <label for="hanTra" class="form-label">Hạn Trả Sách (yyyy-MM-dd):</label>
                <form:input path="muonTraSach.hanTra" id="hanTra" type="date" cssClass="form-control" />
                <form:errors path="muonTraSach.hanTra" cssClass="text-danger" />
            </div>
        </div>

        <div class="mb-4">
            <label for="muonTraSach.ghiChu" class="form-label">Ghi Chú:</label>
            <form:input path="muonTraSach.ghiChu" id="muonTraSach.ghiChu" placeholder="Giỏi" cssClass="form-control" />
        </div>

        <div class="mb-3">
            <button type="submit" class="btn btn-primary w-100">Thêm Khách Hàng</button>
        </div>

    </form:form>
</div>

<script>
    function kiemTraKhachHang() {
        const maKH = document.getElementById("maKH").value;
        const contextPath = window.location.pathname.split("/")[1];
        fetch("/" + contextPath + "/api/khachhang?maKH=" + maKH)
            .then(res => {
                if (!res.ok) throw new Error("Không tìm thấy khách hàng.");
                return res.json();
            })
            .then(data => {
                document.getElementById("khachHang.tenKH").value = data.tenKH;
                document.getElementById("khachHang.tuoi").value = data.tuoi;
                document.getElementById("khachHang.soDT").value = data.soDT;
                document.getElementById("khachHang.diaChi").value = data.diaChi;
                document.getElementById("khachHang.gioiTinh").value = data.gioiTinh;
                document.getElementById("khachHang.ghiChu").value = data.ghiChu;
                document.getElementById("maLoaiKH").value = data.loaiKhachHang.maLoaiKH;
            })
            .catch(err => alert(err.message));
    }
</script>


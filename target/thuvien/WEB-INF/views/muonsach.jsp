<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <title>Mượn Sách</title>
</head>
<body>
    <div class="form-container">
        <h2>Thêm Khách Hàng Mượn Sách</h2>

        <c:if test="${param.success}">
            <div class="success">Thêm khách hàng thành công!</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>






        <form:form method="post" accept-charset="UTF-8" action="muonsach" modelAttribute="khachHangForm">
            <h3>Thông tin khách hàng</h3>
           <div class="form-group">
           <form:input path="khachHang.maKH" id="maKH" cssClass="form-control"/>
    <label for="khachHang.maKH">Mã Khách Hàng:</label>

    <button type="button" onclick="kiemTraKhachHang()">Kiểm tra</button>
</div>

            <div class="form-group">
            <form:input path="khachHang.tenKH" id="khachHang.tenKH" placeholder=" Lê Văn A " />
                <label for="khachHang.tenKH">Họ Tên:</label>
                <form:errors path="khachHang.maKH" cssClass="error"/>

            </div>
            <div class="form-group">
            <form:input path="khachHang.tuoi" id="khachHang.tuoi"  placeholder=" 18"  />

                <label for="khachHang.tuoi">Tuổi:</label>
                   </div>
            <div class="form-group">
            <form:input path="khachHang.soDT" id="khachHang.soDT" placeholder=" 0312345678 " />
                <label for="khachHang.soDT">Số Điện Thoại:</label>

            </div>
            <div class="form-group">
            <form:input path="khachHang.diaChi" id="khachHang.diaChi" placeholder=" 12 Ngô Quyền, Hòa Quý, Đà Nẵng"  />
                <label for="khachHang.diaChi">Địa Chỉ ( Số nhà, Phường, Quận, Thành Phố):                                    </label>

            </div>
            <div class="form-group">
            <form:input path="khachHang.ghiChu" id="khachHang.ghiChu" placeholder="abc"  />
                <label for="khachHang.ghiChu">Ghi Chú:                                    </label>

            </div>
             <div class="form-group">
            <form:input path="khachHang.gioiTinh" id="khachHang.gioiTinh" placeholder=" Nam"  />
                <label for="khachHang.gioiTinh">Giới Tính ( Nam/Nữ):                                    </label>

            </div>
            <div class="form-group">
            <form:select path="maLoaiKH" required="true">
                <form:option value="" label=" " />
                <form:options items="${loaiKhachHangs}" itemValue="maLoaiKH" itemLabel="tenLoaiKH" />
            </form:select>
            <label>Loại Khách Hàng (*):</label>
        </div>

            <h3>Thông tin mượn sách</h3>


           <div class="form-group">

    <form:select path="muonTraSach.sach.maSach"  required="true">
         <form:option value="" label=" " />
        <form:options items="${dsSach}" itemValue="maSach" itemLabel="tenSach"/>
    </form:select>
     <label>Mã Sách (*):</label>
</div>

            <div class="form-group">
    <form:input path="muonTraSach.ngayMuon" id="ngayMuon" type="date" class="form-control" />
    <label for="ngayMuon">Ngày Mượn (yyyy-MM-dd):</label>
</div>

<div class="form-group">
    <form:input path="muonTraSach.hanTra" id="hanTra" type="date" class="form-control" />
    <label for="hanTra">Hạn Trả Sách (yyyy-MM-dd):</label>
</div>

            <div class="form-group">
             <form:input path="muonTraSach.ghiChu" id="muonTraSach.ghiChu" placeholder=" Giỏi "/>
                <label for="muonTraSach.ghiChu">Ghi Chu:</label>

            </div>
            <div class="form-group">
                <input type="submit" value="Thêm Khách Hàng" />
            </div>
        </form:form>



    </div>
</body>
</html>


<script>
$(document).ready(function() {
    var formInputs = $('input[type="text"], input[type="email"], input[type="password"], select');

    formInputs.focus(function() {
        $(this).parent().find('label').addClass('formTop');
    });

    formInputs.blur(function() {
        if ($.trim($(this).val()).length === 0) {
            $(this).parent().find('label').removeClass('formTop');
        }
    });

    $('label').click(function() {
        $(this).parent().find('input, select').focus();
    });
});
</script>
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


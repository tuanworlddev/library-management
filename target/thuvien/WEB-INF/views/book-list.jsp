<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="p-3">
    <div class="d-flex justify-content-between align-items-center border-bottom">
        <h2 style="text-align: center;">Danh sách sách</h2>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal-add-book">
            <i class="fa-solid fa-plus"></i>
            Thêm
        </button>
    </div>

    <div class="row g-3 my-3">
        <c:forEach var="book" items="${books}">
            <div class="col-sm-6 col-md-4 col-lg-3 col-xl-2">
                <div class="card shadow h-100">
                    <img class="card-img-top object-fit-cover"
                         style="aspect-ratio: 1/1; height: auto;"
                         src="${book.anhSach}"
                         alt="${book.tenSach}"
                         onerror="this.onerror=null; this.src='https://res.cloudinary.com/dfvw2zxji/image/upload/v1748860579/image/eskraqh5kwgmaijhylhb.jpg';"/>
                    <div class="card-body d-flex flex-column justify-content-between">
                        <div>
                            <h5 class="card-title">${book.tenSach}</h5>
                            <p class="card-text m-0">${book.tacGia}</p>
                            <p class="card-text mb-1">Số lượng: ${book.soLuong}</p>
                        </div>
                        <div class="d-flex justify-content-around align-items-center">
                            <button type="button"
                                    class="btn btn-sm btn-primary"
                                    data-bs-toggle="modal"
                                    data-bs-target="#modal-edit-book"
                                    data-masach="${book.maSach}"
                                    data-tensach="${book.tenSach}"
                                    data-tacgia="${book.tacGia}"
                                    data-soluong="${book.soLuong}">
                                <i class="fa-solid fa-edit"></i>
                                Sửa
                            </button>
                            <button type="button"
                                    class="btn btn-sm btn-danger"
                                    data-bs-toggle="modal"
                                    data-bs-target="#modal-delete-book"
                                    data-masach="${book.maSach}"
                                    data-tensach="${book.tenSach}">
                                <i class="fa-solid fa-trash-alt"></i>
                                Xóa
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- Modal add book -->
    <div class="modal fade" id="modal-add-book" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
         aria-labelledby="modal-add-bookLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="modal-add-bookLabel">Thêm Sách</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/sachs/them" method="post"
                          enctype="multipart/form-data">
                        <div class="modal-body">
                            <div class="form-group mb-3">
                                <label for="maSach" class="form-label">Mã Sách</label>
                                <input type="text" id="maSach" name="maSach" class="form-control" required
                                       placeholder="Nhập mã sách">
                            </div>
                            <div class="form-group mb-3">
                                <label for="tenSach" class="form-label">Tên Sách</label>
                                <input type="text" id="tenSach" name="tenSach" class="form-control" required
                                       placeholder="Nhập tên sách">
                            </div>
                            <div class="form-group mb-3">
                                <label for="tacGia" class="form-label">Tác Giả</label>
                                <input type="text" id="tacGia" name="tacGia" class="form-control" required
                                       placeholder="Tác giả">
                            </div>
                            <div class="form-group mb-3">
                                <label for="soLuong" class="form-label">Số Lượng</label>
                                <input type="number" id="soLuong" value="0" name="soLuong" class="form-control" required
                                       placeholder="Số lượng nhập vào">
                            </div>
                            <div class="form-group mb-3">
                                <label for="anhFile" class="form-label">Ảnh Bìa</label>
                                <input type="file" id="anhFile" name="anhFile" class="form-control" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                            <button type="submit" class="btn btn-primary">Thêm Sách</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Sửa Sách -->
    <div class="modal fade" id="modal-edit-book" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
         aria-labelledby="modal-edit-bookLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form id="editBookForm" method="post" action="${pageContext.request.contextPath}/sachs/sua" enctype="multipart/form-data">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="modal-edit-bookLabel">Sửa Sách</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" id="editMaSach" name="maSach" />
                        <div class="form-group mb-3">
                            <label for="editTenSach" class="form-label">Tên Sách</label>
                            <input type="text" id="editTenSach" name="tenSach" class="form-control" required placeholder="Nhập tên sách">
                        </div>
                        <div class="form-group mb-3">
                            <label for="editTacGia" class="form-label">Tác Giả</label>
                            <input type="text" id="editTacGia" name="tacGia" class="form-control" required placeholder="Tác giả">
                        </div>
                        <div class="form-group mb-3">
                            <label for="editSoLuong" class="form-label">Số Lượng</label>
                            <input type="number" id="editSoLuong" name="soLuong" class="form-control" required
                                   placeholder="Số lượng nhập vào">
                        </div>
                        <div class="form-group mb-3">
                            <label for="editAnhFile" class="form-label">Ảnh Bìa (Nếu muốn đổi)</label>
                            <input type="file" id="editAnhFile" name="anhFile" class="form-control">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-primary">Cập Nhật</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Modal Xóa Sách -->
    <div class="modal fade" id="modal-delete-book" tabindex="-1" aria-labelledby="modal-delete-bookLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form id="deleteBookForm" method="post" action="${pageContext.request.contextPath}/sachs/xoa">
                <input type="hidden" name="maSach" id="deleteMaSach" />
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modal-delete-bookLabel">Xác nhận xóa sách</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
                    </div>
                    <div class="modal-body">
                        Bạn có chắc chắn muốn xóa sách <strong id="deleteTenSach"></strong> không?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                        <button type="submit" class="btn btn-danger">Xóa</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script>
        var deleteModal = document.getElementById('modal-delete-book');
        deleteModal.addEventListener('show.bs.modal', function (event) {
            var button = event.relatedTarget; // Nút gọi modal
            var maSach = button.getAttribute('data-masach');
            var tenSach = button.getAttribute('data-tensach');

            var inputMaSach = deleteModal.querySelector('#deleteMaSach');
            var spanTenSach = deleteModal.querySelector('#deleteTenSach');

            inputMaSach.value = maSach;
            spanTenSach.textContent = tenSach;
        });
        var editModal = document.getElementById('modal-edit-book');
        editModal.addEventListener('show.bs.modal', function (event) {
            var button = event.relatedTarget;

            var maSach = button.getAttribute('data-masach');
            var tenSach = button.getAttribute('data-tensach');
            var tacGia = button.getAttribute('data-tacgia');
            var soLuong = button.getAttribute('data-soluong');

            editModal.querySelector('#editMaSach').value = maSach;
            editModal.querySelector('#editTenSach').value = tenSach;
            editModal.querySelector('#editTacGia').value = tacGia;
            editModal.querySelector('#editSoLuong').value = soLuong;
            editModal.querySelector('#editAnhFile').value = "";
        });
    </script>
</div>

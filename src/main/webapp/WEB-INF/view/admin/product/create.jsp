<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
                <meta name="author" content="Hỏi Dân IT" />
                <title>Dashboard - Thêm sản phẩm mới</title>

                <!-- Bootstrap CSS (bạn có thể thay bằng link của bạn nếu đã có) -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />

                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const file = e.target.files[0];
                            if (file) {
                                const imgURL = URL.createObjectURL(file);
                                $("#avatarPreview").attr("src", imgURL).show();
                            } else {
                                $("#avatarPreview").hide();
                            }
                        });
                    });
                </script>

                <style>
                    /* Custom styles */
                    form .form-floating label {
                        font-weight: 500;
                    }

                    #avatarPreview {
                        max-height: 200px;
                        border: 1px solid #ddd;
                        padding: 5px;
                        border-radius: 4px;
                        display: none;
                        margin-top: 10px;
                        object-fit: contain;
                        width: 100%;
                    }
                </style>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage Products</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Thêm sản phẩm mới</li>
                                </ol>

                                <div class="card shadow-sm mt-4 mb-5">
                                    <div class="card-body">
                                        <h3 class="mb-4">Thêm mới sản phẩm</h3>

                                        <form:form method="post" action="/admin/product/create"
                                            modelAttribute="newProduct" enctype="multipart/form-data" class="row g-3">

                                            <c:set var="errorName">
                                                <form:errors path="name" cssClass="invalid-feedback" />
                                            </c:set>
                                            <c:set var="errorPrice">
                                                <form:errors path="price" cssClass="invalid-feedback" />
                                            </c:set>
                                            <c:set var="errorQuantity">
                                                <form:errors path="quantity" cssClass="invalid-feedback" />
                                            </c:set>

                                            <!-- Tên sản phẩm -->
                                            <div class="col-md-6 form-floating">
                                                <form:input path="name" type="text"
                                                    class="form-control ${not empty errorName ? 'is-invalid' : ''}"
                                                    id="inputName" placeholder="Tên sản phẩm" />
                                                <label for="inputName">Tên sản phẩm</label>
                                                ${errorName}
                                            </div>

                                            <!-- Giá bán -->
                                            <div class="col-md-6 form-floating">
                                                <form:input path="price" type="number"
                                                    class="form-control ${not empty errorPrice ? 'is-invalid' : ''}"
                                                    id="inputPrice" placeholder="Giá bán" />
                                                <label for="inputPrice">Giá bán</label>
                                                ${errorPrice}
                                            </div>

                                            <!-- Số lượng -->
                                            <div class="col-md-6 form-floating">
                                                <form:input path="quantity" type="number"
                                                    class="form-control ${not empty errorQuantity ? 'is-invalid' : ''}"
                                                    id="inputQuantity" placeholder="Số lượng" />
                                                <label for="inputQuantity">Số lượng</label>
                                                ${errorQuantity}
                                            </div>

                                            <!-- Hãng sản xuất -->
                                            <div class="col-md-6 form-floating">
                                                <form:input path="factory" class="form-control" id="inputFactory"
                                                    placeholder="Hãng sản xuất" />
                                                <label for="inputFactory">Hãng sản xuất</label>
                                            </div>

                                            <!-- Mục đích -->
                                            <div class="col-md-6 form-floating">
                                                <form:input path="target" class="form-control" id="inputTarget"
                                                    placeholder="Mục đích" />
                                                <label for="inputTarget">Mục đích</label>
                                            </div>

                                            <!-- RAM -->
                                            <div class="col-md-6 form-floating">
                                                <form:input path="ram" class="form-control" id="inputRam"
                                                    placeholder="RAM" />
                                                <label for="inputRam">RAM</label>
                                            </div>

                                            <!-- SSD -->
                                            <div class="col-md-6 form-floating">
                                                <form:input path="ssd" class="form-control" id="inputSsd"
                                                    placeholder="SSD" />
                                                <label for="inputSsd">SSD</label>
                                            </div>

                                            <!-- Màn hình -->
                                            <div class="col-md-6 form-floating">
                                                <form:input path="screen" class="form-control" id="inputScreen"
                                                    placeholder="Màn hình" />
                                                <label for="inputScreen">Màn hình</label>
                                            </div>

                                            <!-- CPU -->
                                            <div class="col-md-6 form-floating">
                                                <form:input path="cpu" class="form-control" id="inputCpu"
                                                    placeholder="CPU" />
                                                <label for="inputCpu">CPU</label>
                                            </div>

                                            <!-- Card màn hình -->
                                            <div class="col-md-6 form-floating">
                                                <form:input path="graphics_card" class="form-control"
                                                    id="inputGraphicsCard" placeholder="Card màn hình" />
                                                <label for="inputGraphicsCard">Card màn hình</label>
                                            </div>

                                            <!-- Thông tin pin -->
                                            <div class="col-md-6 form-floating">
                                                <form:input path="battery" class="form-control" id="inputBattery"
                                                    placeholder="Thông tin pin" />
                                                <label for="inputBattery">Thông tin pin</label>
                                            </div>

                                            <!-- Kích thước -->
                                            <div class="col-md-6 form-floating">
                                                <form:input path="weight" class="form-control" id="inputWeight"
                                                    placeholder="Kích thước" />
                                                <label for="inputWeight">Kích thước</label>
                                            </div>

                                            <!-- Ảnh sản phẩm -->
                                            <div class="col-md-6">
                                                <label for="avatarFile" class="form-label">Chọn ảnh sản phẩm</label>
                                                <input class="form-control" type="file" id="avatarFile"
                                                    accept=".png, .jpg, .jpeg" name="imageFile" />
                                                <img id="avatarPreview" alt="Ảnh preview sản phẩm" />
                                            </div>

                                            <!-- Nút submit -->
                                            <div class="col-12 text-end mt-4">
                                                <button type="submit" class="btn btn-primary px-4">Tạo sản phẩm</button>
                                            </div>
                                        </form:form>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>

                <!-- Bootstrap JS Bundle -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>

            </body>

            </html>
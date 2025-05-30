<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <title>${product.name} - Laptopshop</title>
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <meta name="keywords" content="" />
                <meta name="description" content="" />
                <!-- Google Web Fonts -->
                <link rel="preconnect" href="https://fonts.googleapis.com" />
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
                <link
                    href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                    rel="stylesheet" />
                <!-- Icon Font Stylesheet -->
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                    rel="stylesheet" />
                <!-- Libraries Stylesheet -->
                <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet" />
                <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" />
                <!-- Customized Bootstrap Stylesheet -->
                <link href="/client/css/bootstrap.min.css" rel="stylesheet" />
                <!-- Template Stylesheet -->
                <link href="/client/css/style.css" rel="stylesheet" />
                <style>
                    /* Custom styling */
                    .product-image {
                        max-height: 400px;
                        object-fit: contain;
                    }

                    .price {
                        color: #007bff;
                        font-size: 1.8rem;
                        font-weight: 700;
                    }

                    .rating i {
                        color: #ffc107;
                        margin-right: 3px;
                    }

                    .specs-table {
                        width: 100%;
                        border-collapse: separate;
                        border-spacing: 0 10px;
                    }

                    .specs-table th {
                        width: 150px;
                        color: #555;
                        font-weight: 600;
                        padding-right: 20px;
                        vertical-align: top;
                    }

                    .specs-table td {
                        color: #333;
                    }

                    .quantity-input {
                        max-width: 150px;
                    }

                    .quantity-input input.form-control {
                        max-width: 60px;
                        font-weight: 600;
                        font-size: 1.1rem;
                        user-select: none;
                        /* Không cho bôi đen số lượng */
                    }

                    .quantity-input button.btn {
                        width: 40px;
                        height: 40px;
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        font-size: 1.2rem;
                        transition: background-color 0.3s;
                    }

                    .quantity-input button.btn:hover {
                        background-color: #007bff;
                        color: white;
                    }

                    .categories-list li a {
                        font-weight: 600;
                        color: #333;
                        transition: color 0.3s;
                    }

                    .categories-list li a:hover {
                        color: #007bff;
                        text-decoration: none;
                    }

                    .categories-list span {
                        font-weight: 400;
                        color: #666;
                    }
                </style>
            </head>

            <body>
                <!-- Spinner Start -->
                <div id="spinner"
                    class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                    <div class="spinner-grow text-primary" role="status"></div>
                </div>
                <!-- Spinner End -->

                <jsp:include page="../layout/header.jsp" />

                <!-- Single Product Start -->
                <div class="container-fluid py-5 mt-5">
                    <div class="container py-5">
                        <div class="row mb-4">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb bg-light rounded-3 p-3 mb-0">
                                    <li class="breadcrumb-item"><a href="/">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Chi Tiết Sản Phẩm</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="row g-5">
                            <div class="col-lg-8 col-xl-9">
                                <div class="row g-4">
                                    <div class="col-lg-6">
                                        <div class="border rounded p-3 text-center bg-white shadow-sm">
                                            <a href="#">
                                                <img src="/images/product/${product.image}" alt="${product.name}"
                                                    class="img-fluid rounded product-image" />
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 d-flex flex-column justify-content-between">
                                        <div>
                                            <h2 class="fw-bold mb-3">${product.name}</h2>
                                            <p class="text-muted mb-3">${product.factory}</p>
                                            <h3 class="price mb-4">
                                                <fmt:formatNumber type="number" value="${product.price}" /> đ
                                            </h3>
                                            <div class="rating mb-4" title="Rating">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star-half-alt"></i>
                                            </div>

                                            <div class="mb-3">
                                                <span class="badge bg-info text-dark me-2">RAM: ${product.ram}</span>
                                                <span class="badge bg-info text-dark">SSD: ${product.ssd}</span>
                                            </div>

                                            <!-- Form bao gồm cả input số lượng và nút thêm vào giỏ -->
                                            <form method="post" action="/add-product-to-cart/${product.id}">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />
                                                <div class="input-group quantity-input mb-4">
                                                    <button class="btn btn-outline-primary rounded-start btn-minus"
                                                        type="button">
                                                        <i class="fas fa-minus"></i>
                                                    </button>
                                                    <input type="text" class="form-control text-center" name="quantity"
                                                        value="1" />
                                                    <button class="btn btn-outline-primary rounded-end btn-plus"
                                                        type="button">
                                                        <i class="fas fa-plus"></i>
                                                    </button>
                                                </div>

                                                <button type="submit"
                                                    class="btn btn-primary rounded-pill px-4 py-2 fw-semibold"
                                                    style="font-size: 1rem;">
                                                    <i class="fas fa-shopping-bag me-2"></i> Thêm vào giỏ
                                                </button>
                                            </form>

                                        </div>
                                    </div>

                                    <div class="col-lg-12 mt-5">
                                        <ul class="nav nav-tabs mb-3" id="productTab" role="tablist">
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link active" id="specs-tab" data-bs-toggle="tab"
                                                    data-bs-target="#specs" type="button" role="tab"
                                                    aria-controls="specs" aria-selected="true">Thông số kỹ
                                                    thuật</button>
                                            </li>
                                            <!-- Có thể thêm tab khác ở đây -->
                                        </ul>
                                        <div class="tab-content" id="productTabContent">
                                            <div class="tab-pane fade show active" id="specs" role="tabpanel"
                                                aria-labelledby="specs-tab">
                                                <table class="specs-table">
                                                    <tr>
                                                        <th>CPU</th>
                                                        <td>${product.cpu}</td>
                                                    </tr>
                                                    <tr>
                                                        <th>RAM</th>
                                                        <td>${product.ram}</td>
                                                    </tr>
                                                    <tr>
                                                        <th>SSD</th>
                                                        <td>${product.ssd}</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Màn hình</th>
                                                        <td>${product.screen}</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Card Đồ Họa</th>
                                                        <td>${product.graphics_card}</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Pin</th>
                                                        <td>${product.battery}</td>
                                                    </tr>
                                                    <!-- Thêm thông số kỹ thuật khác nếu có -->
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-4 col-xl-3">
                                <div class="bg-light p-4 rounded shadow-sm">
                                    <h4 class="mb-4">Categories</h4>
                                    <ul class="list-unstyled categories-list">
                                        <li class="d-flex justify-content-between align-items-center mb-2">
                                            <a href="#"><i class="bi bi-laptop me-2"></i> Dell</a>
                                            <span>(5)</span>
                                        </li>
                                        <li class="d-flex justify-content-between align-items-center mb-2">
                                            <a href="#"><i class="bi bi-laptop me-2"></i> Asus</a>
                                            <span>(2)</span>
                                        </li>
                                        <li class="d-flex justify-content-between align-items-center mb-2">
                                            <a href="#"><i class="bi bi-laptop me-2"></i> Acer</a>
                                            <span>(8)</span>
                                        </li>
                                        <li class="d-flex justify-content-between align-items-center mb-2">
                                            <a href="#"><i class="bi bi-laptop me-2"></i> Lenovo</a>
                                            <span>(5)</span>
                                        </li>
                                        <!-- Có thể bổ sung thêm danh mục -->
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <jsp:include page="../layout/footer.jsp" />

                <!-- Back to Top -->
                <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"
                    style="bottom: 30px; right: 30px; position: fixed; z-index: 1000;">
                    <i class="fa fa-arrow-up"></i>
                </a>

                <!-- JavaScript Libraries -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/client/lib/easing/easing.min.js"></script>
                <script src="/client/lib/waypoints/waypoints.min.js"></script>
                <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                <!-- Template Javascript -->
                <script src="/client/js/main.js"></script>

                <script>
                    $(document).ready(function () {
                        $('.btn-plus').click(function () {
                            let $input = $(this).siblings('input[name="quantity"]');
                            let currentVal = parseInt($input.val());
                            if (!isNaN(currentVal)) {
                                $input.val(currentVal + 1);
                            } else {
                                $input.val(1);
                            }
                        });

                        $('.btn-minus').click(function () {
                            let $input = $(this).siblings('input[name="quantity"]');
                            let currentVal = parseInt($input.val());
                            if (!isNaN(currentVal) && currentVal > 1) {
                                $input.val(currentVal - 1);
                            } else {
                                $input.val(1);
                            }
                        });
                    });
                </script>
            </body>

            </html>
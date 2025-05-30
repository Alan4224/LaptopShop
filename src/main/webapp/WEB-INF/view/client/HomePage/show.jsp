<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Trang chủ - Laptopshop</title>

                <!-- Google Web Fonts -->
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                    rel="stylesheet">

                <!-- Icon Font Stylesheet -->
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                    rel="stylesheet">

                <!-- Libraries Stylesheet -->
                <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                <!-- Customized Bootstrap Stylesheet -->
                <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                <!-- Template Stylesheet -->
                <link href="/client/css/style.css" rel="stylesheet">

            </head>

            <body>
                <style>
                    .product-card {
                        transition: all 0.3s ease-in-out;
                        background-color: #ffffff;
                        border: 1px solid #e0e0e0;
                    }

                    .product-card:hover {
                        transform: translateY(-6px);
                        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
                        border-color: rgba(0, 0, 0, 0.1);
                    }



                    .product-card img {
                        border-radius: 12px;
                        object-fit: contain;
                        max-height: 200px;
                    }

                    .card-title {
                        font-size: 1rem;
                        min-height: 3rem;
                    }
                </style>

                <!-- Spinner Start -->
                <div id="spinner"
                    class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center"
                    style="margin-top:100px">

                    <div class="spinner-grow text-primary" role="status"></div>
                </div>
                <!-- Spinner End -->

                <jsp:include page="../layout/header.jsp" />

                <jsp:include page="../layout/banner.jsp" />
                <!-- Fruits Shop Start-->
                <div class="container-fluid fruite py-5" style="background-color:#fcfcfc   ;">
                    <div class="container py-5">
                        <div class="tab-class text-center">
                            <div class="row g-4">
                                <div class="col-lg-4 text-start">
                                    <h1>Sản phẩm nổi bật</h1>
                                </div>
                                <div class="col-lg-8 text-end">
                                    <ul class="nav nav-pills d-inline-flex text-center mb-5">
                                        <li class="nav-item">
                                            <a class="d-flex m-2 py-2 bg-light rounded-pill active" href=/products>
                                                <span class="text-dark" style="width: 130px;">All Products</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="tab-content">
                                <div id="tab-1" class="tab-pane fade show p-0 active">
                                    <div class="row g-4">
                                        <div class="col-lg-12">
                                            <div class="row g-4">
                                                <c:forEach var="product" items="${products}">
                                                    <div class="col-md-6 col-lg-4 col-xl-3 mb-4">
                                                        <div
                                                            class="card product-card border rounded-4 shadow-sm h-100 transition">
                                                            <a href="/product/${product.id}"
                                                                style="text-decoration:none; color:inherit;">
                                                                <div class="position-relative">
                                                                    <img src="/images/product/${product.image}"
                                                                        class="card-img-top p-3" alt="${product.name}">
                                                                    <span
                                                                        class="badge bg-primary position-absolute top-0 start-0 m-3 px-3 py-2 fw-semibold rounded-pill shadow-sm">Laptop</span>
                                                                </div>
                                                                <div class="card-body text-center">
                                                                    <h5 class="card-title text-truncate fw-semibold text-dark mb-2"
                                                                        title="${product.name}">
                                                                        ${product.name}
                                                                    </h5>
                                                                    <div
                                                                        class="d-flex justify-content-center gap-3 text-muted small mb-2">
                                                                        <span><i
                                                                                class="fas fa-memory me-1"></i>${product.ram}
                                                                        </span>
                                                                        <span><i
                                                                                class="fas fa-hdd me-1"></i>${product.ssd}
                                                                        </span>
                                                                    </div>
                                                                    <p class="text-success fw-bold fs-5 mb-3">
                                                                        <fmt:formatNumber type="number"
                                                                            value="${product.price}" /> đ
                                                                    </p>
                                                                </div>
                                                            </a>
                                                            <form method="post"
                                                                action="/add-product-to-cart/${product.id}">
                                                                <input type="hidden" name="${_csrf.parameterName}"
                                                                    value="${_csrf.token}" />
                                                                <button type="submit"
                                                                    class="btn btn-outline-primary rounded-pill px-3 fw-medium"
                                                                    style="font-size: 0.9rem;">
                                                                    <i class="fa fa-shopping-cart me-2"></i> Thêm vào
                                                                    giỏ
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </c:forEach>



                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Fruits Shop End-->

                <jsp:include page="../layout/feature.jsp" />

                <jsp:include page="../layout/footer.jsp" />


                <!-- Back to Top -->
                <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                        class="fa fa-arrow-up"></i></a>


                <!-- JavaScript Libraries -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/client/lib/easing/easing.min.js"></script>
                <script src="/client/lib/waypoints/waypoints.min.js"></script>
                <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                <!-- Template Javascript -->
                <script src="/client/js/main.js"></script>
            </body>

            </html>
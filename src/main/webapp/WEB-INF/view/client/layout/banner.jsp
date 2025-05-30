<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!-- Hero Start -->
        <div class="container-fluid py-5 hero-header" style="background: linear-gradient(to right, #fefae2, #fef9e7);">
            <div class="container py-5">
                <div class="row g-5 align-items-center">
                    <!-- Text Content -->
                    <div class="col-md-12 col-lg-6">
                        <h4 class="mb-3 text-muted fw-semibold">✅ 100% Sản phẩm chính hãng</h4>
                        <h1 class="display-3 fw-bold text-dark mb-4">
                            Hàng cao cấp <br /><span class="text-primary">Rẻ vô địch</span>
                        </h1>
                        <a href="/products" class="btn btn-primary btn-lg px-5 py-3 rounded-pill shadow-sm">
                            Khám phá ngay <i class="fas fa-arrow-right ms-2"></i>
                        </a>
                    </div>

                    <!-- Carousel Content -->
                    <div class="col-md-12 col-lg-6">
                        <div id="heroCarousel" class="carousel slide rounded shadow overflow-hidden"
                            data-bs-ride="carousel">
                            <div class="carousel-inner">

                                <div class="carousel-item active position-relative">
                                    <img src="/client/img/hero-img-1.png" class="img-fluid w-100" alt="Gaming">
                                    <div class="carousel-caption d-none d-md-block">
                                        <a href="#" class="btn btn-danger px-4 py-2 rounded-pill shadow-sm">🎮
                                            Gaming</a>
                                    </div>
                                </div>

                                <div class="carousel-item position-relative">
                                    <img src="/client/img/hero-img-3.png" class="img-fluid w-100" alt="Laptop">
                                    <div class="carousel-caption d-none d-md-block">
                                        <a href="#"
                                            class="btn btn-warning text-dark px-4 py-2 rounded-pill shadow-sm">💻
                                            Laptop</a>
                                    </div>
                                </div>

                                <div class="carousel-item position-relative">
                                    <img src="/client/img/hero-img-2.png" class="img-fluid w-100" alt="Phụ kiện">
                                    <div class="carousel-caption d-none d-md-block">
                                        <a href="#" class="btn btn-success px-4 py-2 rounded-pill shadow-sm">🔌 Phụ
                                            kiện</a>
                                    </div>
                                </div>
                            </div>

                            <!-- Controls -->
                            <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel"
                                data-bs-slide="prev">
                                <span class="carousel-control-prev-icon"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel"
                                data-bs-slide="next">
                                <span class="carousel-control-next-icon"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->
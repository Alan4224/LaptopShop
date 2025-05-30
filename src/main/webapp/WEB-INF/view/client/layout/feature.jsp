<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <style>
            .hover-shadow:hover {
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
                transform: translateY(-5px);
                transition: all 0.3s ease-in-out;
            }
        </style>
        <!-- Features Section Start -->
        <div class="container-fluid py-5 bg-light">
            <div class="container py-5">
                <div class="row g-4">
                    <!-- Feature Item -->
                    <div class="col-md-6 col-lg-3">
                        <div
                            class="featurs-item text-center bg-white shadow-sm p-4 rounded-4 h-100 border border-light-subtle hover-shadow">
                            <div class="featurs-icon bg-primary text-white rounded-circle d-flex align-items-center justify-content-center mx-auto mb-4"
                                style="width: 70px; height: 70px;">
                                <i class="fas fa-car-side fa-2x"></i>
                            </div>
                            <h5 class="mb-1 text-dark">Giao hàng nhanh</h5>
                            <p class="text-muted mb-0">Hỏa tốc trong 2h</p>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-3">
                        <div
                            class="featurs-item text-center bg-white shadow-sm p-4 rounded-4 h-100 border border-light-subtle hover-shadow">
                            <div class="featurs-icon bg-success text-white rounded-circle d-flex align-items-center justify-content-center mx-auto mb-4"
                                style="width: 70px; height: 70px;">
                                <i class="fas fa-user-shield fa-2x"></i>
                            </div>
                            <h5 class="mb-1 text-dark">Thanh toán an toàn</h5>
                            <p class="text-muted mb-0">Giao dịch bảo mật</p>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-3">
                        <div
                            class="featurs-item text-center bg-white shadow-sm p-4 rounded-4 h-100 border border-light-subtle hover-shadow">
                            <div class="featurs-icon bg-warning text-white rounded-circle d-flex align-items-center justify-content-center mx-auto mb-4"
                                style="width: 70px; height: 70px;">
                                <i class="fas fa-exchange-alt fa-2x"></i>
                            </div>
                            <h5 class="mb-1 text-dark">Đổi trả trong 30 ngày</h5>
                            <p class="text-muted mb-0">Miễn phí đổi trả</p>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-3">
                        <div
                            class="featurs-item text-center bg-white shadow-sm p-4 rounded-4 h-100 border border-light-subtle hover-shadow">
                            <div class="featurs-icon bg-danger text-white rounded-circle d-flex align-items-center justify-content-center mx-auto mb-4"
                                style="width: 70px; height: 70px;">
                                <i class="fa fa-phone-alt fa-2x"></i>
                            </div>
                            <h5 class="mb-1 text-dark">Hỗ trợ 24/7</h5>
                            <p class="text-muted mb-0">Nhiệt tình, chuyên nghiệp</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Features Section End -->
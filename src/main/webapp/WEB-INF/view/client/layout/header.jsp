<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!-- Header Start -->
        <div class="container-fluid fixed-top bg-white shadow-sm py-2" style="background-color:#ffd500!important">
            <div class="container px-3">
                <nav class="navbar navbar-expand-xl navbar-light">
                    <!-- Logo -->
                    <a href="/" class="navbar-brand d-flex align-items-center gap-2">
                        <i class="fas fa-laptop-code text-primary fa-2x"></i>
                        <h2 class="mb-0 text-primary fw-bold">LaptopShop</h2>
                    </a>

                    <!-- Toggler -->
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>

                    <!-- Content -->
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <!-- Left Menu -->
                        <div class="navbar-nav">
                            <a href="/" class="nav-item nav-link active">Trang chủ</a>
                            <a href="/products" class="nav-item nav-link">Sản phẩm</a>
                            <a href="/about" class="nav-item nav-link">Giới thiệu</a>
                            <a href="/contact" class="nav-item nav-link">Liên hệ</a>
                        </div>

                        <!-- Right User/Cart -->
                        <div class="d-flex align-items-center gap-4">
                            <c:if test="${not empty pageContext.request.userPrincipal}">
                                <!-- Giỏ hàng -->
                                <a href="/cart" class="position-relative text-dark">
                                    <i class="fa fa-shopping-cart fa-2x"></i>
                                    <span
                                        class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger text-white">
                                        ${sessionScope.sum}
                                    </span>
                                </a>

                                <!-- Tài khoản Dropdown -->
                                <div class="dropdown">
                                    <a href="#" id="userDropdown" data-bs-toggle="dropdown">
                                        <img src="/images/avatar/${sessionScope.avatar}" class="rounded-circle"
                                            width="40" height="40" />
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end shadow" aria-labelledby="userDropdown"
                                        style="min-width: 260px;">
                                        <li class="text-center px-3 py-2">
                                            <img src="/images/avatar/${sessionScope.avatar}" class="rounded-circle mb-2"
                                                width="80" height="80" />
                                            <div class="fw-semibold">${sessionScope.fullName}</div>
                                        </li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li><a class="dropdown-item" href="/account"><i
                                                    class="fas fa-user-cog me-2"></i>Quản lý thông tin</a></li>
                                        <li><a class="dropdown-item" href="/history"><i
                                                    class="fas fa-history me-2"></i>Lịch sử mua hàng</a></li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li>
                                            <form method="post" action="/logout">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />
                                                <button class="dropdown-item text-danger"><i
                                                        class="fas fa-sign-out-alt me-2"></i>Đăng xuất</button>
                                            </form>
                                        </li>
                                    </ul>
                                </div>
                            </c:if>

                            <!-- Nếu chưa đăng nhập -->
                            <c:if test="${empty pageContext.request.userPrincipal}">
                                <a href="/login" class="btn btn-outline-primary px-4">
                                    <i class="fas fa-sign-in-alt me-2"></i>Đăng nhập
                                </a>
                            </c:if>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Header End -->
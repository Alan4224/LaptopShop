<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Login - LaptopShop</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

                <style>
                    body {
                        background: linear-gradient(to right, #fdfcfb, #e2d1c3);
                        height: 100vh;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-family: 'Segoe UI', sans-serif;
                    }

                    .card {
                        border: none;
                        border-radius: 15px;
                        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
                        transition: box-shadow 0.3s ease-in-out;
                    }

                    .card:hover {
                        box-shadow: 0 20px 60px rgba(0, 0, 0, 0.25);
                    }

                    .card-header {
                        background: none;
                        border-bottom: none;
                    }

                    .form-control:focus {
                        border-color: #86b7fe;
                        box-shadow: 0 0 0 0.2rem rgba(13, 110, 253, 0.25);
                    }

                    .btn-primary {
                        background-color: #0d6efd;
                        border-color: #0d6efd;
                    }

                    .btn-primary:hover {
                        background-color: #0b5ed7;
                        border-color: #0a58ca;
                    }

                    .small a {
                        color: #0d6efd;
                        text-decoration: none;
                    }

                    .small a:hover {
                        text-decoration: underline;
                    }
                </style>
            </head>

            <body>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-6 col-lg-5">
                            <div class="card p-4">
                                <div class="card-header text-center">
                                    <h3 class="fw-bold">LaptopShop Login</h3>
                                </div>
                                <div class="card-body">
                                    <form method="post" action="/login">
                                        <c:if test="${param.error != null}">
                                            <div class="alert alert-danger text-center py-2">
                                                Invalid email or password.
                                            </div>
                                        </c:if>
                                        <c:if test="${param.logout != null}">
                                            <div class="alert alert-success text-center py-2">
                                                Logout successful.
                                            </div>
                                        </c:if>

                                        <div class="form-floating mb-3">
                                            <input type="email" class="form-control" id="email"
                                                placeholder="name@example.com" name="username" required />
                                            <label for="email">Email address</label>
                                        </div>

                                        <div class="form-floating mb-3">
                                            <input type="password" class="form-control" id="password"
                                                placeholder="Password" name="password" required />
                                            <label for="password">Password</label>
                                        </div>

                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                                        <div class="d-grid mb-3">
                                            <button class="btn btn-primary btn-lg" type="submit">Login</button>
                                        </div>
                                    </form>
                                </div>
                                <div class="card-footer text-center bg-transparent border-0">
                                    <div class="small">
                                        <a href="/register">Need an account? Sign up!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
            </body>

            </html>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <title>Register - LaptopShop</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

                <style>
                    body {
                        background: linear-gradient(to right, #fefcea, #f1daae);
                        min-height: 100vh;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-family: 'Segoe UI', sans-serif;
                    }

                    .card {
                        border: none;
                        border-radius: 16px;
                        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
                        transition: box-shadow 0.3s ease;
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
                        <div class="col-md-10 col-lg-8">
                            <div class="card p-4 mt-4">
                                <div class="card-header text-center">
                                    <h3 class="fw-bold">Create Your Account</h3>
                                </div>
                                <div class="card-body">
                                    <form:form method="post" action="/register" modelAttribute="registerUser">
                                        <c:set var="errorPassword">
                                            <form:errors path="confirmPassword" cssClass="invalid-feedback" />
                                        </c:set>
                                        <c:set var="errorEmail">
                                            <form:errors path="email" cssClass="invalid-feedback" />
                                        </c:set>

                                        <div class="row mb-3">
                                            <div class="col-md-6">
                                                <div class="form-floating mb-3 mb-md-0">
                                                    <form:input class="form-control" id="inputFirstName" type="text"
                                                        placeholder="Enter your first name" path="firstName" />
                                                    <label for="inputFirstName">First Name</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-floating">
                                                    <form:input class="form-control" id="inputLastName" type="text"
                                                        placeholder="Enter your last name" path="lastName" />
                                                    <label for="inputLastName">Last Name</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-floating mb-3">
                                            <form:input class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                                type="email" placeholder="name@example.com" path="email" />
                                            <label>Email Address</label>
                                            ${errorEmail}
                                        </div>

                                        <div class="row mb-3">
                                            <div class="col-md-6">
                                                <div class="form-floating mb-3 mb-md-0">
                                                    <form:input
                                                        class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                                        id="inputPassword" type="password"
                                                        placeholder="Create a password" path="password" />
                                                    <label for="inputPassword">Password</label>
                                                    ${errorPassword}
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-floating mb-3 mb-md-0">
                                                    <form:input class="form-control" id="inputPasswordConfirm"
                                                        type="password" placeholder="Confirm password"
                                                        path="confirmPassword" />
                                                    <label for="inputPasswordConfirm">Confirm Password</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="d-grid">
                                            <button class="btn btn-primary btn-lg" type="submit">Create Account</button>
                                        </div>
                                    </form:form>
                                </div>
                                <div class="card-footer text-center bg-transparent border-0">
                                    <div class="small"><a href="/login">Have an account? Go to login</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
            </body>

            </html>
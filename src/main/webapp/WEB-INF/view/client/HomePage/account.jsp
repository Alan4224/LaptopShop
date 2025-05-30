<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
          <meta charset="utf-8">
          <title> Tài khoản - Laptopshop</title>
          <meta content="width=device-width, initial-scale=1.0" name="viewport">
          <meta content="" name="keywords">
          <meta content="" name="description">

          <!-- Google Web Fonts -->
          <link rel="preconnect" href="https://fonts.googleapis.com">
          <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
          <link
            href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
            rel="stylesheet">

          <!-- Icon Font Stylesheet -->
          <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
          <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

          <!-- Libraries Stylesheet -->
          <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
          <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


          <!-- Customized Bootstrap Stylesheet -->
          <link href="/client/css/bootstrap.min.css" rel="stylesheet">

          <!-- Template Stylesheet -->
          <link href="/client/css/style.css" rel="stylesheet">
        </head>

        <body>

          <!-- Spinner Start -->
          <div id="spinner"
            class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
          </div>
          <!-- Spinner End -->

          <jsp:include page="../layout/header.jsp" />

          <!-- Cart Page Start -->
          <div class="container-fluid py-5">
            <div class="container py-5">
              <div class="mb-3">
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Quản Lý Tài Khoản</li>
                  </ol>
                </nav>
              </div>
              <div class="table-responsive">
                <form:form method="post" action="/account" modelAttribute="newUser" enctype="multipart/form-data"
                  class="p-3 border rounded" style="max-width: 600px; margin: auto;">
                  <div class="mb-3" style="display:none;">
                    <label class="form-label" for="idInput">Id:</label>
                    <form:input type="text" class="form-control" path="id" id="idInput" />
                  </div>
                  <div class="mb-3">
                    <label class="form-label" for="emailInput">Email:</label>
                    <form:input type="email" class="form-control" path="email" id="emailInput" disabled="true" />
                  </div>
                  <div class="mb-3">
                    <label class="form-label" for="phoneInput">Phone number:</label>
                    <form:input type="text" class="form-control" path="phone" id="phoneInput" />
                  </div>
                  <div class="mb-3">
                    <label class="form-label" for="fullNameInput">Full name:</label>
                    <form:input type="text" class="form-control" path="fullName" id="fullNameInput" />
                  </div>
                  <div class="mb-3">
                    <label class="form-label" for="addressInput">Address:</label>
                    <form:input type="text" class="form-control" path="address" id="addressInput" />
                  </div>
                  <div class="mb-3">
                    <label class="form-label" for="formFile">Avatar:</label>
                    <input class="form-control" type="file" id="formFile" accept=".png, .jpg, .jpeg" name="ImageFile"
                      onchange="loadFile(event)" />
                    <img id="output" width="300" class="mt-2 rounded" src="/images/avatar/${newUser.avatar}"
                      alt="Avatar Preview" style="display:block;" />
                  </div>
                  <div class="pd-3 mb-3 d-flex justify-content-center gap-3">
                    <button type="submit" class="btn btn-warning px-4">Submit</button>
                    <a href="/" class="btn btn-secondary px-4">Cancel</a>
                  </div>
                </form:form>
              </div>

              <script>
                var loadFile = function (event) {
                  var output = document.getElementById('output');
                  output.src = URL.createObjectURL(event.target.files[0]);
                  output.style.display = 'block';
                  output.onload = function () {
                    URL.revokeObjectURL(output.src); // free memory
                  };
                };
              </script>
            </div>
          </div>
          <!-- Cart Page End -->


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
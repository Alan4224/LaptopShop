# Project: Website Bán Laptop (Java Spring MVC Course Project)

Đây là dự án thực hành được xây dựng trong khuôn khổ khóa học "Java Spring MVC" của & Eric. Dự án mô phỏng một website thương mại điện tử chuyên bán các sản phẩm laptop.

## Mô tả

Website bao gồm các chức năng cơ bản cho cả người dùng (Client) và quản trị viên (Admin):

**Phía Client:**

- Xem danh sách sản phẩm (có phân trang, filter, sort).
- Xem chi tiết sản phẩm.
- Đăng ký, đăng nhập tài khoản.
- Quản lý giỏ hàng (thêm, sửa, xóa sản phẩm).
- Đặt hàng và thanh toán (mô phỏng).
- Xem lịch sử mua hàng.

**Phía Admin:**

- Dashboard tổng quan.
- Quản lý người dùng (CRUD).
- Quản lý sản phẩm (CRUD).
- Quản lý đơn hàng (Xem chi tiết, cập nhật trạng thái).

## Công nghệ sử dụng

- **Backend:** Java 17 [cite: 61]
  - **Framework:** Spring Boot[cite: 111], Spring MVC [cite: 196]
  - **Data Access:** Spring Data JPA / Hibernate [cite: 235, 240]
  - **Security:** Spring Security (Authentication & Authorization, CSRF Protection) [cite: 183, 424]
  - **Session Management:** Spring Session (JDBC Store) [cite: 449]
  - **Validation:** Jakarta Bean Validation / Hibernate Validator [cite: 368, 372]
  - **Build Tool:** Maven [cite: 129]
- **Frontend:**
  - **View Engine:** JSP (JavaServer Pages) [cite: 218]
  - **Templating:** JSTL (JSP Standard Tag Library) [cite: 222]
  - **Styling:** Bootstrap 5 [cite: 225]
  - **Javascript:** JQuery [cite: 225] (Có thể có sử dụng Ajax cho một số tính năng [cite: 545])
- **Database:** MySQL [cite: 160, 165]
- **Development Tools:**
  - VSCode [cite: 64]
  - Postman [cite: 80]
  - Git [cite: 73]
  - MySQL Workbench [cite: 163]
  - Spring Boot DevTools [cite: 156]
- **(Bonus):** Docker [cite: 571]

## Cài đặt và Chạy dự án

1.  **Yêu cầu:**

    - JDK 17 [cite: 61]
    - Maven
    - MySQL Server [cite: 163]
    - Git

2.  **Clone Repository:**

    ```bash
    git clone <URL_REPOSITORY_CUA_BAN>
    cd <TEN_THU_MUC_PROJECT>
    ```

3.  **Cấu hình Database:**

    - Tạo một database trong MySQL (ví dụ: `laptopshop_db`).
    - Cập nhật thông tin kết nối database trong file `src/main/resources/application.properties`:
      ```properties
      spring.datasource.url=jdbc:mysql://localhost:3306/laptopshop_db # Thay tên db nếu khác
      spring.datasource.username=your_mysql_username # Thay username MySQL
      spring.datasource.password=your_mysql_password # Thay password MySQL
      ```
      _(Lưu ý các cấu hình khác như `spring.jpa.hibernate.ddl-auto=update` đã có sẵn theo project gốc)_ [cite: 165]

4.  **Build và Chạy:**

    - Sử dụng Maven Wrapper được cung cấp:

      ```bash
      # Trên Windows
      ./mvnw spring-boot:run

      # Trên macOS/Linux
      ./mvnw spring-boot:run
      ```

    - Hoặc build file JAR và chạy:
      ```bash
      ./mvnw clean package
      java -jar target/<TEN_FILE_JAR>.jar
      ```

5.  **Truy cập ứng dụng:**
    - Mở trình duyệt và truy cập: `http://localhost:8080` (Hoặc port bạn đã cấu hình trong `application.properties`, ví dụ 8081 [cite: 109]).

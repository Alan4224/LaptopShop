package vn.nhom8.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.nhom8.laptopshop.domain.Cart;
import vn.nhom8.laptopshop.domain.User;

@Repository

public interface CartRepository extends JpaRepository<Cart, Long> {
    Cart findByUser(User user);
}

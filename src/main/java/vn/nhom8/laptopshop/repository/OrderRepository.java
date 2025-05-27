package vn.nhom8.laptopshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.nhom8.laptopshop.domain.Order;
import vn.nhom8.laptopshop.domain.User;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
  List<Order> findByUser(User user);
}

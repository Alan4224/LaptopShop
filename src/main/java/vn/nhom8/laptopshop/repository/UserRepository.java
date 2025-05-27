package vn.nhom8.laptopshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.nhom8.laptopshop.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User user);

    void deleteById(Long id);

    List<User> findAll();

    List<User> findOneByEmail(String email);

    User findFistById(Long id);

    boolean existsByEmail(String email);

    User findByEmail(String email);
}

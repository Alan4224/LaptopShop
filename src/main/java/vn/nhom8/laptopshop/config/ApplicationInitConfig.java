package vn.nhom8.laptopshop.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

import vn.nhom8.laptopshop.domain.Role;
import vn.nhom8.laptopshop.domain.User;
import vn.nhom8.laptopshop.repository.RoleRepository;
import vn.nhom8.laptopshop.repository.UserRepository;

@Configuration
public class ApplicationInitConfig {
  @Autowired
  private PasswordEncoder passwordEncoder;

  @Bean
  ApplicationRunner applicationRunner(UserRepository userRepository, RoleRepository roleRepository) {
    return args -> {
      if (userRepository.findByEmail("admin@gmail.com") == null) {
        Role admin = new Role();
        admin.setName("ADMIN");
        admin.setDescription("role admin");
        Role user = new Role();
        user.setName("USER");
        user.setDescription("role user");
        admin = roleRepository.save(admin);
        roleRepository.save(user);
        User adminAccount = new User();
        adminAccount.setEmail("admin@gmail.com");
        adminAccount.setPassword(passwordEncoder.encode("admin"));
        adminAccount.setFullName("admin");
        adminAccount.setRole(admin);
        userRepository.save(adminAccount);
      }
    };
  }
}

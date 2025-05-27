package vn.nhom8.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.nhom8.laptopshop.domain.Cart;
import vn.nhom8.laptopshop.domain.CartDetail;
import vn.nhom8.laptopshop.domain.Order;
import vn.nhom8.laptopshop.domain.OrderDetail;
import vn.nhom8.laptopshop.domain.Product;
import vn.nhom8.laptopshop.domain.User;
import vn.nhom8.laptopshop.domain.DTO.ProductCriterDTO;
import vn.nhom8.laptopshop.repository.CartDetailRepository;
import vn.nhom8.laptopshop.repository.CartRepository;
import vn.nhom8.laptopshop.repository.OrderDetailRepository;
import vn.nhom8.laptopshop.repository.OrderRepository;
import vn.nhom8.laptopshop.repository.ProductRepository;
import vn.nhom8.laptopshop.service.specification.ProductSpecs;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public ProductService(ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserService userService, OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository) {
        this.productRepository = productRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.cartRepository = cartRepository;
        this.userService = userService;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public Product handleSaveProduct(Product product) {
        Product eric = this.productRepository.save(product);
        return eric;
    }

    public Page<Product> getAllProducts(Pageable pageable) {
        return this.productRepository.findAll(pageable);
    }

    public Page<Product> getAllProductsWithspec(Pageable pageable, ProductCriterDTO productCriterDTO) {
        if (productCriterDTO.getTargetOptional() == null
                && productCriterDTO.getFactoryOptional() == null
                && productCriterDTO.getPriceOptional() == null) {
            return this.productRepository.findAll(pageable);

        }

        Specification<Product> compinedSpec = Specification.where(null);
        if (productCriterDTO.getTargetOptional() != null && productCriterDTO.getTargetOptional().isPresent()) {
            Specification<Product> currentSpecs = ProductSpecs
                    .matchListTarget(productCriterDTO.getTargetOptional().get());
            compinedSpec.and(currentSpecs);
        }
        if (productCriterDTO.getFactoryOptional() != null && productCriterDTO.getFactoryOptional().isPresent()) {
            Specification<Product> currentSpecs = ProductSpecs
                    .matchListFactory(productCriterDTO.getFactoryOptional().get());
            compinedSpec.and(currentSpecs);
        }
        return this.productRepository.findAll(compinedSpec, pageable);
    }

    public void deleteAProduct(long Id) {
        this.productRepository.deleteById(Id);
    }

    public Optional<Product> fetchProductById(long Id) {
        return this.productRepository.findById(Id);
    }

    public Cart fetchByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public List<Order> findByUser(User user) {
        return this.orderRepository.findByUser(user);
    }

    public void handleAddProductToCart(String email, long productId, HttpSession session) {
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            Cart cart = this.cartRepository.findByUser(user);

            if (cart == null) {
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setSum(0);

                cart = this.cartRepository.save(otherCart);
            }
            Optional<Product> product = this.productRepository.findById(productId);
            if (product.isPresent()) {
                Product realProduct = product.get();

                CartDetail olDetail = this.cartDetailRepository.findByCartAndProduct(cart, realProduct);

                if (olDetail == null) {
                    CartDetail detail = new CartDetail();
                    detail.setCart(cart);
                    detail.setProduct(realProduct);
                    detail.setPrice(realProduct.getPrice());
                    detail.setQuantity(1);
                    this.cartDetailRepository.save(detail);

                    int s = cart.getSum() + 1;
                    cart.setSum(s);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", s);
                } else {
                    olDetail.setQuantity(olDetail.getQuantity() + 1);
                    this.cartDetailRepository.save(olDetail);

                }
            }

        }

    }

    public void handleRemoveCartDetail(long cartDetailId, HttpSession session) {
        Optional<CartDetail> cartDetailOptional = this.cartDetailRepository.findById(cartDetailId);
        if (cartDetailOptional.isPresent()) {
            CartDetail cartDetail = cartDetailOptional.get();
            Cart cart = cartDetail.getCart();
            this.cartDetailRepository.deleteById(cartDetailId);

            if (cart.getSum() > 1) {
                int s = cart.getSum() - 1;
                cart.setSum(s);
                session.setAttribute("sum", s);
                this.cartRepository.save(cart);
            } else {
                this.cartRepository.deleteById(cart.getId());
                session.setAttribute("sum", 0);

            }
        }
    }

    public void handleUpdateCartBeforeCheckout(List<CartDetail> cartDetails) {
        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> cdOptional = this.cartDetailRepository.findById(cartDetail.getId());
            if (cdOptional.isPresent()) {
                CartDetail currentCartDetail = cdOptional.get();
                currentCartDetail.setQuantity(cartDetail.getQuantity());
                this.cartDetailRepository.save(currentCartDetail);
            }
        }
    }

    public void handlePlaceOrder(User user, HttpSession session, String receiverName, String receiverAddress,
            String receiverPhone) {
        Cart cart = this.cartRepository.findByUser(user);

        if (cart != null) {

            List<CartDetail> cartDetails = cart.getCartDetails();
            if (cartDetails != null) {

                Order order = new Order();
                order.setUser(user);
                order.setReceiverName(receiverName);
                order.setReceiverAddress(receiverAddress);
                order.setReceiverPhone(receiverPhone);
                order.setStatus("PENDING");

                double sum = 0;

                for (CartDetail cartDetail : cartDetails) {
                    sum += cartDetail.getPrice();
                }
                order.setTotalPrice(sum);
                order = this.orderRepository.save(order);
                for (CartDetail cartDetail : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cartDetail.getProduct());
                    orderDetail.setPrice(cartDetail.getPrice());
                    orderDetail.setQuantity(cartDetail.getQuantity());
                    this.orderDetailRepository.save(orderDetail);
                }

                for (CartDetail cartDetail : cartDetails) {
                    this.cartDetailRepository.deleteById(cartDetail.getId());
                }

                this.cartRepository.deleteById(cart.getId());

                session.setAttribute("sum", 0);
            }
        }
    }
}
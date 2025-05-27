package vn.nhom8.laptopshop.controller.client;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import vn.nhom8.laptopshop.domain.Product_;
import vn.nhom8.laptopshop.domain.Cart;
import vn.nhom8.laptopshop.domain.CartDetail;
import vn.nhom8.laptopshop.domain.Order;
import vn.nhom8.laptopshop.domain.Product;
import vn.nhom8.laptopshop.domain.User;
import vn.nhom8.laptopshop.domain.DTO.ProductCriterDTO;
import vn.nhom8.laptopshop.service.ProductService;
import vn.nhom8.laptopshop.service.UploadService;
import vn.nhom8.laptopshop.service.UserService;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ItemCotroller {
    private final ProductService productService;
    private final UserService userService;
    private final UploadService uploadService;

    public ItemCotroller(ProductService productService, UserService userService, UploadService uploadService) {
        this.productService = productService;
        this.userService = userService;
        this.uploadService = uploadService;
    }

    @GetMapping("/product/{id}")
    public String getMethodName(Model model, @PathVariable Long id) {
        Product pr = this.productService.fetchProductById(id).get();
        model.addAttribute("product", pr);
        model.addAttribute("id", id);
        return "client/product/detail";
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable Long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        long productid = id;
        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, productid, session);
        return "redirect:/";
    }

    @GetMapping("/history")
    public String getHistory(Model model, HttpServletRequest request) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);
        List<Order> order = this.productService.findByUser(currentUser);
        model.addAttribute("orders", order);
        return "client/HomePage/history";
    }

    @GetMapping("/account")
    public String getAccount(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        User user = this.userService.getUserById(id);
        model.addAttribute("newUser", user);
        return "client/HomePage/account";
    }

    @PostMapping("/account")
    public String createUserpage(Model model, @ModelAttribute("newUser") User newUser,
            @RequestParam("ImageFile") MultipartFile file, HttpServletRequest request) {
        User user = this.userService.getUserById(newUser.getId());
        if (user != null) {
            user.setAddress(newUser.getAddress());
            user.setFullName(newUser.getFullName());
            user.setPhone(newUser.getPhone());
            String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
            user.setAvatar(avatar);
            this.userService.handleSaveUser(user);
            HttpSession session = request.getSession(false);
            session.setAttribute("fullName", user.getFullName());
            session.setAttribute("avatar", user.getAvatar());
            session.setAttribute("id", user.getId());
            session.setAttribute("email", user.getEmail());
        }
        return "redirect:/";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);
        Cart cart = this.productService.fetchByUser(currentUser);
        List<CartDetail> cartList = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        double total = 0;
        for (CartDetail cartDetail : cartList) {
            total = cartDetail.getPrice() * cartDetail.getQuantity();
        }
        model.addAttribute("cartList", cartList);
        model.addAttribute("total", total);
        model.addAttribute("cart", cart);
        return "client/cart/show";
    }

    @PostMapping("/delete-cart-product/{id}")
    public String deleteCartProduct(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        this.productService.handleRemoveCartDetail(id, session);
        return "redirect:/cart";
    }

    @GetMapping("/checkout")
    public String getCheckOutPage(Model model, HttpServletRequest request) {
        User currentUser = new User();// null
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        Cart cart = this.productService.fetchByUser(currentUser);

        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);

        return "client/cart/checkout";
    }

    @PostMapping("/confirm-checkout")
    public String getCheckOutPage(@ModelAttribute("cart") Cart cart) {
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        this.productService.handleUpdateCartBeforeCheckout(cartDetails);
        return "redirect:/checkout";
    }

    @PostMapping("/place-order")
    public String handlePlaceOrder(
            HttpServletRequest request,
            @RequestParam("receiverName") String receiverName,
            @RequestParam("receiverAddress") String receiverAddress,
            @RequestParam("receiverPhone") String receiverPhone) {
        User currentUser = new User();// null
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);
        this.productService.handlePlaceOrder(currentUser, session, receiverName, receiverAddress, receiverPhone);
        return "redirect:/";
    }

    @GetMapping("/products")
    public String getProductPage(Model model,
            ProductCriterDTO productCriterDTO,
            HttpServletRequest request) {
        int page = 1;
        try {
            if (productCriterDTO.getPageOptional().isPresent()) {
                // convert from String to int
                page = Integer.parseInt(productCriterDTO.getPageOptional().get());
            } else {
                // page = 1
            }
        } catch (Exception e) {
            // page = 1
            // TODO: handle exception

        }
        // check sort price
        Pageable pageable = PageRequest.of(page - 1, 3);

        if (productCriterDTO.getSortOptional() != null && productCriterDTO.getSortOptional().isPresent()) {
            String sort = productCriterDTO.getSortOptional().get();
            if (sort.equals("gia-tang-dan")) {
                pageable = PageRequest.of(page - 1, 3, Sort.by(Product_.PRICE).ascending());

            } else if (sort.equals("gia-giam-dan")) {
                pageable = PageRequest.of(page - 1, 3, Sort.by(Product_.PRICE).descending());

            }
        }

        Page<Product> prs = this.productService.getAllProductsWithspec(pageable, productCriterDTO);

        List<Product> products = prs.getContent().size() > 0 ? prs.getContent() : new ArrayList<Product>();
        String qs = request.getQueryString();
        if (qs != null && !qs.isBlank()) {
            qs = qs.replace("page=" + page, "");
        }

        model.addAttribute("products", products);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", prs.getTotalPages());
        model.addAttribute("queryString", qs);

        return "client/product/show";
    }
}

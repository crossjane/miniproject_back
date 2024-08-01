package com.bit.springboard.controller;

import com.bit.springboard.dto.ProductDto;
import com.bit.springboard.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@RequestMapping("/products")
public class ProductController {

    @Autowired
    private ProductService productService;

    @PostMapping("/save")
    @ResponseBody
    public ProductDto saveProduct(@RequestBody ProductDto productDto, @RequestParam("file") MultipartFile file) {
        return productService.saveProduct(productDto, file);
    }

    @GetMapping("/all")
    @ResponseBody
    public List<ProductDto> getAllProducts() {
        return productService.getAllProducts();
    }

    @GetMapping("/shopping_main.do")
    public String shoppingMain() {
        return "/WEB-INF/views/store/shopping_main"; // store/shopping_main.jsp를 반환
    }

    @GetMapping("/purchase.do")
    public String purchase() {
        return "/WEB-INF/views/store/purchase";
    }
}
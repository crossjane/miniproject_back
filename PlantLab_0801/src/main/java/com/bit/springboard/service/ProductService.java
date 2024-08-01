package com.bit.springboard.service;

import com.bit.springboard.dto.ProductDto;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ProductService {
    ProductDto saveProduct(ProductDto productDto, MultipartFile file);
    List<ProductDto> getAllProducts();
}
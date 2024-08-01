package com.bit.springboard.service.impl;

import com.bit.springboard.dao.ProductDao;
import com.bit.springboard.dto.ProductDto;
import com.bit.springboard.common.FileUtils;
import com.bit.springboard.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private FileUtils fileUtils;

    @Autowired
    private ProductDao productDao;

    @Override
    public ProductDto saveProduct(ProductDto productDto, MultipartFile file) {
        if (file != null && !file.isEmpty()) {
            try {
                String savedFileName = fileUtils.saveFile(file);
                productDto.setFile_name(savedFileName);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        productDao.saveProduct(productDto);
        return productDto;
    }

    @Override
    public List<ProductDto> getAllProducts() {
        return productDao.getAllProducts();
    }
}
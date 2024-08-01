package com.bit.springboard.dao;

import com.bit.springboard.dto.ProductDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductDao {
    private final SqlSessionTemplate sqlSessionTemplate;

    @Autowired
    public ProductDao(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public void saveProduct(ProductDto productDto) {
        sqlSessionTemplate.insert("ProductDao.saveProduct", productDto);
    }

    public List<ProductDto> getAllProducts() {
        return sqlSessionTemplate.selectList("ProductDao.getAllProducts");
    }
}

package com.interfaces;

import java.sql.SQLException;
import java.util.List;

import com.medHub.model.ProductModel;

public interface ProductInterface {
	public List<ProductModel> viewProduts();
	public void insertProduct(ProductModel productModel) throws SQLException;
	public void updateProducts(int updateProductId, String updateproductcategory, String updateProductName, String updateProductDescription, int updateUnitPrice, int updateQuantity) throws SQLException;
	public void deleteProduct(int productId) throws SQLException;
	public ProductModel findProductByName(String productName);
	public ProductModel findProductByProductId(int id);
	public void updateProductQuantity(ProductModel buyProducts) throws SQLException;
}

/**
 * 
 */
package org.sistema.springmvc.forms.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.sistema.springmvc.forms.models.Product;
import org.sistema.springmvc.forms.models.ProductType;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * implementation of ProductDAO
 * 
 * @author Eugenia Pérez Martínez
 * @email eugenia_perez@cuatrovientos.org
 *
 */

public class ProductDAO extends GenericDAO<Product> {

	
	@Transactional(readOnly = true)
	public List<ProductType> selectTiposProduct() {
		
		List<ProductType> productTypes = null;
		
		Query query = getSession().createQuery("FROM producttype");
		
		productTypes = query.list();
		
		return productTypes;
		
	}
	
	@Transactional(readOnly = true)
	public List<Product> selectProductsOfProductType(Integer productTypeId){
		List<Product> products = null;
		
		Query query = getSession().createQuery("FROM product p WHERE p.produtType_id = :id");
		query.setParameter("id", productTypeId);
		
		products = query.list();
		
		return products;
	}

}

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

public class ProductTypeDAO extends GenericDAO<ProductType> {


		/**
	 * Selects all product types by name
	 * 
	 * @return List of products
	 */
	@Transactional(readOnly = true)
	public List<ProductType> selectByName(String name) {

		List<ProductType> products = null;

			Query query = getSession()
							.createQuery("from producttype tp where tp.name LIKE :name");
		    query.setParameter("name", "%"+name+"%");
		    
			// We get a generic object list
			products = query.list();

		return products;
	}
	
	@Transactional(readOnly = true)
	public List<ProductType> selectProductTypes() {
		
		List<ProductType> productTypes = null;
		
		Query query = getSession().createQuery("FROM producttype");
		
		productTypes = query.list();
		
		return productTypes;
		
	}

}

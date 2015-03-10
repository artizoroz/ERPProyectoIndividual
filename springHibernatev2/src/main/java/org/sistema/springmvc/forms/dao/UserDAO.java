/**
 * 
 */
package org.sistema.springmvc.forms.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.sistema.springmvc.forms.models.User;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * implementation of ProductDAO
 * 
 * @author Eugenia Pérez Martínez
 * @email eugenia_perez@cuatrovientos.org
 *
 */

public class UserDAO extends GenericDAO<User> {


		/**
	 * Selects all product types by name
	 * 
	 * @return List of products
	 */
	@Transactional(readOnly = true)
	public List<User> selectByName(String name) {

		List<User> products = null;

			Query query = getSession()
							.createQuery("from User u where u.login LIKE :login");
		    query.setParameter("login", "%"+name+"%");
		    
			// We get a generic object list
			products = query.list();

		return products;
	}

}

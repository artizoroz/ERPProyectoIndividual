package org.sistema.springmvc.forms.models;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.Size;

/**
 * Represents a user.
 * 
 * @author Eugenia Pérez Martínez
 *
 */
@Entity
public class ProductType {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Size(min=1, message="Name must have a value")
	private String name;
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.EAGER, mappedBy="productType")
	private Set<Product> products;

	/**
	 * default constructor
	 */
	public ProductType() {
	}

	/**
	 * constructor with parameters
	 * @param id
	 * @param login
	 * @param description
	 * @param password
	 */
	public ProductType(int id, String login) {
		this.id = id;
		this.name = login;
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the products
	 */
	public Set<Product> getProducts() {
		return products;
	}

	/**
	 * @param products the products to set
	 */
	public void setProducts(Set<Product> products) {
		this.products = products;
	}

	

}

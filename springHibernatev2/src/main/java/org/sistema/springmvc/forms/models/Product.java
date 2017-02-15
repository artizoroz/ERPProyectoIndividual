package org.sistema.springmvc.forms.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * Represents a Task.
 * 
 * @author Eugenia Pérez Martínez
 *
 */
@Entity
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Size(min=1, message="Name must have a value")
	private String name;
	
	@Size(min=1, message="Description must have a value")
	private String description;
	
	//@Size(min=1, message="Pvp must have a numeric value")
	@Min(0)
	private Double pvp;
	@ManyToOne
	private ProductType productType;
	
	/**
	 * default constructor
	 */
	public Product () {
		
	}
	
	/**
	 * @param id
	 * @param name
	 * @param description
	 * @param productType
	 */
	public Product(int id, String name, String description, Double pvp, ProductType productType) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.pvp = pvp;
		this.productType = productType;
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
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the productType
	 */
	public ProductType getProductType() {
		return productType;
	}

	/**
	 * @param productType the productType to set
	 */
	public void setProductType(ProductType productType) {
		this.productType = productType;
	}

	/**
	 * @return the pvp
	 */
	public Double getPvp() {
		return pvp;
	}

	/**
	 * @param pvp the pvp to set
	 */
	public void setPvp(Double pvp) {
		this.pvp = pvp;
	}

	

	

}

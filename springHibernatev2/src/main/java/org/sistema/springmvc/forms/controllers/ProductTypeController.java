package org.sistema.springmvc.forms.controllers;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.sistema.springmvc.forms.dao.ProductDAO;
import org.sistema.springmvc.forms.dao.ProductTypeDAO;
import org.sistema.springmvc.forms.models.Product;
import org.sistema.springmvc.forms.models.ProductType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Controller for users.
 * 
 * @author Eugenia Pérez Martínez
 *
 */
@Controller
public class ProductTypeController {
	private static final Logger logger = LoggerFactory
			.getLogger(ProductTypeController.class);

	@Autowired
	private ProductTypeDAO productTypeDAO;
	@Autowired
	private ProductDAO productDAO;


	/**
	 * handles default /productTypes
	 * 
	 * @param model
	 * @return the name of the view to show RequestMapping({"/productTypes"})
	 */

	@RequestMapping(method = RequestMethod.GET, value = { "/", "/productTypes" })
	public String showProductTypes(Map<String, Object> model) {
		logger.info("ProductType showProductTypes. ");

		
		List<ProductType> productTypes = productTypeDAO.selectAll(ProductType.class);
		model.put("productTypes", productTypes);

		return "productType/productTypes";
	}

	/**
	 * handles default /productTypes/id
	 * 
	 * @param model
	 * @return the name of the view to show RequestMapping({"/productTypes/{id}"})
	 */
	@RequestMapping(method = RequestMethod.GET, value = { "/productTypes/{id}" })
	public String productTypeDetail(@PathVariable(value = "id") Integer id,
			Map<String, Object> model) {
		logger.info("ProductType detail");

		ProductType productType = productTypeDAO.selectById(id, ProductType.class);
		//The user gets his own collection of tasks load
		model.put("productTypes", productType);
		model.put("products", productType.getProducts());
		
		// We add task for the new task form
		//Producto product = new Producto();
		//product.setProductType(productType);
		//model.put("product", product);

		return "productType/productTypeDetail";
	}
	
	
	/**
	 * handles /productTypes/new by GET
	 * 
	 * @return the name of the view to show RequestMapping({"/productTypes/new"})
	 */
	@RequestMapping(method = RequestMethod.GET, value = { "/productTypes/new" })
	public String newProductType(Map<String, Object> model) {
		logger.info("Showing custom view GET ");

		model.put("productType", new ProductType());

		return "productType/newProductType";
	}

	/**
	 * handles /productTypes/new by POST
	 * 
	 * @return the name of the view to show RequestMapping({"/productTypes/new"})
	 */
	@RequestMapping(method = RequestMethod.POST, value = { "/productTypes/new" })
	public ModelAndView createProductType(@Valid ProductType productType, BindingResult bindingResult) {
		logger.info("Saveview POST " + productType.getId());

		ModelAndView modelAndView = new ModelAndView();
		
		if (bindingResult.hasErrors()) {
			modelAndView.setViewName("productType/newProductType");
			modelAndView.addObject("productType", productType);
			return modelAndView;
		}

		productTypeDAO.insert(productType);
			// We return view name
			modelAndView.setViewName("productType/created");
			modelAndView.addObject("productType", productType);
		
		return modelAndView;
	}

	
	
	
	/**
	 * Simply selects the update view
	 */
	@RequestMapping(value = "/productTypes/update/{id}", method = RequestMethod.GET)
	public String update(@PathVariable(value = "id") Integer productTypeId, Model model) {
		logger.info("Showing update view GET ");

		// We find the user through DAO and load into model
		model.addAttribute("productType", productTypeDAO.selectById(productTypeId, ProductType.class));

		return "productType/update";
	}

	/**
	 * Handles the POST from the Custom.jsp page to update the ProductType.
	 */
	@RequestMapping(value = "/productType/saveupdate", method = RequestMethod.POST)
	public ModelAndView saveUpdate(@Valid ProductType productType, BindingResult bindingResult) {
		logger.info("Save update " + productType.getId());
		
		ModelAndView modelAndView = new ModelAndView();
		
		if (bindingResult.hasErrors()) {
			modelAndView.setViewName("productType/update");
			modelAndView.addObject("productType", productType);
			return modelAndView;
		}
		
		productTypeDAO.update(productType);

		

		// We pass the user received through this object
		modelAndView.addObject("productType", productType);

		// The same as return "user/saveUpdate"
		modelAndView.setViewName("productType/saveUpdated");
		return modelAndView;
	}
	
	

	/**
	 * Delete the specific productType
	 */
	@RequestMapping(value = "/productTypes/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable(value = "id") Integer productTypeId, Model model) {
		logger.info("ProductType detail /delete");
		
		productTypeDAO.delete(productTypeDAO.selectById(productTypeId, ProductType.class));
		model.addAttribute("userId", productTypeId);

		return "productType/deleted";
	}
	

}

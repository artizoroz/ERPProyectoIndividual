package org.sistema.springmvc.forms.controllers;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.sistema.springmvc.forms.dao.GenericDAO;
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
public class ProductController {
	private static final Logger logger = LoggerFactory
			.getLogger(ProductController.class);

	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private ProductTypeDAO productTypeDAO;

	/**
	 * handles /products/id
	 * 
	 * @param model
	 * @return the name of the view to show RequestMapping({"/products/{id}"})
	 */
	@RequestMapping(method = RequestMethod.GET, value = { "/products/{id}" })
	public String productTypeProductDetail(@PathVariable(value = "id") Integer id,
			Map<String, Object> model) {
		logger.info("ProductType product detail");

		Product product = productDAO.selectById(id, Product.class);
		model.put("product", product);

		return "product/productDetail";
	}
	
	/**
	 * handles /productTypes/new by GET
	 * 
	 * @return the name of the view to show RequestMapping({"/products/new"})
	 */
	@RequestMapping(method = RequestMethod.GET, value = { "/products/new" })
	public String newProduct(Map<String, Object> model) {
		logger.info("Showing custom view GET ");
		
		List<ProductType> productTypes = productTypeDAO.selectAll(ProductType.class);
		model.put("productType", productTypes);
		model.put("product", new Product());

		return "product/newProduct";
	}
	

	/**
	 * handles /productTypes/product/new by POST
	 * 
	 * @return the name of the view to show RequestMapping({"/products/new"})
	 */
	@RequestMapping(method = RequestMethod.POST, value = { "/products/new" })
	public ModelAndView createProduct(@Valid Product product, BindingResult bindingResult) {
		
		ModelAndView modelAndView = new ModelAndView();

		if (bindingResult.hasErrors()){
			modelAndView.setViewName("product/newProduct");
			List<ProductType> productTypes = productTypeDAO.selectAll(ProductType.class);
			modelAndView.addObject("productType", productTypes);
			modelAndView.addObject("product", product);
			return modelAndView;
		}
		productDAO.insert(product);
			// We return view name
			modelAndView.setViewName("product/created");
			modelAndView.addObject("product", product);
			logger.info("Saveview POST " + product.getId());
		
		return modelAndView;
	}

	/**
	 * Simply selects the update view for products
	 */
	@RequestMapping(value = "/products/update/{id}", method = RequestMethod.GET)
	public String updateProduct(@PathVariable(value = "id") Integer productId,
			Model model) {
		logger.info("Showing update task view GET ");
		

		// We find the task through DAO and load into model
		List<ProductType> productTypes = productTypeDAO.selectAll(ProductType.class);
		model.addAttribute("productType", productTypes);
		model.addAttribute("product", productDAO.selectById(productId, Product.class));

		return "product/update";
	}

	/**
	 * Handles the POST from the Custom.jsp page to update the ProductType.
	 */
	@RequestMapping(value = "/products/saveupdate", method = RequestMethod.POST)
	public ModelAndView saveUpdateProduct(@Valid Product product, BindingResult bindingResult) {
		logger.info("Save update task " + product.getId());
		
		ModelAndView modelAndView = new ModelAndView();
		
		if (bindingResult.hasErrors()){
			modelAndView.setViewName("product/update");
			List<ProductType> productTypes = productTypeDAO.selectAll(ProductType.class);
			modelAndView.addObject("productType", productTypes);
			modelAndView.addObject("product", product);
			return modelAndView;
		}

		productDAO.update(product);

		

		// We pass the user received through this object
		modelAndView.addObject("product", product);

		// The same as return "user/saveUpdate"
		modelAndView.setViewName("product/saveUpdated");
		return modelAndView;
	}

	/**
	 * Delete the specific product
	 */
	@RequestMapping(value = "/products/delete/{id}", method = RequestMethod.GET)
	public String deleteProduct(@PathVariable(value = "id") Integer productId,
			Model model) {
		logger.info("ProductType detail /delete product: " + productId);

		// Store the concrete task to send it back before deleting to use it in
		// the following view.
		Product product = productDAO.selectById(productId, Product.class);
		model.addAttribute("task", product);

		productDAO.delete(product);

		return "product/deleted";
	}

}

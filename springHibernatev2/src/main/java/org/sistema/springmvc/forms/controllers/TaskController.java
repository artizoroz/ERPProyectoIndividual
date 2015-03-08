package org.sistema.springmvc.forms.controllers;

import java.util.Map;

import org.sistema.springmvc.forms.dao.GenericDAO;
import org.sistema.springmvc.forms.models.Task;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
public class TaskController {
	private static final Logger logger = LoggerFactory
			.getLogger(TaskController.class);

	@Autowired
	private GenericDAO<Task> taskDAO;

	/**
	 * handles /tasks/id
	 * 
	 * @param model
	 * @return the name of the view to show RequestMapping({"/users/{id}"})
	 */
	@RequestMapping(method = RequestMethod.GET, value = { "/tasks/{id}" })
	public String userTaskDetail(@PathVariable(value = "id") Integer id,
			Map<String, Object> model) {
		logger.info("User task detail");

		Task task = taskDAO.selectById(id, Task.class);
		model.put("task", task);

		return "task/taskDetail";
	}

	/**
	 * handles /users/task/new by POST
	 * 
	 * @return the name of the view to show RequestMapping({"/users/new"})
	 */
	@RequestMapping(method = RequestMethod.POST, value = { "/tasks/new" })
	public ModelAndView createTask(Task task) {
		
		ModelAndView modelAndView = new ModelAndView();

		taskDAO.insert(task);
			// We return view name
			modelAndView.setViewName("task/created");
			modelAndView.addObject("task", task);
			logger.info("Saveview POST " + task.getId());
		
		return modelAndView;
	}

	/**
	 * Simply selects the update view for tasks
	 */
	@RequestMapping(value = "/tasks/update/{id}", method = RequestMethod.GET)
	public String updateTask(@PathVariable(value = "id") Integer taskId,
			Model model) {
		logger.info("Showing update task view GET ");

		// We find the task through DAO and load into model
		model.addAttribute("task", taskDAO.selectById(taskId,Task.class));

		return "task/update";
	}

	/**
	 * Handles the POST from the Custom.jsp page to update the User.
	 */
	@RequestMapping(value = "/tasks/saveupdate", method = RequestMethod.POST)
	public ModelAndView saveUpdateTask(Task task) {
		logger.info("Save update task " + task.getId());

		taskDAO.update(task);

		ModelAndView modelAndView = new ModelAndView();

		// We pass the user received through this object
		modelAndView.addObject("task", task);

		// The same as return "user/saveUpdate"
		modelAndView.setViewName("task/saveUpdated");
		return modelAndView;
	}

	/**
	 * Delete the specific task
	 */
	@RequestMapping(value = "/tasks/delete/{id}", method = RequestMethod.GET)
	public String deleteTask(@PathVariable(value = "id") Integer taskId,
			Model model) {
		logger.info("User detail /delete task: " + taskId);

		// Store the concrete task to send it back before deleting to use it in
		// the following view.
		Task task = taskDAO.selectById(taskId, Task.class);
		model.addAttribute("task", task);

		taskDAO.delete(task);

		return "task/deleted";
	}

}

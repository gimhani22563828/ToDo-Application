package com.example.ToDo_App.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.ToDo_App.model.ToDo;
import com.example.ToDo_App.service.ToDoService;

@Controller
public class ToDoController {

	@Autowired
	private ToDoService service;  // Service layer for managing ToDo items

	// Method to view all ToDo items and display message if any
	@GetMapping({"/", "viewToDoList"})
	public String viewAllToDoItems(Model model, @ModelAttribute("message") String message) {
		// 'model' holds the data for the view (like list of ToDos and message)
		// 'message' is a flash attribute passed from redirect for status updates
		model.addAttribute("list", service.getAllToDoItems());
		model.addAttribute("message", message);
		
		// Return the name of the view template for displaying ToDo list
		return "ViewToDoList";
	}

	// Method to update the status of a ToDo item by its ID
	@GetMapping("/updateToDoStatus/{id}")
	public String updateToDoStatus(@PathVariable Long id, RedirectAttributes redirectAttributes) {
		// 'id' is the ToDo item's unique identifier extracted from the URL path
		// 'redirectAttributes' is used to pass flash attributes for status messages
		if (service.updateStatus(id)) {
			redirectAttributes.addFlashAttribute("message", "Update Success");
			return "redirect:/viewToDoList";  // Redirect after successful update
		}
		
		redirectAttributes.addFlashAttribute("message", "Update Failure");
		return "redirect:/viewToDoList";  // Redirect on failure
	}

	// Method to display the form for adding a new ToDo item
	@GetMapping("/addToDoItem")
	public String addToDoItem(Model model) {
		// 'model' holds data for the view; in this case, a new empty ToDo object
		model.addAttribute("todo", new ToDo());
		
		// Return the name of the view template for adding ToDo item
		return "AddToDoItem";
	}

	// Method to save a new ToDo item after form submission
	@PostMapping("/saveToDoItem")
	public String saveToDoItem(@ModelAttribute("todo") ToDo todo, RedirectAttributes redirectAttributes) {
		// 'todo' is the form data that gets mapped to the ToDo object
		// 'redirectAttributes' holds flash attributes to pass messages between redirects
		try {
			if (service.saveOrUpdateToDoItem(todo)) {
				redirectAttributes.addFlashAttribute("message", "Save Success");
				return "redirect:/viewToDoList";  // Redirect after successful save
			}
		} catch (Exception e) {
			// In case of an error, pass the exception message as a failure message
			redirectAttributes.addFlashAttribute("message", "Save Failure: " + e.getMessage());
		}
		
		redirectAttributes.addFlashAttribute("message", "Save Failure");
		return "redirect:/addToDoItem";  // Redirect back if save fails
	}
	
	// Method to display the form for editing a ToDo item
	@GetMapping("/editToDoItem/{id}")
	public String editToDoItem(@PathVariable Long id, Model model) {
		// 'model' is used to pass the ToDo object to the view for editing
		model.addAttribute("todo", service.getToDoItemById(id));
		
		// Return the name of the view template for editing the ToDo item
		return "EditToDoItem";
	}

	// Method to save the edited ToDo item
	@PostMapping("/editSaveToDoItem")
	public String editSaveToDoItem(@ModelAttribute("todo") ToDo todo, RedirectAttributes redirectAttributes) {
		
		// 'redirectAttributes' is used to pass flash attributes (success/failure messages)
		try {
			if (service.saveOrUpdateToDoItem(todo)) {
				redirectAttributes.addFlashAttribute("message", "Edit Success");
				return "redirect:/viewToDoList";  // Redirect after successful edit
			}
		} catch (Exception e) {
			// In case of an error, pass the exception message as a failure message
			redirectAttributes.addFlashAttribute("message", "Edit Failure: " + e.getMessage());
		}
		
		redirectAttributes.addFlashAttribute("message", "Edit Failure");
		return "redirect:/editToDoItem/" + todo.getId();  // Redirect back to edit page on failure
	}
	
	// Method to delete a ToDo item by its ID
	@GetMapping("/deleteToDoItem/{id}")
	public String deleteToDoItem(@PathVariable Long id, RedirectAttributes redirectAttributes) {
		
		// 'redirectAttributes' is used to pass status messages after delete operation
		if (service.deleteToDoItem(id)) {
			redirectAttributes.addFlashAttribute("message", "Delete Success");
			return "redirect:/viewToDoList";  // Redirect after successful delete
		}
		
		redirectAttributes.addFlashAttribute("message", "Delete Failure");
		return "redirect:/viewToDoList";  // Redirect back if delete fails
	}
}

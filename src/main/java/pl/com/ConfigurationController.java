package pl.com;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import pl.com.configurator.*;
import pl.com.configurator.ConfigurationDTO.service.AccessService;;

@RestController
public class ConfigurationController {

	@Autowired
	private AccessService AccessService;

	@RequestMapping("/configuration")
	public ModelAndView config() {
		
	ModelAndView model = new ModelAndView("configuration");
	
		return model;
	}

	@PostMapping("/configuration")
	public ModelAndView setConfig(@RequestParam String p1, @RequestParam String p2) {
		
		
		
		
		return new ModelAndView("redirect:/"); 
	}	
	
}

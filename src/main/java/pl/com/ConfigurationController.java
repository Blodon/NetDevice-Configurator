package pl.com;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import pl.com.configurator.*;
import pl.com.configurator.ConfigurationDTO.ConfigurationDTO;
import pl.com.configurator.ConfigurationDTO.service.AccessService;


@RestController
public class ConfigurationController {

	@Autowired
	private AccessService AccessService;

	
	/** Configuration Menu **/
	@RequestMapping("/configuration")
	public ModelAndView config() {
		
		ModelAndView model = new ModelAndView("configuration");
	
		return model;
	}

	@PostMapping("/configuration")
	public ModelAndView setConfig(@RequestParam String name) {
		
		ConfigurationDTO c = new ConfigurationDTO();
		c.setName(name);
		
		AccessService.saveConfigurationData(c);
		
		return new ModelAndView("redirect:/"); 
	}	
	
	
	/** Serial connection configuration **/
	@RequestMapping("/configuration/serial")
	public ModelAndView serialConfigCON() {
		
		ModelAndView model = new ModelAndView("INconfiguration/serial");
	
		return model;
	}	
	
	/** SSH connection configuration **/
	@RequestMapping("/configuration/ssh")
	public ModelAndView sshConfigCON() {
		
		ModelAndView model = new ModelAndView("INconfiguration/ssh");
	
		return model;
	}	
	
	/** Telnet connection configuration **/
	@RequestMapping("/configuration/telnet")
	public ModelAndView telnetConfigCON() {
		
		ModelAndView model = new ModelAndView("INconfiguration/telnet");
	
		return model;
	}	
	
	/** Raw text view **/
	@RequestMapping("/configuration/raw")
	public ModelAndView serialConfig() {
		
		ModelAndView model = new ModelAndView("INconfiguration/raw");
		
		String config;
		ConfigGenerator a = new ConfigGenerator();
		
		config = a.print(AccessService.getAllConfigurationData().get(0));
		
		model.addObject("config", config);
	
		return model;
	}
	
}

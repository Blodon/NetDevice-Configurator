package pl.com;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import pl.com.configurator.ConfigGenerator;
import pl.com.configurator.Parameters;
import pl.com.configurator.ConfigurationDTO.ConfigurationDTO;
import pl.com.configurator.ConfigurationDTO.service.AccessService;

import pl.com.configurator.Serial.SerialConnect;


@RestController
public class ConfigurationController {

	@Autowired
	private AccessService AccessService;
	
	private Parameters parameters = new Parameters();

	private SerialConnect serialConnect = new SerialConnect();
	
	/** Configuration Menu **/
	@RequestMapping("/configuration")
	public ModelAndView config() {
		
		ModelAndView model = new ModelAndView("configuration");
	
		return model;
	}

	@PostMapping(value = "/configuration")
	public ModelAndView setConfig(@RequestParam String name, @RequestParam String password) {
		
		ConfigurationDTO c = new ConfigurationDTO();
		c.setName(name);
		c.setPassword(password);
		
		AccessService.saveConfigurationData(c);
		
		return new ModelAndView("redirect:/"); 
	}	
	
	
	/** Serial connection configuration **/
	@RequestMapping("/configuration/serial")
	public ModelAndView serialConfigCON() {
		
		ModelAndView model = new ModelAndView("INconfiguration/serial");
		if(serialConnect.showPortList().size()!=0) model.addObject("portList",serialConnect.showPortList());
	
		return model;
	}	
	

	@PostMapping(value = "/serial")
	public String receiveParamSerial(
			@RequestParam(value = "serialPort") String serialPort,
			@RequestParam(value = "serialBaudrate") Integer serialBaudrate,
			@RequestParam(value = "serialDataBits") Integer serialDataBits,
			@RequestParam(value = "serialStopBits") Integer serialStopBits,
			@RequestParam(value = "serialParityBits") String serialParityBits,
			@RequestParam(value = "serialFlowControl") String serialFlowControl) {
		
			if(parameters.setSerialParameters(serialPort,
					serialBaudrate,
					serialDataBits,
					serialStopBits,
					serialParityBits,
					serialFlowControl))
					return "200";
		
		
		return "400"; 
	}	
	
	
	/** SSH connection configuration **/
	@RequestMapping("/configuration/ssh")
	public ModelAndView sshConfigCON() {
		
		ModelAndView model = new ModelAndView("INconfiguration/ssh");
	
		return model;
	}	
	

	@PostMapping(value = "/ssh")
	public String receiveParamSSH(
			@RequestParam(value = "sshIP") String sshIP,
			@RequestParam(value = "sshPort") Integer sshPort) {
		
		if(parameters.setSSHParameters(sshIP, sshPort)) return "200";
		
		return "400"; 
	}	
	
	
	/** Telnet connection configuration **/
	@RequestMapping("/configuration/telnet")
	public ModelAndView telnetConfigCON() {
		
		ModelAndView model = new ModelAndView("INconfiguration/telnet");
	
		return model;
	}	
	

	@PostMapping(value = "/telnet")
	public String receiveParamTelnet(
			@RequestParam(value = "telnetIP") String telnetIP,
			@RequestParam(value = "telnetPort") Integer telnetPort) {
		
		if(parameters.setTelnetParameters(telnetIP, telnetPort)) return "200";
		
		return "400"; 
	}	
	
	
	/** Raw text view **/
	@RequestMapping("/configuration/raw")
	public ModelAndView serialConfig() {
		
		ModelAndView model = new ModelAndView("INconfiguration/raw");
		
		//String config ="";
		ConfigGenerator configGenerator = new ConfigGenerator();
		
		//config = configGenerator.print(AccessService.getAllConfigurationData().get(0));
		
		model.addObject("config", configGenerator.print(AccessService.getAllConfigurationData().get(0)));
		model.addObject("configLines", configGenerator.linesCount());
		
		return model;
	}
	
}

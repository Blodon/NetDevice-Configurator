package pl.com;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	private int sessionID = 0;
	
	/** Configuration Menu **/
	@RequestMapping("/configuration")
	public ModelAndView config() {
		
		sessionID++;
		ModelAndView model = new ModelAndView("configuration");
		model.addObject("sessionID", sessionID);
	
		return model;
	}

	@PostMapping(value = "/configuration/basic1")
	public String setBasicConfig1(
			@RequestParam(value = "basicHostname") String hostname,
			@RequestParam(value = "basicPassword")  String password) {
		
		ConfigurationDTO c = new ConfigurationDTO();
		c.setName(hostname);
		c.setPassword(password);
		
		AccessService.saveConfigurationData(c);
		
		return "200"; 
	}	

	@PostMapping(value = "/configuration/basic2")
	public String setBasicConfig2(
			@RequestParam(value = "basic-Banner") String banner,
			@RequestParam(value = "basic-LineConPass")  String lineConPass) {
		
		if(banner.equals("DEBUG"))return "200"; 
		else return "400";
	}	
	
	
	/** Serial connection configuration **/
	@RequestMapping("/configuration/serial")
	public ModelAndView serialConfigCON() {
		
		ModelAndView model = new ModelAndView("INconfiguration/serial");
		if(serialConnect.showPortList().size()!=0) model.addObject("portList",serialConnect.showPortList());
		model.addObject("typedParameters", parameters.typedSerialSettings());
	
		return model;
	}	
	

	@PostMapping(value = "/serial")
	public String receiveParamSerial(
			@RequestParam(value = "serialPort") String serialPort,
			@RequestParam(value = "serialBaudrate") String serialBaudrate,
			@RequestParam(value = "serialDataBits") String serialDataBits,
			@RequestParam(value = "serialStopBits") String serialStopBits,
			@RequestParam(value = "serialParityBits") String serialParityBits,
			@RequestParam(value = "serialFlowControl") String serialFlowControl) {
		
				
				Integer serialBaudrateI = Integer.parseInt(serialBaudrate);
				Integer serialDataBitsI = Integer.parseInt(serialDataBits);
				Integer serialStopBitsI = Integer.parseInt(serialStopBits);
		
			if(parameters.setSerialParameters(serialPort,
					serialBaudrateI,
					serialDataBitsI,
					serialStopBitsI,
					serialParityBits,
					serialFlowControl)) return "200";
			
		//	System.out.println(parameters.typedSerialSettings());
			
					return "400";
		
		
					
	}	
	
	
	/** SSH connection configuration **/
	@RequestMapping("/configuration/ssh")
	public ModelAndView sshConfigCON() {
		
		ModelAndView model = new ModelAndView("INconfiguration/ssh");
		model.addObject("typedParameters", parameters.typedSSHSettings());
		
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
		model.addObject("typedParameters", parameters.typedTelnetSettings());
		
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
		
		ConfigGenerator configGenerator = new ConfigGenerator();
		
		
		model.addObject("config", configGenerator.print(AccessService.getAllConfigurationData().get(0)));
		model.addObject("configLines", configGenerator.linesCount());
		
		return model;
	}
	
}

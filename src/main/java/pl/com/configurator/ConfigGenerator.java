package pl.com.configurator;

import pl.com.configurator.ConfigurationDTO.ConfigurationDTO;

public class ConfigGenerator {

	private String config;
	
	public String print(ConfigurationDTO confDTO) {

		config += "enable";
		config +="/r/n";
		config += "conf term";
		config +="/r/n";
		config += "name ";
		config += confDTO.getName();
		
		
		
		return config;		
	}
}

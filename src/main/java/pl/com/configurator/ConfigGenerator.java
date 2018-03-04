package pl.com.configurator;

import pl.com.configurator.ConfigurationDTO.ConfigurationDTO;

public class ConfigGenerator {

	private String config;
	private int lines;
	
	/** for serial and raw configuration (with command "enable") **/
	public ConfigGenerator() {
		lines = 0;
		config = writeln("enable");
	}
	
	
	/** Configuration for SSH / telnet (without command "enable") **/
	public ConfigGenerator(boolean overNet) {
		lines = 0;
	}
	
	
	/** return configuration - use here commands **/
	public String print(ConfigurationDTO confDTO) {

		addline("conf term");
		addCommand("name", confDTO.getName());
		addCommand("enable secret", confDTO.getPassword());
		
		
		return config;		
	}
	
	
	
	public int linesCount() {
		
		return lines;
	}
	
	private String writeln(String command) {
		
		command = command + "\r\n";
		
		lines++;
		
		return command;
	}

	private void addline(String command) {
		
		config += writeln(command);
		
		lines++;
	
	}
	
	private void addCommand(String command, String value) {

		config += command;
		config += " ";
		config += value;
		config += "\r\n";
		
		lines++;
			
	}
	
}

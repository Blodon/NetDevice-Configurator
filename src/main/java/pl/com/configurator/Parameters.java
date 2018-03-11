package pl.com.configurator;


public class Parameters {

	private String serialPort;
	private Integer serialBaudrate;
	private Integer serialDataBits;
	private Integer serialStopBits;
	private String serialParityBits;
	private String serialFlowControl;

	private String sshIP;
	private Integer sshPort;
	
	private String telnetIP;
	private Integer telnetPort;
	
	
	public Parameters(){
		serialBaudrate = 9600;
		serialDataBits = 8;
		serialStopBits = 1;
		serialParityBits = "None";
		serialFlowControl = "None";
	}
	
	public boolean setSerialParameters(String serialPort,
			Integer serialBaudrate,
			Integer serialDataBits,
			Integer serialStopBits,
			String serialParityBits,
			String serialFlowControl) {
		
		this.serialPort = serialPort;
		this.serialBaudrate = serialBaudrate;
		this.serialDataBits = serialDataBits;
		this.serialStopBits = serialStopBits;
		this.serialParityBits = serialParityBits;
		this.serialFlowControl = serialFlowControl;
		
		return true;
		
	}

	
	public boolean setSSHParameters(String sshIP, Integer sshPort) {
		
		this.sshIP = sshIP;
		this.sshPort = sshPort;
		
		return true;
	}
	
	
	public boolean setTelnetParameters(String telnetIP, Integer telnetPort) {
		
		this.telnetIP = telnetIP;
		this.telnetPort = telnetPort;
		
		return true;
	}
	
	public String[] showCurrentSerialParameters() {
		
		String params[] = {
				serialPort,
				serialBaudrate.toString(),
				serialDataBits.toString(),
				serialStopBits.toString(),
				serialParityBits,
				serialFlowControl	
		};
		
		return params;
	}	
	
	public String[] showCurrentSSHParameters() {
		
		String params[] = {
				sshIP,
				sshPort.toString()	
		};
		
		return params;
	}	
	
	public String[] showCurrentTelnetParameters() {
		
		String params[] = {
				telnetIP,
				telnetPort.toString()	
		};
		
		return params;
	}

	public String typedSerialSettings() {
		
		String settings;
		
		settings = serialBaudrate.toString();
		settings += ", ";
		settings += serialDataBits.toString();
		settings += ", ";
		settings += serialStopBits.toString();
		settings += ", ";
		settings += serialParityBits;
		settings += ", ";
		settings += serialFlowControl;
		
		
		return settings;
	}
	
}

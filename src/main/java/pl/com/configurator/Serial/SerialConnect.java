package pl.com.configurator.Serial;

import java.util.Arrays;

import java.util.List;
import jssc.*;


public class SerialConnect {
	
	private List<String> portList;
	private static SerialPort serialConnection;
	private String receivedData = "";
	
	
	public SerialConnect() {
	
		serialPortListRefresh();
	
	}

	
	private void serialPortListRefresh() {
		
		portList = Arrays.asList(SerialPortList.getPortNames());
	
	}
	
	public List<String> showPortList(){
		
		serialPortListRefresh();
		
		return portList;
	}
	
	
	
	public void connectPort(String portName ) throws SerialPortException {
	
	if(serialConnection.isOpened()) serialConnection.closePort();
		
	 serialConnection = new SerialPort(portName);
	
	 serialConnection.openPort();
		
	}
	
	
	public boolean connectionParameters(int baudRate, int dataBits, int stopBits, int parity, boolean setRTS, boolean setDTR) {
		
		try {
			
			serialConnection.setParams(baudRate, dataBits, stopBits, parity, setRTS, setDTR);
			
			serialConnection.addEventListener(new SerialPortEventListener() {
				
				@Override
				public void serialEvent(SerialPortEvent serialEvent) {
					
				        if(serialEvent.isRXCHAR() && serialEvent.getEventValue() > 0) {
				            try {
				                receivedData += serialConnection.readString(serialEvent.getEventValue());
				                receivedData += "\r\n";

				            }
				            catch (SerialPortException ex) {
				                receivedData += "!!! Error in receiving string from COM-port: ";
				                receivedData +=  ex;
				            }
				        }
				}
			}, SerialPort.MASK_RXCHAR);
			
			return true;
		
		} catch (SerialPortException e) {
			
			e.printStackTrace();
		
			return false;
		}
		
	}
	
	public String writeReceivedData() {
		
		return receivedData;
	}
	
	
	public void writeConfig(String config) {
		
		try {
			serialConnection.writeString(config);
		} catch (SerialPortException e) {
			e.printStackTrace();
		}
		
	}
	
	
}

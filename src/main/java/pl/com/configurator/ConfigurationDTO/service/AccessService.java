package pl.com.configurator.ConfigurationDTO.service;

import java.util.List;

import pl.com.configurator.ConfigurationDTO.ConfigurationData;
import pl.com.configurator.ConfigurationDTO.ConfigurationDTO;

public interface AccessService {

	public void saveConfigurationData(ConfigurationDTO configurationDTO);

	public List<ConfigurationDTO> getAllConfigurationData();

	public ConfigurationData mapDTOToEntity(ConfigurationDTO configurationDTO);

	public ConfigurationDTO mapEntityToDTO(ConfigurationData configurationData);
	
}

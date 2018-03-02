package pl.com.configurator.ConfigurationDTO.service.implementation;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import  pl.com.configurator.ConfigurationDTO.ConfigurationData;
import  pl.com.configurator.ConfigurationDTO.ConfigurationDTO;
import  pl.com.configurator.ConfigurationDTO.repository.ConfigurationRepository;
import pl.com.configurator.ConfigurationDTO.service.AccessService;


@Service
public class AccessServiceImplementation implements AccessService {
	
	@Autowired
	private ConfigurationRepository ConfigurationRepository;

	@Override
	public void saveConfigurationData(ConfigurationDTO configurationDTO) {
		
		ConfigurationRepository.save(mapDTOToEntity(configurationDTO));
	}

	@Override
	public ConfigurationDTO mapEntityToDTO(ConfigurationData e) {
		ConfigurationDTO configurationDTO = new ConfigurationDTO();
		
		configurationDTO.setName(e.getName());
		
		return configurationDTO;
	}

	
	public List<ConfigurationDTO> getAllConfigurationData(){
		
		return ConfigurationRepository.findAll().stream().map(e -> mapEntityToDTO(e)).collect(Collectors.toList());
		
	}
	
	public ConfigurationData mapDTOToEntity(ConfigurationDTO configurationDTO){
		
		ConfigurationData configurationData = new ConfigurationData();
		
		configurationData.setName(configurationDTO.getName());
		
		return configurationData;
	}


	
}

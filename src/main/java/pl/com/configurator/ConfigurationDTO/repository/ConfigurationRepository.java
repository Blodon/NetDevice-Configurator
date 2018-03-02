package pl.com.configurator.ConfigurationDTO.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pl.com.configurator.ConfigurationDTO.ConfigurationData;

@Repository
public interface ConfigurationRepository extends JpaRepository<ConfigurationData, Long> {

}

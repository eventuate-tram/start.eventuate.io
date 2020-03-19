package io.spring.start.site;

import io.spring.initializr.metadata.InitializrProperties;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.NestedConfigurationProperty;

@ConfigurationProperties("custom")
class CustomInitializrProperties {

	@NestedConfigurationProperty
	private InitializrProperties initializr;

	public InitializrProperties getInitializr() {
		return initializr;
	}

	public void setInitializr(InitializrProperties initializr) {
		this.initializr = initializr;
	}
}

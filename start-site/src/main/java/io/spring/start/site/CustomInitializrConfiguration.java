package io.spring.start.site;

import io.spring.initializr.generator.spring.build.BuildCustomizer;
import io.spring.initializr.metadata.InitializrMetadataBuilder;
import io.spring.initializr.metadata.InitializrProperties;
import io.spring.initializr.web.support.DefaultInitializrMetadataProvider;
import io.spring.initializr.web.support.InitializrMetadataUpdateStrategy;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@EnableConfigurationProperties(CustomInitializrProperties.class)
public class CustomInitializrConfiguration {

	@Bean
	public DefaultInitializrMetadataProvider customInitializrMetadataProvider(InitializrProperties initializrProperties,
																			  CustomInitializrProperties customInitializrProperties,
																			  InitializrMetadataUpdateStrategy initializrMetadataUpdateStrategy) {
		return new DefaultInitializrMetadataProvider(
				InitializrMetadataBuilder
						.fromInitializrProperties(customInitializrProperties.getInitializr())
						.withInitializrProperties(initializrProperties, true)
						.build(),
				initializrMetadataUpdateStrategy);
	}

	@Bean
	public BuildCustomizer customMavenBuildCustomizer() {
		return new CustomMavenBuildCustomizer();
	}

	@Bean
	public BuildCustomizer customGradleBuildCustomizer() {
		return new CustomGradleBuildCustomizer();
	}
}

package io.spring.start.site;

import io.spring.initializr.generator.buildsystem.gradle.GradleBuild;
import io.spring.initializr.generator.spring.build.BuildCustomizer;


class CustomGradleBuildCustomizer implements BuildCustomizer<GradleBuild> {

	@Override
	public void customize(GradleBuild gradleBuild) {
		CustomRepositories.EVENTUATE_REPOSITORIES.forEach(gradleBuild.repositories()::add);
	}
}

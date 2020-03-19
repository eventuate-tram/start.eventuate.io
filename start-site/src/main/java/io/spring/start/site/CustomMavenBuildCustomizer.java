package io.spring.start.site;

import io.spring.initializr.generator.buildsystem.maven.MavenBuild;
import io.spring.initializr.generator.spring.build.BuildCustomizer;


class CustomMavenBuildCustomizer implements BuildCustomizer<MavenBuild> {

	@Override
	public void customize(MavenBuild mavenBuild) {
		CustomRepositories.EVENTUATE_REPOSITORIES.forEach(mavenBuild.repositories()::add);
	}
}

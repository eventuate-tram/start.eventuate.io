package io.spring.start.site;

import io.spring.initializr.generator.buildsystem.MavenRepository;

import java.util.Arrays;
import java.util.List;

public class CustomRepositories {

	public static final List<MavenRepository> EVENTUATE_REPOSITORIES = Arrays.asList(
			MavenRepository
					.withIdAndUrl("jcenter", "https://jcenter.bintray.com/")
					.name("jcenter")
					.build());

}

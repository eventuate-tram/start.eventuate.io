package io.spring.start.site;

import io.spring.initializr.generator.buildsystem.MavenRepository;

import java.util.Arrays;
import java.util.List;

public class CustomRepositories {
    public static final List<MavenRepository> EVENTUATE_REPOSITORIES = Arrays.asList(
            MavenRepository
                    .withIdAndUrl("eventuate-release", "https://dl.bintray.com/eventuateio-oss/eventuate-maven-release/")
                    .name("eventute-release")
                    .build(),
            MavenRepository
                    .withIdAndUrl("eventuate-rc", "https://dl.bintray.com/eventuateio-oss/eventuate-maven-rc")
                    .name("eventute-rc")
                    .build()
            );
}

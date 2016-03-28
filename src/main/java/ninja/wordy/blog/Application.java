package ninja.wordy.blog;

import org.apache.catalina.Context;
import org.hdiv.config.annotation.ExclusionRegistry;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.context.embedded.tomcat.TomcatContextCustomizer;
import org.springframework.boot.context.embedded.tomcat.TomcatEmbeddedServletContainerFactory;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.hdiv.config.annotation.configuration.HdivWebSecurityConfigurerAdapter;

@SpringBootApplication
public class Application extends SpringBootServletInitializer implements EmbeddedServletContainerCustomizer  /* TODO: uncomment to disable httponly cookies */ {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(Application.class);
    }

/* TODO: uncomment to disable httponly cookies */
    @Override
    public void customize(final ConfigurableEmbeddedServletContainer container) {
        ((TomcatEmbeddedServletContainerFactory) container).addContextCustomizers(new TomcatContextCustomizer() {
            @Override
            public void customize(Context context) {
                context.setUseHttpOnly(false);
            }
        });
    }

    @Bean
    public ApplicationWebSecurity applicationWebSecurity() {
        return new ApplicationWebSecurity();
    }

    protected static class ApplicationWebSecurity extends HdivWebSecurityConfigurerAdapter {

        @Override
        public void addExclusions(ExclusionRegistry registry) {
            registry.addUrlExclusions("/login","/signup","/search","/post");
        }
    }
}

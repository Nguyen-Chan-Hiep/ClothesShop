package com.ltweb.Config;

import java.nio.charset.Charset;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@SuppressWarnings("deprecation")
@Configuration
@EnableWebMvc
@ComponentScan(basePackages = { "com.ltweb" })
public class AppConfig extends WebMvcConfigurerAdapter {

	@Bean
	public InternalResourceViewResolver resolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setViewClass(JstlView.class);
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}

	@Bean
	public StringHttpMessageConverter stringHttpMessageConverter() {
		return new StringHttpMessageConverter(Charset.forName("UTF-8"));
	}

	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("utf-8");
		return resolver;
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/css/**").addResourceLocations("/resources/css/");
		registry.addResourceHandler("/resources/js/**").addResourceLocations("/resources/js/");
		registry.addResourceHandler("/resources/images/**").addResourceLocations("/resources/images/");
		registry.addResourceHandler("/resources/images/icons/**").addResourceLocations("/resources/images/icons/");
		registry.addResourceHandler("/resources/fonts/font-awesome-4.7.0/css/**")
				.addResourceLocations("/resources/fonts/font-awesome-4.7.0/css/");
		registry.addResourceHandler("/resources/fonts/font-awesome-4.7.0/fonts/**")
				.addResourceLocations("/resources/fonts/font-awesome-4.7.0/fonts/");
		registry.addResourceHandler("/resources/fonts/font-awesome-4.7.0/less/**")
				.addResourceLocations("/resources/fonts/font-awesome-4.7.0/less/");
		registry.addResourceHandler("/resources/fonts/font-awesome-4.7.0/scss/**")
				.addResourceLocations("/resources/fonts/font-awesome-4.7.0/scss/");
		registry.addResourceHandler("/resources/fonts/iconic/css/**")
				.addResourceLocations("/resources/fonts/iconic/css/");
		registry.addResourceHandler("/resources/fonts/iconic/fonts/**")
				.addResourceLocations("/resources/fonts/iconic/fonts/");
		registry.addResourceHandler("/resources/fonts/linearicons-v1.0.0/**")
				.addResourceLocations("/resources/fonts/linearicons-v1.0.0/");
		registry.addResourceHandler("/resources/fonts/linearicons-v1.0.0/WebFont/**")
				.addResourceLocations("/resources/fonts/linearicons-v1.0.0/WebFont/");
		registry.addResourceHandler("/resources/fonts/Montserrat/**")
				.addResourceLocations("/resources/fonts/Montserrat/");
		registry.addResourceHandler("/resources/fonts/PlayfairDisplay/**")
				.addResourceLocations("/resources/fonts/PlayfairDisplay/");
		registry.addResourceHandler("/resources/fonts/Poppins/**").addResourceLocations("/resources/fonts/Poppins/");
		/////////////////////// vendor/////////////////////

		registry.addResourceHandler("/resources/vendor/animate/**").addResourceLocations("/resources/vendor/animate/");
		registry.addResourceHandler("/resources/vendor/animsition/css/**")
				.addResourceLocations("/resources/vendor/animsition/css/");
		registry.addResourceHandler("/resources/vendor/animsition/js/**")
				.addResourceLocations("/resources/vendor/animsition/js/");
		registry.addResourceHandler("/resources/vendor/bootstrap/css/**")
				.addResourceLocations("/resources/vendor/bootstrap/css/");
		registry.addResourceHandler("/resources/vendor/bootstrap/js/**")
				.addResourceLocations("/resources/vendor/bootstrap/js/");
		registry.addResourceHandler("/resources/vendor/countdowntime/**")
				.addResourceLocations("/resources/vendor/countdowntime/");
		registry.addResourceHandler("/resources/vendor/css-hamburgers/**")
				.addResourceLocations("/resources/vendor/css-hamburgers/");
		registry.addResourceHandler("/resources/vendor/daterangepicker/**")
				.addResourceLocations("/resources/vendor/daterangepicker/");
		registry.addResourceHandler("/resources/vendor/isotope/**").addResourceLocations("/resources/vendor/isotope/");
		registry.addResourceHandler("/resources/vendor/jquery/**").addResourceLocations("/resources/vendor/jquery/");
		registry.addResourceHandler("/resources/vendor/jqueryui/**")
				.addResourceLocations("/resources/vendor/jqueryui/");
		registry.addResourceHandler("/resources/vendor/jqueryui/images/**")
				.addResourceLocations("/resources/vendor/jqueryui/images/");
		registry.addResourceHandler("/resources/vendor/jqueryui/external/jquery/**")
				.addResourceLocations("/resources/vendor/jqueryui/external/jquery/");
		registry.addResourceHandler("/resources/vendor/lightbox2/css/**")
				.addResourceLocations("/resources/vendor/lightbox2/css/");
		registry.addResourceHandler("/resources/vendor/lightbox2/images/**")
				.addResourceLocations("/resources/vendor/lightbox2/images/");
		registry.addResourceHandler("/resources/vendor/lightbox2/js/**")
				.addResourceLocations("/resources/vendor/lightbox2/js/");
		registry.addResourceHandler("/resources/vendor/MagnificPopup/**")
				.addResourceLocations("/resources/vendor/MagnificPopup/");
		registry.addResourceHandler("/resources/vendor/parallax100/**")
				.addResourceLocations("/resources/vendor/parallax100/");
		registry.addResourceHandler("/resources/vendor/perfect-scrollbar/**")
				.addResourceLocations("/resources/vendor/perfect-scrollbar/");
		registry.addResourceHandler("/resources/vendor/select2/**").addResourceLocations("/resources/vendor/select2/");
		registry.addResourceHandler("/resources/vendor/slick/**").addResourceLocations("/resources/vendor/slick/");
		registry.addResourceHandler("/resources/vendor/slick/fonts/**")
				.addResourceLocations("/resources/vendor/slick/fonts/");
		registry.addResourceHandler("/resources/vendor/sweetalert/**")
				.addResourceLocations("/resources/vendor/sweetalert/");
		registry.addResourceHandler("/resources/admin_resources/css/**")
				.addResourceLocations("/resources/admin_resources/css/");
		registry.addResourceHandler("/resources/admin_resources/js/**")
				.addResourceLocations("/resources/admin_resources/js/");
		registry.addResourceHandler("/resources/admin_resources/img/**")
				.addResourceLocations("/resources/admin_resources/img/");
		registry.addResourceHandler("/resources/admin_resources/jquery-ui-datepicker/**")
				.addResourceLocations("/resources/admin_resources/jquery-ui-datepicker/");
		registry.addResourceHandler("/resources/admin_resources/webfonts/**")
				.addResourceLocations("/resources/admin_resources/webfonts/");
	}
}

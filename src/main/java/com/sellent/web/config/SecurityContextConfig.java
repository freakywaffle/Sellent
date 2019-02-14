package com.sellent.web.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.ObjectPostProcessor;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

@Configuration
@ComponentScan(basePackages="com.sellent.web.config")
@EnableWebSecurity
public class SecurityContextConfig extends WebSecurityConfigurerAdapter {

   @Autowired
   private DataSource dataSource;
   @Autowired
   private AuthenticationSuccessHandler handler;
   
   @Override
   protected void configure(HttpSecurity http) throws Exception {
      http
         .authorizeRequests()
            .antMatchers("/member/login","/member/join",
	            		 "/member/findInfo","/member/idchk",
	            		 "/member/pwdFind","/member/idFind",
	            		 "/member/email-send","/member/file-upload",
	            		 "/member/changePwd"
            		)
               .access("permitAll")
            .antMatchers("/admin/**")
               .hasAnyRole("ADMIN")
            .antMatchers("/member/**","/category/reg",
            		     "/member/editInfo","/member/introduce",
            		     "/member/skill-send","member/delete-tech"
            		     )
               .hasAnyRole("MEMBER")
            .and()
         .formLogin()
            .loginPage("/member/login")
            .loginProcessingUrl("/member/login")
            .defaultSuccessUrl("/index")
            .successHandler(handler)
            .and()
         .logout()
            .logoutUrl("/member/logout")
            .logoutSuccessUrl("/index" )
            .invalidateHttpSession(true)
            .and()
         .csrf()
            .disable();
      
      
   }
   
   @Override
   protected void configure(AuthenticationManagerBuilder auth) throws Exception {
         
         auth
         .jdbcAuthentication()
         .passwordEncoder(new BCryptPasswordEncoder())
         .dataSource(dataSource)
         .usersByUsernameQuery(
                     "select id, password, enabled from member where id=?")
         .authoritiesByUsernameQuery(
                     "select id, role from member_role where id=?");
         
   }
   
   
}
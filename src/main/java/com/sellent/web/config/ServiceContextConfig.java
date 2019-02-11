package com.sellent.web.config;

import java.io.IOException;
import java.util.Properties;

import org.apache.commons.dbcp.BasicDataSource;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
@ComponentScan(basePackages= {"com.sellent.web.dao","com.sellent.web.service"})
public class ServiceContextConfig {
	
	@Autowired
	ApplicationContext applicationContext;
	
	@Bean
	public BasicDataSource dataSource() {
		
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://222.121.107.249/sellentdb?useUnicode=true&characterEncoding=utf8");
		dataSource.setUsername("hyungho");
		dataSource.setPassword("11111111");
		
		
		
		return dataSource;
	}
	
	
	@Bean
	public SqlSessionFactoryBean sqlSessionFactory() throws IOException {
		SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
		
		sqlSessionFactory.setDataSource(dataSource());
		sqlSessionFactory.setMapperLocations(
				applicationContext.getResources(
						"classpath:com/sellent/web/dao/mybatis/mapper/*.xml"));
		
		return sqlSessionFactory;
	}
	
	@Bean
	public SqlSessionTemplate sqlSession() throws IOException, Exception {
		
		SqlSessionTemplate sqlSession 
			= new SqlSessionTemplate(sqlSessionFactory().getObject());
		
		
		return sqlSession;
	}
	
//	이메일 인증을 위한 smtp 설정
	@Bean
	public JavaMailSender javaMailSender() {
		JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
		javaMailSender.setDefaultEncoding("UTF-8");
		javaMailSender.setHost("smtp.naver.com");
		javaMailSender.setPort(587);
		javaMailSender.setUsername("haejeong1005@naver.com");
		javaMailSender.setPassword("Lhj63262688*");
		
		Properties javaMailProperties = new Properties();
		javaMailProperties.put("mail.transport.protocol","smtp");
		javaMailProperties.put("mail.smtp.auth", true);
		javaMailProperties.put("mail.smtp.tarttls.enable", true);
		javaMailProperties.put("mail.debug",true);
		
		javaMailSender.setJavaMailProperties(javaMailProperties);
		
		return javaMailSender;
		
	}
}

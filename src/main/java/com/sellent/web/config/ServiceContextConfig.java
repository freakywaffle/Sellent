package com.sellent.web.config;

import java.io.IOException;

import org.apache.commons.dbcp.BasicDataSource;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ServiceContextConfig {
	
	@Autowired
	ApplicationContext applicationContext;
	
	@Bean
	public BasicDataSource dataSource() {
		
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://192.168.0.10:3306/sellentdb");
		dataSource.setUsername("hyungho");
		dataSource.setPassword("1111");
		
		
		
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
}

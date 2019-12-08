package com;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.briup.Hospital.dao")
public class HospitalMs1Application {

	public static void main(String[] args) {
		SpringApplication.run(HospitalMs1Application.class, args);
	}

}

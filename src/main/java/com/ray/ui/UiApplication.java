package com.ray.ui;

import com.ray.cloud.framework.eureka.JettyFrameWorkServer;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@EnableDiscoveryClient
@SpringBootApplication
public class UiApplication extends JettyFrameWorkServer {

	public static void main(String[] args) {
		SpringApplication.run(UiApplication.class, args);
	}
}

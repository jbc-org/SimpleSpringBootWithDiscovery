package com.example.simplespringbootwithdiscovery;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.InetAddress;
import java.net.UnknownHostException;

@SpringBootApplication
@RestController
public class SimpleSpringBootWithDiscovery {

	public static void main(String[] args) {
		SpringApplication.run(SimpleSpringBootWithDiscovery.class, args);
	}

	@RequestMapping("/")
	@GetMapping
	public String getGreeting() throws UnknownHostException {
		String ip = InetAddress.getLocalHost().getHostAddress();
		return "Hello from SimpleSpringBootAppWithDiscovery; running on " + ip;
	}

}

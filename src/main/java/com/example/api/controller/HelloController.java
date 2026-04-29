package com.example.api.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * REST Controller for Hello API endpoint
 */
@RestController
@RequestMapping("/api")
public class HelloController {

    /**
     * Hello endpoint that returns a simple greeting message
     * @return ResponseEntity with Hello message
     */
    @GetMapping("/hello")
    public ResponseEntity<String> sayHello() {
        return ResponseEntity.ok("Hello");
    }

    /**
     * Health check endpoint
     * @return ResponseEntity with status OK
     */
    @GetMapping("/health")
    public ResponseEntity<String> health() {
        return ResponseEntity.ok("OK");
    }

    /**
     * Root endpoint
     * @return ResponseEntity with welcome message
     */
    @GetMapping("/")
    public ResponseEntity<String> root() {
        return ResponseEntity.ok("Welcome to Cloud API");
    }

}

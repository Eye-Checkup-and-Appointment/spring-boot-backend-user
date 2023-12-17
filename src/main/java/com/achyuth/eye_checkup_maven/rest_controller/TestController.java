package com.achyuth.eye_checkup_maven.rest_controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/")
@RestController
public class TestController {
    @GetMapping
    public ResponseEntity<String> testController(){
        return new ResponseEntity<>("Hello! World!", HttpStatus.OK);
    }
}


package com.example.java.controller;

import com.example.java.model.PlaceEntity;
import com.example.java.service.IPlaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/place")
public class PlaceController {
    @Autowired
    IPlaceService _placeService;

    @GetMapping("/list")
    public ResponseEntity<List<PlaceEntity>> getAllPlace() {
        try {
            List<PlaceEntity> result = _placeService.getList();
            return new ResponseEntity<List<PlaceEntity>>(result, HttpStatus.OK);
        } catch (Exception exception) {
            return new ResponseEntity<List<PlaceEntity>>(new ArrayList<PlaceEntity>(), HttpStatus.BAD_REQUEST);
        }
    }

}

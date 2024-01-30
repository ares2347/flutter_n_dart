package com.example.java.service;

import com.example.java.model.PlaceEntity;
import com.example.java.repository.IPlaceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlaceService implements IPlaceService{
    @Autowired
    IPlaceRepository _placeRepository;

    @Override
    public List<PlaceEntity> getList() {
        return _placeRepository.findAll();
    }
}

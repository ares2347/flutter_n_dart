package com.example.java.repository;

import com.example.java.model.PlaceEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface IPlaceRepository extends JpaRepository<PlaceEntity, UUID> {
}

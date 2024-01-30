package com.example.java.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Entity
@Getter
@Setter
@Table(name = "places")
@NoArgsConstructor
@AllArgsConstructor
public class PlaceEntity {
    @Id
    @GeneratedValue
    @Column(name = "place_id", columnDefinition = "BINARY(16)", updatable = false, nullable = false)
    private UUID placeId;

    @Column(name = "name")
    private String name;

    @Column(name = "rating")
    private int rating;

    @Column(name = "thumbnail")
    private String thumbnail;

    public PlaceEntity(String name, int rating, String thumbnail) {
        this.name = name;
        this.rating = rating;
        this.thumbnail = thumbnail;
    }
}

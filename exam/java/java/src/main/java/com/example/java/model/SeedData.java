package com.example.java.model;

import com.example.java.repository.IPlaceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class SeedData implements CommandLineRunner {
    @Autowired
    IPlaceRepository _placeRepository;

    @Override
    public void run(String... args) throws Exception {
        seedData();
    }

    private void seedData() {
        if (_placeRepository.count() == 0) {
            PlaceEntity hanoi = new PlaceEntity("Ha Noi", 4, "");
            PlaceEntity saigon = new PlaceEntity("Sai Gon", 5, "");
            PlaceEntity hoian = new PlaceEntity("Hoi An", 5, "");
            PlaceEntity danang = new PlaceEntity("Da Nang", 5, "");
            _placeRepository.save(hanoi);
            _placeRepository.save(saigon);
            _placeRepository.save(hoian);
            _placeRepository.save(danang);
        }
    }
}

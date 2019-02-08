package com.vitaflo.innova.repository;

import com.vitaflo.innova.model.Country;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CountryRepository extends PagingAndSortingRepository<Country, Integer> {

    Country findById(Long id);

    List<Country> findAllByIdIn(List<Long> id);
}

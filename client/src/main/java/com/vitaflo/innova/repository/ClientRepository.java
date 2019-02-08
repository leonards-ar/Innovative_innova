package com.vitaflo.innova.repository;

import com.vitaflo.innova.model.Client;
import com.vitaflo.innova.model.Country;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClientRepository extends PagingAndSortingRepository<Client, Integer> {

    Client findById(Long id);

    Page<Client> findAllByCountryIn(List<Country> countries, Pageable pageable);

    Page<Client> findAllByNameLikeAndCountryIn(String name, List<Country>countries, Pageable pageable);

}

package com.vitaflo.innova.repository;

import com.vitaflo.innova.model.Client;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ClientRepository extends PagingAndSortingRepository<Client, Integer> {

    Client findById(Long id);
}

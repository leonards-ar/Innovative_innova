package com.vitaflo.innova.services;

import com.vitaflo.innova.model.Client;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;


public interface ClientService {

    Page<Client> list(List<Long> countries,  String name, Pageable pageable);

    Client findById(Long id);

    Client save(Client client);

    void delete(Long id);
}

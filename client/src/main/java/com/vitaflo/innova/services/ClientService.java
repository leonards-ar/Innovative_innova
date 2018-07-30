package com.vitaflo.innova.services;

import com.vitaflo.innova.model.Client;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;


public interface ClientService {

    Page<Client> list(Pageable pageable);

    Client findById(Long id);

    Client save(Client client);

    void delete(Long id);
}

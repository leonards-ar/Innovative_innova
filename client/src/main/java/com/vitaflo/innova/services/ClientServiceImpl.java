package com.vitaflo.innova.services;

import com.vitaflo.innova.model.Client;
import com.vitaflo.innova.repository.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class ClientServiceImpl implements ClientService {
    @Autowired
    private ClientRepository clientRepository;

    @Override
    public Page<Client> list(Pageable pageable) {
        return clientRepository.findAll(pageable);
    }

    @Override
    public Client findById(Long id) {
        return clientRepository.findById(id);
    }

    @Override
    public Client save(Client client){
        return clientRepository.save(client);
    }

    @Override
    public void delete(Long id) {
        Client client = clientRepository.findById(id);
        clientRepository.delete(client);
    }
}
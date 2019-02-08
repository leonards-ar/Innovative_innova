package com.vitaflo.innova.services;

import com.vitaflo.innova.model.Client;
import com.vitaflo.innova.model.Country;
import com.vitaflo.innova.repository.ClientRepository;
import com.vitaflo.innova.repository.CountryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClientServiceImpl implements ClientService {
    @Autowired
    private ClientRepository clientRepository;
    @Autowired
    private CountryRepository countryRepository;

    @Override
    public Page<Client> list(List<Long> countries, String name, Pageable pageable) {

        List<Country> mapCountries = countryRepository.findAllByIdIn(countries);

        if(name != null){
            return clientRepository.findAllByNameLikeAndCountryIn("%"+name+"%", mapCountries, pageable);
        }

        return clientRepository.findAllByCountryIn(mapCountries, pageable);
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

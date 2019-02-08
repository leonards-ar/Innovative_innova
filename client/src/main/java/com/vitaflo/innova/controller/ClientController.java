package com.vitaflo.innova.controller;

import com.vitaflo.innova.exception.ResourceNotFound;
import com.vitaflo.innova.mapper.dto.ClientDto;
import com.vitaflo.innova.model.Client;
import com.vitaflo.innova.services.ClientService;
import ma.glasnost.orika.MapperFacade;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping(value = "/api")
public class ClientController {

    protected final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    protected MapperFacade mapper;

    @Autowired
    protected ClientService clientService;


    @RequestMapping(method = RequestMethod.GET)
    public Page<ClientDto> list(@RequestHeader String countries, @RequestParam(value="name", required=false) String name,  Pageable pageable) {
        List<Long> countryIds = Arrays.stream(countries.split(",")).map(Long::valueOf).collect(Collectors.toList());
        Page<Client> clients = clientService.list(countryIds, name, pageable);

        return new PageImpl<>(mapper.mapAsList(clients.getContent(), ClientDto.class), pageable, clients.getTotalElements());
    }

    @RequestMapping(method = RequestMethod.POST)
    public ClientDto save(@RequestBody ClientDto dto, HttpServletResponse response) {

        dto.validate();
        Client client = clientService.save(mapper.map(dto, Client.class));
        response.setStatus(HttpServletResponse.SC_CREATED);
        return mapper.map(client, ClientDto.class);

    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ClientDto find(@PathVariable Long id) {
        Client client = clientService.findById(id);
        if(client == null) {
            throw new ResourceNotFound("Client Not Found");
        }
        return mapper.map(client, ClientDto.class);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    public ClientDto find(@PathVariable Long id, @RequestBody ClientDto dto, HttpServletResponse response) {
        dto.validate();
        Client client = clientService.save(mapper.map(dto, Client.class));
        response.setStatus(HttpServletResponse.SC_NO_CONTENT);
        return mapper.map(client, ClientDto.class);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public void find(@PathVariable Long id, HttpServletResponse response) {
        clientService.delete(id);
        response.setStatus(HttpServletResponse.SC_NO_CONTENT);
    }

}

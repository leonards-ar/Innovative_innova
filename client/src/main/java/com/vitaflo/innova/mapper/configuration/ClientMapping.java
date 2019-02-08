package com.vitaflo.innova.mapper.configuration;

import com.vitaflo.innova.mapper.dto.ClientDto;
import com.vitaflo.innova.model.Client;
import ma.glasnost.orika.MapperFactory;
import net.rakugakibox.spring.boot.orika.OrikaMapperFactoryConfigurer;
import org.springframework.stereotype.Component;

@Component
public class ClientMapping implements OrikaMapperFactoryConfigurer {

    @Override
    public void configure(MapperFactory mapperFactory) {
        mapperFactory.classMap(Client.class, ClientDto.class)
                .fieldAToB("country.name", "country")
                .byDefault()
                .register();
    }
}

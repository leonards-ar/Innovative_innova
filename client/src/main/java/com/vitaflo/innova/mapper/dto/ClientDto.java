package com.vitaflo.innova.mapper.dto;

import lombok.Data;

@Data
public class ClientDto {

    private Long id;
    private String name;
    private String address;
    private String phone;
    private String email;
    private String contact;
    private String country;
    private String status;
}

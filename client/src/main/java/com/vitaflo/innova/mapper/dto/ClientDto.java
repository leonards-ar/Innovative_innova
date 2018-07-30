package com.vitaflo.innova.mapper.dto;

import lombok.Data;
import org.springframework.util.Assert;

import static org.springframework.util.Assert.*;

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

    public void validate() {
        Assert.noNullElements(new Object[]{name, phone, email, contact, country, status}, "These fields shouldn't be null");
    }
}

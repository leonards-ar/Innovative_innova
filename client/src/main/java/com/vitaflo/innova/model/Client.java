package com.vitaflo.innova.model;


import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name="clients")
public class Client {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="id")
    private Long id;

    @Column(name="name", nullable = false)
    private String name;

    @Column(name="address")
    private String address;

    @Column(name="telephone", nullable = false)
    private String phone;

    @Column(name="email", nullable = false)
    private String email;

    @Column(name="contact")
    private String contact;

    @ManyToOne
    @JoinColumn(name="country_id", nullable = false)
    private Country country;

    @Column(name="status", nullable = false)
    private String status = "Enabled";
}

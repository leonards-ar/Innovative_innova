package com.vitaflo.innova.model;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name="countries")
public class Country {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="id")
    private Long id;

    @Column(name="name", nullable = false)
    private String name;

    @Column(name="code")
    private String code;

}

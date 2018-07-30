package com.vitaflo.innova.exception;

import lombok.Data;

@Data
public class ResourceNotFound extends RuntimeException {

    private String message;

    public ResourceNotFound(String message) {
        this.message = message;
    }
}

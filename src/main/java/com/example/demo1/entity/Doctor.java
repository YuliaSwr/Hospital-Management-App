package com.example.demo1.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Doctor {

    private int id;
    private String firstName;
    private String lastName;
    private Specialization specialization;
    private String phoneNumber;
    private String email;

    public Doctor(String firstName,
                  String lastName,
                  Specialization specialization,
                  String phoneNumber,
                  String email) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.specialization = specialization;
        this.phoneNumber = phoneNumber;
        this.email = email;
    }

    public Doctor(int id,
                  String firstName,
                  String lastName,
                  Specialization specialization,
                  String phoneNumber,
                  String email) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.specialization = specialization;
        this.phoneNumber = phoneNumber;
        this.email = email;
    }
}

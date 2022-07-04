package com.example.demo1.entity;

public enum Specialization {
    LORE("LORE"),
    OPHTHALMOLOGIST("OPHTHALMOLOGIST"),
    SURGEON("SURGEON"),
    DENTIST("DENTIST");
    private String specialization;
    private Specialization(String specialization) {
        this.specialization = specialization;
    }

    public String getSpecialization() {
        return specialization;
    }
}

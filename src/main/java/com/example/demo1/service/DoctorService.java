package com.example.demo1.service;


import com.example.demo1.dao.DoctorDAO;
import com.example.demo1.entity.Doctor;

import java.sql.SQLException;
import java.util.List;

public class DoctorService {

    private DoctorDAO doctorDAO;

    public DoctorService() {
        this.doctorDAO = new DoctorDAO();
    }

    public List<Doctor> getAll(){
        return doctorDAO.selectAll();
    }

    public void save(Doctor doctor) {
        doctorDAO.insert(doctor);
    }

    public void delete(int id) {
        doctorDAO.deleteById(id);
    }

    public Doctor getById(int id){
        return doctorDAO.selectById(id);
    }

    public void update(Doctor doctor) {
        doctorDAO.update(doctor);
    }

    public List<Doctor> selectBySpec(String spec) {
        return doctorDAO.selectBySpec(spec);
    }
}

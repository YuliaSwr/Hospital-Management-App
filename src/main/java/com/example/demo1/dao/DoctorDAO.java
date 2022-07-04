package com.example.demo1.dao;

import com.example.demo1.entity.Doctor;
import com.example.demo1.entity.Specialization;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DoctorDAO {
    private final String JDBC_URL = "jdbc:mysql://localhost:3306/hospital?useSSL=false";
    private final String JDBC_USERNAME = "juliapp";
    private final String JDBC_PASSWORD = "password";

    private final String SELECT_ALL =
            "SELECT * FROM doctors";

    private final String SELECT_BY_ID =
            "SELECT * FROM doctors WHERE id = ?";

    private final String SELECT_BY_SPEC =
            "SELECT * FROM doctors WHERE specialization = ?";

    private final String INSERT_NEW =
            "INSERT INTO doctors (firstName, lastName, specialization, phoneNumber, email) VALUES (?, ?, ?, ?, ?);";

    private final String DELETE_BY_ID =
            "DELETE FROM doctors WHERE id = ?";

    private final String UPDATE_BY_ID =
            "UPDATE doctors SET firstName = ?, lastName = ?, specialization = ?, phoneNumber = ?, email = ? WHERE id = ?";

    protected Connection getConnection() throws SQLException {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
            System.out.println("Connection set");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    public List<Doctor> selectAll() {
        List<Doctor> doctors = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL)) {

            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                String specialization = rs.getString("specialization");
                String phoneNumber = rs.getString("phoneNumber");
                String email = rs.getString("email");

                doctors.add(new Doctor(id,
                        firstName,
                        lastName,
                        Specialization.valueOf(specialization),
                        phoneNumber,
                        email));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return doctors;
    }

    public void insert(Doctor doctor) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_NEW)) {
            preparedStatement.setString(1, doctor.getFirstName());
            preparedStatement.setString(2, doctor.getLastName());
            preparedStatement.setString(3, doctor.getSpecialization().toString());
            preparedStatement.setString(4, doctor.getPhoneNumber());
            preparedStatement.setString(5, doctor.getEmail());

            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean update(Doctor doctor){
        boolean rowUpdated = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BY_ID)) {
            preparedStatement.setString(1, doctor.getFirstName());
            preparedStatement.setString(2, doctor.getLastName());
            preparedStatement.setString(3, doctor.getSpecialization().toString());
            preparedStatement.setString(4, doctor.getPhoneNumber());
            preparedStatement.setString(5, doctor.getEmail());
            preparedStatement.setInt(6, doctor.getId());

            System.out.println(preparedStatement);

            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }

    public Doctor selectById(int id) {
        Doctor doctor = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID)) {
            preparedStatement.setInt(1, id);

            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                String specialization = rs.getString("specialization");
                String phoneNumber = rs.getString("phoneNumber");
                String email = rs.getString("email");

                doctor = new Doctor(
                        id,
                        firstName,
                        lastName,
                        Specialization.valueOf(specialization),
                        phoneNumber,
                        email);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return doctor;
    }

    public boolean deleteById(int id) {
        boolean rowDeleted = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BY_ID)) {
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }

    public List<Doctor> selectBySpec(String spec) {
        List<Doctor> doctors = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_SPEC)) {
            preparedStatement.setString(1, spec);

            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                String specialization = rs.getString("specialization");
                String phoneNumber = rs.getString("phoneNumber");
                String email = rs.getString("email");

                Doctor doctor = new Doctor(
                        id,
                        firstName,
                        lastName,
                        Specialization.valueOf(specialization),
                        phoneNumber,
                        email);

                doctors.add(doctor);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return doctors;
    }
}

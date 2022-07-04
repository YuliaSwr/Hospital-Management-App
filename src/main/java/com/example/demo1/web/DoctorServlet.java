package com.example.demo1.web;

import com.example.demo1.entity.Doctor;
import com.example.demo1.entity.Specialization;
import com.example.demo1.service.DoctorService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/doctor")
public class DoctorServlet extends HttpServlet {

    private DoctorService doctorService;

    @Override
    public void init() {
        this.doctorService = new DoctorService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        request.setAttribute("doctorsList", doctorService.getAll());
        request.setAttribute("doctor", new Doctor());
        request.setAttribute("spec", null);

        String path = request.getServletPath();
        System.out.println(path);
        System.out.println(request.getContextPath());

//        switch (path) {
//            case "/1delete":
//                int id = Integer.parseInt(request.getParameter("id"));
//                doctorService.delete(id);
//                break;
//            case "/edit":
//                int idEdit = Integer.parseInt(request.getParameter("id"));
//                request.setAttribute("doctor", doctorService.getById(idEdit));
//                break;
//            case "/filter":
//                String spec = request.getParameter("spec");
//                request.setAttribute("spec", spec);
//                request.setAttribute("doctorsList", doctorService.selectBySpec(spec));
//                break;
//            default:
//                break;
//        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("doctors.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Doctor doctor = makeDoctor(request);

        String act = request.getParameter("act");

        switch (act) {
            case "insert":
                doctorService.save(doctor);
                break;
            case "update":
                doctorService.update(doctor);
                break;
            default:
                break;
        }

        response.sendRedirect("/doctor");
    }

    private Doctor makeDoctor(HttpServletRequest request) {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String specialization = request.getParameter("specialization");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");

        if (request.getParameter("id") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            return new Doctor(
                    id,
                    firstName,
                    lastName,
                    Specialization.valueOf(specialization),
                    phoneNumber,
                    email);
        }

        return new Doctor(
                firstName,
                lastName,
                Specialization.valueOf(specialization),
                phoneNumber,
                email);
    }
}

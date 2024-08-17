package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import java.io.IOException;

@WebServlet("/updateData")
public class dataupdate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String contact = request.getParameter("contact");
        String cgpa = request.getParameter("cgpa");

        if (idParam == null || idParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID is required.");
            return;
        }

        try {
            int id = Integer.parseInt(idParam);

            try (Session session = new Configuration().configure().buildSessionFactory().openSession()) {
                Transaction transaction = session.beginTransaction();
                
                Student student = session.get(Student.class, id);
                if (student == null) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Student not found.");
                    return;
                }
                
                
                student.setSname(name);
                student.setGender(gender.charAt(0)); 
                student.setContact(Long.parseLong(contact));
                student.setCgpa(Float.parseFloat(cgpa));
                
                session.update(student);
                transaction.commit();
            }
            
            response.sendRedirect("succes.html"); 

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number format.");
        }
    }
}

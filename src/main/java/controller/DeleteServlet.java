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

@WebServlet("/deleteData")
public class DeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String idParam = request.getParameter("id");

        try (Session session = new Configuration().configure().buildSessionFactory().openSession()) {
            Transaction transaction = session.beginTransaction();

            if ("deleteAll".equals(action)) {
                session.createQuery("DELETE FROM Student").executeUpdate();
            } else if ("delete".equals(action)) {
                if (idParam == null || idParam.isEmpty()) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID is required.");
                    return;
                }
                
                int id = Integer.parseInt(idParam);
                Student student = session.get(Student.class, id);
                if (student != null) {
                    session.delete(student);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Student not found.");
                    return;
                }
            }

            transaction.commit();
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number format.");
        }

        response.sendRedirect("succes.html"); // Redirect or forward as needed
    }
}

package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import java.io.IOException;
import java.util.List;

@WebServlet("/retrieveData")
public class RetriveData extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SessionFactory sessionFactory;

    @Override
    public void init() throws ServletException {
        super.init();
        sessionFactory = new Configuration().configure().buildSessionFactory();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Session session = sessionFactory.openSession();
        try {
            // Hibernate query to retrieve all student records
            Query<Student> query = session.createQuery("FROM Student", Student.class);
            List<Student> students = query.list();

            // Store the list of students in the request object
            request.setAttribute("studentList", students);

            // Forward the request to the JSP page
            request.getRequestDispatcher("retrive.jsp").forward(request, response);
        } finally {
            session.close();
        }
    }

    @Override
    public void destroy() {
        if (sessionFactory != null) {
            sessionFactory.close();
        }
        super.destroy();
    }
}

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

@WebServlet("/searchStudent")
public class SearchStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SessionFactory sessionFactory;

    @Override
    public void init() throws ServletException {
        super.init();
        sessionFactory = new Configuration().configure().buildSessionFactory();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        Session session = sessionFactory.openSession();
        try {
            Student student = session.get(Student.class, id);

            if (student != null) {
                request.setAttribute("student", student);
                request.getRequestDispatcher("update.jsp").forward(request, response);
            } else {
                response.sendRedirect("error.html?message=Student%20not%20found");
            }
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

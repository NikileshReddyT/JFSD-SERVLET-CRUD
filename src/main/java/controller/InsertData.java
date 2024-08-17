package controller;
import java.io.IOException;
//import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import jakarta.servlet.GenericServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/insertdata")
public class InsertData extends GenericServlet {

    private static final long serialVersionUID = 1L;

    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        HttpServletResponse httpResponse = (HttpServletResponse) res;
        httpResponse.setContentType("text/html");
//        PrintWriter pw = httpResponse.getWriter();
//        String ack = "";
        String name = req.getParameter("name");
        char ch = req.getParameter("gender").charAt(0);
        long contact = Long.parseLong(req.getParameter("contact"));
        float cgpa = Float.parseFloat(req.getParameter("cgpa"));
        try {
            Student sd = new Student();
          
            sd.setSname(name);
            sd.setGender(ch);
            sd.setContact(contact);
            sd.setCgpa(cgpa);

            Configuration cfg = new Configuration();
            cfg.configure();
            SessionFactory sf = cfg.buildSessionFactory();
            Session s = sf.openSession();
            s.getTransaction().begin();
            s.persist(sd);
            s.getTransaction().commit();
            httpResponse.sendRedirect("succes.html"); // Redirect to success page
        } catch (Exception e) {
            e.printStackTrace();
            // Encode error message for URL
            String errorMessage = URLEncoder.encode(e.getMessage(), StandardCharsets.UTF_8.toString());
            httpResponse.sendRedirect("error.html?message=" + errorMessage); // Redirect to error page with message
        }
    }
}

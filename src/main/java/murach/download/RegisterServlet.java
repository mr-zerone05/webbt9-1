package murach.download;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("firstName");
        String lastName  = request.getParameter("lastName");
        String email     = request.getParameter("email");

        Cookie c1 = new Cookie("firstName", firstName);
        Cookie c2 = new Cookie("lastName", lastName);
        Cookie c3 = new Cookie("email", email);

        c1.setMaxAge(60*60*24*365); // 1 năm
        c2.setMaxAge(60*60*24*365);
        c3.setMaxAge(60*60*24*365);

        response.addCookie(c1);
        response.addCookie(c2);
        response.addCookie(c3);

        response.sendRedirect("thanks.jsp");
    }
}


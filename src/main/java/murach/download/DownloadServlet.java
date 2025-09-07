package murach.download;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class DownloadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/register.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName  = request.getParameter("lastName");

        // Tạo cookie
        Cookie firstNameCookie = new Cookie("firstName", firstName);
        firstNameCookie.setMaxAge(60*60*24*365); // 1 năm
        response.addCookie(firstNameCookie);

        Cookie lastNameCookie = new Cookie("lastName", lastName);
        lastNameCookie.setMaxAge(60*60*24*365);
        response.addCookie(lastNameCookie);

        request.setAttribute("firstName", firstName);
        request.setAttribute("lastName", lastName);

        getServletContext().getRequestDispatcher("/thanks.jsp")
                .forward(request, response);
    }
}


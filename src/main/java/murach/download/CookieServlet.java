package murach.download;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class CookieServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/view_cookies.jsp")
                .forward(request, response);
    }
}


package servlet;
import java.io.IOException; import jakarta.servlet.ServletException; import jakarta.servlet.http.*;
public class LogoutServlet extends HttpServlet {
    @Override protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession s = req.getSession(false);
        if(s!=null) s.invalidate();
        resp.sendRedirect("login.jsp");
    }
}

package net.shoplogin.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shoplogin.bean.SloginBean;
import net.shoplogin.database.SloginDao;

/**
 * Servlet implementation class SloginServlet
 */
@WebServlet("/slogin")
public class SloginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SloginDao sloginDao = new SloginDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SloginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher dispatcher = request.getRequestDispatcher("shoplogin.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
        String password = request.getParameter("password");
        SloginBean sloginBean = new SloginBean();
        sloginBean.setEmail(email);
        sloginBean.setPassword(password);

        try {
            if (sloginDao.validate(sloginBean)) {
                //HttpSession session = request.getSession();
                // session.setAttribute("username",username);
                response.sendRedirect("shopsuccess.jsp");
            } else {
//                HttpSession session = request.getSession();
                //session.setAttribute("user", username);
                response.sendRedirect("shoplogin.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
	}

}

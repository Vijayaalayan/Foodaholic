package net.java.registration.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.java.registration.dao.FoodieDao;
import net.java.registration.model.Foodie;

/**
 * Servlet implementation class FoodieServlet
 */
@WebServlet("/register")
public class FoodieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private FoodieDao foodieDao = new FoodieDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FoodieServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("foodieregister.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String number = request.getParameter("number");
		String place = request.getParameter("place");
		String password = request.getParameter("password");
		String guide = request.getParameter("guide");
		
		Foodie foodie = new Foodie();
		foodie.setName(name);
		foodie.setEmail(email);
		foodie.setNumber(number);
		foodie.setPlace(place);
		foodie.setPassword(password);
		foodie.setGuide(guide);
		
		try {
			foodieDao.registerFoodie(foodie);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/foodiedetails.jsp");
		dispatcher.forward(request, response);
	}

}

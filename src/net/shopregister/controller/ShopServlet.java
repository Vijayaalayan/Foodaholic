package net.shopregister.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.shopregister.dao.ShopDao;
import net.shopregister.model.Shop;

/**
 * Servlet implementation class ShopServlet
 */
@WebServlet("/sregister")
public class ShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private ShopDao shopDao = new ShopDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher dispatcher = request.getRequestDispatcher("shopregister.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String shopName = request.getParameter("shopName");
		String email = request.getParameter("email");
		String number = request.getParameter("number");
		String password = request.getParameter("password");
		String place = request.getParameter("place");
		String latlon = request.getParameter("latlon");
		
		Shop shop = new Shop();
		shop.setShopName(shopName);
		shop.setEmail(email);
		shop.setNumber(number);
		shop.setPassword(password);
		shop.setPlace(place);
		shop.setLatlon(latlon);
		
		try {
			shopDao.registerShop(shop);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("shopdetails.jsp");
		dispatcher.forward(request, response);
	}

}

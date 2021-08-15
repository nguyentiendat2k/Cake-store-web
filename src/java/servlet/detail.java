/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import context.DBContext;
import dao.DAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Product;
import models.Order;
import models.Users;

public class detail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String stringPid = request.getParameter("pid");
        DBContext db = new DBContext();
        DAO dao = new DAO(db);
        int pid = 0;
        try {
            pid = Integer.parseInt(stringPid);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        Product p = dao.getProductByID(pid);
        request.setAttribute("product", p);
        request.getRequestDispatcher("detail.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DBContext db = new DBContext();
        DAO dao = new DAO(db);
        HttpSession session = request.getSession();
        ArrayList<Order> listOrder;
        
        if(session.getAttribute("listOrder")==null){
            listOrder = new ArrayList<>();
        }else{
            listOrder = (ArrayList<Order>)session.getAttribute("listOrder");
        }
       
//        session.setAttribute("listOrder", listOrder);

        String username = (String) session.getAttribute("username");
        if (username == null) {
            response.sendRedirect("login");
            return;
        }
        int orderID = dao.getLastOrderID() + 1;
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int pID = Integer.parseInt(request.getParameter("pid"));
        int price = Integer.parseInt(request.getParameter("price"));
        int totalPrice = price * quantity;
        Product p = dao.getProductByID(pID);
        String pName = p.getProductName();
        String pImage = p.getProductImage();
        Users u = dao.getAccountByUsername(username);
        Order o = new Order(orderID, quantity, totalPrice, u, pID, pName, price, pImage);
//        ArrayList<Order> list = (ArrayList<Order>)session.getAttribute("listOrder");
        listOrder.add(o);
        session.setAttribute("listOrder", listOrder);
        System.out.println(session.getAttribute("listOrder"));
//        dao.Buy(orderID, quantity, totalPrice, pID, username);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.LaptopDAO;
import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CartItem;
import model.laptop;
import model.user;

/**
 *
 * @author nhhag
 */
@WebServlet(name = "CartSV", urlPatterns = {"/addcart"})
public class CartAddItemSV extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CartSV</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartSV at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pid_raw = request.getParameter("pid");
        String quantity_raw = request.getParameter("quantity");
        String index = request.getParameter("index");
        PrintWriter out = response.getWriter();
        int quantities = 1;
        HttpSession sesion = request.getSession();
        OrderDAO o = new OrderDAO();
        LaptopDAO d = new LaptopDAO();
        user a = (user) sesion.getAttribute("acc"); 
        if (a == null) {
          
            response.sendRedirect("login");
        } else
        try {
            int pid = Integer.parseInt(pid_raw);
            if (quantity_raw == null) {
                quantities = 1;
            }
            int uid = a.getUserID();
            CartItem c = new CartItem(1, pid, quantities, uid);
            if (o.checkDupliProduct(uid, pid) == null) {
                o.insertCartItem(c);
                request.setAttribute("mess", "Add to cart successfully");

            } else {
                CartItem e = new CartItem(1, pid, quantities + 1, uid);
                o.updateCartItemQuantity(e);
                request.setAttribute("mess", "Add to cart successfully");

            }
            response.sendRedirect("shop?index=" + index);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

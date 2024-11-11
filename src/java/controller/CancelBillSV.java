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
import java.util.List;
import model.orderdetail;
import model.user;

/**
 *
 * @author nhhag
 */
@WebServlet(name = "CancelBillSV", urlPatterns = {"/cancelbill"})
public class CancelBillSV extends HttpServlet {

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
            out.println("<title>Servlet CancelBillSV</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CancelBillSV at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        HttpSession sesion = request.getSession();
        user a = (user) sesion.getAttribute("acc");
        if(a==null)
        {
            response.sendRedirect("login");
        }
        OrderDAO o = new OrderDAO();
        LaptopDAO d = new LaptopDAO();
        String ordersId = request.getParameter("orderId");
        String status = request.getParameter("status");
        String index = request.getParameter("index");
        PrintWriter out = response.getWriter(); 
        
        try {

            int oid = Integer.parseInt(ordersId);
            List<orderdetail> list = o.getAllOrderDetailByID(oid);
            o.updateOrderStatus(o.getOrdersByOrderID(oid), status, oid);
            if(status.equals("Complete")){
                for (int i = 0; i < list.size(); i++) {
                    d.updateLaptopQuantity(d.getLaptopByID(list.get(i).getLaptopid()), list.get(i).getQuantity());
                            }
            }

        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        response.sendRedirect("shop");
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

package controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import dal.LaptopDAO;
import dal.OrderDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.laptop;
import model.order;
import model.orderdetail;
import model.user;

/**
 *
 * @author nhhag
 */
@WebServlet(urlPatterns = {"/stat"})
public class StatisticSV extends HttpServlet {

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
            out.println("<title>Servlet StatisticSV</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StatisticSV at " + request.getContextPath() + "</h1>");
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
        OrderDAO o = new OrderDAO();
        LaptopDAO d = new LaptopDAO();
        UserDAO u = new UserDAO();
        List<laptop> list1 = d.getAllLaptop();
        List<user> list2 = u.getAllUser();
        List<order> list3 = o.getAllOrder();
        int sumq = 0;
        int sum = 0;
        for (int i = 0; i < list3.size(); i++) {
            if (list3.get(i).getStatus().equals("Complete")) {
                sum += list3.get(i).getTotal();
                List<orderdetail> list4 = o.getAllOrderDetailByID(list3.get(i).getOid());
                for (int j = 0; j < list4.size(); j++) {
                    sumq += list4.get(j).getQuantity();
                }
            }
        }
        request.setAttribute("AllUser", list2.size());
        request.setAttribute("AllLaptop", list1.size());
        request.setAttribute("AllSale", sum);
        request.setAttribute("AllSaleProduct", sumq);
        request.getRequestDispatcher("Statistic.jsp").forward(request, response);
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

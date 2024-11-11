/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BrandDAO;
import dal.CategoryDAO;
import dal.LaptopDAO;
import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.CartItem;
import model.brand;
import model.category;
import model.laptop;
import model.spec;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.user;
import org.apache.jasper.tagplugins.jstl.core.Catch;

/**
 *
 * @author nhhag
 */
@WebServlet(name = "ShopSV", urlPatterns = {"/shop"})
public class ShopSV extends HttpServlet {

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
            out.println("<title>Servlet HomeSV</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeSV at " + request.getContextPath() + "</h1>");
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
        HttpSession sesion = request.getSession();
        user a = (user) sesion.getAttribute("acc");
        String index_raw = request.getParameter("index");
        String sort_raw = request.getParameter("sort");
        int index = 1;
        try {
            index = Integer.parseInt(index_raw);

        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        LaptopDAO d = new LaptopDAO();
        CategoryDAO c = new CategoryDAO();
        BrandDAO b = new BrandDAO();
        OrderDAO o = new OrderDAO();
        int page = d.getTotalLaptop() / 9;
        if (page % 9 != 0) {
            page++;
        }
        laptop last = d.getLastestLaptop();
        List<brand> list4 = b.getAllBrand();
        List<spec> list1 = d.getAllSpec();
        List<laptop> list2 = new ArrayList<>();
        if (sort_raw == null) {
            list2 = d.getLaptopPage(index);
        } else if (sort_raw.equals("high")) {
            list2 = d.getLaptopPageDESC(index);
        }
        else{
            list2 = d.getLaptopPageASC(index);
        }
        List<category> list3 = c.getAllCategories();
        int total = (index - 1) * 9 + list2.size();
        request.setAttribute("totalItem", d.getTotalLaptop());
        request.setAttribute("currentItem", total);
        request.setAttribute("pageIndex", index);
        request.setAttribute("endP", page);
        request.setAttribute("laptop", list2);
        request.setAttribute("spec", list1);
        request.setAttribute("cat", list3);
        if (a != null) {
            List<CartItem> list5 = o.getAllCartItemsByID(a.getUserID());
            request.setAttribute("cartnumber", list5.size());
        }
        request.setAttribute("brand", list4);
        request.getRequestDispatcher("Shop.jsp").forward(request, response);

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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.BrandDAO;
import dal.CategoryDAO;
import dal.LaptopDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.category;

/**
 *
 * @author nhhag
 */
@WebServlet(name="FindByPriceSV", urlPatterns={"/pricecontent"})
public class FindByPriceSV extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet FindByPriceSV</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FindByPriceSV at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String from_raw = request.getParameter("from");
        String to_raw = request.getParameter("to");
        LaptopDAO d = new LaptopDAO();
        BrandDAO b = new BrandDAO();
        if(from_raw == null || to_raw == null)
        {
            request.setAttribute("warn", "Please input price");
        }
        else
        {
            try{
                int from = Integer.parseInt(from_raw);
                int to = Integer.parseInt(to_raw);
                request.setAttribute("laptop", d.getLaptopByPrice(from, to));
            }
            catch(NumberFormatException e)
            {
                System.out.println(e);
            }
        }
        request.setAttribute("spec", d.getAllSpec());
        CategoryDAO c = new CategoryDAO();
        List<category> list3 = c.getAllCategories();
        request.setAttribute("cat", list3);
        request.setAttribute("brand", b.getAllBrand());
        request.getRequestDispatcher("Shop.jsp").forward(request, response);
        
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

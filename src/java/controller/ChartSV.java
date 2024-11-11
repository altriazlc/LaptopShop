/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.chartmonth;
import model.chartweek;

/**
 *
 * @author nhhag
 */
@WebServlet(name="ChartSV", urlPatterns={"/chart"})
public class ChartSV extends HttpServlet {
   
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
            out.println("<title>Servlet ChartSV</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChartSV at " + request.getContextPath () + "</h1>");
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
        OrderDAO o = new OrderDAO();
        PrintWriter out = response.getWriter();
        
        chartweek week = new chartweek(0, 0, 0, 0, 0, 0, 0);
        week.setMonday(o.getSaleWeek(2));
        week.setTuesday(o.getSaleWeek(3));
        week.setWendsday(o.getSaleWeek(4));
        week.setThursday(o.getSaleWeek(5));
        week.setFriday(o.getSaleWeek(6));
        week.setSaturday(o.getSaleWeek(7));
        week.setSunday(o.getSaleWeek(1));
        
        chartmonth month = new chartmonth(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
        month.setJan(o.getSaleMonth(1));
        month.setFeb(o.getSaleMonth(2));
        month.setMar(o.getSaleMonth(3));
        month.setApr(o.getSaleMonth(4));
        month.setMay(o.getSaleMonth(5));
        month.setJun(o.getSaleMonth(6));
        month.setJul(o.getSaleMonth(7));
        month.setAug(o.getSaleMonth(8));
        month.setSep(o.getSaleMonth(9));
        month.setOct(o.getSaleMonth(10));
        month.setNov(o.getSaleMonth(11));
        month.setDec(o.getSaleMonth(12));
        
        request.setAttribute("m", month);
        request.setAttribute("w", week);
        request.getRequestDispatcher("ChartWeek.jsp").forward(request, response);
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

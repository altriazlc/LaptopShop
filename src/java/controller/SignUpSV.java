/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.user;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author nhhag
 */
@WebServlet(name = "SignUpSV", urlPatterns = {"/signup"})
public class SignUpSV extends HttpServlet {

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
            out.println("<title>Servlet SignUpSV</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUpSV at " + request.getContextPath() + "</h1>");
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

        request.getRequestDispatcher("Signup.jsp").forward(request, response);
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
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String name = request.getParameter("fullname");
        String phoneNum = request.getParameter("phone");
        String mail = request.getParameter("email");
        String repass = request.getParameter("repass");
        String addr = request.getParameter("address");
        String role_raw = request.getParameter("role");
        int roles = 1;
        if (role_raw != null) {
            roles = Integer.parseInt(role_raw);
        }

        UserDAO d = new UserDAO();
        if (d.checkDupli(user) == null && d.checkDupliEmail(mail) == null) {
            d.insertUser(new user(1, user, mail, pass, roles, name, addr, phoneNum));
            request.setAttribute("mess", "Add account successfully, please return to sign in page to log in");
        } else {
            if (d.checkDupli(user) != null) {
                request.setAttribute("uerror", "User existed");
            }
            if (d.checkDupliEmail(mail) != null) {
                request.setAttribute("eerror", "Email exsited");
            }

        }

        request.getRequestDispatcher("Signup.jsp").forward(request, response);

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

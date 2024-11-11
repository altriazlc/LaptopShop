package controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import dal.CategoryDAO;
import dal.LaptopDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;
import model.category;
import model.laptop;
import model.spec;

/**
 *
 * @author nhhag
 */
@WebServlet(urlPatterns = {"/editproduct"})
public class EditProductSV extends HttpServlet {

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
            out.println("<title>Servlet EditProductSV</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProductSV at " + request.getContextPath() + "</h1>");
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
        String id_raw = request.getParameter("pid");
        int id = -1;
        try {
            id = Integer.parseInt(id_raw);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        LaptopDAO d = new LaptopDAO();
        spec a = d.getSpecLaptopByID(id);
        laptop b = d.getLaptopByID(id);
        CategoryDAO c = new CategoryDAO();
        List<category> list = c.getAllCategories();
        request.setAttribute("detail", a);
        request.setAttribute("laptop", b);
        request.setAttribute("cat", list);
        request.setAttribute("pid", id);
        request.getRequestDispatcher("Edit.jsp").forward(request, response);
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
        String id_raw = request.getParameter("id");
        String price_raw = request.getParameter("price");
        String stock_raw = request.getParameter("stock");
        String imgs = request.getParameter("image");
        String descr = request.getParameter("desc");
        try {
            int prices = Integer.parseInt(price_raw);
            int stocks = Integer.parseInt(stock_raw);
            int id = Integer.parseInt(id_raw);
            LaptopDAO d = new LaptopDAO();
            laptop l = d.getLaptopByID(id);
            laptop a = new laptop(
                    id,
                    l.getBrandid(),
                    l.getCatid(),
                    l.getName(),
                    descr, // Assuming descr is a String description.
                    (Date) l.getDate(), // Ensure l.getDate() returns a Date.
                    imgs, // Assuming img is a String.
                    prices, // Ensure prices is an int.
                    stocks // Ensure stocks is an int.
            );
            d.updateLaptop(a);
            response.sendRedirect("manageproduct");
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
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

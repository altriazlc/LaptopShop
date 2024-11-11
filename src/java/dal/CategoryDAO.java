/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author nhhag
 */
public class CategoryDAO extends DBContext {

    public List<category> getAllCategories() {
        List<category> list = new ArrayList<>();
        String sql = "SELECT CategoryID, CategoryName FROM Categories";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                category c = new category(
                        rs.getInt("CategoryID"),
                        rs.getString("CategoryName")
                );
                list.add(c);
            }
           
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception for debugging
        }
        return list;
    }
    public static void main(String[] args) {
        CategoryDAO c = new CategoryDAO();
        List<category> list = c.getAllCategories();
        System.out.println(list.get(0).getCatname());
    }
}

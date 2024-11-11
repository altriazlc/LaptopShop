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
import model.brand;

/**
 *
 * @author nhhag
 */
public class BrandDAO extends DBContext {

    public List<brand> getAllBrand() {
        List<brand> list = new ArrayList<>();
        String sql = "SELECT [BrandID]\n"
                + "      ,[BrandName]\n"
                + "  FROM [dbo].[Brands]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                brand c = new brand(
                        rs.getInt("BrandID"),
                        rs.getString("BrandName")
                );
                list.add(c);
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception for debugging
        }
        return list;
    }

    public static void main(String[] args) {
        BrandDAO b = new BrandDAO();
        List<brand> list = b.getAllBrand();
        System.out.println(list.get(0).getBrandname());
    }
}

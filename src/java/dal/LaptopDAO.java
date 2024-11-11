/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import model.laptop;
import model.spec;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LaptopDAO extends DBContext {

    //get all students
    public List<laptop> getAllLaptop() {
        List<laptop> list = new ArrayList<>();
        String sql = "select * from laptops";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                laptop s = new laptop(
                        rs.getInt("LaptopID"),
                        rs.getInt("BrandID"),
                        rs.getInt("CategoryID"),
                        rs.getString("ModelName"),
                        rs.getString("Description"),
                        rs.getDate("CreatedAt"),
                        rs.getString("Image"),
                        rs.getInt("Price"), rs.getInt("Stock"));
                list.add(s);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<laptop> getLaptopByCat(int catid) {
        List<laptop> list = new ArrayList<>();
        String sql = "SELECT [LaptopID]\n"
                + "      ,[BrandID]\n"
                + "      ,[CategoryID]\n"
                + "      ,[ModelName]\n"
                + "      ,[Description]\n"
                + "      ,[CreatedAt]\n"
                + "      ,[Image]\n"
                + "       ,[Price]\n"
                + "       ,[Stock]\n"
                + "  FROM [dbo].[Laptops]\n"
                + "  where CategoryID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, catid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                laptop s = new laptop(
                        rs.getInt("LaptopID"),
                        rs.getInt("BrandID"),
                        rs.getInt("CategoryID"),
                        rs.getString("ModelName"),
                        rs.getString("Description"),
                        rs.getDate("CreatedAt"), rs.getString("Image"),
                        rs.getInt("Price"), rs.getInt("Stock"));
                list.add(s);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<laptop> getLaptopByPrice(int from, int to) {
        List<laptop> list = new ArrayList<>();
        String sql = "select * \n"
                + "from Laptops l\n"
                + "where l.Price between ? and ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, from);
            st.setInt(2, to);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                laptop s = new laptop(
                        rs.getInt("LaptopID"),
                        rs.getInt("BrandID"),
                        rs.getInt("CategoryID"),
                        rs.getString("ModelName"),
                        rs.getString("Description"),
                        rs.getDate("CreatedAt"), rs.getString("Image"),
                        rs.getInt("Price"), rs.getInt("Stock"));
                list.add(s);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<laptop> getLaptopByBrand(int catid) {
        List<laptop> list = new ArrayList<>();
        String sql = "SELECT [LaptopID]\n"
                + "      ,[BrandID]\n"
                + "      ,[CategoryID]\n"
                + "      ,[ModelName]\n"
                + "      ,[Description]\n"
                + "      ,[CreatedAt]\n"
                + "      ,[Image]\n"
                + "      ,[Price]\n"
                + "       ,[Stock]\n"
                + "  FROM [dbo].[Laptops]\n"
                + "  where BrandID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, catid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                laptop s = new laptop(
                        rs.getInt("LaptopID"),
                        rs.getInt("BrandID"),
                        rs.getInt("CategoryID"),
                        rs.getString("ModelName"),
                        rs.getString("Description"),
                        rs.getDate("CreatedAt"), rs.getString("Image"),
                        rs.getInt("Price"), rs.getInt("Stock"));
                list.add(s);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public void addProduct(laptop a, spec b) {
        String insertLaptop = "INSERT INTO [dbo].[Laptops]\n"
                + "           ([BrandID]\n"
                + "           ,[CategoryID]\n"
                + "           ,[ModelName]\n"
                + "           ,[Description]\n"
                + "           ,[CreatedAt]\n"
                + "           ,[Image]\n"
                + "           ,[Price]\n"
                + "           ,[Stock])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?, GETDATE(), ?, ?, ?)";

        String insertSpecification = "INSERT INTO Specifications (LaptopID, Processor, RAM, Storage, ScreenSize, GraphicsCard, BatteryLife, Weight, OperatingSystem) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";

        String getID = "SELECT TOP 1 LaptopID\n"
                + "FROM Laptops\n"
                + "ORDER BY LaptopID DESC";

        try {
            PreparedStatement st = connection.prepareStatement(insertLaptop);
            st.setInt(1, a.getBrandid());
            st.setInt(2, a.getCatid());
            st.setString(3, a.getName());
            st.setString(4, a.getDesc());
            st.setString(5, a.getImg()); // Image
            st.setInt(6, a.getPrice());
            st.setInt(7, a.getStock());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

        int id = 0;
        try {
            PreparedStatement st = connection.prepareStatement(getID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                id = rs.getInt("LaptopID");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        System.out.println(id);

        try {
            PreparedStatement st = connection.prepareStatement(insertSpecification);
            st.setInt(1, id);
            st.setString(2, b.getCpu());
            st.setString(3, b.getRam());
            st.setString(4, b.getStorage());
            st.setString(5, b.getRes());
            st.setString(6, b.getCard());
            st.setString(7, b.getBattery());
            st.setString(8, b.getWeight());
            st.setString(9, b.getOs());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        System.out.println("add success");
    }

    public laptop getLastestLaptop() {
        laptop l = new laptop();
        String sql = "SELECT top 1[LaptopID]\n"
                + "      ,[BrandID]\n"
                + "      ,[CategoryID]\n"
                + "      ,[ModelName]\n"
                + "      ,[Description]\n"
                + "      ,[CreatedAt]\n"
                + "      ,[Image]\n"
                + "      ,[Price]\n"
                + "       ,[Stock]\n"
                + "  FROM [dbo].[Laptops]\n"
                + "  order by CreatedAt";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                l = new laptop(
                        rs.getInt("LaptopID"),
                        rs.getInt("BrandID"),
                        rs.getInt("CategoryID"),
                        rs.getString("ModelName"),
                        rs.getString("Description"),
                        rs.getDate("CreatedAt"), rs.getString("Image"),
                        rs.getInt("Price"), rs.getInt("Stock"));
                return l;
            }
        } catch (SQLException e) {

        }
        return null;

    }

    public List<laptop> getSearchLaptop(String name) {
        List<laptop> list = new ArrayList<>();
        String sql = "SELECT [LaptopID]\n"
                + "      ,[BrandID]\n"
                + "      ,[CategoryID]\n"
                + "      ,[ModelName]\n"
                + "      ,[Description]\n"
                + "      ,[CreatedAt]\n"
                + "      ,[Image]\n"
                + "      ,[Price]\n"
                + "      ,[Stock]\n"
                + "  FROM [dbo].[Laptops]\n"
                + "  where ModelName like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + name + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                laptop l = new laptop(
                        rs.getInt("LaptopID"),
                        rs.getInt("BrandID"),
                        rs.getInt("CategoryID"),
                        rs.getString("ModelName"),
                        rs.getString("Description"),
                        rs.getDate("CreatedAt"),
                        rs.getString("Image"),
                        rs.getInt("Price"), rs.getInt("Stock")
                );
                list.add(l);
            }
        } catch (SQLException e) {

        }
        return list;

    }

    public laptop getFeatureLaptop() {
        laptop l = new laptop();
        String sql = "SELECT TOP 1 *\n"
                + "FROM Laptops\n"
                + "ORDER BY NEWID();";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                l = new laptop(
                        rs.getInt("LaptopID"),
                        rs.getInt("BrandID"),
                        rs.getInt("CategoryID"),
                        rs.getString("ModelName"),
                        rs.getString("Description"),
                        rs.getDate("CreatedAt"),
                        rs.getString("Image"),
                        rs.getInt("Price"), rs.getInt("Stock")
                );
                return l;
            }
        } catch (SQLException e) {

        }
        return null;

    }

    public laptop getLaptopByID(int id) {
        laptop l = new laptop();
        String sql = "SELECT TOP 1 *\n"
                + "FROM Laptops\n"
                + "where laptopid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                l = new laptop(
                        rs.getInt("LaptopID"),
                        rs.getInt("BrandID"),
                        rs.getInt("CategoryID"),
                        rs.getString("ModelName"),
                        rs.getString("Description"),
                        rs.getDate("CreatedAt"), rs.getString("Image"),
                        rs.getInt("Price"), rs.getInt("Stock"));
                return l;
            }
        } catch (SQLException e) {

        }
        return null;

    }

    public List<laptop> get5LastestLaptop() {
        List<laptop> list = new ArrayList<>();
        String sql = "SELECT top 6  [LaptopID]\n"
                + "      ,[BrandID]\n"
                + "      ,[CategoryID]\n"
                + "      ,[ModelName]\n"
                + "      ,[Description]\n"
                + "      ,[CreatedAt]\n"
                + "      ,[Image]\n"
                + "      ,[Price]\n"
                + "       ,[Stock]\n"
                + "  FROM [dbo].[Laptops]\n"
                + "  order by CreatedAt desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                laptop l = new laptop(
                        rs.getInt("LaptopID"),
                        rs.getInt("BrandID"),
                        rs.getInt("CategoryID"),
                        rs.getString("ModelName"),
                        rs.getString("Description"),
                        rs.getDate("CreatedAt"), rs.getString("Image"),
                        rs.getInt("Price"), rs.getInt("Stock"));
                list.add(l);
            }
        } catch (SQLException e) {

        }
        return list;

    }

    public List<laptop> get5BestSellerLaptop() {
        List<laptop> list = new ArrayList<>();
        String sql = "SELECT top 6  [LaptopID]\n"
                + "      ,[BrandID]\n"
                + "      ,[CategoryID]\n"
                + "      ,[ModelName]\n"
                + "      ,[Description]\n"
                + "      ,[CreatedAt]\n"
                + "      ,[Image]\n"
                + "      ,[Price]\n"
                + "       ,[Stock]\n"
                + "  FROM [dbo].[Laptops]\n"
                + "  order by Stock asc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                laptop s = new laptop(
                        rs.getInt("LaptopID"),
                        rs.getInt("BrandID"),
                        rs.getInt("CategoryID"),
                        rs.getString("ModelName"),
                        rs.getString("Description"),
                        rs.getDate("CreatedAt"), rs.getString("Image"),
                        rs.getInt("Price"), rs.getInt("Stock"));
                list.add(s);
            }
        } catch (SQLException e) {

        }
        return list;

    }

    public List<laptop> get6SameLaptop(int cid) {
        List<laptop> list = new ArrayList<>();
        String sql = "select top 6*\n"
                + "from Laptops\n"
                + "where brandid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                laptop s = new laptop(
                        rs.getInt("LaptopID"),
                        rs.getInt("BrandID"),
                        rs.getInt("CategoryID"),
                        rs.getString("ModelName"),
                        rs.getString("Description"),
                        rs.getDate("CreatedAt"), rs.getString("Image"),
                        rs.getInt("Price"), rs.getInt("Stock"));
                list.add(s);
            }
        } catch (SQLException e) {

        }
        return list;

    }

    public spec getSpecLaptopByID(int id) {
        spec l = new spec();
        String sql = "SELECT [SpecID]\n"
                + "      ,[LaptopID]\n"
                + "      ,[Processor]\n"
                + "      ,[RAM]\n"
                + "      ,[Storage]\n"
                + "      ,[ScreenSize]\n"
                + "      ,[GraphicsCard]\n"
                + "      ,[BatteryLife]\n"
                + "      ,[Weight]\n"
                + "      ,[OperatingSystem]\n"
                + "  FROM [dbo].[Specifications]"
                + "Where laptopid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                l = new spec(
                        rs.getInt("SpecID"),
                        rs.getInt("LaptopID"),
                        rs.getString("Processor"),
                        rs.getString("RAM"),
                        rs.getString("Storage"),
                        rs.getString("ScreenSize"),
                        rs.getString("GraphicsCard"),
                        rs.getString("BatteryLife"),
                        rs.getString("Weight"),
                        rs.getString("OperatingSystem")
                );
                return l;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public int getTotalLaptop() {
        String sql = "select COUNT(*)\n"
                + "from Laptops";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {

        }
        return 0;
    }

    public List<laptop> getLaptopPage(int index) {
        List<laptop> list = new ArrayList<>();
        String sql = "SELECT [LaptopID]\n"
                + "      ,[BrandID]\n"
                + "      ,[CategoryID]\n"
                + "      ,[ModelName]\n"
                + "      ,[Description]\n"
                + "      ,[CreatedAt]\n"
                + "      ,[Image]\n"
                + "      ,[Price]\n"
                + "      ,[Stock]\n"
                + "  FROM [dbo].[Laptops]"
                + "  order by LaptopID desc\n"
                + "Offset ? rows fetch next 9 rows only";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 9);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                laptop s = new laptop(
                        rs.getInt("LaptopID"),
                        rs.getInt("BrandID"),
                        rs.getInt("CategoryID"),
                        rs.getString("ModelName"),
                        rs.getString("Description"),
                        rs.getDate("CreatedAt"), rs.getString("Image"),
                        rs.getInt("Price"), rs.getInt("Stock"));
                list.add(s);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<laptop> getLaptopPageASC(int index) {
        List<laptop> list = new ArrayList<>();
        String sql = "SELECT [LaptopID]\n"
                + "      ,[BrandID]\n"
                + "      ,[CategoryID]\n"
                + "      ,[ModelName]\n"
                + "      ,[Description]\n"
                + "      ,[CreatedAt]\n"
                + "      ,[Image]\n"
                + "      ,[Price]\n"
                + "      ,[Stock]\n"
                + "  FROM [dbo].[Laptops]"
                + "  order by Price\n"
                + "Offset ? rows fetch next 9 rows only";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 9);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                laptop s = new laptop(
                        rs.getInt("LaptopID"),
                        rs.getInt("BrandID"),
                        rs.getInt("CategoryID"),
                        rs.getString("ModelName"),
                        rs.getString("Description"),
                        rs.getDate("CreatedAt"), rs.getString("Image"),
                        rs.getInt("Price"), rs.getInt("Stock"));
                list.add(s);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<laptop> getLaptopPageDESC(int index) {
        List<laptop> list = new ArrayList<>();
        String sql = "SELECT [LaptopID]\n"
                + "      ,[BrandID]\n"
                + "      ,[CategoryID]\n"
                + "      ,[ModelName]\n"
                + "      ,[Description]\n"
                + "      ,[CreatedAt]\n"
                + "      ,[Image]\n"
                + "      ,[Price]\n"
                + "      ,[Stock]\n"
                + "  FROM [dbo].[Laptops]"
                + "  order by price desc\n"
                + "Offset ? rows fetch next 9 rows only";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 9);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                laptop s = new laptop(
                        rs.getInt("LaptopID"),
                        rs.getInt("BrandID"),
                        rs.getInt("CategoryID"),
                        rs.getString("ModelName"),
                        rs.getString("Description"),
                        rs.getDate("CreatedAt"), rs.getString("Image"),
                        rs.getInt("Price"), rs.getInt("Stock"));
                list.add(s);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<spec> getAllSpec() {
        List<spec> list = new ArrayList<>();
        String sql = "SELECT [SpecID]\n"
                + "      ,[LaptopID]\n"
                + "      ,[Processor]\n"
                + "      ,[RAM]\n"
                + "      ,[Storage]\n"
                + "      ,[ScreenSize]\n"
                + "      ,[GraphicsCard]\n"
                + "      ,[BatteryLife]\n"
                + "      ,[Weight]\n"
                + "      ,[OperatingSystem]\n"
                + "  FROM [dbo].[Specifications]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                spec s = new spec(
                        rs.getInt("SpecID"),
                        rs.getInt("LaptopID"),
                        rs.getString("Processor"),
                        rs.getString("RAM"),
                        rs.getString("Storage"),
                        rs.getString("ScreenSize"),
                        rs.getString("GraphicsCard"),
                        rs.getString("BatteryLife"),
                        rs.getString("Weight"),
                        rs.getString("OperatingSystem")
                );
                list.add(s);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    //delete
    public void deleteLaptop(int id) {
        String sql = "DELETE FROM Laptops\n"
                + "WHERE LaptopID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public void deleteSpec(int id) {
        String sql = "DELETE FROM Specifications\n"
                + "WHERE LaptopID =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public void updateLaptop(laptop a) {
        String sql = "UPDATE [dbo].[Laptops]\n"
                + "   SET [BrandID] = ?"
                + "      ,[CategoryID] = ?"
                + "      ,[ModelName] = ?"
                + "      ,[Description] = ?"
                + "      ,[CreatedAt] = ?"
                + "      ,[Image] = ?"
                + "      ,[Price] = ?"
                + "      ,[Stock] = ?"
                + " WHERE laptopid = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, a.getBrandid());
            st.setInt(2, a.getCatid());
            st.setString(3, a.getName());
            st.setString(4, a.getDesc());
            st.setDate(5, (Date) a.getDate()); // Assuming a.getCreatedAt() returns a java.util.Date
            st.setString(6, a.getImg()); // Assuming you are setting image as null
            st.setInt(7, a.getPrice());
            st.setInt(8, a.getStock());
            st.setInt(9, a.getLaptopid()); // Assuming you have a method to get LaptopID
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateLaptopQuantity(laptop a, int sl) {
        String sql = "UPDATE [dbo].[Laptops]\n"
                + "   SET [BrandID] = ?"
                + "      ,[CategoryID] = ?"
                + "      ,[ModelName] = ?"
                + "      ,[Description] = ?"
                + "      ,[CreatedAt] = ?"
                + "      ,[Image] = ?"
                + "      ,[Price] = ?"
                + "      ,[Stock] = ?"
                + " WHERE laptopid = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, a.getBrandid());
            st.setInt(2, a.getCatid());
            st.setString(3, a.getName());
            st.setString(4, a.getDesc());
            st.setDate(5, (Date) a.getDate()); // Assuming a.getCreatedAt() returns a java.util.Date
            st.setString(6, a.getImg()); // Assuming you are setting image as null
            st.setInt(7, a.getPrice());
            st.setInt(8, a.getStock() - sl);
            st.setInt(9, a.getLaptopid()); // Assuming you have a method to get LaptopID
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //check Student id exsited???
    /*public Student getStudentById(String id) {
        String sql = "SELECT TOP (1000) [ID]\n"
                + "      ,[Name]\n"
                + "      ,[DOB]\n"
                + "      ,[Gender]\n"
                + "      ,[Address]\n"
                + "  FROM [Trading2024].[dbo].[Student] where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Student s = new Student(rs.getString("id"),
                        rs.getString("name"),
                        rs.getString("dob"),
                        rs.getBoolean("gender"),
                        rs.getString("address"));
                return s;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public void insert(Student s) {
        String sql = "insert into student values(?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, s.getId());
            st.setString(2, s.getName());
            st.setString(3, s.getDob());
            st.setBoolean(4, s.isGender());
            st.setString(5, s.getAddress());
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public void update(Student s) {
        String sql = "update student set name=?,dob=?,gender=?,address=? where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, s.getName());
            st.setString(2, s.getDob());
            st.setBoolean(3, s.isGender());
            st.setString(4, s.getAddress());
            st.setString(5, s.getId());
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public Admin checkAuthen(String username, String password) {
        String sql = "select * from admin where username=? and password=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Admin(username, password, rs.getInt("role"));
            }
        } catch (SQLException e) {

        }
        return null;
    }*/
    public static void main(String[] args) {
        LaptopDAO d = new LaptopDAO();
        List<laptop> list = d.getAllLaptop();
        d.updateLaptopQuantity(d.getLaptopByID(1), 5);

    }
}

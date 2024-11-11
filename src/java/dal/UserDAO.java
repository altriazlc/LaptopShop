/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author nhhag
 */
import java.util.ArrayList;
import java.util.List;
import model.laptop;
import model.spec;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.user;

public class UserDAO extends DBContext {

    public user checkUser(String pass, String user) {
        String sql = "  SELECT UserID, UserName, Email, PasswordHash, Role, FullName, Address, Phone FROM Users\n"
                + "  where PasswordHash =? and  UserName = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pass);
            st.setString(2, user);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new user(rs.getInt("UserId"),
                        rs.getString("UserName"),
                        rs.getString("Email"),
                        rs.getString("PasswordHash"),
                        rs.getInt("Role"),
                        rs.getString("FullName"),
                        rs.getString("Address"),
                        rs.getString("Phone")
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public user checkDupli(String user) {
        String sql = "  SELECT  Userid,UserName, Email, PasswordHash, Role, FullName, Address, Phone FROM Users\n"
                + "  where UserName = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new user(rs.getInt("UserId"),
                        rs.getString("UserName"),
                        rs.getString("Email"),
                        rs.getString("PasswordHash"),
                        rs.getInt("Role"),
                        rs.getString("FullName"),
                        rs.getString("Address"),
                        rs.getString("Phone")
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public user checkDupliEmail(String email) {
        String sql = "  SELECT  UserId, UserName, Email, PasswordHash, Role, FullName, Address, Phone FROM Users\n"
                + "  where Email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new user(rs.getInt("UserId"),
                        rs.getString("UserName"),
                        rs.getString("Email"),
                        rs.getString("PasswordHash"),
                        rs.getInt("Role"),
                        rs.getString("FullName"),
                        rs.getString("Address"),
                        rs.getString("Phone")
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insertUser(user u) {

        String sql = "INSERT INTO Users (UserName, Email, PasswordHash, Role, FullName, Address, Phone) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getUserName());
            st.setString(2, u.getEmail());
            st.setString(3, u.getPass());
            st.setInt(4, u.getRole());
            st.setString(5, u.getName());
            st.setString(6, u.getAddress());
            st.setString(7, u.getPhone());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void deleteUser(int uid) {

        String sql = "DELETE FROM [dbo].[Users]\n"
                + "WHERE [UserID] = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void updateUser(user a, int id) {

        String sql = "UPDATE [dbo].[Users]\n"
                + "   SET [UserName] = ?\n"
                + "      ,[Email] = ?\n"
                + "      ,[PasswordHash] = ? \n"
                + "      ,[Role] = ?\n"
                + "      ,[FullName] = ? \n"
                + "      ,[Address] = ?\n"
                + "      ,[Phone] = ?\n"
                + " WHERE userid=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getUserName());
            st.setString(2, a.getEmail());
            st.setString(3, a.getPass());
            st.setInt(4, a.getRole());
            st.setString(5, a.getName());
            st.setString(6, a.getAddress());
            st.setString(7, a.getPhone());
            st.setInt(8, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public List<user> getAllUser() {
        String sql = "  SELECT UserID, UserName, Email, PasswordHash, Role, FullName, Address, Phone FROM Users";
        List<user> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                user s = new user(rs.getInt("UserId"),
                        rs.getString("UserName"),
                        rs.getString("Email"),
                        rs.getString("PasswordHash"),
                        rs.getInt("Role"),
                        rs.getString("FullName"),
                        rs.getString("Address"),
                        rs.getString("Phone")
                );
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public user getUserByID(int uid) {
        String sql = "select *\n"
                + "from Users\n"
                + "where UserID =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new user(rs.getInt("UserId"),
                        rs.getString("UserName"),
                        rs.getString("Email"),
                        rs.getString("PasswordHash"),
                        rs.getInt("Role"),
                        rs.getString("FullName"),
                        rs.getString("Address"),
                        rs.getString("Phone")
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<user> getAllUserByPage(int index) {
        String sql = "  SELECT [UserID]\n"
                + "      ,[UserName]\n"
                + "      ,[Email]\n"
                + "      ,[PasswordHash]\n"
                + "      ,[Role]\n"
                + "      ,[FullName]\n"
                + "      ,[Address]\n"
                + "      ,[Phone]\n"
                + "  FROM [dbo].[Users]\n"
                + "  order by Role\n"
                + "offset ? rows fetch next 9 rows only ";
        List<user> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 9);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                user s = new user(rs.getInt("UserId"),
                        rs.getString("UserName"),
                        rs.getString("Email"),
                        rs.getString("PasswordHash"),
                        rs.getInt("Role"),
                        rs.getString("FullName"),
                        rs.getString("Address"),
                        rs.getString("Phone")
                );
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        UserDAO d = new UserDAO();
        System.out.println(d.getUserByID(21));
    }
}

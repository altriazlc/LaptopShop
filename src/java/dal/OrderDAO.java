package dal;

/**
 *
 * @author nhhag
 */
import model.orderdetail;
import java.util.ArrayList;
import java.util.List;
import model.laptop;
import model.spec;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.user;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.CartItem;
import model.chartweek;
import model.order;
import org.eclipse.jdt.internal.compiler.batch.Main;

public class OrderDAO extends DBContext {

    public List<orderdetail> getAllOrderDetailByID(int id) {
        List<orderdetail> list = new ArrayList<>();
        String sql = "SELECT * FROM OrderItems where orderid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                orderdetail orderItem = new orderdetail(
                        rs.getInt("OrderItemID"),
                        rs.getInt("OrderID"),
                        rs.getInt("LaptopID"),
                        rs.getInt("Quantity"),
                        rs.getDouble("Price")
                );
                list.add(orderItem);
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Print the stack trace for debugging
        }
        return list;
    }

    public List<order> getAllOrdersPage(int index) {
        List<order> list = new ArrayList<>();
        String sql = "select *\n"
                + "from Orders\n"
                + "order by OrderDate desc\n"
                + "offset ? rows fetch next 9 rows only ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 9);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                order order = new order(
                        rs.getInt("OrderID"),
                        rs.getInt("UserID"),
                        rs.getTimestamp("OrderDate"),
                        rs.getInt("TotalAmount"),
                        rs.getString("Status"));
                list.add(order);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<order> getAllOrder() {
        List<order> list = new ArrayList<>();
        String sql = "select *\n"
                + "from Orders\n";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                order order = new order(
                        rs.getInt("OrderID"),
                        rs.getInt("UserID"),
                        rs.getTimestamp("OrderDate"),
                        rs.getInt("TotalAmount"),
                        rs.getString("Status"));
                list.add(order);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<CartItem> getAllCartItemsByID(int id) {
        List<CartItem> list = new ArrayList<>();
        String sql = "SELECT * FROM CartItems where userid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CartItem cartItem = new CartItem(
                        rs.getInt("CartItemID"),
                        rs.getInt("LaptopID"),
                        rs.getInt("Quantity"),
                        rs.getInt("UserID")
                );
                list.add(cartItem);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Print the stack trace for debugging
        }
        return list;
    }

    public CartItem checkDupliProduct(int uid, int pid) {

        String sql = "select * \n"
                + "from CartItems\n"
                + "where UserID = ? and LaptopID =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uid);
            st.setInt(2, pid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CartItem s = new CartItem(
                        rs.getInt("CartItemID"),
                        rs.getInt("LaptopID"),
                        rs.getInt("Quantity"),
                        rs.getInt("UserID")
                );
                return s;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Print the stack trace for debugging
        }
        return null;
    }

    public CartItem getProductAmount(int uid, int pid) {

        String sql = "select * \n"
                + "from CartItems\n"
                + "where UserID = ? and LaptopID =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uid);
            st.setInt(2, pid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CartItem s = new CartItem(
                        rs.getInt("CartItemID"),
                        rs.getInt("LaptopID"),
                        rs.getInt("Quantity"),
                        rs.getInt("UserID")
                );
                return s;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Print the stack trace for debugging
        }
        return null;
    }

    public void insertCartItem(CartItem cartItem) {
        String sql = "INSERT INTO CartItems (LaptopID, Quantity, UserID) VALUES (?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cartItem.getLaptopID());
            st.setInt(2, cartItem.getQuantity());
            st.setInt(3, cartItem.getUserID());

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Print the stack trace for debugging

        }

    }

    public void updateCartItemQuantity(CartItem cartItem) {
        String sql = "UPDATE CartItems\n"
                + "SET Quantity = ?\n"
                + "WHERE LaptopID = ? AND UserID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(2, cartItem.getLaptopID());
            st.setInt(1, cartItem.getQuantity());
            st.setInt(3, cartItem.getUserID());

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Print the stack trace for debugging

        }

    }

    public void deleteCartItem(CartItem cartItem) {
        String sql = "DELETE FROM CartItems\n"
                + "WHERE LaptopID = ? AND UserID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cartItem.getLaptopID());
            st.setInt(2, cartItem.getUserID());

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Print the stack trace for debugging

        }

    }

    public void deleteCartItemByUserID(int uid) {
        String sql = "DELETE FROM [dbo].[CartItems]\n"
                + "WHERE [UserID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uid);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Print the stack trace for debugging

        }

    }

    public void addNewOrderByUserID(int uid, int price) {
        String sql = "INSERT INTO [dbo].[Orders] ([UserID], [OrderDate], [TotalAmount], [Status]) VALUES (?, GETDATE(), ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uid);
            st.setInt(2, price);
            st.setString(3, "Processing");
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Print the stack trace for debugging

        }

    }

    public void updateOrderStatus(order o, String status, int oid) {
        String sql = "UPDATE [dbo].[Orders]\n"
                + "   SET [UserID] = ?\n"
                + "      ,[OrderDate] = [OrderDate]\n"
                + "      ,[TotalAmount] =? \n"
                + "      ,[Status] = ?\n"
                + " WHERE orderid =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, o.getUserid());
            st.setInt(2, o.getTotal());
            st.setString(3, status);
            st.setInt(4, oid);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Print the stack trace for debugging

        }

    }

    public int getSaleWeek(int stt) {
        String sql = " SELECT *\n"
                + "FROM Orders o\n"
                + "WHERE o.Status = 'Complete'\n"
                + "  AND DATEPART(dw, o.OrderDate) = ?  \n"
                + "  AND MONTH(o.OrderDate) = MONTH(GETDATE())\n"
                + "  AND YEAR(o.OrderDate) = YEAR(GETDATE())\n"
                + "  AND DATEPART(week, o.OrderDate) = DATEPART(week, GETDATE());";
        int sum = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, stt);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                sum += rs.getInt("TotalAmount");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return sum;
    }

    public int getSaleMonth(int stt) {
        String sql = "select *\n"
                + "from Orders o\n"
                + "where o.Status ='Complete' and Month(o.OrderDate)=?";
        int sum = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, stt);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                sum += rs.getInt("TotalAmount");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return sum;
    }

    public order getNewestOrdersByUserID() {
        String sql = "   SELECT top 1 [OrderID]\n"
                + "      ,[UserID]\n"
                + "      ,[OrderDate]\n"
                + "      ,[TotalAmount]\n"
                + "      ,[Status]\n"
                + "  FROM [dbo].[Orders]\n"
                + "	order by OrderDate desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new order(rs.getInt("OrderID"),
                        rs.getInt("UserID"),
                        rs.getDate("OrderDate"),
                        rs.getInt("TotalAmount"),
                        rs.getString("Status"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public order getOrdersByOrderID(int oid) {
        String sql = "   SELECT top 1 [OrderID]\n"
                + "      ,[UserID]\n"
                + "      ,[OrderDate]\n"
                + "      ,[TotalAmount]\n"
                + "      ,[Status]\n"
                + "  FROM [dbo].[Orders]\n"
                + "where orderid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, oid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new order(rs.getInt("OrderID"),
                        rs.getInt("UserID"),
                        rs.getDate("OrderDate"),
                        rs.getInt("TotalAmount"),
                        rs.getString("Status"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<order> getAllOrdersByUserID(int uid) {
        List<order> list = new ArrayList<>();
        String sql = "select   [OrderID]\n"
                + "      ,[UserID]\n"
                + "      ,[OrderDate]\n"
                + "      ,[TotalAmount]\n"
                + "      ,[Status]\n"
                + "  FROM [dbo].[Orders]\n"
                + "where userid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                order o = new order(rs.getInt("OrderID"),
                        rs.getInt("UserID"),
                        rs.getDate("OrderDate"),
                        rs.getInt("TotalAmount"),
                        rs.getString("Status"));
                list.add(o);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void addNewOrderItemsByOrderID(int oid, CartItem a) {
        String sql = "INSERT INTO [dbo].[OrderItems]\n"
                + "           ([OrderID]\n"
                + "           ,[LaptopID]\n"
                + "           ,[Quantity]\n"
                + "           ,[Price])\n"
                + "     VALUES (?,?,?,?)\n";
        LaptopDAO d = new LaptopDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, oid);
            st.setInt(2, a.getLaptopID());
            st.setInt(3, a.getQuantity());
            st.setInt(4, d.getLaptopByID(a.getLaptopID()).getPrice());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Print the stack trace for debugging

        }

    }

    public static void main(String[] args) {
        OrderDAO o = new OrderDAO();
        System.out.println(o.getSaleWeek(0));

    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.History;
import models.Order;
import models.Product;
import models.Users;

public class DAO {

    private Connection connection;

    public DAO(DBContext db) {
        try {
            connection = db.getConnection();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public Users getAccountByUsername(String username) {
        try {
            String sql = "SELECT * "
                    + "  FROM [PRJ321_PROJECT].[dbo].[User]\n"
                    + "WHERE [username] = ? ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Users(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int checkUserAccount(String username, String password) {
        Users acc = getAccountByUsername(username);
        if (acc == null) {
            return 0; //Account is not available
        } else if (!acc.getPassword().equals(password)) {
            return 1; //Wrong password
        } else {
            return 2; //Account available
        }
    }

    public void signUpAccount(String username, String password, String email, String phone) {
        try {
            String sql = "INSERT INTO [PRJ321_PROJECT].[dbo].[User]\n"
                    + "           ([username]\n"
                    + "           ,[password]\n"
                    + "           ,[email]\n"
                    + "           ,[phone])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setString(4, phone);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void UpdateMethod(Users us, String oldusername) {
        try {
            String sql = "UPDATE [PRJ321_PROJECT].[dbo].[User]\n"
                    + "   SET [username] = ?\n"
                    + "      ,[password] = ?\n"
                    + "      ,[email] = ?\n"
                    + "      ,[phone] = ?\n"
                    + " WHERE [username] = ?";

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, us.getUsername());
            statement.setString(2, us.getPassword());
            statement.setString(3, us.getEmail());
            statement.setString(4, us.getPhone());
            statement.setString(5, oldusername);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addToContact(String username, String email, String phone, String contents) {
        try {
            String sql = "INSERT INTO [PRJ321_PROJECT].[dbo].[Contact]\n"
                    + "           ([name]\n"
                    + "           ,[email]\n"
                    + "           ,[phone]\n"
                    + "           ,[contents])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, contents);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Product getProductByID(int pid) {
        try {
            String sql = "select * from Product p where p.ProductID = ? ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setProductPrice(rs.getInt("ProductPrice"));
                p.setProductImage(rs.getString("ProductImage"));
                return p;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> getListProduct(int pageIndex) throws SQLException {
        List<Product> list = new ArrayList<>();
        try {
            String query = "select * from("
                    + "select ROW_NUMBER() over (order by ProductID ASC) as rn, *\n"
                    + "from Product"
                    + ")as x\n"
                    + "where rn between (?-1)*?+1"
                    + "and ?*?";

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, pageIndex);
            ps.setInt(2, 6);
            ps.setInt(3, pageIndex);
            ps.setInt(4, 6);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setProductPrice(rs.getInt("ProductPrice"));
                p.setProductImage(rs.getString("ProductImage"));
                list.add(p);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int getLastOrderID() {
        int orderID = 0;
        try {
            String sql = "select top(1) OrderID from [Order] order by OrderID desc";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return orderID;
    }

    public List<Order> getAllProductByUser(String username) {
        List<Order> list = new ArrayList<>();
        try {
            String sql = "select p.ProductImage, p.ProductName, p.ProductPrice, o.OrderQuantity,o.OrderTotalPrice\n"
                    + "from [Order] o, Product p, [User] u \n"
                    + "where o.ProductID = p.ProductID and o.username = u.username and u.username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                int orderID = getLastOrderID();
                o.setOrderID(orderID + 1);
                o.setProductImage(rs.getString(1));
                o.setProductName(rs.getString(2));
                o.setProductPrice(rs.getInt(3));
                o.setQuantity(rs.getInt(4));
                o.setTotalPrice(rs.getInt(3) * rs.getInt(4));
                list.add(o);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<History> getHistory(String username) {
        ArrayList<History> list = new ArrayList();
        try {
            String sql = "select *\n"
                    + "  from History h\n"
                    + "  where h.username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new History(rs.getInt(1), rs.getInt(2), rs.getString(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void buy(int totalPriceCart, String username) {
        try {
            String sql = "insert into [History] "
                    + "(Total_Price_Cart, username) "
                    + "values (?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, totalPriceCart);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public int getCount() throws SQLException {
        int count = 0;
        try {
            String query = "select count(*) from Product";

            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return count;

    }

    public List<Users> getAllUser() {
        List<Users> list = new ArrayList<>();
        try {
            String sql = "select username from [User] where username not like 'admin'";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Users u = new Users();
                u.setUsername(rs.getString("username"));
                list.add(u);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void deleteByUsername(String username) {
        try {
            String sql = "delete from [User] where username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public ArrayList<Product> searchProduct(String keyword) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "";
        try {
            try {
                int temp = Integer.parseInt(keyword);
                sql = "select * from Product p "
                        + "where p.ProductPrice = " + keyword;
            } catch (NumberFormatException e) {
                sql = "select * from Product p "
                        + "where p.ProductName like '%" + keyword + "%'";
            }
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }
}

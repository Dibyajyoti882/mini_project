/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ecommerce.dao;

import com.ecommerce.util.DBConnection;
import com.ecommerce.model.CartItem;
import com.ecommerce.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
/**
 *
 * @author divyajyoti
 */
public class OrderDAO {
     public boolean placeOrder(int userId, List<CartItem> items) {
        String insertOrder = "INSERT INTO orders (user_id, status) VALUES (?, 'PLACED')";
        String insertItem = "INSERT INTO order_items (order_id, product_id, quantity) VALUES (?, ?, ?)";
        String updateStock = "UPDATE products SET stock = stock - ? WHERE id = ?";

        try (Connection conn = DBConnection.getConnection()) {
            try {
                conn.setAutoCommit(false);
                int orderId;
                try (PreparedStatement ps = conn.prepareStatement(insertOrder, Statement.RETURN_GENERATED_KEYS)) {
                    ps.setInt(1, userId);
                    ps.executeUpdate();
                    try (ResultSet rs = ps.getGeneratedKeys()) {
                        if (rs.next()) orderId = rs.getInt(1);
                        else throw new RuntimeException("Failed to create order");
                    }
                }

                try (PreparedStatement psItem = conn.prepareStatement(insertItem);
                     PreparedStatement psUpdate = conn.prepareStatement(updateStock)) {
                    for (CartItem ci : items) {
                        Product p = ci.getProduct();
                        psItem.setInt(1, orderId);
                        psItem.setInt(2, p.getId());
                        psItem.setInt(3, ci.getQuantity());
                        psItem.executeUpdate();

                        psUpdate.setInt(1, ci.getQuantity());
                        psUpdate.setInt(2, p.getId());
                        psUpdate.executeUpdate();
                    }
                }

                conn.commit();
                return true;
            } catch (Exception e) {
                conn.rollback();
                e.printStackTrace();
                return false;
            } finally {
                conn.setAutoCommit(true);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }
}

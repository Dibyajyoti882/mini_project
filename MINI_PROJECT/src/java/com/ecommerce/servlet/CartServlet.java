package com.ecommerce.servlet;

import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.CartItem;
import com.ecommerce.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private ProductDAO pdao = new ProductDAO();

    @SuppressWarnings("unchecked")
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        HttpSession session = req.getSession();
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
        if (cart == null) { cart = new LinkedHashMap<>(); session.setAttribute("cart", cart); }

        if ("add".equals(action)) {
            int pid = Integer.parseInt(req.getParameter("productId"));
            int qty = Integer.parseInt(req.getParameter("quantity"));
            Product p = pdao.findById(pid);
            if (p != null) {
                if (cart.containsKey(pid)) {
                    CartItem ci = cart.get(pid);
                    ci.setQuantity(ci.getQuantity() + qty);
                } else {
                    cart.put(pid, new CartItem(p, qty));
                }
            }
        } else if ("update".equals(action)) {
            int pid = Integer.parseInt(req.getParameter("productId"));
            int qty = Integer.parseInt(req.getParameter("quantity"));
            if (cart.containsKey(pid)) cart.get(pid).setQuantity(qty);
        } else if ("remove".equals(action)) {
            int pid = Integer.parseInt(req.getParameter("productId"));
            cart.remove(pid);
        }
        resp.sendRedirect(req.getContextPath() + "/cart.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect(req.getContextPath() + "/cart.jsp");
    }
}

<%@ page import="java.util.Map" %>
<%@ page import="com.ecommerce.model.CartItem" %>
<%@ page import="com.ecommerce.model.Product" %>
<%
Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
if (cart == null) cart = new java.util.LinkedHashMap<>();
double total = 0;
for (CartItem ci : cart.values()) total += ci.getProduct().getPrice().doubleValue() * ci.getQuantity();
%>
<!doctype html>
<html><head>
<meta charset="utf-8"><title>Cart</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container py-4">
  <h2>Your Cart</h2>
  <a href="products" class="btn btn-link">Continue shopping</a>
  <table class="table mt-3">
    <thead><tr><th>Product</th><th>Price</th><th>Qty</th><th>Subtotal</th><th></th></tr></thead>
    <tbody>
      <% for (CartItem ci : cart.values()) {
           Product p = ci.getProduct();
      %>
      <tr>
        <td><%= p.getName() %></td>
        <td>? <%= p.getPrice() %></td>
        <td>
          <form action="<%= request.getContextPath() %>/cart" method="post" class="d-flex">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="productId" value="<%= p.getId() %>">
            <input type="number" name="quantity" value="<%= ci.getQuantity() %>" min="1" class="form-control me-2" style="width:100px">
            <button class="btn btn-sm btn-primary">Update</button>
          </form>
        </td>
        <td>? <%= p.getPrice().doubleValue() * ci.getQuantity() %></td>
        <td>
          <form action="<%= request.getContextPath() %>/cart" method="post">
            <input type="hidden" name="action" value="remove">
            <input type="hidden" name="productId" value="<%= p.getId() %>">
            <button class="btn btn-sm btn-danger">Remove</button>
          </form>
        </td>
      </tr>
      <% } %>
    </tbody>
  </table>

  <div class="d-flex justify-content-between">
    <h4>Total: ? <%= total %></h4>
    <div>
      <a href="products" class="btn btn-secondary">Continue</a>
      <a href="checkout.jsp" class="btn btn-success">Checkout</a>
    </div>
  </div>
</body></html>

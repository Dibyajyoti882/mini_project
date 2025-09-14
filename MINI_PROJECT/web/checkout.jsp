<%@ page import="java.util.Map" %>
<%@ page import="com.ecommerce.model.CartItem" %>
<%
Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
if (cart == null) cart = new java.util.LinkedHashMap<>();
double total = 0;
for (CartItem ci : cart.values()) total += ci.getProduct().getPrice().doubleValue() * ci.getQuantity();
%>
<!doctype html>
<html><head>
<meta charset="utf-8"><title>Checkout</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container py-4">
  <h2>Checkout</h2>
  <div class="mb-3">
    <h4>Order summary</h4>
    <ul>
      <% for (CartItem ci : cart.values()) { %>
        <li><%= ci.getProduct().getName() %> x <%= ci.getQuantity() %> = ? <%= ci.getProduct().getPrice().doubleValue() * ci.getQuantity() %></li>
      <% } %>
    </ul>
    <h5>Total: ? <%= total %></h5>
  </div>

  <form action="<%= request.getContextPath() %>/checkout" method="post">
    <!-- in future: shipping address, payment method -->
    <button class="btn btn-success">Place Order</button>
  </form>
</body></html>

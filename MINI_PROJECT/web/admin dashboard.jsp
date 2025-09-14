<%@ page import="java.util.List" %>
<%@ page import="com.ecommerce.model.Product" %>
<%
    com.ecommerce.model.User currentUser =
        (com.ecommerce.model.User) session.getAttribute("currentUser");

    if (currentUser == null || !"ADMIN".equals(currentUser.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - E-Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h1>Welcome, <%= currentUser.getFullname() %> (Admin)</h1>
    <a href="logout.jsp" class="btn btn-danger">Logout</a>
    <hr>

    <h3>Manage Products</h3>
    <a href="add-product.jsp" class="btn btn-success mb-3">+ Add New Product</a>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th><th>Name</th><th>Price</th><th>Stock</th><th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% 
                List<Product> products = (List<Product>) request.getAttribute("products");
                if (products != null) {
                    for (Product p : products) {
            %>
            <tr>
                <td><%= p.getId() %></td>
                <td><%= p.getName() %></td>
                <td><%= p.getPrice() %></td>
                <td><%= p.getStock() %></td>
                <td>
                    <a href="edit-product.jsp?id=<%= p.getId() %>" class="btn btn-warning btn-sm">Edit</a>
                    <a href="delete-product?id=<%= p.getId() %>" class="btn btn-danger btn-sm">Delete</a>
                </td>
            </tr>
            <% } } %>
        </tbody>
    </table>
</div>
</body>
</html>

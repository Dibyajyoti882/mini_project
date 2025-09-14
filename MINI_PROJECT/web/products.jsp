<%@ page import="java.util.List" %>
<%@ page import="com.ecommerce.model.Product" %>
<%
    List<Product> products = (List<Product>) request.getAttribute("products");
    if (products == null) products = new java.util.ArrayList<>();

    com.ecommerce.model.User currentUser =
        (com.ecommerce.model.User) session.getAttribute("currentUser");
%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Products - E-Shop</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
  <style>
    :root {
      --primary-color: #2563eb;
      --secondary-color: #64748b;
      --accent-color: #f59e0b;
      --success-color: #10b981;
      --danger-color: #ef4444;
    }

    body {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      min-height: 100vh;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .navbar {
      background: rgba(255, 255, 255, 0.95) !important;
      backdrop-filter: blur(10px);
      box-shadow: 0 2px 20px rgba(0,0,0,0.1);
    }

    .navbar-brand {
      font-weight: 700;
      font-size: 1.5rem;
      color: var(--primary-color) !important;
    }

    .btn-custom {
      border-radius: 25px;
      padding: 6px 18px;
      font-weight: 500;
      transition: all 0.3s ease;
    }

    .btn-cart {
      background: var(--accent-color);
      color: white;
      border: none;
    }
    .btn-cart:hover { background: #d97706; color: white; }

    .btn-login {
      background: transparent;
      color: var(--primary-color);
      border: 2px solid var(--primary-color);
    }
    .btn-login:hover {
      background: var(--primary-color);
      color: white;
    }

    .main-content {
      background: rgba(255, 255, 255, 0.95);
      border-radius: 20px;
      margin: 2rem 0;
      padding: 2rem;
      backdrop-filter: blur(10px);
      box-shadow: 0 10px 40px rgba(0,0,0,0.1);
    }

    .product-card {
      border: none;
      border-radius: 15px;
      overflow: hidden;
      transition: all 0.3s ease;
      background: white;
      box-shadow: 0 5px 15px rgba(0,0,0,0.08);
    }
    .product-card:hover {
      transform: translateY(-8px);
      box-shadow: 0 20px 40px rgba(0,0,0,0.15);
    }

    .product-img {
      width: 100%;
      height: 230px;
      object-fit: contain;
      background: #fff;
      padding: 12px;
      border-bottom: 1px solid #eee;
      transition: transform 0.3s ease;
    }
    .product-card:hover .product-img { transform: scale(1.05); }

    .price-tag {
      background: linear-gradient(45deg, var(--success-color), #059669);
      color: white;
      padding: 5px 15px;
      border-radius: 20px;
      font-weight: 600;
      display: inline-block;
    }

    .add-to-cart-btn {
      background: linear-gradient(45deg, var(--primary-color), #1d4ed8);
      border: none;
      border-radius: 10px;
      padding: 10px;
      color: white;
      font-weight: 600;
      transition: all 0.3s ease;
    }
    .add-to-cart-btn:hover {
      background: linear-gradient(45deg, #1d4ed8, var(--primary-color));
      transform: translateY(-2px);
      color: white;
    }

    .footer {
      background: rgba(30, 41, 59, 0.95);
      color: white;
      margin-top: 4rem;
    }
  </style>
</head>
<body>

  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
      <a class="navbar-brand" href="<%= request.getContextPath() %>/products">
        <i class="fas fa-shopping-store me-2"></i>E-Shop
      </a>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <a class="nav-link" href="<%= request.getContextPath() %>/products">
              <i class="fas fa-home me-1"></i>Home
            </a>
          </li>
          <% if (currentUser != null) { %>
            <li class="nav-item">
              <span class="nav-link">
                <i class="fas fa-user me-1"></i> Welcome, <%= currentUser.getFullname() %>
              </span>
            </li>
            <li class="nav-item">
              <a class="btn btn-danger btn-sm ms-2" href="logout.jsp">Logout</a>
            </li>
          <% } else { %>
            <li class="nav-item">
              <a class="btn btn-custom btn-login me-2" href="login.jsp">
                <i class="fas fa-user me-1"></i>Login
              </a>
            </li>
            <li class="nav-item">
              <a class="btn btn-custom btn-cart" href="register.jsp">
                <i class="fas fa-user-plus me-1"></i>Register
              </a>
            </li>
          <% } %>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Products Section -->
  <div class="container">
    <div class="main-content">
      <h1 class="page-title text-center">
        <i class="fas fa-shopping-bag me-2"></i>Available Products
      </h1>

      <div class="row g-4">
        <% if (products.isEmpty()) { %>
          <div class="col-12 text-center py-5">
            <i class="fas fa-box-open fa-4x text-muted mb-3"></i>
            <p class="text-muted fs-5">No products available at the moment.</p>
          </div>
        <% } else {
             for (Product p : products) { 
                String imageUrl = p.getImageUrl();
                boolean isOnline = (imageUrl != null && (imageUrl.startsWith("http://") || imageUrl.startsWith("https://")));
        %>
          <div class="col-lg-4 col-md-6">
            <div class="card product-card h-100">
              <!-- Product Image -->
              <div class="position-relative">
               <img src="<%= isOnline ? imageUrl : request.getContextPath() + "/" + imageUrl %>"
                    class="product-img"
                    alt="<%= p.getName() %>"
                    onerror="this.src='<%= request.getContextPath() %>/images/placeholder.png'">
               
                <div class="position-absolute top-0 end-0 m-3">
                  <span class="price-tag">
                    <i class="fas fa-rupee-sign"></i> <%= p.getPrice() %>
                  </span>
                </div>
              </div>

              <!-- Product Info -->
              <div class="card-body d-flex flex-column">
                <h5 class="card-title fw-bold mb-2">
                  <i class="fas fa-tag me-2 text-primary"></i><%= p.getName() %>
                </h5>
                <p class="card-text text-muted mb-3" style="flex-grow:1;">
                  <%= p.getDescription() %>
                </p>

                <!-- Add to Cart -->
                <form action="<%= request.getContextPath() %>/cart" method="post" class="mt-auto">
                  <input type="hidden" name="action" value="add">
                  <input type="hidden" name="productId" value="<%= p.getId() %>">
                  <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-sort-numeric-up"></i></span>
                    <input type="number" name="quantity" class="form-control" min="1" value="1" max="99">
                    <button class="btn add-to-cart-btn" type="submit">
                      <i class="fas fa-cart-plus me-1"></i>Add to Cart
                    </button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        <% } } %>
      </div>
    </div>
  </div>

  <!-- Footer -->
  <footer class="footer py-4">
    <div class="container text-center">
      <p class="mb-0">&copy; 2025 E-Shop. All rights reserved.</p>
    </div>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

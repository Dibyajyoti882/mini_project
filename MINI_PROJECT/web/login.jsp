<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Login - E-Shop</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <style>
    :root {
      --primary-color: #3B82F6;
      --secondary-color: #64748B;
      --success-color: #10B981;
      --danger-color: #EF4444;
      --warning-color: #F59E0B;
      --light-gray: #F8FAFC;
      --medium-gray: #E2E8F0;
      --dark-gray: #1E293B;
      --gradient-bg: linear-gradient(135deg, #667EEA 0%, #764BA2 100%);
    }
    
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    
    body {
      font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
      background: var(--gradient-bg);
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      line-height: 1.6;
      padding: 2rem 1rem;
    }
    
    .login-container {
      width: 100%;
      max-width: 450px;
      animation: slideInUp 0.8s cubic-bezier(0.4, 0, 0.2, 1);
    }
    
    .login-card {
      background: rgba(255, 255, 255, 0.95);
      backdrop-filter: blur(20px);
      border-radius: 24px;
      padding: 3rem 2.5rem;
      box-shadow: 
        0 25px 50px -12px rgba(0, 0, 0, 0.25),
        0 0 0 1px rgba(255, 255, 255, 0.3);
      border: 1px solid rgba(255, 255, 255, 0.2);
    }
    
    .login-header {
      text-align: center;
      margin-bottom: 2.5rem;
    }
    
    .brand-logo {
      background: linear-gradient(135deg, var(--primary-color), #7C3AED);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
      font-size: 2.5rem;
      font-weight: 700;
      margin-bottom: 0.5rem;
      display: block;
    }
    
    .login-title {
      font-size: 1.75rem;
      font-weight: 700;
      color: var(--dark-gray);
      margin-bottom: 0.5rem;
    }
    
    .login-subtitle {
      color: var(--secondary-color);
      font-size: 1rem;
      font-weight: 400;
    }
    
    .form-group {
      margin-bottom: 1.75rem;
      position: relative;
    }
    
    .form-label {
      font-weight: 600;
      color: var(--dark-gray);
      margin-bottom: 0.5rem;
      font-size: 0.9rem;
      display: flex;
      align-items: center;
      gap: 8px;
    }
    
    .form-control {
      background: rgba(248, 250, 252, 0.8);
      border: 2px solid var(--medium-gray);
      border-radius: 16px;
      padding: 1rem 1.25rem;
      font-size: 1rem;
      transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
      color: var(--dark-gray);
    }
    
    .form-control:focus {
      outline: none;
      border-color: var(--primary-color);
      background: white;
      box-shadow: 0 0 0 4px rgba(59, 130, 246, 0.1);
      transform: translateY(-2px);
    }
    
    .form-control::placeholder {
      color: var(--secondary-color);
    }
    
    .input-icon {
      position: absolute;
      right: 1.25rem;
      top: 50%;
      transform: translateY(-50%);
      color: var(--secondary-color);
      transition: all 0.3s ease;
      pointer-events: none;
    }
    
    .form-control:focus + .input-icon {
      color: var(--primary-color);
    }
    
    .password-toggle {
      position: absolute;
      right: 1.25rem;
      top: 50%;
      transform: translateY(-50%);
      background: none;
      border: none;
      color: var(--secondary-color);
      cursor: pointer;
      padding: 0;
      font-size: 1.1rem;
      transition: all 0.3s ease;
    }
    
    .password-toggle:hover {
      color: var(--primary-color);
    }
    
    .form-extras {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 2rem;
      font-size: 0.9rem;
    }
    
    .remember-me {
      display: flex;
      align-items: center;
      gap: 8px;
      cursor: pointer;
    }
    
    .remember-me input[type="checkbox"] {
      width: 18px;
      height: 18px;
      border: 2px solid var(--medium-gray);
      border-radius: 4px;
      cursor: pointer;
    }
    
    .remember-me input[type="checkbox"]:checked {
      background-color: var(--primary-color);
      border-color: var(--primary-color);
    }
    
    .remember-me label {
      color: var(--secondary-color);
      cursor: pointer;
      margin: 0;
    }
    
    .forgot-password {
      color: var(--primary-color);
      text-decoration: none;
      font-weight: 500;
      transition: all 0.3s ease;
    }
    
    .forgot-password:hover {
      color: #2563EB;
      text-decoration: underline;
    }
    
    .login-btn {
      background: linear-gradient(135deg, var(--primary-color), #2563EB);
      color: white;
      border: none;
      padding: 1.25rem 2rem;
      border-radius: 16px;
      font-weight: 700;
      font-size: 1.1rem;
      width: 100%;
      cursor: pointer;
      transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
      margin-bottom: 1.5rem;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 12px;
    }
    
    .login-btn:hover:not(:disabled) {
      background: linear-gradient(135deg, #2563EB, var(--primary-color));
      transform: translateY(-3px);
      box-shadow: 
        0 20px 40px -12px rgba(59, 130, 246, 0.4),
        0 0 0 4px rgba(59, 130, 246, 0.1);
    }
    
    .login-btn:active {
      transform: translateY(-1px);
    }
    
    .login-btn:disabled {
      opacity: 0.7;
      cursor: not-allowed;
    }
    
    .divider {
      position: relative;
      text-align: center;
      margin: 2rem 0;
    }
    
    .divider::before {
      content: '';
      position: absolute;
      top: 50%;
      left: 0;
      right: 0;
      height: 1px;
      background: linear-gradient(90deg, transparent, var(--medium-gray), transparent);
    }
    
    .divider span {
      background: rgba(255, 255, 255, 0.95);
      padding: 0 1.5rem;
      color: var(--secondary-color);
      font-weight: 500;
      font-size: 0.9rem;
    }
    
    .register-link {
      background: transparent;
      color: var(--success-color);
      border: 2px solid var(--success-color);
      padding: 1rem 2rem;
      border-radius: 16px;
      font-weight: 600;
      width: 100%;
      text-decoration: none;
      cursor: pointer;
      transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
    }
    
    .register-link:hover {
      background: var(--success-color);
      color: white;
      transform: translateY(-2px);
      box-shadow: 
        0 15px 30px -8px rgba(16, 185, 129, 0.4),
        0 0 0 4px rgba(16, 185, 129, 0.1);
    }
    
    .alert {
      padding: 1.25rem 1.5rem;
      border-radius: 16px;
      margin-bottom: 2rem;
      display: flex;
      align-items: center;
      gap: 12px;
      font-weight: 500;
      border: none;
    }
    
    .alert-danger {
      background: linear-gradient(135deg, #FEF2F2, #FEE2E2);
      border: 1px solid #FECACA;
      color: var(--danger-color);
    }
    
    .alert-success {
      background: linear-gradient(135deg, #F0FDF4, #DCFCE7);
      border: 1px solid #BBF7D0;
      color: var(--success-color);
    }
    
    .social-login {
      margin-bottom: 2rem;
    }
    
    .social-btn {
      background: white;
      border: 2px solid var(--medium-gray);
      border-radius: 12px;
      padding: 0.75rem 1rem;
      margin-bottom: 0.75rem;
      width: 100%;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 12px;
      text-decoration: none;
      color: var(--dark-gray);
      font-weight: 500;
      transition: all 0.3s ease;
      cursor: pointer;
    }
    
    .social-btn:hover {
      background: var(--light-gray);
      border-color: var(--primary-color);
      color: var(--dark-gray);
      transform: translateY(-2px);
    }
    
    .google-btn {
      color: #4285F4;
    }
    
    .facebook-btn {
      color: #1877F2;
    }
    
    .security-note {
      background: linear-gradient(135deg, #F0FDF4, #DCFCE7);
      border: 1px solid #BBF7D0;
      border-radius: 12px;
      padding: 1rem;
      margin-top: 1.5rem;
      text-align: center;
    }
    
    .security-note small {
      color: var(--success-color);
      font-weight: 500;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
    }
    
    @keyframes slideInUp {
      from {
        opacity: 0;
        transform: translateY(40px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
    
    @keyframes shake {
      0%, 100% { transform: translateX(0); }
      25% { transform: translateX(-5px); }
      75% { transform: translateX(5px); }
    }
    
    .shake {
      animation: shake 0.5s ease-in-out;
    }
    
    .loading-spinner {
      width: 20px;
      height: 20px;
      border: 2px solid rgba(255, 255, 255, 0.3);
      border-radius: 50%;
      border-top-color: white;
      animation: spin 1s linear infinite;
    }
    
    @keyframes spin {
      to { transform: rotate(360deg); }
    }
    
    @media (max-width: 576px) {
      .login-card {
        padding: 2rem 1.5rem;
        margin: 1rem;
      }
      
      .brand-logo {
        font-size: 2rem;
      }
      
      .login-title {
        font-size: 1.5rem;
      }
    }
  </style>
</head>
<body>

  <div class="login-container">
    <div class="login-card">
      
      <!-- Header -->
      <div class="login-header">
        <div class="brand-logo">
          <i class="fas fa-shopping-store me-2"></i>E-Shop
        </div>
        <h1 class="login-title">Welcome Back</h1>
        <p class="login-subtitle">Sign in to your account to continue</p>
      </div>

      <!-- Error Alert -->
      <div id="errorAlert" class="alert alert-danger" style="display: none;">
        <i class="fas fa-exclamation-triangle"></i>
        <span id="errorMessage">${param.error}</span>
      </div>

      <!-- Success Alert -->
      <div id="successAlert" class="alert alert-success" style="display: none;">
        <i class="fas fa-check-circle"></i>
        <span id="successMessage">${param.msg}</span>
      </div>

      <!-- Social Login Options -->
      <div class="social-login">
        <button type="button" class="social-btn google-btn" onclick="alert('Google login not implemented')">
          <i class="fab fa-google"></i>
          Continue with Google
        </button>
        <button type="button" class="social-btn facebook-btn" onclick="alert('Facebook login not implemented')">
          <i class="fab fa-facebook-f"></i>
          Continue with Facebook
        </button>
      </div>

      <!-- Divider -->
      <div class="divider">
        <span>or sign in with email</span>
      </div>

      <!-- Login Form -->
      <form id="loginForm" action="${pageContext.request.contextPath}/user/login" method="post" novalidate>
        
        <!-- Email -->
        <div class="form-group">
          <label for="email" class="form-label">
            <i class="fas fa-envelope"></i>
            Email Address
          </label>
          <div class="position-relative">
            <input type="email" 
                   id="email" 
                   name="email" 
                   class="form-control" 
                   placeholder="Enter your email address" 
                   required 
                   autocomplete="email">
            <i class="fas fa-envelope input-icon"></i>
          </div>
        </div>

        <!-- Password -->
        <div class="form-group">
          <label for="password" class="form-label">
            <i class="fas fa-lock"></i>
            Password
          </label>
          <div class="position-relative">
            <input type="password" 
                   id="password" 
                   name="password" 
                   class="form-control" 
                   placeholder="Enter your password" 
                   required 
                   autocomplete="current-password">
            <button type="button" 
                    class="password-toggle" 
                    onclick="togglePassword()"
                    tabindex="-1">
              <i class="fas fa-eye" id="passwordToggleIcon"></i>
            </button>
          </div>
        </div>

        <!-- Form Extras -->
        <div class="form-extras">
          <div class="remember-me">
            <input type="checkbox" id="remember" name="remember">
            <label for="remember">Remember me</label>
          </div>
          <a href="#" class="forgot-password">Forgot password?</a>
        </div>

        <!-- Login Button -->
        <button type="submit" class="login-btn" id="loginBtn">
          <i class="fas fa-sign-in-alt"></i>
          <span class="btn-text">Sign In</span>
        </button>
      </form>

      <!-- Divider -->
      <div class="divider">
        <span>Don't have an account?</span>
      </div>

      <!-- Register Link -->
      <a href="register.jsp" class="register-link">
        <i class="fas fa-user-plus"></i>
        Create New Account
      </a>

      <!-- Security Notice -->
      <div class="security-note">
        <small>
          <i class="fas fa-shield-alt"></i>
          Your connection is secured with SSL encryption
        </small>
      </div>

    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    // Show error message if present
    const errorParam = new URLSearchParams(window.location.search).get('error');
    if (errorParam) {
      const errorAlert = document.getElementById('errorAlert');
      const errorMessage = document.getElementById('errorMessage');
      errorMessage.textContent = decodeURIComponent(errorParam);
      errorAlert.style.display = 'flex';
      
      // Auto-hide after 5 seconds
      setTimeout(() => {
        errorAlert.style.display = 'none';
      }, 5000);
    }

    // Show success message if present
    const msgParam = new URLSearchParams(window.location.search).get('msg');
    if (msgParam) {
      const successAlert = document.getElementById('successAlert');
      const successMessage = document.getElementById('successMessage');
      successMessage.textContent = decodeURIComponent(msgParam);
      successAlert.style.display = 'flex';
      
      // Auto-hide after 5 seconds
      setTimeout(() => {
        successAlert.style.display = 'none';
      }, 5000);
    }

    // Password toggle functionality
    function togglePassword() {
      const passwordInput = document.getElementById('password');
      const toggleIcon = document.getElementById('passwordToggleIcon');
      
      if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        toggleIcon.className = 'fas fa-eye-slash';
      } else {
        passwordInput.type = 'password';
        toggleIcon.className = 'fas fa-eye';
      }
    }

    // Form validation and submission
    document.getElementById('loginForm').addEventListener('submit', function(e) {
      e.preventDefault();
      
      const form = this;
      const submitBtn = document.getElementById('loginBtn');
      const btnText = submitBtn.querySelector('.btn-text');
      const email = document.getElementById('email').value.trim();
      const password = document.getElementById('password').value;
      
      // Reset any previous error states
      document.querySelectorAll('.form-control').forEach(input => {
        input.classList.remove('is-invalid');
      });
      
      let isValid = true;
      let firstError = null;
      
      // Validate email
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      if (!email || !emailRegex.test(email)) {
        document.getElementById('email').classList.add('is-invalid');
        if (!firstError) firstError = document.getElementById('email');
        isValid = false;
      }
      
      // Validate password
      if (!password || password.length < 1) {
        document.getElementById('password').classList.add('is-invalid');
        if (!firstError) firstError = document.getElementById('password');
        isValid = false;
      }
      
      if (!isValid) {
        // Shake animation for errors
        form.classList.add('shake');
        setTimeout(() => form.classList.remove('shake'), 500);
        
        // Focus first error field
        if (firstError) {
          firstError.focus();
        }
        
        // Show error message
        showError('Please check your email and password');
        return;
      }
      
      // Show loading state
      submitBtn.disabled = true;
      btnText.textContent = 'Signing In...';
      submitBtn.insertAdjacentHTML('afterbegin', '<div class="loading-spinner me-2"></div>');
      
      // Submit form
      setTimeout(() => {
        form.submit();
      }, 500);
    });
    
    // Show error message
    function showError(message) {
      const errorAlert = document.getElementById('errorAlert');
      const errorMessage = document.getElementById('errorMessage');
      errorMessage.textContent = message;
      errorAlert.style.display = 'flex';
      
      setTimeout(() => {
        errorAlert.style.display = 'none';
      }, 5000);
    }
    
    // Real-time validation feedback
    document.querySelectorAll('.form-control').forEach(input => {
      input.addEventListener('blur', function() {
        if (this.hasAttribute('required') && !this.value.trim()) {
          this.classList.add('is-invalid');
        } else if (this.type === 'email' && this.value.trim()) {
          const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
          if (!emailRegex.test(this.value.trim())) {
            this.classList.add('is-invalid');
          } else {
            this.classList.remove('is-invalid');
          }
        } else {
          this.classList.remove('is-invalid');
        }
      });
      
      input.addEventListener('input', function() {
        if (this.classList.contains('is-invalid') && this.value.trim()) {
          if (this.type === 'email') {
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (emailRegex.test(this.value.trim())) {
              this.classList.remove('is-invalid');
            }
          } else {
            this.classList.remove('is-invalid');
          }
        }
      });
    });

    // Auto-focus email field on page load
    window.addEventListener('load', function() {
      document.getElementById('email').focus();
    });

    // Handle keyboard shortcuts
    document.addEventListener('keydown', function(e) {
      // Enter key on any input submits form
      if (e.key === 'Enter' && e.target.matches('input')) {
        document.getElementById('loginForm').dispatchEvent(new Event('submit'));
      }
    });
  </script>
</body>
</html>
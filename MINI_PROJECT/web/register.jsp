<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Register - E-Shop</title>
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
    
    .register-container {
      width: 100%;
      max-width: 480px;
      animation: slideInUp 0.8s cubic-bezier(0.4, 0, 0.2, 1);
    }
    
    .register-card {
      background: rgba(255, 255, 255, 0.95);
      backdrop-filter: blur(20px);
      border-radius: 24px;
      padding: 3rem 2.5rem;
      box-shadow: 
        0 25px 50px -12px rgba(0, 0, 0, 0.25),
        0 0 0 1px rgba(255, 255, 255, 0.3);
      border: 1px solid rgba(255, 255, 255, 0.2);
    }
    
    .register-header {
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
    
    .register-title {
      font-size: 1.75rem;
      font-weight: 700;
      color: var(--dark-gray);
      margin-bottom: 0.5rem;
    }
    
    .register-subtitle {
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
    
    .password-strength {
      margin-top: 0.75rem;
      opacity: 0;
      transition: opacity 0.3s ease;
    }
    
    .password-strength.show {
      opacity: 1;
    }
    
    .strength-meter {
      height: 4px;
      background: var(--medium-gray);
      border-radius: 2px;
      margin-bottom: 0.5rem;
      overflow: hidden;
    }
    
    .strength-fill {
      height: 100%;
      transition: all 0.3s ease;
      border-radius: 2px;
    }
    
    .strength-weak { 
      background: var(--danger-color); 
      width: 25%; 
    }
    
    .strength-fair { 
      background: var(--warning-color); 
      width: 50%; 
    }
    
    .strength-good { 
      background: #3B82F6; 
      width: 75%; 
    }
    
    .strength-strong { 
      background: var(--success-color); 
      width: 100%; 
    }
    
    .strength-text {
      font-size: 0.85rem;
      font-weight: 500;
      text-align: center;
    }
    
    .register-btn {
      background: linear-gradient(135deg, var(--success-color), #059669);
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
    
    .register-btn:hover:not(:disabled) {
      background: linear-gradient(135deg, #059669, var(--success-color));
      transform: translateY(-3px);
      box-shadow: 
        0 20px 40px -12px rgba(16, 185, 129, 0.4),
        0 0 0 4px rgba(16, 185, 129, 0.1);
    }
    
    .register-btn:active {
      transform: translateY(-1px);
    }
    
    .register-btn:disabled {
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
    
    .login-link {
      background: transparent;
      color: var(--primary-color);
      border: 2px solid var(--primary-color);
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
    
    .login-link:hover {
      background: var(--primary-color);
      color: white;
      transform: translateY(-2px);
      box-shadow: 
        0 15px 30px -8px rgba(59, 130, 246, 0.4),
        0 0 0 4px rgba(59, 130, 246, 0.1);
    }
    
    .alert {
      background: linear-gradient(135deg, #FEF2F2, #FEE2E2);
      border: 1px solid #FECACA;
      color: var(--danger-color);
      padding: 1.25rem 1.5rem;
      border-radius: 16px;
      margin-bottom: 2rem;
      display: flex;
      align-items: center;
      gap: 12px;
      font-weight: 500;
    }
    
    .terms-checkbox {
      margin-bottom: 2rem;
    }
    
    .form-check {
      display: flex;
      align-items: flex-start;
      gap: 12px;
    }
    
    .form-check-input {
      width: 20px;
      height: 20px;
      border: 2px solid var(--medium-gray);
      border-radius: 6px;
      cursor: pointer;
      flex-shrink: 0;
      margin-top: 2px;
    }
    
    .form-check-input:checked {
      background-color: var(--success-color);
      border-color: var(--success-color);
    }
    
    .form-check-label {
      font-size: 0.9rem;
      color: var(--secondary-color);
      line-height: 1.5;
      cursor: pointer;
    }
    
    .form-check-label a {
      color: var(--primary-color);
      text-decoration: none;
      font-weight: 600;
    }
    
    .form-check-label a:hover {
      text-decoration: underline;
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
      .register-card {
        padding: 2rem 1.5rem;
        margin: 1rem;
      }
      
      .brand-logo {
        font-size: 2rem;
      }
      
      .register-title {
        font-size: 1.5rem;
      }
    }
  </style>
</head>
<body>

  <div class="register-container">
    <div class="register-card">
      
      <!-- Header -->
      <div class="register-header">
        <div class="brand-logo">
          <i class="fas fa-shopping-store me-2"></i>E-Shop
        </div>
        <h1 class="register-title">Create Account</h1>
        <p class="register-subtitle">Join thousands of happy customers</p>
      </div>

      <!-- Error Alert -->
      <div id="errorAlert" class="alert" style="display: none;">
        <i class="fas fa-exclamation-triangle"></i>
        <span id="errorMessage">${param.error}</span>
      </div>

      <!-- Registration Form -->
      <form id="registerForm" action="${pageContext.request.contextPath}/user/register" method="post" novalidate>
        
        <!-- Full Name -->
        <div class="form-group">
          <label for="fullname" class="form-label">
            <i class="fas fa-user"></i>
            Full Name
          </label>
          <div class="position-relative">
            <input type="text" 
                   id="fullname" 
                   name="fullname" 
                   class="form-control" 
                   placeholder="Enter your full name" 
                   required>
            <i class="fas fa-user input-icon"></i>
          </div>
        </div>

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
                   required>
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
                   placeholder="Create a strong password" 
                   required 
                   minlength="6">
            <button type="button" 
                    class="password-toggle" 
                    onclick="togglePassword()"
                    tabindex="-1">
              <i class="fas fa-eye" id="passwordToggleIcon"></i>
            </button>
          </div>
          
          <!-- Password Strength Meter -->
          <div class="password-strength" id="passwordStrength">
            <div class="strength-meter">
              <div class="strength-fill" id="strengthBar"></div>
            </div>
            <div class="strength-text" id="strengthText">Enter a password</div>
          </div>
        </div>

        <!-- Phone -->
        <div class="form-group">
          <label for="phone" class="form-label">
            <i class="fas fa-phone"></i>
            Phone Number
            <small class="text-muted">(Optional)</small>
          </label>
          <div class="position-relative">
            <input type="tel" 
                   id="phone" 
                   name="phone" 
                   class="form-control" 
                   placeholder="Enter your phone number">
            <i class="fas fa-phone input-icon"></i>
          </div>
        </div>

        <!-- Terms & Conditions -->
        <div class="terms-checkbox">
          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="terms" required>
            <label class="form-check-label" for="terms">
              I agree to the <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a>
            </label>
          </div>
        </div>

        <!-- Register Button -->
        <button type="submit" class="register-btn" id="registerBtn">
          <i class="fas fa-user-plus"></i>
          <span class="btn-text">Create Account</span>
        </button>
      </form>

      <!-- Divider -->
      <div class="divider">
        <span>Already have an account?</span>
      </div>

      <!-- Login Link -->
      <a href="login.jsp" class="login-link">
        <i class="fas fa-sign-in-alt"></i>
        Sign In Instead
      </a>

      <!-- Security Notice -->
      <div class="security-note">
        <small>
          <i class="fas fa-shield-alt"></i>
          Your information is protected with SSL encryption
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

    // Password strength checker
    document.getElementById('password').addEventListener('input', function() {
      const password = this.value;
      const strengthDiv = document.getElementById('passwordStrength');
      const strengthBar = document.getElementById('strengthBar');
      const strengthText = document.getElementById('strengthText');
      
      if (password.length === 0) {
        strengthDiv.classList.remove('show');
        return;
      }
      
      strengthDiv.classList.add('show');
      
      let score = 0;
      let feedback = [];
      
      // Length check
      if (password.length >= 8) score += 1;
      else feedback.push('At least 8 characters');
      
      // Lowercase check
      if (/[a-z]/.test(password)) score += 1;
      else feedback.push('One lowercase letter');
      
      // Uppercase check
      if (/[A-Z]/.test(password)) score += 1;
      else feedback.push('One uppercase letter');
      
      // Number check
      if (/\d/.test(password)) score += 1;
      else feedback.push('One number');
      
      // Special character check
      if (/[^A-Za-z0-9]/.test(password)) score += 1;
      else feedback.push('One special character');
      
      // Update strength meter
      strengthBar.className = 'strength-fill';
      
      if (score <= 1) {
        strengthBar.classList.add('strength-weak');
        strengthText.textContent = 'Weak password';
        strengthText.style.color = '#EF4444';
      } else if (score <= 2) {
        strengthBar.classList.add('strength-fair');
        strengthText.textContent = 'Fair password';
        strengthText.style.color = '#F59E0B';
      } else if (score <= 3) {
        strengthBar.classList.add('strength-good');
        strengthText.textContent = 'Good password';
        strengthText.style.color = '#3B82F6';
      } else {
        strengthBar.classList.add('strength-strong');
        strengthText.textContent = 'Strong password';
        strengthText.style.color = '#10B981';
      }
    });

    // Form validation and submission
    document.getElementById('registerForm').addEventListener('submit', function(e) {
      e.preventDefault();
      
      const form = this;
      const submitBtn = document.getElementById('registerBtn');
      const btnText = submitBtn.querySelector('.btn-text');
      const fullname = document.getElementById('fullname').value.trim();
      const email = document.getElementById('email').value.trim();
      const password = document.getElementById('password').value;
      const terms = document.getElementById('terms').checked;
      
      // Reset any previous error states
      document.querySelectorAll('.form-control').forEach(input => {
        input.classList.remove('is-invalid');
      });
      
      let isValid = true;
      let firstError = null;
      
      // Validate full name
      if (fullname.length < 2) {
        document.getElementById('fullname').classList.add('is-invalid');
        if (!firstError) firstError = document.getElementById('fullname');
        isValid = false;
      }
      
      // Validate email
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      if (!emailRegex.test(email)) {
        document.getElementById('email').classList.add('is-invalid');
        if (!firstError) firstError = document.getElementById('email');
        isValid = false;
      }
      
      // Validate password
      if (password.length < 6) {
        document.getElementById('password').classList.add('is-invalid');
        if (!firstError) firstError = document.getElementById('password');
        isValid = false;
      }
      
      // Validate terms
      if (!terms) {
        document.getElementById('terms').classList.add('is-invalid');
        if (!firstError) firstError = document.getElementById('terms');
        isValid = false;
        
        // Show error message
        showError('Please accept the Terms of Service and Privacy Policy');
      }
      
      if (!isValid) {
        // Shake animation for errors
        form.classList.add('shake');
        setTimeout(() => form.classList.remove('shake'), 500);
        
        // Focus first error field
        if (firstError) {
          firstError.focus();
        }
        
        return;
      }
      
      // Show loading state
      submitBtn.disabled = true;
      btnText.textContent = 'Creating Account...';
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
        } else {
          this.classList.remove('is-invalid');
        }
      });
      
      input.addEventListener('input', function() {
        if (this.classList.contains('is-invalid')) {
          this.classList.remove('is-invalid');
        }
      });
    });
  </script>
</body>
</html>
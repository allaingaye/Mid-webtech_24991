<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign In</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/signin.css">

    <style>
        /* Custom styles for a professional sign-in page with background image */
        body {
            font-family: Arial, sans-serif;
            background: url('images/library.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            position: relative;
            color: #fff;
        }
        
        /* Overlay to darken the background image for better contrast */
        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1;
        }
        
        .container {
            position: relative;
            z-index: 2;
            max-width: 400px;
            padding: 2rem;
            background-color: transparent;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            color: #333;
        }
        
        .form-container h2 {
            text-align: center;
            color: #343a40;
            font-weight: bold;
            margin-bottom: 1.5rem;
        }
        
        .form-control {
            border-radius: 5px;
        }
        
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            border-radius: 5px;
            padding: 0.75rem;
            width: 100%;
        }
        
        .btn-primary:hover {
            background-color: purple;
            border-color: #0062cc;
        }
        
        .form-container p {
            text-align: center;
        }
        
        .success {
            color: green;
            text-align: center;
            margin-top: 1rem;
        }
        
        .error {
            color: red;
            text-align: center;
            margin-top: 1rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-header">
            <h2>Login</h2>
            <p>Please enter your credentials</p>
        </div>

        <!-- Display error message if available -->
        <c:if test="${not empty errorMessage}">
            <p class="error-message">${errorMessage}</p>
        </c:if>

        <!-- Login form -->
        <form action="LoginServlet" method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="role">Role:</label>
                <select id="role" name="role" class="form-control" required>
                    <option value="" disabled selected>Select Role</option>
                    <option value="STUDENT">Student</option>
                    <option value="TEACHER">Teacher</option>
                    <option value="LIBRARIAN">Librarian</option>
                    <option value="HOD">Head of Department</option>
                    <option value="DEAN">Dean</option>
                    <option value="REGISTER">Registrar</option>
                    <option value="MANAGER">Manager</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
        </form>

        <div class="login-redirect">
            <p>Don't have an account? <a href="signup.jsp">Register here</a></p>
        </div>
    </div>
</body>
</html>

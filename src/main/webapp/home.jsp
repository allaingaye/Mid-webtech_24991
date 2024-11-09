<%@ page import="model.Role" %>
<%@ page import="model.User" %>
<%@ page session="true" %>

<%
    HttpSession currentSession = request.getSession(false);
    User loggedInUser = (currentSession != null) ? (User) currentSession.getAttribute("loggedInUser") : null;

    if (loggedInUser == null) {
        response.sendRedirect("signin.jsp?error=Session expired. Please log in.");
        return;
    }

    Role userRole = loggedInUser.getRole();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Management System - Home</title>
    
    <link rel="stylesheet" href="styles.css">

    <style>
        /* General Styling */
        body {
            font-family: 'Poppins', sans-serif;
            color: #333;
            background: url('images/library.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
            opacity: 0;
            transition: opacity 0.5s ease;
        }

        .fade-in {
            opacity: 1;
            transition: opacity 1s ease-in;
        }

        * {
            box-sizing: border-box;
        }

        /* Navbar */
        .navbar {
            background-color: rgba(255, 255, 255, 0.95);
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .navbar a {
            color: black; /* Change the link color to black */
            font-size: 1.2em;
            padding: 10px 15px;
            text-transform: uppercase;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .navbar a:hover {
            color: white; /* Optional: Add hover effect */
        }

        .navbar-logo {
            font-size: 1.5em;
            font-weight: bold;
        }

        .navbar-menu {
            display: flex;
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .navbar-menu li {
            margin: 0 15px;
        }

        /* Hero Section */
        .hero-section {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
            background: rgba(0, 0, 0, 0.6);
        }

        .hero-overlay {
            padding: 30px;
            background-color: rgba(0, 0, 0, 0.5);
            border-radius: 10px;
        }

        .hero-overlay h1 {
            font-size: 3.5em;
            color: white; /* Highlight the "Welcome" in blue */
        }

        .hero-overlay p {
            font-size: 1.5em;
            margin-bottom: 20px;
        }

        /* Content Section */
        .welcome-message {
            padding: 80px 0;
            text-align: center;
            background-color: rgba(255, 255, 255, 0.9);
        }

        .welcome-message h2 {
            font-size: 2.5em;
            color: black; /* Keep the welcome message in black */
        }

        .welcome-message p {
            font-size: 1.2em;
            color: #555;
        }

        /* Footer */
        .footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 20px;
        }

        .footer a {
            color: #ffcc00;
            text-decoration: none;
        }

        .footer a:hover {
            color: #ff9900;
        }
    </style>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            document.body.classList.add('fade-in');
        });
    </script>
</head>
<body>
    <nav class="navbar">
        <a href="HomePage.jsp" class="navbar-logo">Library Management</a>
        <ul class="navbar-menu">
            <% if (userRole == Role.LIBRARIAN) { %>
                <li><a href="manageBooks.jsp">Manage Books</a></li>
                <li><a href="assignShelf.jsp">Assign Shelf</a></li>
                <li><a href="addShelf.jsp">Add Shelf</a></li>
                <li><a href="insertShelf.jsp">Assign Rooms</a></li>
                <li><a href="countBooksInRoom.jsp">Books in Room</a></li>
            <% } else if (userRole == Role.STUDENT || userRole == Role.TEACHER) { %>
                <li><a href="registerMembership.jsp">Register Membership</a></li>
                <li><a href="borrowBook.jsp">Borrow Books</a></li>
                <li><a href="returnBook.jsp">Return Books</a></li>
            <% } else if (userRole == Role.HOD || userRole == Role.DEAN || userRole == Role.REGISTER || userRole == Role.MANAGER) { %>
                <li><a href="viewReports.jsp">View Reports</a></li>
                <li><a href="manageUsers.jsp">Manage Users</a></li>
            <% } %>
            <li><a href="signin.jsp">Logout</a></li>
        </ul>
    </nav>

    <section class="hero-section">
        <div class="hero-overlay">
            <h1>Welcome, <%= loggedInUser.getFirstName() %>!</h1>
            <p>Uncover valuable resources and personalized services at our library..</p>
        </div>
    </section>

    <section id="welcome" class="welcome-message">
        <h2>Welcome, <%= userRole %>!</h2>
        <p> <%= userRole %> </p>
    </section>

    <% if (userRole == Role.LIBRARIAN) { %>
    <section class="featured-section">
        <div class="featured-photo">
            <img src="images/library.jpg" alt="Books Management" width="100%">
        </div>
        <div class="featured-text">
            <h2>Manage Library Resources</h2>
            <p>Effortlessly manage books, members, and room assignments with our system.</p>
        </div>
    </section>
    <% } %>

    <footer class="footer">
        <p>&copy; 2024 Library Management System. All rights reserved.</p>
        <p><a href="terms.jsp">Terms of Service</a> | <a href="privacy.jsp">Privacy Policy</a></p>
    </footer>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Management System - AUCA</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('images/library.jpg');
            background-size: cover;
            background-position: center;
            color: #333;
            height: 100vh; 
            display: flex;
            justify-content: center;
            align-items: flex-end;
        }
        .container {
            width: 80%;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
            margin-bottom: 90px;
        }
        header {
            text-align: center;
            padding: 20px 0;
        }
        h1 {
            color: black;
            font-size: 2.5em;
            margin-bottom: 10px;
        }
        nav {
            margin: 20px 0;
            text-align: center;
        }
        nav a {
            text-decoration: none;
            color: #fff;
            background-color: #28a745; 
            padding: 10px 20px;
            border-radius: 5px;
            margin: 0 10px;
            transition: background 0.3s, transform 0.2s;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }
        nav a:hover {
            background-color: #218838;
            transform: translateY(-2px);
        }
        section {
            margin: 20px 0;
        }
        .role-info {
            margin: 20px 0;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background-color: transparent;
        }
        h2 {
            color: black;
            font-size: 1.8em;
            margin-bottom: 10px;
        }
        footer {
            text-align: center;
            padding: 10px;
            font-size: 0.9em;
            color: #777;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <header>
        <h1>Welcome to AUCA Library Management System</h1>
    </header>

    <nav>
        <a href="displayMembershipTypes.jsp">Membership Display</a>
        <a href="viewReports.jsp">View Reports</a>
        <a href="signup.jsp">Register as Member</a>
        <a href="createLocation.jsp">Register Location</a>
        <a href="signin.jsp">Logout</a>
    </nav>

    <section>
        <div class="role-info">
            <h2>Librarian Access</h2>
        </div>
    </section>
</div>

</body>
</html>

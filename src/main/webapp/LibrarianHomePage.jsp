<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Librarian Dashboard</title>
    <style>
        body {
            background-image: url('images/library.jpg');
            background-size: cover;
            font-family: Arial, sans-serif;
            color: black; /* Light blue text */
            text-align: center;
            padding: 20px;
        }
        h1 {
            margin-bottom: 20px;
            font-size: 2.5em;
            text-shadow: 2px 2px 4px rgba(0, 0, 128, 0.7); /* Dark blue shadow */
        }
        .container {
            background:white; /* Semi-transparent dark blue background */
            padding: 30px;
            border-radius: 10px;
            display: inline-block;
            margin: 20px auto;
            width: 80%;
            max-width: 500px;
        }
        button {
            background-color: green; /* Dodger blue */
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            margin: 10px 5px;
        }
        button:hover {
            background-color: #1C86EE; /* Slightly darker blue */
        }
        a {
            color: #00BFFF; /* Deep sky blue */
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        h2 {
            font-size: 1.8em;
            margin-bottom: 10px;
            text-shadow: 1px 1px 3px rgba(0, 0, 128, 0.6); /* Dark blue shadow */
        }
    </style>
</head>
<body>
    <h1>Welcome, <%= session.getAttribute("librarianName") %>!</h1>
    <p>Stay on top of your tasks and keep the library running smoothly.</p>

    <div class="container">
        <h2>Membership Management</h2>
        <button onclick="location.href='MembershipForm.html'">Approve Membership Requests</button>
    </div>

    <div class="container">
        <h2>Book Management</h2>
        <button onclick="location.href='manageBooks.jsp'">Manage Books</button>
        <button onclick="location.href='addShelf.jsp'">Add Shelf</button>
        <button onclick="location.href='assignShelf.jsp'">Assign Books to Shelf</button>
        <button onclick="location.href='GetProvince.jsp'">Get Location by Phone Number</button>
        <button onclick="location.href='manageUsers.jsp'">Manage Users</button>
        <button onclick="location.href='viewReports.jsp'">View Reports</button>
    </div>

    <div class="container">
        <h2>Library Statistics</h2>
        <button onclick="location.href='countBooksInRoom.jsp'">Count Books in Rooms</button>
    </div>
</body>
</html>

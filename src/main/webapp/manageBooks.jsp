<%@ page import="java.util.List" %>
<%@ page import="model.Book" %>
<%@ page import="controller.UserDao" %>

<%
    UserDao userDao = new UserDao();
    List<Book> books = userDao.getAllBooks();
%>
//
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Books</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" crossorigin="anonymous">
    <script src="${pageContext.request.contextPath}/manageBooks.js" defer></script>

    <style>
        /* General styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h2 {
            color: #333;
        }

        /* Navbar styles */
        .navbar {
            background-color: #007bff;
            padding: 10px;
            text-align: left;
        }

        .navbar .back-link {
            color: #fff;
            text-decoration: none;
            font-size: 16px;
        }

        .navbar .back-link i {
            margin-right: 5px;
        }

        /* Alert message */
        .alert {
            background-color: #f8d7da;
            color: #721c24;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #f5c6cb;
            border-radius: 5px;
        }

        /* Form styles */
        .form-container {
            background-color: #fff;
            padding: 20px;
            margin: 20px auto;
            width: 50%;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-container input,
        .form-container select {
            display: block;
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .form-container .btn-submit {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            border-radius: 5px;
            width: 100%;
        }

        .form-container .btn-submit:hover {
            background-color: #218838;
        }

        /* Book list styles */
        .book-list {
            background-color: #fff;
            padding: 20px;
            margin: 20px auto;
            width: 80%;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .book-list table {
            width: 100%;
            border-collapse: collapse;
        }

        .book-list th,
        .book-list td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        .book-list th {
            background-color: #007bff;
            color: white;
        }

        .book-list td {
            background-color: #f9f9f9;
        }

        /* Button styles */
        .action-btn {
            background-color: #ffc107;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .action-btn.assign {
            background-color: #007bff;
        }

        .action-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <!-- Display success or failure messages -->
    <%
        String message = request.getParameter("message");
        if (message != null && !message.isEmpty()) {
    %>
        <div class="alert"><%= message %></div>
    <%
        }
    %>

    <!-- Back to Home Link -->
    <nav class="navbar">
        <a href="home.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Back to Home</a>
    </nav>

    <!-- Manage Books Section -->
    <section class="manage-books-section">
        <!-- Add Book Form -->
        <div class="form-container">
            <h2>Add New Book</h2>
            <form id="addBookForm" action="BookServlet?action=addBook" method="POST">
                <input type="text" name="title" placeholder="Book Title" required>
                <input type="text" name="isbnCode" placeholder="ISBN Code" required>
                <input type="number" name="edition" placeholder="Edition" required>
                <input type="number" name="year" placeholder="Publication Year" required>
                <input type="text" name="publisherName" placeholder="Publisher Name" required>
                <input type="text" name="shelfId" placeholder="Shelf ID" required>
                <select name="bookStatus" required>
                    <option value="AVAILABLE">Available</option>
                    <option value="BORROWED">Borrowed</option>
                    <option value="RESERVED">Reserved</option>
                </select>
                <button type="submit" class="btn-submit">Add Book</button>
            </form>
        </div>

        <!-- Book List -->
        <div class="book-list">
            <h2>Available Books</h2>
            <table>
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>ISBN Code</th>
                        <th>Year</th>
                        <th>Shelf</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="bookTableBody">
                    <% for (Book book : books) { %>
                        <tr data-book-id="<%= book.getBookId() %>">
                            <td><%= book.getTitle() %></td>
                            <td><%= book.getIsbnCode() %></td>
                            <td><%= book.getPublicationYear() %></td>
                            <td><%= book.getShelf() != null ? book.getShelf().getShelfId() : "Unassigned" %></td>
                            <td><%= book.getBookStatus() %></td>
                            <td>
                                <button onclick="assignToShelf('<%= book.getBookId() %>')" class="action-btn assign">Assign to Shelf</button>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </section>
</body>
</html>

<%@ page import="controller.Student" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Student Data</title>
    <style>
        /* General Styles */
         body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: #ffffff;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        h2 {
            color: #ffffff;
            margin-bottom: 30px;
            font-size: 28px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        form {
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            width: 300px;
            animation: fadeIn 0.5s ease-in;
            color: black;
            margin-bottom: 20px;
        }

        input[type="text"],
        input[type="submit"] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s, transform 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
            transform: scale(1.05);
        }

        input[type="submit"]:active {
            transform: scale(0.95);
        }

        /* Animation */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        button {
            background-color: #f44336;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s, transform 0.3s;
            margin-top: 10px;
        }

        button:hover {
            background-color: #d32f2f;
            transform: scale(1.05);
        }

        button:active {
            transform: scale(0.95);
        }

        a {
            text-decoration: none;
            color: #ffffff;
            font-size: large;
            background-color: rgba(0, 0, 0, 0.3);
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s;
            display: inline-block;
        }

        a:hover {
            background-color: rgba(0, 0, 0, 0.5);
            transform: scale(1.05);
            color: #d4e1ff;
        }

        a:active {
            transform: scale(0.95);
        }
    </style>
</head>
<body>
    <h2>Delete Student Data</h2>

    <!-- Form to delete a specific student by ID -->
    <form action="deleteData" method="post">
        <h3>Delete Specific Student</h3>
        <label for="id">Student ID:</label>
        <input type="text" id="id" name="id" required><br>
        <input type="hidden" name="action" value="delete">
        <input type="submit" value="Delete">
    </form>

    <!-- Form to delete all students -->
    <form action="deleteData" method="post">
        <h3>Delete All Students</h3>
        <input type="hidden" name="action" value="deleteAll">
        <input type="submit" value="Delete All">
    </form>
</body>
</html>

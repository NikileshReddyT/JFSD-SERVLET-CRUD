<%@ page import="controller.Student" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Student Data</title>
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
            height: 100vh;
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

        .gender-options {
            display: flex;
            justify-content: space-between;
        }

        input[type="radio"] {
            margin-right: 5px;
        }

        label {
            margin-right: 20px;
            cursor: pointer;
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
    </style>
</head>
<body>
    <h2>Update Student Data</h2>
    <form action="updateData" method="post">
        <input type="hidden" name="id" value="<%= ((Student) request.getAttribute("student")).getSid() %>">
        
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= ((Student) request.getAttribute("student")).getSname() %>" required><br>
        
        <label>Gender:</label>
        <div class="gender-options">
            <input type="radio" name="gender" value="m" <%= ((Student) request.getAttribute("student")).getGender() == 'm' ? "checked" : "" %>> 
            <label for="male">Male</label>
            <input type="radio" name="gender" value="f" <%= ((Student) request.getAttribute("student")).getGender() == 'f' ? "checked" : "" %>> 
            <label for="female">Female</label>
        </div><br>

        <label for="contact">Contact:</label>
        <input type="text" id="contact" name="contact" value="<%= ((Student) request.getAttribute("student")).getContact() %>" required><br>

        <label for="cgpa">CGPA:</label>
        <input type="text" id="cgpa" name="cgpa" value="<%= ((Student) request.getAttribute("student")).getCgpa() %>" required><br>

        <input type="submit" value="Update">
    </form>
</body>
</html>

<%@ page import="java.util.List" %>
<%@ page import="controller.Student" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Information</title>
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
        h1 {
            color: #ffffff;
            margin-bottom: 30px;
            font-size: 28px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            animation: fadeIn 0.5s ease-in;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background: rgba(255, 255, 255, 0.9);
            color: #333;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            animation: fadeIn 0.5s ease-in;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            text-align:center;
        }

        th {
            background-color: #6a11cb;
            color: white;
            text-align: center;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
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
    <h1>Student Information</h1>

    <%
        // Retrieve the student list from the request attribute
        List<Student> studentList = (List<Student>) request.getAttribute("studentList");

        if (studentList != null && !studentList.isEmpty()) {
    %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>Contact</th>
                    <th>CGPA</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Student student : studentList) {
                %>
                    <tr>
                        <td><%= student.getSid() %></td>
                        <td><%= student.getSname() %></td>
                        <td><%= student.getGender() %></td>
                        <td><%= student.getContact() %></td>
                        <td><%= student.getCgpa() %></td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    <%
        } else {
    %>
        <p>No student data available.</p>
    <%
        }
    %>
	<a href="index.html">Home</a>
</body>
</html>

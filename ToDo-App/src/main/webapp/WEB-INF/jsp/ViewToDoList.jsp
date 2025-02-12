<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<head>
    <meta charset="ISO-8859-1">
    <title>View ToDo Item List</title>

    <link rel="stylesheet"
        	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script
        	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script
        	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>  
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    <style>
         a {
        color: white;
        text-decoration: none;
        font-weight: bold;
        padding: 5px 10px;
        border-radius: 4px;
        transition: all 0.3s ease;
    }

    a:hover {
        color: white;
        background-color: rgba(255, 255, 255, 0.2); /* Slight background on hover */
        text-decoration: none;
        transform: scale(1.05); /* Slight zoom effect */
    }

    /* Optional: Add focus style for accessibility */
    a:focus {
        outline: 3px solid rgba(255, 255, 255, 0.5);
    }
    </style>

</head>
<body>

    <div class="container">

        <h1 class="p-3"> ToDo Item List</h1>

        <form:form>

            <table class="table table-bordered">
            	<tr>
            		<th>Id</th>
            		<th>Title</th>
            		<th>Date</th>
            		<th>Status</th>
            		<th>Mark Completed</th>
            		<th>Edit</th>
            		<th>Delete</th>
            	</tr>

            	<c:forEach var="todo" items="${list}">
                    <tr>
                		<td>${todo.id}</td>
                		<td>${todo.title}</td>
                		<td>${todo.date}</td>
                		<td>${todo.status}</td>
                		
                		<td><button type="button" class="btn btn-success">
                		    <a href="/updateToDoStatus/${todo.id}">Mark Complete</a>
                		</button></td>
                		
                		<td><button type="button" class="btn btn-primary">
                		    <a href="/editToDoItem/${todo.id}">Edit</a>
                		</button></td>
                		
                		<td><button type="button" class="btn btn-danger">
                			<a href="/deleteToDoItem/${todo.id}">Delete</a>
                		</button></td>
                	</tr>

            	</c:forEach>

            </table>

        </form:form>

        <button type="button" class="btn btn-primary btn-block">
        	<a href="/addToDoItem">Add New ToDo Item</a>
        </button>

    </div>

    <!-- JavaScript for Toastr notification -->
    <script type="text/javascript">
        window.onload = function() {
            // Get the message from JSP
            var msg = "${message}";
            
            if (msg == "Save Success") {
                toastr["success"]("Item added successfully!!");
            } else if (msg == "Delete Success") {
                toastr["success"]("Item deleted successfully!!");
            } else if (msg == "Delete Failure") {
                toastr["error"]("Some error occurred, couldn't delete item");
            } else if (msg == "Edit Success") {
                toastr["success"]("Item updated successfully!!");
            }

            // Toastr options configuration
            toastr.options = {
                "closeButton": true,
                "debug": false,
                "newestOnTop": false,
                "progressBar": true,
                "positionClass": "toast-top-right",
                "preventDuplicates": false,
                "showDuration": "300",
                "hideDuration": "1000",
                "timeOut": "5000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            }
        }
    </script>

</body>

</html>

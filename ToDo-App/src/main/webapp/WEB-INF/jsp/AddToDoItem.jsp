<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<head>
    <!-- Meta tag to define character set as ISO-8859-1 -->
    <meta charset="ISO-8859-1">
    
    <!-- Title for the web page -->
    <title>Add ToDo Item</title>

    <!-- Bootstrap CSS for styling the form and layout -->
    <link rel="stylesheet"
    	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <!-- Toaster CSS for notification styling -->
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    
    <!-- jQuery library -->
    <script
    	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <!-- Bootstrap JS for additional interactive components -->
    <script
    	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <!-- Toaster JS for showing notifications -->
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

</head>
<body>

    <!-- Main container for the page content -->
    <div class="container">

        <!-- Heading for the page -->
        <h1 class="p-3"> Add to Your ToDo List </h1>

        <!-- Spring form tag to handle form submission -->
        <form:form action="/saveToDoItem" method="post" modelAttribute="todo">

            <!-- Row for the "Title" input field -->
            <div class="row">
            	<div class="form-group col-md-12">
            		<label class="col-md-3" for="title">Title</label>
            		<div class="col-md-6">
            		    <!-- Spring form input for "title" -->
            		    <form:input type="text" path="title" id="title"
            		        class="form-control input-sm" required="required" />
            		</div>
            	</div>
            </div>

            <!-- Row for the "Date" input field -->
            <div class="row">
            	<div class="form-group col-md-12">
            		<label class="col-md-3" for="date">Date</label>
            		<div class="col-md-6">
            			<!-- Spring form input for "date" -->
            			<form:input type="date" path="date" id="date"
            				class="form-control input-sm" required="required" />
            		</div>
            	</div>
            </div>
            
            <!-- Row for the "Status" input field -->
            <div class="row">
            	<div class="form-group col-md-12">
            		<label class="col-md-3" for="status">Status</label>
            		<div class="col-md-6">
            			<!-- Spring form input for "status" with default value "Incomplete" -->
            			<form:input type="text" path="status" id="status"
            				class="form-control input-sm" value="Incomplete" />
            		</div>
            	</div>
            </div>

            <!-- Row for the "Save" button -->
            <div class="row p-2">
            	<div class="col-md-2">
            		<!-- Submit button to save the ToDo item -->
            		<button type="submit" value="Register" class="btn btn-success">Save</button>
            	</div>
            </div>

        </form:form>

    </div>

    <!-- JavaScript for Toaster notification -->
    <script type="text/javascript">
        // Function to display notifications after page load
        window.onload = function() {
            // Get the message from JSP to display in the Toastr notification
            var msg = "${message}";
            
            // Show error or success message based on the value of "message"
            if (msg == "Save Failure") {
                toastr["error"]("Something went wrong with the save.");
            } else if (msg == "Save Success") {
                toastr["success"]("Item saved successfully.");
            }

            // Toastr options configuration for customizing notification appearance and behavior
            toastr.options = {
                "closeButton": true,  // Show close button in the notification
                "debug": false,
                "newestOnTop": false,  // Notifications stack bottom to top
                "progressBar": true,  // Show progress bar while notification is visible
                "positionClass": "toast-top-right",  // Positioning of the toast (top-right corner)
                "preventDuplicates": false,
                "showDuration": "300",  // Duration for showing the notification (in ms)
                "hideDuration": "1000",  // Duration for hiding the notification (in ms)
                "timeOut": "5000",  // Time before the notification disappears (in ms)
                "extendedTimeOut": "1000",  // Time for extended timeout (in ms)
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",  // Animation method to show the toast
                "hideMethod": "fadeOut"  // Animation method to hide the toast
            }
        }
    </script>

</body>

</html>

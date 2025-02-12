# To-Do List Application

This is a simple To-Do List application built using **Java Spring Boot**, **JPA Data**, **JSP**, and **MySQL**. The application allows users to add, mark as completed, delete, and view tasks. It stores tasks in a MySQL database.

## Features
- **Add a new task**: Users can input a task and add it to the list.
- **Mark a task as completed**: Users can mark tasks as completed.
- **Delete a task**: Users can remove tasks from the list.
- **View all tasks**: Users can see the list of all tasks.

## Prerequisites
Before running the application, ensure you have the following installed on your system:
Install Prerequisites:

Ensure Java JDK 11+ and Maven are installed.

### Add JARs to the Build Path:
Download and add **jakarta.servlet.jsp.jstl-2.0.0.jar** and **jakarta.servlet.jsp.jstl-api-2.0.0.jar** to the project build path.

### MySQL:
- **MySQL Server** (Use MySQL Workbench to manage your database)
- **MySQL Connector for Java**

### Set Up MySQL Database:
1. Create the **todo_app** database in MySQL Workbench.
#### Update application.properties with your database credentials:
spring.datasource.url=jdbc:mysql://localhost:3306/todo_app
spring.datasource.username=<your-mysql-username>
spring.datasource.password=<your-mysql-password>

### Run the Application:

Once everything is set up, you can run the Spring Boot application.
Access the To-Do List in a browser via http://localhost:8090.
Use the UI to add, mark as completed, or delete tasks.

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sidebar Navigation</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            /* Custom CSS for sidebar */
            body {
                font-family: Arial, sans-serif;
                background-color: #f8f9fa; /* Light grey background */
            }
            .sidebar {
                position: fixed;
                top: 0;
                left: 0;
                height: 100%;
                width: 250px; /* Adjust width as needed */
                z-index: 100;
                background-color: #343a40; /* Dark background */
                box-shadow: 0 2px 10px rgba(0,0,0,0.1); /* Shadow for sidebar */
            }
            .list-group-item {
                border: none;
                border-radius: 0;
                color: #ffffff; /* White text */
                transition: background-color 0.3s ease;
                background-color: #343a40; /* Dark background */
            }
            .list-group-item:hover {
                background-color: #495057; /* Darker background on hover */
            }
            .list-group-item i {
                width: 30px; /* Adjust icon width */
            }
            .list-group-item span {
                font-size: 14px; /* Adjust font size */
            }
            .sidebar-heading {
                color: #ffffff;
                padding: 10px;
            }
            .sidebar-brand {
                padding: 20px 10px;
                text-align: center;
            }
            .sidebar-brand h1 {
                color: #ffffff;
                font-size: 1.5rem;
                margin-bottom: 0;
            }
        </style>
    </head>
    <body>
        <!-- Sidebar -->
        <nav id="sidebarMenu" class="collapse d-lg-block sidebar">
            <div class="position-sticky">
                <div class="sidebar-brand">
                    <h1>HOANGANHTECH</h1>
                </div>
                <div class="list-group list-group-flush">
                    <c:if test="${sessionScope.acc != null}">
                        <a href="" class="list-group-item list-group-item-action py-2">
                           <span>Welcome admin ${sessionScope.acc.name}</span>
                        </a>
                    </c:if>
                    <a href="stat" class="list-group-item list-group-item-action py-2">
                        <i class="fas fa-shoe-prints fa-fw me-3"></i><span>Shop Statistic</span>
                    </a>
                    <a href="chart" class="list-group-item list-group-item-action py-2">
                        <i class="fas fa-shoe-prints fa-fw me-3"></i><span>Shop Chart</span>
                    </a>
                    <a href="managebill" class="list-group-item list-group-item-action py-2">
                        <i class="fas fa-shoe-prints fa-fw me-3"></i><span>Bill Management</span>
                    </a>
                    <a href="manageaccount" class="list-group-item list-group-item-action py-2">
                        <i class="fas fa-user-circle fa-fw me-3"></i><span>User Management</span>
                    </a>
                    <a href="manageproduct" class="list-group-item list-group-item-action py-2 ">
                        <i class="fas fa-shoe-prints fa-fw me-3"></i><span>Product Management</span>
                    </a>

                    <c:if test="${sessionScope.acc != null}">
                        <a href="logout" class="list-group-item list-group-item-action py-2">
                            <i class="fas fa-sign-out-alt fa-fw me-3"></i><span>Log out</span>
                        </a>
                    </c:if>
                    <a href="home" class="list-group-item list-group-item-action py-2">
                        <i class="fas fa-home fa-fw me-3"></i><span>Home</span>
                    </a>
                </div>
            </div>
        </nav>
        <!-- Sidebar -->

        <!-- Include your footer or other content here if needed -->

        <script src="https://kit.fontawesome.com/a076d05399.js"></script> <!-- Font Awesome -->
    </body>
</html>

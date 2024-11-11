<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Weekly Revenue Charts</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <!------ Include the above in your HEAD tag ------>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/> 

        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">


        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/bootstrap.min.css">
        <!-- Material Design Bootstrap -->
        <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb-pro.min.css">
        <!-- Material Design Bootstrap Ecommerce -->
        <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb.ecommerce.min.css">
        <!-- Your custom styles (optional) -->
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ------>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/> 
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <jsp:include page="LeftAdmin.jsp"></jsp:include>

            <!-- Line Chart -->
            <h1 style="margin-left: 300px; margin-top: 50px">Weekly Revenue</h1>
            <canvas id="revenueChart" width="300" height="50" style="margin-left: 300px"></canvas>
            <br>

            <!-- Circle Chart -->
            <h1 style="margin-left: 300px; margin-top: 200px">Monthly Revenue</h1>
            <canvas id="circleChart" style="margin-left: 300px"></canvas>
            <script>
                // Line Chart
                const ctxLine = document.getElementById('revenueChart').getContext('2d');
                const revenueChart = new Chart(ctxLine, {
                    type: 'line',
                    data: {
                        labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
                        datasets: [{
                                label: 'Weekly Revenue',
                                data: [${w.monday}, ${w.tuesday}, ${w.wendsday}, ${w.thursday}, ${w.friday}, ${w.saturday}, ${w.sunday}], // Replace with your revenue data
                                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                borderColor: 'rgba(75, 192, 192, 1)',
                                borderWidth: 1,
                                fill: true
                            }]
                    },
                    options: {
                        maintainAspectRatio: true,
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        },
                        plugins: {
                            datalabels: {
                                align: 'end',
                                anchor: 'end',
                                backgroundColor: 'rgba(75, 192, 192, 0.8)',
                                borderRadius: 3,
                                color: 'white',
                                font: {
                                    weight: 'bold'
                                },
                                formatter: function (value) {
                                    return value.toFixed(2); // Format the value to 2 decimal places
                                }
                            }
                        }
                    },
                    plugins: [ChartDataLabels]
                });

                // Circle Chart (Doughnut)
                const ctxCircle = document.getElementById('circleChart').getContext('2d');
                const circleChart = new Chart(ctxCircle, {
                    type: 'bar',
                    data: {
                        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
                        datasets: [{
                                label: 'Monthly Revenue',
                                data: [${m.jan}, ${m.feb}, ${m.mar}, ${m.apr}, ${m.may}, ${m.jun}, ${m.jul}, ${m.aug}, ${m.sep}, ${m.oct}, ${m.nov}, ${m.dec}], // Replace with your monthly revenue data
                                backgroundColor: [
                                    'rgba(255, 0, 0, 0.2)', // Red
                                    'rgba(255, 127, 0, 0.2)', // Orange
                                    'rgba(255, 255, 0, 0.2)', // Yellow
                                    'rgba(0, 255, 0, 0.2)', // Green
                                    'rgba(0, 0, 255, 0.2)', // Blue
                                    'rgba(75, 0, 130, 0.2)', // Indigo
                                    'rgba(148, 0, 211, 0.2)', // Violet
                                    'rgba(255, 0, 0, 0.2)', // Red
                                    'rgba(255, 127, 0, 0.2)', // Orange
                                    'rgba(255, 255, 0, 0.2)', // Yellow
                                    'rgba(0, 255, 0, 0.2)', // Green
                                    'rgba(0, 0, 255, 0.2)'     // Blue
                                ],
                                borderColor: [
                                    'rgba(255, 0, 0, 1)', // Red
                                    'rgba(255, 127, 0, 1)', // Orange
                                    'rgba(255, 255, 0, 1)', // Yellow
                                    'rgba(0, 255, 0, 1)', // Green
                                    'rgba(0, 0, 255, 1)', // Blue
                                    'rgba(75, 0, 130, 1)', // Indigo
                                    'rgba(148, 0, 211, 1)', // Violet
                                    'rgba(255, 0, 0, 1)', // Red
                                    'rgba(255, 127, 0, 1)', // Orange
                                    'rgba(255, 255, 0, 1)', // Yellow
                                    'rgba(0, 255, 0, 1)', // Green
                                    'rgba(0, 0, 255, 1)'     // Blue
                                ],
                                borderWidth: 1
                            }]
                    },
                    options: {
                        maintainAspectRatio: true,
                        plugins: {
                            datalabels: false // Disable data labels
                        }
                    }
                });
        </script>
    </body>
</html>

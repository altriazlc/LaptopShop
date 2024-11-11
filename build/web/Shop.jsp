<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@300;400;500&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
        <script src="js/modernizr.js"></script>
    </head>
    <body>
        <!--begin of menu-->
        <jsp:include page="Menu.jsp"></jsp:include>
        <section class="jumbotron text-center bg-light" style="background-image: url('https://cdn.tgdd.vn/Files/2019/08/08/1185458/8-chiengametothon_800x450.jpg')">
                <div class="container" style="padding-top: 50px;">
                    <h1 class="jumbotron-heading display-4" style="color: white">The High Quality Laptop Shop</h1>
                    <p class="lead text-muted">Your one-stop shop for the latest and greatest laptops from top brands.</p>
                </div>
            </section>


            <!--end of menu-->

            <div class="container">
                <div class="row">
                    <div class="col">
                        <nav aria-label="breadcrumb">

                        </nav>
                    </div>
                </div>
            </div>
            <div class="container">

            <jsp:include page="LeftShop.jsp"></jsp:include>
                <div class="col-sm-9">
                    <p style="color: red">${requestScope.notify}</p>
                <div class="row">
                    <c:forEach items="${requestScope.laptop}" var="l">
                        <div class="col-12 col-md-6 col-lg-4 mb-4">
                            <div class="card h-100 shadow-sm">
                                <img class="card-img-top" src="${l.img}" alt="Card image cap" style="width: 100%; height: 200px; object-fit: cover;">
                                <div class="card-body d-flex flex-column">
                                    <h4 class="card-title"><a href="detail?pid=${l.laptopid}" title="View Product" class="text-decoration-none text-dark">${l.name}</a></h4>
                                        <c:forEach items="${requestScope.spec}" var="s">
                                            <c:if test="${s.laptopid==l.laptopid}">
                                            <h6 class="card-text text-muted">CPU: ${s.cpu}</h6>
                                            <h6 class="card-text text-muted">Ram ${s.ram}</h6>
                                            <h6 class="card-text text-muted"> Graphic card: ${s.card}</h6>     
                                            <h6 class="card-text text-muted"> Storage: ${s.storage}</h6>     
                                            
                                        </c:if>

                                    </c:forEach>
                                    <div class="mt-auto">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <span class="btn btn-light border">${l.price} $</span>
                                            <a href="addcart?pid=${l.laptopid}&quantity=1&index=${pageIndex}" class="btn btn-primary">Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </c:forEach>
                </div>
                <!--paging-->
                <div class="clearfix">
                    <div class="hint-text">Showing <b>${currentItem}</b> out of <b>${totalItem}</b> entries</div>
                    <ul class="pagination">
                        <li class="page-item ${pageIndex == 1 ? 'disabled' : ''}">
                            <a href="?index=${pageIndex - 1}" class="page-link">Previous</a>
                        </li>
                        <c:forEach begin="1" end="${endP}" var="i">
                            <li class="page-item ${pageIndex == i ? 'active' : ''}">
                                <a href="shop?index=${i}" class="page-link">${i}</a>
                            </li>
                        </c:forEach>
                        <li class="page-item ${pageIndex == endP ? 'disabled' : ''}">
                            <a href="shop?index=${pageIndex + 1}" class="page-link">Next</a>
                        </li>
                    </ul>
                </div>

            </div>

        </div>



        <!-- Footer -->
        <footer id="footer" class="overflow-hidden">
            <div class="container">
                <div class="row">
                    <div class="footer-top-area">
                        <div class="row d-flex flex-wrap justify-content-between">
                            <div class="col-lg-3 col-sm-6 pb-3">
                                <div class="footer-menu">
                                    <img src="images/main-logo.png" alt="logo">
                                    <p>Nisi, purus vitae, ultrices nunc. Sit ac sit suscipit hendrerit. Gravida massa volutpat aenean odio erat nullam fringilla.</p>
                                    <div class="social-links">
                                        <ul class="d-flex list-unstyled">
                                            <li>
                                                <a href="#">
                                                    <svg class="facebook">
                                                    <use xlink:href="#facebook" />
                                                    </svg>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <svg class="instagram">
                                                    <use xlink:href="#instagram" />
                                                    </svg>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <svg class="twitter">
                                                    <use xlink:href="#twitter" />
                                                    </svg>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <svg class="linkedin">
                                                    <use xlink:href="#linkedin" />
                                                    </svg>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <svg class="youtube">
                                                    <use xlink:href="#youtube" />
                                                    </svg>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2 col-sm-6 pb-3">
                                <div class="footer-menu text-uppercase">
                                    <h5 class="widget-title pb-2">Quick Links</h5>
                                    <ul class="menu-list list-unstyled text-uppercase">
                                        <li class="menu-item pb-2">
                                            <a href="#">Home</a>
                                        </li>
                                        <li class="menu-item pb-2">
                                            <a href="#">About</a>
                                        </li>
                                        <li class="menu-item pb-2">
                                            <a href="shop">Shop</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6 pb-3">
                                <div class="footer-menu text-uppercase">
                                    <h5 class="widget-title pb-2">Help & Info Help</h5>
                                    <ul class="menu-list list-unstyled">
                                        <li class="menu-item pb-2">
                                            <a href="#">Track Your Order</a>
                                        </li>
                                        <li class="menu-item pb-2">
                                            <a href="#">Returns Policies</a>
                                        </li>
                                        <li class="menu-item pb-2">
                                            <a href="#">Shipping + Delivery</a>
                                        </li>
                                        <li class="menu-item pb-2">
                                            <a href="#">Contact Us</a>
                                        </li>
                                        <li class="menu-item pb-2">
                                            <a href="#">Faqs</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6 pb-3">
                                <div class="footer-menu contact-item">
                                    <h5 class="widget-title text-uppercase pb-2">Contact Us</h5>
                                    <p>Do you have any queries or suggestions? <a href="mailto:">yourinfo@gmail.com</a>
                                    </p>
                                    <p>If you need support? Just give us a call. <a href="">+55 111 222 333 44</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
        </footer>
        <div id="footer-bottom">
            <div class="container">
                <div class="row d-flex flex-wrap justify-content-between">
                    <div class="col-md-4 col-sm-6">
                        <div class="Shipping d-flex">
                            <p>We ship with:</p>
                            <div class="card-wrap ps-2">
                                <img src="images/dhl.png" alt="visa">
                                <img src="images/shippingcard.png" alt="mastercard">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6">
                        <div class="payment-method d-flex">
                            <p>Payment options:</p>
                            <div class="card-wrap ps-2">
                                <img src="images/visa.jpg" alt="visa">
                                <img src="images/mastercard.jpg" alt="mastercard">
                                <img src="images/paypal.jpg" alt="paypal">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6">
                        <div class="copyright">
                            <p>© Copyright 2023 MiniStore. Design by <a href="https://templatesjungle.com/">TemplatesJungle</a> Distribution by <a href="https://themewagon.com">ThemeWagon</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/jquery-1.11.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript" src="js/plugins.js"></script>
        <script type="text/javascript" src="js/script.js"></script>

    </body>
</html>


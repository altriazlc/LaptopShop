<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ministore</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="format-detection" content="telephone=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="author" content="">
        <meta name="keywords" content="">
        <meta name="description" content="">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="demo-4.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@300;400;500&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
        <!-- script
        ================================================== -->
        <script src="js/modernizr.js"></script>
    </head>
    <body>

        <jsp:include page="Menu.jsp"></jsp:include>

            <section id="billboard" class="position-relative overflow-hidden bg-light-blue">
                <div class="swiper main-swiper">

                    <div class="swiper-slide" style="margin-top: 100px">
                        <div class="container">
                            <div class="row d-flex flex-wrap align-items-center">
                                <div class="col-md-6">
                                    <div class="banner-content">
                                        <h1 class="display-2 text-uppercase text-dark pb-5">The Best Laptop Shop Ever   </h1>
                                        <a href="shop" class="btn btn-medium btn-dark text-uppercase btn-rounded-none">Shop Product</a>
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <div class="image-holder">
                                        <img src="images/23-730x408-1.jpg" alt=""/>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container" style="margin-top:5% ">
                    <div class="row d-flex flex-wrap align-items-center">
                        <div class="col-md-6">
                                <h3 class="text-dark pb-5">FAMOUS BRAND</h3>       
                        </div>
                        
                    </div>
                </div>



                <div class="container" >
                    <div class="cat-blocks-container">
                        <div class="row">
                            <div class="col-6 col-sm-4 col-lg-3">
                                <a href="brandcontent?id=4" class="cat-block">
                                    <figure>
                                        <span>
                                            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/HP_logo_2012.svg/800px-HP_logo_2012.svg.png" alt="Category image" style="width: 50%">
                                        </span>
                                    </figure>
                                </a>
                            </div><!-- End .col-sm-4 col-lg-2 -->

                            <div class="col-6 col-sm-4 col-lg-3">
                                <a href="brandcontent?id=2" class="cat-block">
                                    <figure>
                                        <span>
                                            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Dell_logo_2016.svg/1200px-Dell_logo_2016.svg.png" style="width: 50%">
                                        </span>
                                    </figure>
                                </a>
                            </div><!-- End .col-sm-4 col-lg-2 -->

                            <div class="col-6 col-sm-4 col-lg-3">
                                <a href="brandcontent?id=6" class="cat-block">
                                    <figure>
                                        <span>
                                            <img src="https://1000logos.net/wp-content/uploads/2017/03/Lenovo-Logo-1.png" alt="Category image"  style="width: 100%;height: 145px">
                                        </span>
                                    </figure>

                                </a>
                            </div><!-- End .col-sm-4 col-lg-2 -->

                            <div class="col-6 col-sm-4 col-lg-3">
                                <a href="brandcontent?id=1" class="cat-block">
                                    <figure>
                                        <span>
                                            <img src="https://upload.wikimedia.org/wikipedia/commons/d/de/AsusTek-black-logo.png" alt="Category image" style="width: 100%;height: 145px">
                                        </span>
                                    </figure>

                                </a>
                            </div><!-- End .col-sm-4 col-lg-2 -->

                            <!-- End .col-sm-4 col-lg-2 -->
                        </div><!-- End .row -->
                        <div class="row">
                            <div class="col-6 col-sm-4 col-lg-3">
                                <a href="brandcontent?id=3" class="cat-block">
                                    <figure>
                                        <span>
                                            <img src="https://static.vecteezy.com/system/resources/previews/019/766/411/original/acer-logo-acer-icon-transparent-free-png.png" alt="Category image" style="width: 180px">
                                        </span>
                                    </figure>

                                </a>
                            </div><!-- End .col-sm-4 col-lg-2 -->

                            <div class="col-6 col-sm-4 col-lg-3">
                                <a href="brandcontent?id=7" class="cat-block">
                                    <figure>
                                        <span>
                                            <img src="https://logos-marques.com/wp-content/uploads/2021/03/Apple-Icone.png" alt="Category image" style="width: 100%;height: 180px">
                                        </span>
                                    </figure>

                                </a>
                            </div>
                            <div class="col-6 col-sm-4 col-lg-3">
                                <a href="brandcontent?id=8" class="cat-block">
                                    <figure>
                                        <span>
                                            <img src="https://cmctelecom.vn/wp-content/uploads/2017/02/microsoft-logo-microsoft-icon-transparent-free-png.png" alt="Category image" style="width: 100%;height: 180px">
                                        </span>
                                    </figure>
                                </a>
                            </div><!-- End .col-sm-4 col-lg-2 -->

                            <div class="col-6 col-sm-4 col-lg-3">
                                <a href="brandcontent?id=5" class="cat-block">
                                    <figure>
                                        <span>
                                            <img src="https://storage-asset.msi.com/event/msi-logos/images/msi-logo-for_digital_use_b.png" alt="Category image" style="width: 100%;height: 180px">
                                        </span>
                                    </figure>
                                </a>
                            </div><!-- End .col-sm-4 col-lg-2 -->

                        </div>
                    </div><!-- End .cat-blocks-container -->
                </div><!-- End .container -->
            </section>

            <section id="mobile-products" class="product-store position-relative padding-large no-padding-top" style="margin-top: 100px">
                <div class="container">
                    <div class="row">
                        <div class="display-header d-flex justify-content-between pb-3">
                            <h2 class="display-7 text-dark text-uppercase">Latest Products</h2>
                            <div class="btn-right">
                                <a href="shop" class="btn btn-medium btn-normal text-uppercase">Go to Shop</a>
                            </div>
                        </div>
                        <div class="row"> 
                        <c:forEach items="${requestScope.list}" var="l">
                            <div class="col-12 col-md-6 col-lg-4 mb-4">
                                <div class="card h-100 shadow-sm">
                                    <a href="detail?pid=${l.laptopid}" title="View Product" class="text-decoration-none text-dark"><img class="card-img-top" src="${l.img}" alt="Card image cap" style="width: 80%; height: 190px; object-fit: cover;"></a>
                                    <div class="card-body d-flex flex-column">
                                        <h4 class="card-title   "><a href="detail?pid=${l.laptopid}" title="View Product" class="text-decoration-none text-dark">${l.name}</a></h4>
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
                                                <a href="addcart?pid=${l.laptopid}&quantity=1" class="btn btn-primary">Add to cart</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </c:forEach>
                    </div>



                    </section>
                    <section id="smart-watches" class="product-store padding-large position-relative">
                        <div class="container">
                            <div class="row">
                                <div class="display-header d-flex justify-content-between pb-3">
                                    <h2 class="display-7 text-dark text-uppercase">Best Seller Products</h2>
                                    <div class="btn-right">
                                        <a href="shop" class="btn btn-medium btn-normal text-uppercase">Go to Shop</a>
                                    </div>
                                </div>
                                <div class="row"> 
                                    <c:forEach items="${requestScope.list2}" var="l">
                                        <div class="col-12 col-md-6 col-lg-4 mb-4">
                                            <div class="card h-100 shadow-sm">
                                                <a href="detail?pid=${l.laptopid}" title="View Product" class="text-decoration-none text-dark"><img class="card-img-top" src="${l.img}" alt="Card image cap" style="width: 80%; height: 190px; object-fit: cover;"></a>
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
                                                            <a href="addcart?pid=${l.laptopid}&quantity=1" class="btn btn-primary">Add to cart</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </c:forEach>
                                </div>

                                <div class="swiper-pagination position-absolute text-center"></div>
                                </section>
                                <section id="yearly-sale" class="bg-light-blue overflow-hidden mt-5">
                                    <div class="swiper main-swiper">

                                        <div class="swiper-slide" style="margin-top: 100px">
                                            <div class="container">
                                                <div class="row d-flex flex-wrap align-items-center">
                                                    <div class="col-md-5">
                                                        <div class="banner-content">
                                                            <div class="text-content">
                                                                <h3>SUGGEST PRODUCT</h3>
                                                                <h2 class="display-2 pb-5 text-uppercase text-dark">${requestScope.fe.name}</h2>
                                                                <h3>${requestScope.fe.price}$</h3>
                                                                <a href="shop" class="btn btn-medium btn-dark text-uppercase btn-rounded-none">Shop Sale</a>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="col-md-7">
                                                        <div class="image-holder">
                                                            <img src="${requestScope.fe.img}"  width="700" height="700"/>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                                <section id="company-services" class="padding-large">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-lg-3 col-md-6 pb-3">
                                                <div class="icon-box d-flex">
                                                    <div class="icon-box-icon pe-3 pb-3">
                                                        <svg class="cart-outline">
                                                        <use xlink:href="#cart-outline" />
                                                        </svg>
                                                    </div>
                                                    <div class="icon-box-content">
                                                        <h3 class="card-title text-uppercase text-dark">Free delivery</h3>
                                                        <p>We can help you ship products to your home without any delivery fees</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-6 pb-3">
                                                <div class="icon-box d-flex">
                                                    <div class="icon-box-icon pe-3 pb-3">
                                                        <svg class="quality">
                                                        <use xlink:href="#quality" />
                                                        </svg>
                                                    </div>
                                                    <div class="icon-box-content">
                                                        <h3 class="card-title text-uppercase text-dark">Quality guarantee</h3>
                                                        <p>We guarantee high-quality products from top brands to ensure your satisfaction.</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-6 pb-3">
                                                <div class="icon-box d-flex">
                                                    <div class="icon-box-icon pe-3 pb-3">
                                                        <svg class="price-tag">
                                                        <use xlink:href="#price-tag" />
                                                        </svg>
                                                    </div>
                                                    <div class="icon-box-content">
                                                        <h3 class="card-title text-uppercase text-dark">Daily offers</h3>
                                                        <p>Explore our daily deals and special discounts to find great savings on laptops.</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-6 pb-3">
                                                <div class="icon-box d-flex">
                                                    <div class="icon-box-icon pe-3 pb-3">
                                                        <svg class="shield-plus">
                                                        <use xlink:href="#shield-plus" />
                                                        </svg>
                                                    </div>
                                                    <div class="icon-box-content">
                                                        <h3 class="card-title text-uppercase text-dark">100% secure payment</h3>
                                                        <p>>Rest assured with our secure payment options for a worry-free shopping experience.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>

                                <section id="subscribe" class="container-grid padding-large position-relative overflow-hidden">
                                    <div class="container">
                                        <div class="row">
                                            <div class="subscribe-content bg-dark d-flex flex-wrap justify-content-center align-items-center padding-medium">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="display-header pe-3">
                                                        <h2 class="display-7 text-uppercase text-light">Subscribe Us Now</h2>
                                                        <p>Get latest news, updates and deals directly mailed to your inbox.</p>
                                                    </div>
                                                </div>
                                                <div class="col-md-5 col-sm-12">
                                                    <form class="subscription-form validate">
                                                        <div class="input-group flex-wrap">
                                                            <input class="form-control btn-rounded-none" type="email" name="EMAIL" placeholder="Your email address here">
                                                            <button class="btn btn-medium btn-primary text-uppercase btn-rounded-none" type="submit" name="subscribe">Subscribe</button>
                                                        </div>
                                                        <form>
                                                            </div>
                                                            </div>
                                                            </div>
                                                            </div>
                                                            </section>
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

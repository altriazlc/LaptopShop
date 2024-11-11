<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="row">
    <div class="col-sm-3">
        <div class="card bg-light mb-3">
            <div class="card-header bg-dark text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
            <ul class="list-group category_block">
                <li class="list-group-item text-white"><a href="shop">All</a></li>
                    <c:forEach items="${requestScope.cat}" var="c">
                    <li class="list-group-item text-white"><a href="catcontent?id=${c.catid}">${c.catname}</a></li>
                    </c:forEach>

            </ul>
        </div>
        <div class="card bg-light mb-3">
            <div class="card-header bg-dark text-white text-uppercase">Brand</div>
            <ul class="list-group category_block">
                <c:forEach items="${requestScope.brand}" var="b">
                    <li class="list-group-item text-white"><a href="brandcontent?id=${b.brandid}">${b.brandname}</a></li>
                    </c:forEach>

            </ul>
        </div>
        <div class="card bg-light mb-3">
            <div class="card-header bg-dark text-white text-uppercase">Price</div>
            <ul class="list-group category_block">
                <li class="list-group-item text-white"><a href="shop?sort=low">Low -> High</a></li>
                <li class="list-group-item text-white"><a href="shop?sort=high">High -> Low</a></li>
            </ul>
            <div class="d-flex align-items-center mt-4 pb-1">

                <div class="md-form md-outline my-0">
                    <input type="number" id="from" name="from" class="form-control mb-0" placeholder="From">
                </div>
                <p class="px-2 mb-0 text-muted"> - </p>
                <div class="md-form md-outline my-0">
                    <input type="number" id="to" name="to" class="form-control mb-0" placeholder="To">
                </div>
            </div>
            <div class="card-header bg-dark text-white text-uppercase">
                <a href="#" id="findLink" class="text-white" style="align-items:  center">Find</a>
            </div>
        </div>      
    </div>

    <script>
        document.getElementById('findLink').addEventListener('click', function (event) {
            event.preventDefault(); // Prevent the default link behavior
            var fromValue = parseFloat(document.getElementById('from').value);
            var toValue = parseFloat(document.getElementById('to').value);

            if (isNaN(fromValue) || isNaN(toValue)) {
                alert("Please enter both 'From' and 'To' values.");
                return;
            }

            if (fromValue > toValue) {
                alert("'From' value cannot be greater than 'To' value.");
                return;
            }

            var url = 'pricecontent?from=' + fromValue + '&to=' + toValue;
            window.location.href = url;
        });
    </script>

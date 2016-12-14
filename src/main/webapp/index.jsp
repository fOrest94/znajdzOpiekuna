<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE HTML>
<html lang="pl_PL">
<head>
    <link rel="shortcut icon" type="image/x-icon" href="/img/bookmark.png">
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/style.css" rel="stylesheet"/>
    <link href="/resources/css/font-awesome.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Itim" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Aclonica|Open+Sans" rel="stylesheet">
    <title>znajdźOpiekuna</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>

<body>

<div class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <div class="navbar-brand navbar-nav">
                <a href="#"><div class="logo">znajdźOpiekuna</div></a>
            </div>

        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#howItWorks" id="howDissapear">Jak to działa?</a></li>
                <c:if test="${pageContext.request.userPrincipal.name == null}">
                    <li><a href="login">Zaloguj się</a></li>
                    <li>
                        <ol class="breadcrumb" style="float: left;">
                            <li class="active" style="color: #c09e6b;">Zarejestruj się</li>
                            <li><a href="registrationParent">Rodzic</a></li>
                            <li><a href="registrationGuardian">Opiekunka</a></li>
                        </ol>
                    </li>
                </c:if>
                <sec:authorize access="hasRole('ROLE_USER')">
                    <c:url value="/logout" var="logoutUrl" />
                    <form action="${logoutUrl}" method="post" id="logoutForm">
                        <input type="hidden" name="${_csrf.parameterName}"
                               value="${_csrf.token}" />
                    </form>
                    <script>
                        function formSubmit() {
                            document.getElementById("logoutForm").submit();
                        }
                    </script>

                    <c:if test="${pageContext.request.userPrincipal.name != null}">

                        <li><a href="profile"> Mój profil</a></li>
                        <li>
                            <ol class="breadcrumb" style="float: left;">
                                <li class="active" style="color: #c09e6b; font-size: 12px;">Witaj, ${pageContext.request.userPrincipal.name}</li>
                                <li><a href="javascript:formSubmit()"> Wyloguj</a></li>
                            </ol>
                        </li>
                    </c:if>
                </sec:authorize>
            </ul>
        </div>
    </div>
</div>


<div id="headerSection" style="padding-top: 115px; ">
    <div class="container">
        <div class="row">
            <div class="col col-md-5"></div>
            <div class="col col-md-7"  style="padding-top: 200px">

                <form class="form-horizontal" action="/indexService">
                    <div class="form-group">
                        <h1 class="text-center" style="color: #FF4F4F; font-size: 50px">Znajdź lokalną  nianię lub opiekunkę!</h1>
                        <h3 class="text-center" style="color: #FF4F4F; font-size: 30px">Szybko, prosto i bezpiecznie.</h3>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-6 col-md-offset-3">
                            <input type="text" class="form-control" id="inputEmail3" placeholder="Wpisz kod lub miasto">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-10 col-md-offset-1">
                            <div class="checkbox">
                                <label class="radio-inline">
                                    <input type="radio" name="userType" id="inlineRadio1" value="sister" checked="checked">Znajdź opiekę
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="userType" id="inlineRadio2" value="simply">Znajdź pracę
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-10 col-md-offset-1">
                            <input type="submit" class="btn btn-danger">Szukaj</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="howItWorks" style="padding-top: 115px; ">
    <div class="container">
        <div class="row">
            <div class="col col-md-12" data-scrollreveal="enter top and move 100px, wait 0.2s">
                <h1 style="color: #FF4F4F;">Jak znaleźć nanię lub opiekunkę?</h1>

                <h3 style="color: #FF4F4F;">Strona znajdźOpiekuna czyni szukanie opieki łatwym</h3>
                <p>Welcome to Find A Babysitter â Australia's leading child care job site helping parents locate nannies, after-school carers and babysitters. With just the click of a button you can access a wonderful range of child care providers just right for your family's needs.</p>
                <h2 style="color: #FF4F4F;">Czemu strona znajdźOpiekuna jest tak popularna?</h2>
                <p>Find A Babysitter is the largest, most effective and affordable way to find a babysitter or nanny for your family in Australia. We are proud to be the Australian market leader, giving you a quality site with a range of helpful features. By using Find. A Babysitter :</p>
                <ul>
                    <li>QUALITY &amp; RESULTS:&nbsp;You have access to a quality site that delivers results. Find A Babysitter has helped over 50,000 parents find the babysitter or nanny they need, with an 88.8% success rate&nbsp;since we started in July 2005.<br> &nbsp;</li>
                    <li>SIZE:&nbsp;You can access the largest database of babysitters and nannies nationwide, so you are sure to find a babysitter or nanny for your specific needs.<br> &nbsp;</li>
                    <li>MORE FOR YOUR MONEY:&nbsp;You get 3 powerful methods to find the right babysitter or nanny The broad database of nannies and babysitter to email. The job posting feature that lets applicants contact you directly. And notification alerts as new babysitters or nanny's join in your local area. The job posting feature includes your job being listed for&nbsp;free&nbsp;on&nbsp;<a href="http://www.adzuna.com.au/" title="">Adzuna.com.au</a>&nbsp;reaching a greater number of babysitters or nannies.<br> &nbsp;</li>
                    <li>UP-TO-DATE:&nbsp;You can choose the most up-to-date carers listed (plus we 'retire' any babysitters or nannies&nbsp;who don't log in regularly).<br> &nbsp;</li>
                    <li>RATINGS:&nbsp;You can use our Ratings System, to gain and provide feedback on babysitters and nannies so you can identify the gems easily.<br> &nbsp;</li>
                    <li>AUTHENTICITY:&nbsp;Behind the scenes Find A Babysitter is run by Fairfax Media (see About Us for more info). This brings a professional focus to ensure the site gives you great results!<br> &nbsp;</li>
                    <li>UP-TO-DATE:&nbsp;You can choose the most up-to-date carers listed (plus we 'retire' any babysitters or nannies&nbsp;who don't log in regularly).<br> &nbsp;</li>
                    <li>RATINGS:&nbsp;You can use our Ratings System, to gain and provide feedback on babysitters and nannies so you can identify the gems easily.<br> &nbsp;</li>
                </ul>

            </div>
        </div>
    </div>
</div>

<script src="/resources/js/jquery.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/scrollReveal.js"></script>
<script src="/resources/js/custom.js"></script>
<script src="/resources/js/script.js"></script>

</body>
</html>
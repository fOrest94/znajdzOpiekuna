<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page session="true" %>

<!DOCTYPE HTML>
<html lang="pl_PL">
<head>
    <link rel="shortcut icon" type="image/x-icon" href="/img/bookmark.png">
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/style.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Itim" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Aclonica|Open+Sans" rel="stylesheet">
    <title>znajdźOpiekuna</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>

<body>
<div class="navbar navbar-default" style="margin-bottom: 0px;">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target=".navbar-collapse">
                <span class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span>
            </button>
            <div class="navbar-brand navbar-nav">
                <a href="#">
                    <div class="logo">znajdźOpiekuna</div>
                </a>
            </div>

        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right" style="padding-right: 0px;">
                <sec:authorize access="hasRole('ROLE_USER')">
                    <c:url value="/logout" var="logoutUrl"/>
                    <form action="${logoutUrl}" method="post" id="logoutForm">
                        <input type="hidden" name="${_csrf.parameterName}"
                               value="${_csrf.token}"/>
                    </form>
                    <li>
                        <ol class="breadcrumb" style="float: left;">
                            <li class="active" style="color: #c09e6b;"><a
                                    href="indexService">Witaj, ${user.firstName}</a></li>
                            <li><a href="javascript:formSubmit()"> Wyloguj</a></li>
                        </ol>
                    </li>
                </sec:authorize>
            </ul>
        </div>
    </div>
</div>

<div class="profile-navbar">
    <div class="container">
        <div class="col-lg-3 col-lg-offset-9"
             style="padding-left: 50px; padding-top: 10px;">
            <a href="/showProfile"
               style="color: white; font-size: 13px; padding-right: 20px;">Profil</a>
            <a href="profile"
               style="color: white; font-size: 13px; padding-right: 20px;">Ustawienia</a>
            <a href="profile" style="color: white; font-size: 13px;">Wiadomości</a>
        </div>
    </div>
</div>
<c:if test="${pageContext.request.userPrincipal.name != null}">
    <div class="container" style="background-color: white;">
        <ul class="nav nav-tabs" style="font-size: 10px;" role="tablist">
            <li role="presentation" class="active"><a href="showProfile">Profil</a></li>
            <li role="presentation"><a href="editProfile">Edycja</a></li>
            <li role="presentation"><a href="userSettings">Zaawansowane</a></li>
        </ul>
    </div>
</c:if>
<div class="container" style="min-height: 800px; background-color: white; padding-top: 70px;">

    <div class="col-lg-5" style="height: 420px;">

        <div class="col-lg-12" style=" text-align: center;">
            <div class="col-lg-9 col-lg-offset-1" style="height: 500px;">

                <img src="${pageContext.request.contextPath}/resources/pictures/profileImages/${pageContext.request.userPrincipal.name}.jpg"
                     width="300" height="300">
                <form:form method="POST" modelAttribute="fileBucket"
                           enctype="multipart/form-data" class="form-horizontal">
                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}"/>
                    <div class="row">
                        <div class="form-group col-md-12">
                            <div class="col-md-7">
                                <form:input type="file" path="file" id="file" class="form-control input-sm"/>
                                <div class="has-error">
                                    <form:errors path="file" class="help-inline"/>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-actions floatRight">
                            <input type="submit" value="Zapisz"
                                   class="btn btn-danger btn-sm">
                        </div>
                    </div>
                </form:form>
                File <strong>${fileName}</strong> uploaded successfully.
            </div>
        </div>
    </div>
    <div class="col-lg-7" style="height: 420px">
        <div class="row">
            <h1 style="text-align: left; font-size: 35px; color: #FF4F4F;">${user.firstName} ${user.lastName}</h1>
            <hr>
            <div class="col-lg-6">
                <h3 style="text-align: left; "><c:choose>
                    <c:when test="${user.sex == false}">
                        Kobieta
                    </c:when>
                    <c:otherwise>
                        Mężczyzna
                    </c:otherwise>
                </c:choose>,${userNanny.age} lat</h3>
                <h3 style="text-align: left; ">Gdzie opieka: ${userNanny.placeOfTakeCare }</h3>
                <h3 style="text-align: left; ">Wynagrodzenie: ${userNanny.moneyPerHour }zł/h</h3>
                <h3 style="text-align: left; ">Lokalizacja: ${user.zipCode}</h3>
                <h3 style="text-align: left; ">Ocena: 4.5</h3>
            </div>
            <div class="col-lg-6" style="padding-top: 30px;">
                <a href="writeToMe" class="btn btn-danger" style="width: 180px; font-size: 19px; color: white;">Napisz
                    do mnie!</a>
            </div>

        </div>
    </div>
    <div class="col-lg-7 col-lg-offset-5" style="min-height: 500px; padding-bottom: 100px;">

        <p style="font-size: 16px; text-align: left;">
        <div class="panel">
            <h3 style="text-align: left;">Prace których się podejmę:</h3>
        </div>
        <br>
        <img src="${pageContext.request.contextPath}/resources/images/${userNanny.whoWannCareNanny}.png"> Opieka nad
        dziećmi<br>
        <img src="${pageContext.request.contextPath}/resources/images/${userNanny.whoWannCareOld }.png"> Opieka nad
        starszymi<br>
        <br>
        <div class="panel">
            <h3 style="text-align: left;">Miejsce opieki:</h3>
        </div>
        <br>
        <c:choose>
            <c:when test="${userNanny.placeOfTakeCare == 1}">
                <img src="${pageContext.request.contextPath}/resources/images/1.png"> Dowolne<br>
                <img src="${pageContext.request.contextPath}/resources/images/0.png"> U rodziców<br>
                <img src="${pageContext.request.contextPath}/resources/images/0.png"> U niani <br>
            </c:when>
            <c:when test="${userNanny.placeOfTakeCare == 2}">
                <img src="${pageContext.request.contextPath}/resources/images/0.png"> Dowolne<br>
                <img src="${pageContext.request.contextPath}/resources/images/1.png"> U rodziców<br>
                <img src="${pageContext.request.contextPath}/resources/images/0.png"> U niani <br>
            </c:when>
            <c:otherwise>
                <img src="${pageContext.request.contextPath}/resources/images/0.png"> Dowolne<br>
                <img src="${pageContext.request.contextPath}/resources/images/0.png"> U rodziców<br>
                <img src="${pageContext.request.contextPath}/resources/images/1.png"> U niani <br>
            </c:otherwise>
        </c:choose><br>
        <div class="panel">
            <h3 style="text-align: left;">Zajęcia z podopiecznymi:</h3>
        </div>
        <br>
        <img src="${pageContext.request.contextPath}/resources/images/${userNanny.otherActClean}.png"> Dowolne<br>
        <img src="${pageContext.request.contextPath}/resources/images/${userNanny.otherActCook}.png"> U rodziców<br>
        <img src="${pageContext.request.contextPath}/resources/images/${userNanny.otherActShop}.png"> U niani <br>
        <img src="${pageContext.request.contextPath}/resources/images/${userNanny.otherActVac}.png"> U niani <br>
        <div class="panel">
            <h3 style="text-align: left;">Inne umiejętności:</h3>
        </div>
        ${userNanny.otherSkills}<br><br>
        <div class="panel">
            <h3 style="text-align: left;">Doświadczenie w pracy z dziećmi:</h3>
        </div>
        <img src="${pageContext.request.contextPath}/resources/images/${userNanny.careExpKids}.png">
        <c:choose>
            <c:when test="${userNanny.careExpKids == true}">
                Tak<br>Staż: ${userNanny.experienceKidsTime}<br>
            </c:when>
            <c:otherwise>
                Nie<br>
            </c:otherwise>
        </c:choose><br>
        <div class="panel">
            <h3 style="text-align: left;">Doświadczenie w pracy ze starszymi:</h3>
        </div>
        <img src="${pageContext.request.contextPath}/resources/images/${userNanny.careExpOld}.png">
        <c:choose>
            <c:when test="${userNanny.careExpOld == true}">
                Tak<br>Staż: ${userNanny.experienceOldTime}<br>
            </c:when>
            <c:otherwise>
                Nie<br>
            </c:otherwise>
        </c:choose><br>
        <div class="panel">
            <h3 style="text-align: left;">Wymiar etatu:</h3>
        </div>
        <br>
        <img src="${pageContext.request.contextPath}/resources/images/${userNanny.timeJobHalf}.png"> Pół etatu<br>
        <img src="${pageContext.request.contextPath}/resources/images/${userNanny.timeJobFull}.png"> Pełny etat<br>
        <img src="${pageContext.request.contextPath}/resources/images/${userNanny.timeJobCasual}.png"> Dorywczo <br>
        <br>
        <div class="panel">
            <h3 style="text-align: left;">Praca z domem:</h3>
        </div>
        <br>
        <img src="${pageContext.request.contextPath}/resources/images/${userNanny.workWithHome}.png">
        <c:choose>
            <c:when test="${userNanny.workWithHome == true}">
                Tak<br>
            </c:when>
            <c:otherwise>
                Nie<br>
            </c:otherwise>
        </c:choose>
        <div class="panel">
            <h3 style="text-align: left;">Wykształcenie:</h3>
        </div>
        ${userNanny.education}<br><br>
        <div class="panel">
            <h3 style="text-align: left;">Języki obce:</h3>
        </div>
        ${userNanny.foreignLanguages}<br>
    </div>
</div>

<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script
        src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script
        src="${pageContext.request.contextPath}/resources/js/scrollReveal.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>

</body>
</html>
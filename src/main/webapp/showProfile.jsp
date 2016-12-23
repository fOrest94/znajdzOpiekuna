<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true" %>

<!DOCTYPE HTML>
<head>

    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/style.css" rel="stylesheet"/>
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
                <a href="/index">
                    <div class="logo">znajdźOpiekuna</div>
                </a>
            </div>

        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right" style="padding-right: 0px;">
                <c:if test="${pageContext.request.userPrincipal.name != null}">
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
                </c:if>
                <c:if test="${pageContext.request.userPrincipal.name == null}">
                    <li><a href="login">Zaloguj się</a></li>
                    <li><a href="registration" style="color: #c09e6b;">Zarejestruj się</a></li>
                </c:if>
            </ul>
        </div>
    </div>
</div>

<div class="profile-navbar">
    <div class="container">
        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <div class="col-lg-3" style="padding-left: 50px; padding-top: 22px;">
                <a href="news" style="color: white; font-size: 20px; padding-right: 20px;">Aktualności</a>
            </div>
            <div class="col-lg-3 col-lg-offset-6" style="padding-left: 50px; padding-top: 10px;">
                <a href="showMyProfile" style="color: white; font-size: 13px; padding-right: 20px;">Profil</a>
                <a href="editMyProfile" style="color: white; font-size: 13px;  padding-right: 20px;">Ustawienia</a>
                <a href="messages" style="color: white; font-size: 13px;">Wiadomości</a>
            </div>
        </c:if>
    </div>
</div>
<c:if test="${pageContext.request.userPrincipal.name != null && whatShow == 1}">
    <div class="container" style="background-color: white;">
        <ul class="nav nav-tabs" style="font-size: 10px;" role="tablist">
            <li role="presentation" class="active"><a href="showMyProfile">Profil</a></li>
            <li role="presentation"><a href="editMyProfile">Edycja</a></li>
            <li role="presentation"><a href="newsManagement">Dodaj aktualność</a></li>

        </ul>
    </div>
</c:if>
<div class="container" style="min-height: 800px; background-color: white; padding-top: 70px;">

    <div class="col-lg-5" style="height: 420px;">

        <div class="col-lg-12" style=" text-align: center;">
            <div class="col-lg-9 col-lg-offset-1" style="height: 500px;">

                <img src="resources/pictures/profileImages/${user.id}.jpg"
                     width="300" height="300">
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



        <div class="panel panel-default" style="width: 520px;">
            <div class="panel-heading">O mnie</div>
            <div class="panel-body">
                <c:if test="${user.userType eq 1 }">
                ${userParent.writeSthAboutYou}
                </c:if>
                <c:if test="${user.userType eq 2 }">
                    ${userNanny.writeSthAboutYou}
                </c:if>
            </div>
        </div>

        <c:if test="${user.userType eq 2 }">
        <p style="font-size: 16px; text-align: left;">
        <div class="panel">
            <h3 style="text-align: left;">Prace których się podejmę:</h3>
        </div>
        <br>
        <img src="/resources/img/${userNanny.whoWannCareNanny}.png"> Opieka nad
        dziećmi<br>
        <img src="resources/img/${userNanny.whoWannCareOld }.png"> Opieka nad
        starszymi<br>
        <br>
        <div class="panel">
            <h3 style="text-align: left;">Miejsce opieki:</h3>
        </div>
        <br>
        <c:choose>
            <c:when test="${userNanny.placeOfTakeCare == 1}">
                <img src="resources/img/1.png"> Dowolne<br>
                <img src="resources/img/0.png"> U rodziców<br>
                <img src="resources/img/0.png"> U niani <br>
            </c:when>
            <c:when test="${userNanny.placeOfTakeCare == 2}">
                <img src="resources/img/0.png"> Dowolne<br>
                <img src="resources/img/1.png"> U rodziców<br>
                <img src="resources/img/0.png"> U niani <br>
            </c:when>
            <c:otherwise>
                <img src="resources/img/0.png"> Dowolne<br>
                <img src="resources/img/0.png"> U rodziców<br>
                <img src="resources/img/1.png"> U niani <br>
            </c:otherwise>
        </c:choose><br>
        <div class="panel">
            <h3 style="text-align: left;">Zajęcia z podopiecznymi:</h3>
        </div>
        <br>
        <img src="resources/img/${userNanny.otherActClean}.png"> Dowolne<br>
        <img src="resources/img/${userNanny.otherActCook}.png"> U rodziców<br>
        <img src="resources/img/${userNanny.otherActShop}.png"> U niani <br>
        <img src="resources/img/${userNanny.otherActVac}.png"> U niani <br>
        <div class="panel">
            <h3 style="text-align: left;">Inne umiejętności:</h3>
        </div>
        ${userNanny.otherSkills}<br><br>
        <div class="panel">
            <h3 style="text-align: left;">Doświadczenie w pracy z dziećmi:</h3>
        </div>
        <img src="resources/img/${userNanny.careExpKids}.png">
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
        <img src="resources/img/${userNanny.careExpOld}.png">
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
        <img src="resources/img/${userNanny.timeJobHalf}.png"> Pół etatu<br>
        <img src="resources/img/${userNanny.timeJobFull}.png"> Pełny etat<br>
        <img src="resources/img/${userNanny.timeJobCasual}.png"> Dorywczo <br>
        <br>
        <div class="panel">
            <h3 style="text-align: left;">Praca z domem:</h3>
        </div>
        <br>
        <img src="${pageContext.request.contextPath}/resources/img/${userNanny.workWithHome}.png">
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
    </c:if>

        <p style="font-size: 16px; text-align: left;">
        <div class="panel">
            <h3 style="text-align: left;">Poszukuję opieki dla:</h3>
        </div>
        <br>
        <img src="resources/img/${userParent.whoWannCareNanny}.png"> Dziecka<br>
        <img src="resources/img/${userParent.whoWannCareOld }.png"> Osoby starszej<br>
        <img src="resources/img/${userParent.workWithHome}.png"> Domu<br>
        <br>

        <br>
    </div>
</div>

<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/scrollReveal.js"></script>
<script src="resources/js/custom.js"></script>
<script src="resources/js/script.js"></script>

</body>
</html>
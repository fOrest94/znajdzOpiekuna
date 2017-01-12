<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>
<html lang="pl_PL">
<head>

    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css">
    <title>Rejestracja</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

    <script src="/resources/js/jquery-birthday-picker.min.js"></script>
</head>


<body>
<script>
    $("#default-settings").birthdayPicker();
    $("#default-birthday").birthdayPicker({"defaultDate":"01-03-1980"});
    $("#max-year-birthday").birthdayPicker({
        "defaultDate": "01-03-1980",
        "maxYear": "2020",
        "maxAge": 65
    });
    $("#short-month-birthday").birthdayPicker({
        "defaultDate": "01-03-1980",
        "maxYear": "2020",
        "maxAge": 65,
        "monthFormat":"short"
    });
    $("#long-month-birthday").birthdayPicker({
        "defaultDate": "01-03-1980",
        "maxYear": "2020",
        "maxAge": 65,
        "monthFormat":"long",
        "sizeClass": "span3"
    });
</script>
<script type="text/javascript">

    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-36251023-1']);
    _gaq.push(['_setDomainName', 'jqueryscript.net']);
    _gaq.push(['_trackPageview']);

    (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();

</script>
<div class="container" style="">
    <form:form method="post" action="/registrationSearch" modelAttribute="searchCare" class="form-horizontal">
    <div id="signupbox" style="margin-top:50px" class="col-lg-8 col-lg-offset-2">
        <div class="panel panel-danger" style="border-color: #fcb2ab; margin-top: 200px;">
            <div class="panel-heading">
                <div class="panel-title"><p style="text-align: left; font-size: 19px;">${user.firstName}, uzupełnij swój profil</p></div>
            </div>
            <div class="panel-body">

            <div id="signupalert" style="display:none" class="alert alert-danger">
                <p>Error:</p>
                <span></span>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label" style="text-align: left">Szukasz opieki dla:</label>
                <div class="col-lg-9" style="padding-top: 1px">
                <div class="col-md-4" style="padding-left: 30px;">
                    <spring:bind path="whatWannaCare">
                    <form:checkbox path="whatWannaCare" id="checkbox1" value="nanny"/>
                    <form:errors path="whatWannaCare" cssClass="error"/>
                    <label for="checkbox1">Dziecka</label>
                        <form:hidden path="userId" value="${user.id}"/>
                </div>
                </spring:bind>
                <div class="col-md-4" style="padding-left: 10px;">
                    <spring:bind path="whatWannaCare">
                        <form:checkbox path="whatWannaCare" id="checkbox2" value="old" />
                        <form:errors path="whatWannaCare" cssClass="error"/>
                        <label for="checkbox2">Osoby starszej</label>
                    </spring:bind>
                </div>
                <div class="col-md-4">
                    <spring:bind path="whatWannaCare">
                        <form:checkbox path="whatWannaCare" id="checkbox3" value="dom"/>
                        <form:errors path="whatWannaCare" cssClass="error"/>
                        <label for="checkbox3">Domu</label>
                    </spring:bind>
                </div>
                </div>
            </div>
                <hr/>


                <div class="form-group" style="margin-top: 20px;">
                    <spring:bind path="writeSthAboutYou">
                        <label class="col-md-3 control-label" style="text-align: left">Napisz coś o
                            sobie</label>
                        <div class="col-md-8 ">
                            <form:textarea path="writeSthAboutYou" rows="8" cols="62"
                                           style="margin-left: 20px; border-radius: 3px;"/>
                            <form:errors path="writeSthAboutYou" cssClass="error"/>
                        </div>
                    </spring:bind>

                </div>
                <hr/>

                <div class="form-group" style="margin-top: 20px;">
                    <spring:bind path="writeSthAboutYou">
                        <label class="col-md-3 control-label" style="text-align: left">Telefon komórkowy</label>
                        <div class="col-md-4 ">
                            <form:input style=" margin-left: 20px;" type="text" path="writeSthAboutYou" class="form-control"   placeholder="Telefon"
                                        autofocus="true"></form:input>
                            <form:errors path="writeSthAboutYou"></form:errors>
                        </div>
                    </spring:bind>

                </div>
                <hr/>

                <div class="form-group" style="margin-top: 20px; ">
                    <label class="col-md-3 control-label" style="text-align: left">Cena za godzinę
                        opieki</label>
                    <div class="col-md-2 " style="padding-left: 35px;">
                        <spring:bind path="moneyPerHour">
                            <form:input path="moneyPerHour" class="form-control" placeholder="zł/h"
                                        style="margin-top: 5px; "/>
                            <form:errors path="moneyPerHour" cssClass="error"/>
                        </spring:bind>
                    </div>
                    <div class="col-md-7 " style="margin-top: 10px; padding-right: 20px;">
                        <p style="font-size: 17px; text-align: left; padding-top: 2px;">zł/h</p>
                    </div>
                </div>
                <hr/>
                    <div class="form-group">
                        <div class="col-md-offset-3 col-md-9">
                            <input type="submit" value="Zarejestruj się" class="btn btn-danger"
                                   style="font-size: 14px;">
                        </div>
                    </div>
            </div>
            </div>
</div>
</div>
</form:form>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/resources/js/jquery.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/scrollReveal.js"></script>
<script src="/resources/js/custom.js"></script>
<script src="/resources/js/script.js"></script>
</body>
</html>

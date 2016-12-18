<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="path" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>
<html lang="pl_PL">
<head>

    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/style.css" rel="stylesheet">

    <title>znajdźOpiekuna</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<style>
    body {
        background: url("/resources/images/main-wallpaper.png") no-repeat center center fixed;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
    }

    p {
        text-align: left;
        font-family: 'Itim', cursive;
        font-size: 21px;
        color: #52452e;
        margin-bottom: 0px;
    }
</style>

<body>

<div class="container" style="">
    <form:form  method="post" action="/registrationOffer" modelAttribute="offerCare" class="form-horizontal">
        <div id="signupbox1" style="margin-top:50px" class="col-lg-8 col-lg-offset-2">
            <div class="panel panel-danger" style="border-color: #fcb2ab;  margin-top: 200px;">
                <div class="panel-heading">
                    <div class="panel-title"><p>${user.firstName}, uzupełnij swój profil</p></div>

                </div>
                <div class="panel-body">

                    <div id="signupalert" style="display:none" class="alert alert-danger">
                        <p>Error:</p>
                        <span></span>
                    </div>

                    <div class="form-group" style="border-bottom: 12px; ">
                        <label class="col-md-3 control-label" style="text-align: left">Kim chcesz się
                            opiekować</label>
                        <div class="col-md-4">
                            <div class="col-md-4" style="padding-left: 10px;">
                                <spring:bind path="whatWannaCare">
                                    <form:checkbox path="whatWannaCare" id="checkbox1" value="nanny"/>
                                    <form:errors path="whatWannaCare" cssClass="error"/>
                                    <label for="checkbox1">Dzieci</label>
                                </spring:bind>
                                <form:hidden path="userId" value="${user.id}"/>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <spring:bind path="whatWannaCare">
                                <form:checkbox path="whatWannaCare" id="checkbox2" value="old"/>
                                <form:errors path="whatWannaCare" cssClass="error"/>
                                <label for="checkbox2">Osoby starsze</label>
                            </spring:bind>
                        </div>
                    </div>
                    <hr/>
                    <div class="form-group">
                        <label class="col-md-3 control-label" style="text-align: left">Jakie inne zajęcia jesteś w
                            stanie wykonywać</label>
                        <div class="col-md-4">
                            <spring:bind path="otherActivities">
                                <form:checkbox path="otherActivities" id="checkbox1" value="shop"/>
                                <form:errors path="otherActivities" cssClass="error"/>
                                <label for="checkbox1">Zakupy</label>
                            </spring:bind>
                        </div>
                        <div class="col-md-4">
                            <spring:bind path="otherActivities">
                                <form:checkbox path="otherActivities" id="checkbox3" value="clean"/>
                                <form:errors path="otherActivities" cssClass="error"/>
                                <label for="checkbox3">Sprzątanie</label>
                            </spring:bind>
                        </div>
                        <div class="col-md-4">
                            <spring:bind path="otherActivities">
                                <form:checkbox path="otherActivities" id="checkbox4" value="vacum"/>
                                <form:errors path="otherActivities" cssClass="error"/>
                                <label for="checkbox4">Pranie</label>
                            </spring:bind>
                        </div>
                        <div class="col-md-4">
                            <spring:bind path="otherActivities">
                                <form:checkbox path="otherActivities" id="checkbox2" value="cook"/>
                                <form:errors path="otherActivities" cssClass="error"/>
                                <label for="checkbox2">Gotowanie</label>
                            </spring:bind>
                        </div>
                    </div>
                    <hr/>

                    <div class="form-group" style="margin-top: 20px;">
                        <spring:bind path="otherSkills">
                            <label for="otherSkills" class="text-left col-md-3 control-label " style="text-align: left">Inne
                                umiejętności</label>
                            <div class="col-md-8">
                                <form:input path="otherSkills" class="form-control"
                                            style="margin-left: 20px; border-radius: 3px;" placeholder=""/>
                                <form:errors path="otherSkills" cssClass="error"/>
                            </div>
                        </spring:bind>
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
                    <div class="form-group">
                        <div class="col-lg-offset-10 col-lg-1">
                            <a href="#signupbox2" onclick="slideThird();"><img src="/resources/images/bottom-arrow.png"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="signupbox2" style="margin-top:300px" class="col-lg-8 col-lg-offset-2">
            <div class="panel panel-danger" style="border-color: #fcb2ab;">
                <div class="panel-heading">
                    <div class="panel-title"><p>Szczegóły profilu</p></div>
                </div>
                <div class="panel-body">
                    <div class="form-group" style="border-bottom: 12px; ">
                        <div class="col-md-12 ">
                            <h4 style="text-align: left;">Praca</h4>
                        </div>
                    </div>
                    <hr/>

                    <div class="form-group">
                        <label class="col-md-3 control-label" style="text-align: left">Posiadam doświadczenie w opiece
                            nad</label>
                        <div class="col-md-4">
                            <div class="col-md-4" style="padding-left: 10px;">
                                <spring:bind path="careExperience">
                                    <form:checkbox path="careExperience" id="checkbox5" value="kids"/>
                                    <form:errors path="careExperience" cssClass="error"/>
                                    <label for="checkbox5">Dziećmi</label>
                                </spring:bind>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <spring:bind path="careExperience">
                                <form:checkbox path="careExperience" id="checkbox6" value="old"/>
                                <form:errors path="careExperience" cssClass="error"/>
                                <label for="checkbox6">Osobami starszymi</label>
                            </spring:bind>
                        </div>
                    </div>
                    <hr/>

                    <div class="form-group" style="margin-top: 20px;">
                        <label class="col-md-3 control-label" style="text-align: left">Wymiar pracy w jakim możesz
                            pracować</label>
                        <div class="col-md-8 ">
                            <spring:bind path="timeJobTime">
                                <div class="col-md-5 ">
                                    <div class="radio">
                                        <label style="font-size: 1.2em">
                                            <form:radiobutton path="timeJobTime" value="half"/>Pełny etaty
                                            <span class="cr"><i class="cr-icon fa fa-circle glyphicon glyphicon-ok"></i></span>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md-5 ">
                                    <div class="radio">
                                        <label style="font-size: 1.2em">
                                            <form:radiobutton path="timeJobTime" value="full"/>Pół etatu
                                            <span class="cr"><i class="cr-icon fa fa-circle glyphicon glyphicon-ok"></i></span>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md-5 ">
                                    <div class="radio">
                                        <label style="font-size: 1.2em">
                                            <form:radiobutton path="timeJobTime" value="casual"/>Dorywczo
                                            <span class="cr"><i class="cr-icon fa fa-circle glyphicon glyphicon-ok"></i></span>
                                        </label>
                                    </div>
                                </div>
                                <form:errors path="timeJobTime" cssClass="error"/>
                            </spring:bind>
                        </div>
                    </div>
                    <hr/>

                    <div class="form-group" style="margin-top: 20px;">
                        <label for="nanny-experience" class="text-left col-md-3 control-label "
                               style="text-align: left">Doświadczenie przy pracy z dziećmi</label>
                        <div class="col-md-5" style="padding-top: 5px;">
                            <spring:bind path="experienceKidsTime">
                                <path:select path="experienceKidsTime" id="nanny-experience"
                                             style=" margin-left: 20px;  margin-top: 5px; border-radius: 3px; font-size: 18px;">
                                    <option value="brak">brak</option>
                                    <option value="pół roku">pół roku</option>
                                    <option value="rok">rok</option>
                                    <option value="dwa lata">dwa lata</option>
                                    <option value="więcej niż 2 lata">więcej niż 2 lata</option>
                                </path:select>
                                <form:errors path="experienceKidsTime" cssClass="error"/>
                            </spring:bind>
                        </div>
                    </div>
                    <hr/>

                    <div class="form-group" style="margin-top: 20px;">
                        <label for="nanny-experience" class="text-left col-md-3 control-label "
                               style="text-align: left">Doświadczenie przy pracy ze starszymi</label>
                        <div class="col-md-5" style="padding-top: 5px;">
                            <spring:bind path="experienceOldTime">
                                <form:select path="experienceOldTime" id="nanny-experience"
                                             style=" margin-left: 20px;  margin-top: 5px; border-radius: 3px; font-size: 18px;">
                                    <option value="brak">brak</option>
                                    <option value="pół roku">pół roku</option>
                                    <option value="rok">rok</option>
                                    <option value="dwa lata">dwa lata</option>
                                    <option value="więcej niż 2 lata">więcej niż 2 lata</option>
                                </form:select>
                                <form:errors path="experienceOldTime" cssClass="error"/>
                            </spring:bind>
                        </div>
                    </div>
                    <hr/>

                    <div class="form-group" style="border-bottom: 12px; ">
                        <div class="col-md-12 ">
                            <h4 style="text-align: left;">Miejsce pracy</h4>
                        </div>
                    </div>
                    <hr/>

                    <div class="form-group" style="margin-top: 20px;">
                        <label class="col-md-3 control-label" style="text-align: left">Miejsce opieki nad
                            dzieckiem</label>
                        <div class="col-md-8 ">
                            <spring:bind path="placeOfTakeCare">
                                <div class="col-md-5 ">
                                    <div class="radio">
                                        <label style="font-size: 1.2em">
                                            <form:radiobutton path="placeOfTakeCare" value="Dowolne"/>Dowolne
                                            <span class="cr"><i class="cr-icon fa fa-circle glyphicon glyphicon-ok"></i></span>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md-5 ">
                                    <div class="radio">
                                        <label style="font-size: 1.2em">
                                            <form:radiobutton path="placeOfTakeCare" value="U rodziców"/>U rodziców
                                            <span class="cr"><i class="cr-icon fa fa-circle glyphicon glyphicon-ok"></i></span>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md-5 ">
                                    <div class="radio">
                                        <label style="font-size: 1.2em">
                                            <form:radiobutton path="placeOfTakeCare" value="U niani"/>U niani
                                            <span class="cr"><i class="cr-icon fa fa-circle glyphicon glyphicon-ok"></i></span>
                                        </label>
                                    </div>
                                </div>
                                <form:errors path="placeOfTakeCare" cssClass="error"/>
                            </spring:bind>
                        </div>
                    </div>
                    <hr/>

                    <div class="form-group" style="margin-top: 20px;">
                        <label class="col-md-3 control-label" style="text-align: left">Praca z
                            mieszkaniem</label>
                        <div class="col-md-8 ">
                            <spring:bind path="workWithHome">
                                <div class="col-md-5 ">
                                    <div class="radio">
                                        <label style="font-size: 1.2em">
                                            <form:radiobutton path="workWithHome" value="Tak"/>Tak
                                            <span class="cr"><i class="cr-icon fa fa-circle glyphicon glyphicon-ok"></i></span>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md-5 ">
                                    <div class="radio">
                                        <label style="font-size: 1.2em">
                                            <form:radiobutton path="workWithHome" value="Nie"/>Nie
                                            <span class="cr"><i class="cr-icon fa fa-circle glyphicon glyphicon-ok"></i></span>
                                        </label>
                                    </div>
                                </div>
                                <form:errors path="workWithHome" cssClass="error"/>
                            </spring:bind>
                        </div>
                    </div>
                    <hr/>

                    <div class="form-group" style="border-bottom: 12px; ">
                        <div class="col-md-12 ">
                            <h4 style="text-align: left;">Wynagrodzenie</h4>
                        </div>
                    </div>

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
                            <p style="font-size: 17px;">zł/h</p>
                        </div>
                    </div>
                    <hr/>

                    <div class="form-group" style="border-bottom: 12px; ">
                        <div class="col-md-12 ">
                            <h4 style="text-align: left;">Informacje o wykształceniu</h4>
                        </div>
                    </div>

                    <div class="form-group" style="margin-top: 20px;">
                        <label for="nanny-experience" class="text-left col-md-3 control-label "
                               style="text-align: left">Wykształcenie</label>
                        <div class="col-md-5" style="padding-top: 5px;">
                            <spring:bind path="education">
                                <form:select path="education" id="nanny-experience"
                                             style=" margin-left: 20px;  margin-top: 5px; border-radius: 3px; font-size: 18px;">
                                    <option value="brak">brak</option>
                                    <option value="podstawowe">podstawowe</option>
                                    <option value="zawodowe">zawodowe</option>
                                    <option value="średnie">średnie</option>
                                    <option value="wyższe">wyższe</option>
                                </form:select>
                                <form:errors path="education" cssClass="error"/>
                            </spring:bind>
                        </div>
                    </div>
                    <hr/>

                    <div class="form-group" style="margin-top: 20px;">
                        <label class="col-md-3 control-label" style="text-align: left">Języki obce jakie
                            znasz</label>
                        <div class="col-md-8" style="padding-left: 35px; padding-top: 5px;">
                            <spring:bind path="foreignLanguages">
                                <form:input path="foreignLanguages" class="form-control" placeholder="Języki obce"/>
                                <form:errors path="foreignLanguages" cssClass="error"/>
                            </spring:bind>
                        </div>
                    </div>
                    <hr/>

                    <div class="form-group">
                        <div class="col-lg-6" style="padding-left: 50px;">
                            <a href="#signupbox1" onclick="slideSecond();"><img
                                    src="/resources/images/top-arrow.png"></a>
                        </div>
                        <div class="col-lg-offset-3 col-lg-2">
                            <div style="margin-top: 5px" class="form-group">
                                <input type="submit" value="Zarejestruj" class="btn btn-danger"
                                       style="font-size: 18px; width: 130px;">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form:form>
</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/resources/js/jquery.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/scrollReveal.js"></script>
<script src="/resources/js/custom.js"></script>
<script src="/resources/js/script.js"></script>

</body>
</html>
    
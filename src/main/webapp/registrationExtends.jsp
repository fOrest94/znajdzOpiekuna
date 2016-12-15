<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="pl_PL">
    <head>
        
       <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">

        <title>znajdźOpiekuna</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    </head>
		
<body>

<div class="container" style=" margin-top: 300px;">  
	<form:form method="POST" modelAttribute="nannyForm" id="registerParent" class="form-horizontal">
		<div id="signupbox1" style="margin-top:50px" class="col-lg-8 col-lg-offset-2" >
			<div class="panel panel-danger" style="border-color: #fcb2ab;">
				<div class="panel-heading">
					<div class="panel-title">Twój profil</div>

				</div>
				<div class="panel-body" >
					<form method="POST" modelAttribute="registerParent" id="registerParent" class="form-horizontal">

						<div id="signupalert" style="display:none" class="alert alert-danger">
							<p>Error:</p>
							<span></span>
						</div>

						<div class="form-group"  style="border-bottom: 12px; ">
							<label for="typeOfWork" class="col-md-3 control-label"  style="text-align: left">Kim chcesz się opiekować</label>
							<div class="col-md-4">
								<div class="checkbox">
									<label style="font-size: 1.2em">
										<input type="checkbox" value="">
										<span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
										Dzieci
									</label>
								</div>
							</div>
							<div class="col-md-4">
								<div class="checkbox">
									<label style="font-size: 1.2em">
										<input type="checkbox" value="">
										<span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
										Osoby starsze
									</label>
								</div>
							</div>
						</div>
						<hr />
						<div class="form-group">
							<label for="typeOfWork" class="col-md-3 control-label"  style="text-align: left">Jakie inne zajęcia jesteś w stanie wykonywać</label>
							<div class="col-md-4">
								<div class="checkbox">
									<label style="font-size: 1.2em">
										<input type="checkbox" value="">
										<span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
										Zakupy
									</label>
								</div>
							</div>
							<div class="col-md-4">
								<div class="checkbox">
									<label style="font-size: 1.2em">
										<input type="checkbox" value="">
										<span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
										Sprzątanie
									</label>
								</div>
							</div>
							<div class="col-md-4">
								<div class="checkbox">
									<label style="font-size: 1.2em">
										<input type="checkbox" value="">
										<span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
										Pranie
									</label>
								</div>
							</div>
							<div class="col-md-4">
								<div class="checkbox">
									<label style="font-size: 1.2em">
										<input type="checkbox" value="">
										<span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
										Gotowanie
									</label>
								</div>
							</div>
						</div>
						<hr/>

						<div class="form-group" style="margin-top: 20px;">
							<label for="otherAbilities" class="text-left col-md-3 control-label " style="text-align: left">Inne umiejętności</label>
							<div class="col-md-8">
								<input path="otherAbilities" class="form-control" style="margin-left: 20px; border-radius: 3px;" placeholder=""/>
							</div>
						</div>
						<hr/>

						<div class="form-group" style="margin-top: 20px;">
							<label for="icode" class="col-md-3 control-label"  style="text-align: left">Napisz coś o sobie</label>
							<div class="col-md-8 ">
                                    <textarea rows="8" cols="62" form="registerParent" name="sthAboutYou" style="margin-left: 20px; border-radius: 3px;">
                                        At w3schools.com you will learn how to make a website. We offer free tutorials in all web development technologies.
                                    </textarea>
							</div>

						</div>
						<hr/>
						<div class="form-group">
							<div class="col-lg-6" style="padding-left: 50px;">
								<a href="#1" onclick="slideFirst();"><img src="images/left-arrow.png"></a>
							</div>
							<div class="col-lg-offset-4 col-lg-1">
								<a href="#2" onclick="slideThird();"><img src="images/right-arrow.png"></a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

		<div id="signupbox2" style="margin-top:50px" class="col-lg-8 col-lg-offset-2" >
			<div class="panel panel-danger" style="border-color: #fcb2ab;">
				<div class="panel-heading">
					<div class="panel-title">Szczegóły profilu</div>

				</div>
				<div class="panel-body" >
					<form method="POST" modelAttribute="registerParent" id="registerParent" class="form-horizontal">

						<div id="signupalert" style="display:none" class="alert alert-danger">
							<p>Error:</p>
							<span></span>
						</div>
						<div class="form-group"  style="border-bottom: 12px; ">
							<div class="col-md-12 ">
								<h4 style="text-align: left;">Praca</h4>
							</div>
						</div>
						<hr />

						<div class="form-group">
							<label for="typeOfWork" class="col-md-3 control-label"  style="text-align: left">Posiadam doświadczenie w opiece nad</label>
							<div class="col-md-4">
								<div class="checkbox">
									<label style="font-size: 1.2em">
										<input type="checkbox" value="">
										<span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
										Dziećmi
									</label>
								</div>
							</div>
							<div class="col-md-4">
								<div class="checkbox">
									<label style="font-size: 1.2em">
										<input type="checkbox" value="">
										<span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
										Starszymi
									</label>
								</div>
							</div>
						</div>
						<hr/>

						<div class="form-group"  style="border-bottom: 12px; ">
							<label for="typeOfWork" class="col-md-3 control-label"  style="text-align: left">Wymiar pracy w jakim możesz pracować</label>
							<div class="col-md-4">
								<div class="checkbox">
									<label style="font-size: 1.2em">
										<input type="checkbox" value="">
										<span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
										Pół etatu
									</label>
								</div>
							</div>
							<div class="col-md-4">
								<div class="checkbox">
									<label style="font-size: 1.2em">
										<input type="checkbox" value="">
										<span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
										Pełny etat
									</label>
								</div>
							</div>
							<div class="col-md-4">
								<div class="checkbox">
									<label style="font-size: 1.2em">
										<input type="checkbox" value="">
										<span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
										Dorywczo
									</label>
								</div>
							</div>
						</div>
						<hr />

						<div class="form-group" style="margin-top: 20px;">
							<label for="nanny-experience" class="text-left col-md-3 control-label " style="text-align: left">Doświadczenie przy pracy z dziećmi</label>
							<div class="col-md-5" style="padding-top: 5px;">
								<select name="nanny-experience" id="nanny-experience" style=" margin-left: 20px;  margin-top: 5px; border-radius: 3px; font-size: 18px;" form="registerParent">
									<option value="">brak</option>
									<option value="">---</option>
									<option value="01">pół roku</option>
									<option value="02">rok</option>
									<option value="03">dwa lata</option>
									<option value="04">więcej niż 2 lata</option>
								</select>
							</div>
						</div>
						<hr/>

						<div class="form-group" style="margin-top: 20px;">
							<label for="nanny-experience" class="text-left col-md-3 control-label " style="text-align: left">Doświadczenie przy pracy ze starszymi</label>
							<div class="col-md-5" style="padding-top: 5px;">
								<select name="nanny-experience" id="nanny-experience" style=" margin-left: 20px;  margin-top: 5px; border-radius: 3px; font-size: 18px;" form="registerParent">
									<option value="">brak</option>
									<option value="">---</option>
									<option value="01">pół roku</option>
									<option value="02">rok</option>
									<option value="03">dwa lata</option>
									<option value="04">więcej niż 2 lata</option>
								</select>
							</div>
						</div>
						<hr/>

						<div class="form-group"  style="border-bottom: 12px; ">
							<div class="col-md-12 ">
								<h4 style="text-align: left;">Miejsce pracy</h4>
							</div>
						</div>
						<hr />

						<div class="form-group" style="margin-top: 20px;">
							<label for="icode" class="col-md-3 control-label"  style="text-align: left">Miejsce opieki nad dzieckiem</label>
							<div class="col-md-8 ">
								<div class="col-md-5 ">
									<div class="radio">
										<label style="font-size: 1.2em">
											<input type="radio" name="o5" value="both">Dowolne
											<span class="cr"><i class="cr-icon fa fa-circle glyphicon glyphicon-ok"></i></span>
										</label>
									</div>
								</div>
								<div class="col-md-5 ">
									<div class="radio">
										<label style="font-size: 1.2em">
											<input type="radio" name="o5" value="first">U rodziców
											<span class="cr"><i class="cr-icon fa fa-circle glyphicon glyphicon-ok"></i></span>
										</label>
									</div>
								</div>
								<div class="col-md-5 ">
									<div class="radio">
										<label style="font-size: 1.2em">
											<input type="radio" name="o5" value="second">U niani
											<span class="cr"><i class="cr-icon fa fa-circle glyphicon glyphicon-ok"></i></span>
										</label>
									</div>
								</div>
							</div>
						</div>
						<hr/>

						<div class="form-group" style="margin-top: 20px;">
							<label for="icode" class="col-md-3 control-label"  style="text-align: left">Praca z mieszkaniem</label>
							<div class="col-md-8 ">
								<div class="col-md-5 ">
									<div class="radio">
										<label style="font-size: 1.2em">
											<input type="radio" name="o5" value="both">Tak
											<span class="cr"><i class="cr-icon fa fa-circle glyphicon glyphicon-ok"></i></span>
										</label>
									</div>
								</div>
								<div class="col-md-5 ">
									<div class="radio">
										<label style="font-size: 1.2em">
											<input type="radio" name="o5" value="first">Nie
											<span class="cr"><i class="cr-icon fa fa-circle glyphicon glyphicon-ok"></i></span>
										</label>
									</div>
								</div>
							</div>
						</div>
						<hr/>

						<div class="form-group"  style="border-bottom: 12px; ">
							<div class="col-md-12 ">
								<h4 style="text-align: left;">Wynagrodzenie</h4>
							</div>
						</div>

						<div class="form-group" style="margin-top: 20px; ">
							<label for="icode" class="col-md-3 control-label"  style="text-align: left">Cena za godzinę opieki</label>
							<div class="col-md-2 " style="padding-left: 35px;">
								<input path="passwordConfirm" class="form-control" placeholder="zł/h"  style="margin-top: 5px; "/>
							</div>
							<div class="col-md-7 "  style="margin-top: 10px; padding-right: 20px;">
								<p style="font-size: 17px;">zł/h</p>
							</div>
						</div>
						<hr/>

						<div class="form-group"  style="border-bottom: 12px; ">
							<div class="col-md-12 ">
								<h4 style="text-align: left;">Informacje o wykształceniu</h4>
							</div>
						</div>

						<div class="form-group" style="margin-top: 20px;">
							<label for="nanny-experience" class="text-left col-md-3 control-label " style="text-align: left">Wykształcenie</label>
							<div class="col-md-5" style="padding-top: 5px;">
								<select name="nanny-experience" id="nanny-experience" style=" margin-left: 20px;  margin-top: 5px; border-radius: 3px; font-size: 18px;" form="registerParent">
									<option value="">brak</option>
									<option value="">---</option>
									<option value="01">podstawowe</option>
									<option value="02">zawodowe</option>
									<option value="03">średnie</option>
									<option value="04">wyższe</option>
								</select>
							</div>
						</div>
						<hr/>

						<div class="form-group" style="margin-top: 20px;">
							<label for="icode" class="col-md-3 control-label"  style="text-align: left">Języki obce jakie znasz</label>
							<div class="col-md-8" style="padding-left: 35px; padding-top: 5px;">
								<input path="foreignLanguages" class="form-control" placeholder="Języki obce"/>
							</div>
						</div>
						<hr/>

						<div class="form-group">
							<div class="col-lg-6" style="padding-left: 50px;">
								<a href="#2" onclick="slideSecond();"><img src="images/left-arrow.png"></a>
							</div>
							<div class="col-lg-offset-3 col-lg-2">
								<div style="margin-top: 5px" class="form-group">
									<input type="submit" name="submit" value="Zarejestruj" class="btn btn-danger" style="font-size: 18px; width: 130px;">
								</div>
							</div>

						</div>
					</form>
				</div>
			</div>
		</div>
	</form:form>
    </div>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/scrollReveal.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
    
    </body>
</html>
    
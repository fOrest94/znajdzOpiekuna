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
	<form:form method="POST" modelAttribute="guardianForm" id="registerParent" class="form-horizontal">
         <div id="signupbox" style="margin-top:50px" class="col-md-8 col-md-offset-2">
                    <div class="panel panel-danger" style="border-color: #fcb2ab;">
                        <div class="panel-heading">
                            <div class="panel-title">Sign Up</div>   
                        </div>  
                        <div class="panel-body" >           
                                <div id="signupalert" style="display:none" class="alert alert-danger">
                                    <p>Error:</p>
                                    <span></span>
                                </div>
                                
								<div class="form-group">
	                                <label for="firstName" class="col-md-3 control-label"  style="text-align: left">Dane</label>
	                                <div class="col-md-4">
	                                    <form:input path="firstName" class="form-control" placeholder="Imię"/>
	                                </div>
	                                <div class="col-md-4">
	                                    <form:input path="lastName" class="form-control" placeholder="Nazwisko"/>
	                                </div>
	                            </div>
                                
                                <div class="form-group">
                                    <label for="username" class="text-left col-md-3 control-label " style="text-align: left">Email</label>
                                    <div class="col-md-4">
                                        <form:input path="username" class="form-control" placeholder="Adress Email"/>
                                    </div>
                                </div>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <div class="form-group">
                                    <label for="password" class="col-md-3 control-label"  style="text-align: left">Hasło</label>
                                    <div class="col-md-4">
                                        <form:input path="password" class="form-control" placeholder="Hasło"/>

                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="password" class="col-md-3 control-label"  style="text-align: left">Powtórz hasło</label>
                                    <div class="col-md-4">
                                        <form:input path="passwordConfirm" class="form-control" placeholder="Hasło"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="icode" class="col-md-3 control-label"  style="text-align: left">Lokalizacja</label>
                                    <div class="col-md-4">

                                        <button></button>
                                    </div>
                                    <div class="col-md-4">
                                         <ul></ul>
                                    </div>       
                                </div>

                                <div class="form-group">
                                    <label for="icode" class="col-md-3 control-label"  style="text-align: left">Data urodzenia</label>
                                    <div class="col-md-5" style="padding-top: 5px;"> 
									    <select name="dob-day" id="dob-day" style="border-radius: 3px; font-size: 18px;" form="registerParent">
									      <option value="">Dzień</option>
									      <option value="">---</option>
									      <option value="01">01</option>
									      <option value="02">02</option>
									      <option value="03">03</option>
									      <option value="04">04</option>
									      <option value="05">05</option>
									      <option value="06">06</option>
									      <option value="07">07</option>
									      <option value="08">08</option>
									      <option value="09">09</option>
									      <option value="10">10</option>
									      <option value="11">11</option>
									      <option value="12">12</option>
									      <option value="13">13</option>
									      <option value="14">14</option>
									      <option value="15">15</option>
									      <option value="16">16</option>
									      <option value="17">17</option>
									      <option value="18">18</option>
									      <option value="19">19</option>
									      <option value="20">20</option>
									      <option value="21">21</option>
									      <option value="22">22</option>
									      <option value="23">23</option>
									      <option value="24">24</option>
									      <option value="25">25</option>
									      <option value="26">26</option>
									      <option value="27">27</option>
									      <option value="28">28</option>
									      <option value="29">29</option>
									      <option value="30">30</option>
									      <option value="31">31</option>
									    </select>
									    <select name="dob-month" id="dob-month" style="border-radius: 3px; font-size: 18px;" form="registerParent">
									      <option value="">Miesiąc</option>
									      <option value="">-----</option>
									      <option value="01">Styczeń</option>
									      <option value="02">Luty</option>
									      <option value="03">Marzec</option>
									      <option value="04">Kwiecień</option>
									      <option value="05">Maj</option>
									      <option value="06">Czerwiec</option>
									      <option value="07">Lipiec</option>
									      <option value="08">Sierpień</option>
									      <option value="09">Wrzesień</option>
									      <option value="10">Październik</option>
									      <option value="11">Listopad</option>
									      <option value="12">Grudzień</option>
									    </select>
									    <select name="dob-year" id="dob-year" style="border-radius: 3px; font-size: 18px;" form="registerParent">
									      <option value="">Rok</option>
									      <option value="">----</option>
									      <option value="2012">2012</option>
									      <option value="2011">2011</option>
									      <option value="2010">2010</option>
									      <option value="2009">2009</option>
									      <option value="2008">2008</option>
									      <option value="2007">2007</option>
									      <option value="2006">2006</option>
									      <option value="2005">2005</option>
									      <option value="2004">2004</option>
									      <option value="2003">2003</option>
									      <option value="2002">2002</option>
									      <option value="2001">2001</option>
									      <option value="2000">2000</option>
									      <option value="1999">1999</option>
									      <option value="1998">1998</option>
									      <option value="1997">1997</option>
									      <option value="1996">1996</option>
									      <option value="1995">1995</option>
									      <option value="1994">1994</option>
									      <option value="1993">1993</option>
									      <option value="1992">1992</option>
									      <option value="1991">1991</option>
									      <option value="1990">1990</option>
									      <option value="1989">1989</option>
									      <option value="1988">1988</option>
									      <option value="1987">1987</option>
									      <option value="1986">1986</option>
									      <option value="1985">1985</option>
									      <option value="1984">1984</option>
									      <option value="1983">1983</option>
									      <option value="1982">1982</option>
									      <option value="1981">1981</option>
									      <option value="1980">1980</option>
									      <option value="1979">1979</option>
									      <option value="1978">1978</option>
									      <option value="1977">1977</option>
									      <option value="1976">1976</option>
									      <option value="1975">1975</option>
									      <option value="1974">1974</option>
									      <option value="1973">1973</option>
									      <option value="1972">1972</option>
									      <option value="1971">1971</option>
									      <option value="1970">1970</option>
									      <option value="1969">1969</option>
									      <option value="1968">1968</option>
									      <option value="1967">1967</option>
									      <option value="1966">1966</option>
									      <option value="1965">1965</option>
									      <option value="1964">1964</option>
									      <option value="1963">1963</option>
									      <option value="1962">1962</option>
									      <option value="1961">1961</option>
									      <option value="1960">1960</option>
									      <option value="1959">1959</option>
									      <option value="1958">1958</option>
									      <option value="1957">1957</option>
									      <option value="1956">1956</option>
									      <option value="1955">1955</option>
									      <option value="1954">1954</option>
									      <option value="1953">1953</option>
									      <option value="1952">1952</option>
									      <option value="1951">1951</option>
									      <option value="1950">1950</option>
									      <option value="1949">1949</option>
									      <option value="1948">1948</option>
									      <option value="1947">1947</option>
									      <option value="1946">1946</option>
									      <option value="1945">1945</option>
									      <option value="1944">1944</option>
									      <option value="1943">1943</option>
									      <option value="1942">1942</option>
									      <option value="1941">1941</option>
									      <option value="1940">1940</option>
									      <option value="1939">1939</option>
									      <option value="1938">1938</option>
									      <option value="1937">1937</option>
									      <option value="1936">1936</option>
									      <option value="1935">1935</option>
									      <option value="1934">1934</option>
									      <option value="1933">1933</option>
									      <option value="1932">1932</option>
									      <option value="1931">1931</option>
									    </select>
                                    </div>     
                                </div>

								 <hr/>
                                <div class="form-group">                                    
                                    <div class="col-lg-offset-10 col-lg-12">
                                    	<a href="#" onclick="slideSecond();"><img src="${pageContext.request.contextPath}/resources/images/right-arrow.png"></a>
                                    </div>
                                </div>
                         </div>
                    </div>    
         </div>

           <div id="signupbox1" style="margin-top:50px" class="col-lg-8 col-lg-offset-2" >
                    <div class="panel panel-danger" style="border-color: #fcb2ab;">
                        <div class="panel-heading">
                            <div class="panel-title">Twój profil</div>
                            
                        </div>  
                        <div class="panel-body" >
                                
                                <div id="signupalert" style="display:none" class="alert alert-danger">
                                    <p>Error:</p>
                                    <span></span>
                                </div>
                                
								<div class="form-group"  style="border-bottom: 12px; ">
	                                <label for="typeOfWork" class="col-md-3 control-label"  style="text-align: left">Kim chcesz się opiekować</label>
	                                <div class="col-md-4">
                                          <div class="checkbox">
                                          <label style="font-size: 1.2em">
                                            <form:checkbox path="whoWannCareNanny" value=""/>
                                            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
                                           Dzieci
                                          </label>
                                        </div>
	                                </div>
	                                <div class="col-md-4">
                                        <div class="checkbox">
                                          <label style="font-size: 1.2em">
                                            <form:checkbox path="whoWannCareNanny" value=""/>
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
                                            <form:checkbox path="otherActShop" value=""/>
                                            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
                                           Zakupy
                                          </label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="checkbox">
                                          <label style="font-size: 1.2em">
                                            <form:checkbox path="otherActClean" value="false"/>
                                            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
                                           Sprzątanie
                                          </label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                          <div class="checkbox">
                                          <label style="font-size: 1.2em">
                                            <form:checkbox path="otherActVac" value=""/>
                                            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
                                           Pranie
                                          </label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="checkbox">
                                          <label style="font-size: 1.2em">
                                            <form:checkbox path="otherActCook" value=""/>
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
                                        <form:input path="otherSkills" class="form-control" style="margin-left: 20px; border-radius: 3px;" placeholder=""/>
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
                                        <a href="#" onclick="slideFirst();"><img src="${pageContext.request.contextPath}/resources/images/left-arrow.png"></a>
                                    </div>                                   
                                    <div class="col-lg-offset-4 col-lg-1">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/images/right-arrow.png"></a>
                                    </div>
                                </div>
                         </div>
                    </div>    
         </div> 

         <div id="signupbox2" style="margin-top:50px" class="col-lg-8 col-lg-offset-2" >
                    <div class="panel panel-danger" style="border-color: #fcb2ab;">
                        <div class="panel-heading">
                            <div class="panel-title">Szczegóły profilu</div>
                            
                        </div>  
                        <div class="panel-body" >
                                
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
                                            <form:checkbox path="careExpKids" value=""/>
                                            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
                                           Dziećmi
                                          </label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="checkbox">
                                          <label style="font-size: 1.2em">
                                            <form:checkbox path="careExpOld" value=""/>
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
                                            <form:checkbox path="timeJobHalf" value=""/>
                                            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
                                           Pół etatu
                                          </label>
                                        </div>
	                                </div>
	                                <div class="col-md-4">
                                        <div class="checkbox">
                                          <label style="font-size: 1.2em">
                                            <form:checkbox path="timeJobFull" value=""/>
                                            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
                                           Pełny etat
                                          </label>
                                        </div>
	                                </div>
	                                <div class="col-md-4">
                                        <div class="checkbox">
                                          <label style="font-size: 1.2em">
                                            <form:checkbox path="timeJobCasual" value=""/>
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
									                <form:radiobutton path="placeOfTakeCare" value="1"/>Dowolne
									                <span class="cr"><i class="cr-icon fa fa-circle glyphicon glyphicon-ok"></i></span>
									            </label>
									        </div>
									    </div>
										<div class="col-md-5 ">
			                                <div class="radio">
										        <label style="font-size: 1.2em">
										            <form:radiobutton path="placeOfTakeCare" value="2"/>U rodziców
										            <span class="cr"><i class="cr-icon fa fa-circle glyphicon glyphicon-ok"></i></span>
										        </label>
										    </div>
										</div>
		                                <div class="col-md-5 ">
			                                <div class="radio">
										        <label style="font-size: 1.2em">
										        	<form:radiobutton path="placeOfTakeCare" value="3"/>U niani
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
									                <form:radiobutton path="workWithHome" value="1"/>Tak
									                <span class="cr"><i class="cr-icon fa fa-circle glyphicon glyphicon-ok"></i></span>
									            </label>
									        </div>
									    </div>
										<div class="col-md-5 ">
			                                <div class="radio">
										        <label style="font-size: 1.2em">
										            <form:radiobutton path="workWithHome" value="1"/>Nie
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
	                                    <form:input path="moneyPerHour" class="form-control" placeholder="zł/h"  style="margin-top: 5px; "/>
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
                                        <form:input path="foreignLanguages" class="form-control" placeholder="Języki obce"/>
                                    </div>
                                </div> 
                                <hr/>

                               <div class="form-group"> 
                                    <div class="col-lg-6" style="padding-left: 50px;">
                                        <a href=""><img src="${pageContext.request.contextPath}/resources/images/left-arrow.png"></a>
                                    </div>                                   
                                    <div class="col-lg-offset-3 col-lg-2">
                                        <div style="margin-top: 5px" class="form-group">
											<input type="submit" name="submit" value="Zarejestruj" class="btn btn-danger" style="font-size: 18px; width: 130px;">
										</div>
                                    </div>
                                </div>
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
    
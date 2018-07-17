<%-- 
    Document   : MyService
    Created on : Jul 11, 2018, 8:29:47 AM
    Author     : Tu Khac Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Service Manager</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <jsp:useBean id="serviceBean" class="bean.ViewServiceBean" scope="page"/>
        <jsp:setProperty name="serviceBean" property="selectType" param="type"/>
        <jsp:setProperty name="serviceBean" property="accountName" value="${sessionScope.account.accountName}"/>

        <jsp:include page="/header.jsp"/>

        <div class="container-fluid row">

            <jsp:include page="/functionBar.jsp"/>

            <div class="col-sm-10">
                <!--Filter-->
                <div class="row">
                    <div class="navbar col-sm-6 navbar-right text-center" style="padding-top: 7px;margin-right: 5px; background-color: #337ab7; color: white">
                        <form class="form-inline">
                            <div class="form-group">
                                <label for="type">Filter: </label>
                                <select class="form-control" id="type" name="type" onchange="document.forms[4].submit()">
                                    <option value="mySer" ${param.type == 'mySer' ? "selected" : ""}>My Service</option>
                                    <option value="allSer" ${param.type == 'allSer' ? "selected" : ""}>Available Service</option>
                                </select>
                            </div>
                            <div class="input-group" class="text-center">
                                <input type="text" class="form-control" placeholder="Enter name" id="filterName" name="filterName">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit">
                                        <i class="glyphicon glyphicon-search"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!--Table-->
                <div class="panel panel-primary row">
                    <!--heading-->
                    <div class="panel-heading">
                        <h3 style="text-align: center">
                            <c:if test="${param.type == 'allSer'}">AVAILABLE SERVICE</c:if>
                            <c:if test="${param.type == 'mySer'}">MY SERVICE</c:if>
                            </h3>
                        </div>
                        <!--body-->
                        <div class="panel-body">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Service Name</th>
                                        <th>Provider Name</th>
                                        <th>Detail</th>
                                        <th style="text-align: center">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="ser" items="${serviceBean.service}">
                                    <tr>
                                        <td>${ser.serviceName}</td>
                                        <td>${ser.providerName}</td>
                                        <td>${ser.detail}</td>
                                        <td style="text-align: center">
                                            <a href="/ServiceforStudentManagement/studentProvider/ServiceDetail.jsp?serviceID=${ser.serviceID}">
                                                <button type="button" class="btn btn-default">View</button>
                                            </a>
                                            <input type="submit" class="btn btn-default" value="Feedback"></input>
                                            <c:if test="${param.type == 'allSer'}">
                                                <input type="submit" class="btn btn-default" value="Order"></input>
                                            </c:if>
                                            <c:if test="${param.type == 'mySer'}">
                                                <input type="submit" class="btn btn-default" value="Rating"></input>
                                                <input type="submit" class="btn btn-default" value="Stop Using"></input>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>

        </div>

    </body>
</html>
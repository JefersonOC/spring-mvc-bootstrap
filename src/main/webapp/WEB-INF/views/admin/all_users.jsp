<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ include file="../shared/header.jsp" %>
<%@ include file="admin_menu.jsp" %>

<div class="container">

    <fieldset>
        <legend>Lista de Usuários</legend>

        <a href="<c:url value='/admin/new_user' />" class="btn btn-primary">Novo Usuário</a>

        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th>Nome</th>
                <th>Sobrenome</th>
                <th>Email</th>
                <th>SSO ID</th>
                <th width="80"></th>
                <th width="80"></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td>${user.firstName}</td>
                    <td>${user.lastName}</td>
                    <td>${user.email}</td>
                    <td>${user.ssoId}</td>
                    <td><a href="<c:url value='#' />"><i class="fa fa-edit">&nbsp;</i></a></td>
                    <td><a href="<c:url value='#' />"><i class="fa fa-remove">&nbsp;</i></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </fieldset>
</div>

<%@ include file="../shared/footer.jsp" %>

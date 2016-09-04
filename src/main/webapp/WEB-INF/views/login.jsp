<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ include file="shared/header.jsp" %>
<%@ include file="public_menu.jsp" %>

<c:url var="loginUrl" value="/login"/>

<!-- Begin page content -->
<div class="container">

    <form action="${loginUrl}" method="POST" class="form-horizontal">

        <fieldset>
            <legend>Entrar no Sistema</legend>

            <c:if test="${param.error != null}">
                <div class="alert alert-danger">
                    <p>Invalid username and password.</p>
                </div>
            </c:if>

            <c:if test="${param.logout != null}">
                <div class="alert alert-success">
                    <p>You have been logged out successfully.</p>
                </div>
            </c:if>

            <div class="form-group">
                <label class="col-lg-2 control-label" for="username">Usuário</label>

                <div class="col-lg-5">
                    <input type="text" class="form-control" id="username" name="ssoId"
                           placeholder="Digite seu nome de usuário"
                           required>
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-2 control-label" for="password">Senha</label>

                <div class="col-lg-5">
                    <input type="password" class="form-control" id="password" name="password"
                           placeholder="Digite sua senha de acesso"
                           required>
                </div>
            </div>

            <input type="hidden" name="${_csrf.parameterName}"
                   value="${_csrf.token}"/>

            <div class="form-group">
                <div class="col-lg-10 col-lg-offset-2">
                    <input type="submit"
                           class="btn btn-primary" value="Entrar">
                    <%--ou <a href="<c:url value='/contact' />">entre em contato</a>--%>
                </div>
            </div>
        </fieldset>
    </form>
</div>

<%@ include file="shared/footer.jsp" %>
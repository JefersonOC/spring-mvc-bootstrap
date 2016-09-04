<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ include file="../shared/header.jsp" %>
<%@ include file="admin_menu.jsp" %>

<c:url var="new_user" value="/admin/new_user"/>

<!-- Begin page content -->
<div class="container">

    <form:form method="POST" action="${new_user}" modelAttribute="user" class="form-horizontal">

        <fieldset>
            <legend>Novo Usuário</legend>

            <div class="form-group">
                <label class="col-lg-2 control-label" for="firstName">Nome</label>

                <div class="col-lg-10">
                    <form:input type="text" path="firstName" id="firstName" class="form-control"/>
                    <div class="has-error">
                        <form:errors path="firstName" class="help-inline"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-2 control-label" for="lastName">Sobrenome</label>

                <div class="col-lg-10">
                    <form:input type="text" path="lastName" id="lastName" class="form-control"/>
                    <div class="has-error">
                        <form:errors path="lastName" class="help-inline"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-2 control-label" for="ssoId">SSO ID</label>

                <div class="col-lg-10">
                    <form:input type="text" path="ssoId" id="ssoId" class="form-control"/>
                    <div class="has-error">
                        <form:errors path="ssoId" class="help-inline"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-2 control-label" for="password">Senha</label>

                <div class="col-lg-10">
                    <form:input type="password" path="password" id="password" class="form-control"/>
                    <div class="has-error">
                        <form:errors path="password" class="help-inline"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-2 control-label" for="email">Email</label>

                <div class="col-lg-10">
                    <form:input type="text" path="email" id="email" class="form-control"/>
                    <div class="has-error">
                        <form:errors path="email" class="help-inline"/>
                    </div>
                </div>
            </div>


            <div class="form-group">
                <label class="col-lg-2 control-label" for="userProfiles">Papéis</label>

                <div class="col-lg-10">
                    <form:select path="userProfiles" items="${roles}" multiple="true" itemValue="id"
                                 itemLabel="type"
                                 class="form-control"/>
                    <div class="has-error">
                        <form:errors path="userProfiles" class="help-inline"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-lg-10 col-lg-offset-2">
                    <input type="submit" value="Registrar" class="btn btn-primary"> ou <a
                        href="<c:url value='/users' />">Cancelar</a>
                </div>
            </div>

        </fieldset>
    </form:form>
</div>

<%@ include file="../shared/footer.jsp" %>
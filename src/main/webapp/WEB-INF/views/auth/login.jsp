<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<t:pagetemplate>
    <form action="./login" method="post">
        <section class="hero">
            <div class="hero-body">
                <div class="container has-text-centered">
                    <div class="column is-6 is-offset-3">
                        <c:if test="${!authenticationFailed}">
                            <p class="subtitle has-text-grey">Please login to access the forum</p>
                        </c:if>
                        <c:if test="${authenticationFailed}">
                            <p class="subtitle has-text-danger">Authentication failed for user ${prefillUsername}, please retry</p>
                        </c:if>
                        <div class="box">
                            <div class="field">
                                <div class="control has-icons-left">
                                    <input name="username" class="input is-large" type="text"
                                           placeholder="Username" autofocus="" value="${prefillUsername}">
                                    <span class="icon is-large is-left">
                                        <i class="fas fa-user"></i>
                                    </span>
                                </div>
                            </div>
                            <div class="field">
                                <div class="control has-icons-left">
                                    <input name="password" class="input is-large" type="password"
                                           placeholder="Password" id="pwdInputField">
                                    <a class="icon is-large is-left">
                                        <i class="fas fa-lock" ></i>
                                    </a>
                                </div>
                            </div>
                            <div class="field">
                                <label class="checkbox">
                                    <input type="checkbox" id="pwdToggle">
                                    Show password
                                </label>
                            </div>
                            <button class="button is-block is-primary is-large is-fullwidth">Login</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>
    <script type="text/javascript" src="/js/login.js"></script>
</t:pagetemplate>

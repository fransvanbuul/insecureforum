<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<t:pagetemplate>
    <form action="./login" method="post">
        <section class="hero">
            <div class="hero-body">
                <div class="container has-text-centered">
                    <div class="column is-6 is-offset-3">
                        <p class="subtitle has-text-grey">Please login to access the forum</p>
                        <div class="box">
                            <div class="field">
                                <div class="control has-icons-left">
                                    <input name="username" class="input is-large" type="text" placeholder="Username" autofocus="">
                                    <span class="icon is-large is-left">
                                        <i class="fas fa-user"></i>
                                    </span>
                                </div>
                            </div>
                            <div class="field">
                                <div class="control has-icons-left">
                                    <input name="password" class="input is-large" type="password" placeholder="Password">
                                    <span class="icon is-large is-left">
                                        <i class="fas fa-eye"></i>
                                    </span>
                                </div>
                            </div>
                            <button class="button is-block is-primary is-large is-fullwidth">Login</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>
</t:pagetemplate>

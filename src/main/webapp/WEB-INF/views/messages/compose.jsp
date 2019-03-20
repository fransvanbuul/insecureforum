<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<t:pagetemplate>
    <form action="./compose" method="post">
        <section class="section">
            <div class="container">
                <div class="columns">
                        <div class="column is-3">
                            <p class="field">
                                <button class="button is-medium is-primary is-fullwidth" type="submit">
                                    <span class="icon is-small"><i class="fas fa-envelope"></i></span>
                                    <span>Submit</span>
                                </button>
                            </p>
                            <p class="field">
                                <a class="button is-medium is-warning is-fullwidth" href="./list">
                                    <span class="icon is-small"><i class="fas fa-ban"></i></span>
                                    <span>Cancel</span>
                                </a>
                            </p>
                        </div>
                        <div class="column is-9">
                            <div class="box content">
                                <div class="field">
                                    <label class="label">Subject</label>
                                    <div class="control">
                                        <input class="input" type="text" name="subject">
                                    </div>
                                </div>
                                <div class="field">
                                    <label class="label">Message</label>
                                    <div class="control">
                                        <textarea class="textarea" name="body" rows="15"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </section>
    </form>
</t:pagetemplate>

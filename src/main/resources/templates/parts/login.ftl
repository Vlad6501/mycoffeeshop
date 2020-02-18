<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group">
            <label class="col-md-auto col-form-label">Имя пользователя:</label>
            <div class="col-md-auto">
                <input type="text" name="username" value="<#if user??>${user.username}</#if>"
                       class="form-control ${(usernameError??)?string('is-invalid','')}"
                       placeholder="User name"/>
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
            </div>
        </div>
        <#if isRegisterForm>
            <div class="form-group">
                <label class="col-md-auto col-form-label">Эл. адрес:</label>
                <div class="col-md-auto">
                    <input type="email" name="email" value="<#if user??>${user.email}</#if>"
                           class="form-control ${(emailError??)?string('is-invalid','')}"
                           placeholder="some@some.com">
                    <#if emailError??>
                        <div class="invalid-feedback">
                            ${emailError}
                        </div>
                    </#if>
                </div>
            </div>
        </#if>
        <div class="form-group">
            <label class="col-md-auto col-form-label">Пароль:</label>
            <div class="col-md-auto">
                <input type="password" name="password"
                       class="form-control ${(passwordError??)?string('is-invalid','')}"
                       placeholder="Password">
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </div>
        </div>
        <#if isRegisterForm>
            <div class="form-group">
                <label class="col-md-auto col-form-label">Повторите пароль:</label>
                <div class="col-md-auto">
                    <input type="password" name="password2"
                           class="form-control ${(password2Error??)?string('is-invalid','')}"
                           placeholder="Retype password">
                    <#if password2Error??>
                        <div class="invalid-feedback">
                            ${password2Error}
                        </div>
                    </#if>
                </div>
            </div>
        </#if>
        <div class="form-group col-md-auto">
            <input type="hidden" name="_csrf" value="${_csrf.token }"/>
            <#if !isRegisterForm><a href="/registration">Add new user</a></#if>
            <button type="submit" class="btn btn-dark">Sign In</button>
        </div>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token }"/>
        <button type="submit" class="btn btn-dark">Выйти</button>
    </form>
</#macro>
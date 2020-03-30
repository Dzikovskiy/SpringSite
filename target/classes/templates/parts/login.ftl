<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> User Name : </label>
            <div class="col-sm-3">
                <input class="form-control" type="text" name="username" placeholder="User name"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Password: </label>
            <div class="col-sm-3">
                <input class="form-control" type="password" name="password" placeholder="Password"/>
            </div>
        </div>
        <#if isRegisterForm>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Email: </label>
            <div class="col-sm-3">
                <input class="form-control" type="email" name="email" placeholder="Email"/>
            </div>
        </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <#if !isRegisterForm> <a class="mr-5" href="/registration">Add new user</a></#if>
        <button type="submit" class="btn btn-primary ml-5"><#if isRegisterForm>Register<#else>Sign In</#if></button>
    </form>
</#macro>
<#macro logout>

    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-primary">Sign out</button>
    </form>

</#macro>
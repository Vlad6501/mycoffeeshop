<#assign
known = Session.SPRING_SECURITY_CONTEXT??
>

<#if known>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    id = user.getId()
    name = user.getUsername()
    isAdmin = user.isAdmin()

    chek = true
    >
<#else>
    <#assign
    name = "гость"
    isAdmin = false
    chek = false
    id = 0
    >
</#if>
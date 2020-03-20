<#import "parts/login.ftl" as l>
<#import "parts/common.ftl" as c>


<@c.page>
    Add new User
    <b>${message?ifExists}</b>
    <@l.login "/registration" />
</@c.page>
<#import "parts/login.ftl" as l>
<#import "parts/common.ftl" as c>
<@c.page>
    <b>${message?ifExists}</b>
    <@l.login "/login"  false/>

</@c.page>
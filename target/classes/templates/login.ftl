<#import "parts/login.ftl" as l>
<#import "parts/common.ftl" as c>
<@c.page>
Login page
<@l.login "/login" />

<a href="/registration">Add new user</a>
</@c.page>
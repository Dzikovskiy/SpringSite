<#import "parts/login.ftl" as l>
<#import "parts/common.ftl" as c>


<@c.page>
    <div class="mb-1">Add new User</div>
    <b>${message?ifExists}</b>
    <@l.login "/registration" true />
</@c.page>
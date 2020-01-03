<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>


<@c.page>
    <div>
        <@l.logout/>
        <span><a href="/user"> Users list</a></span>
    </div>
    <div>
        <form method="post">
            <input type="text" name="text" placeholder="Your message">
            <input type="text" name="tag" placeholder="Tags">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit">Add</button>
        </form>

        <b>Find by text</b>
        <form method="get" action="/main">
            <input type="text" name="findByText" >
            <button type="submit">Find</button>
        </form>

        <b>Find by tag</b>
        <form method="get" action="/main">
            <input type="text" name="findByTag" >
            <button type="submit">Find</button>
        </form>

        <b>Reset</b>
        <form method="post" action="reset">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit">reset</button>
        </form>
    </div>
    <div>Your messages:</div>

    <#list messages as message>
        <div>
            <b>${message.id}</b>
            <span>${message.text}</span>
            <i>${message.tag}</i>
            <strong>${message.authorName}</strong>
        </div>
    <#else>
        No messages
    </#list>
</@c.page>
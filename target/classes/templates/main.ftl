<#import "parts/common.ftl" as c>
<#import "parts/editModal.ftl" as m>


<@c.page>
    <form method="get" action="/main">
        <div class="form-row mb-2">
            <label class="col-2 col-form-label">Find by text</label>
            <div class="col-2">
                <input class="form-control " type="text"
                       name="findByText" <#if findByText??> value="${findByText}"</#if>>
            </div>
            <div class="col">
                <button type="submit" class="btn btn-primary ml-2">Find</button>
            </div>
        </div>
    </form>

    <form method="get" action="/main">
        <div class="form-row mb-2">
            <label class="col-sm-2 col-form-label">Find by tag</label>
            <div class="col-2">
                <input class="form-control " type="text" name="findByTag" <#if findByTag??> value="${findByTag}"</#if>>
            </div>
            <div class="col">
                <button type="submit" class="btn btn-primary ml-2">Find</button>
            </div>
        </div>
    </form>

    <div class="form-group row">
        <label class="col-sm-2 col-form-label mr-3">Reset</label>
        <form method="post" action="reset">
            <input class="form-control" type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit" class="btn btn-primary ">reset</button>
        </form>

    </div>
    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
       aria-controls="collapseExample">
        Добавить
    </a>
    <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" name="text" class="form-control " placeholder="Your message">
                </div>
                <div class="form-group">
                    <input type="text" name="tag" class="form-control " placeholder="Tags">
                </div>
                <div class="form-group">
                    <div class="input-group mb-3">
                        <div class="custom-file">
                            <input type="file" name="file" class="custom-file-input">
                            <label class="custom-file-label" for="inputGroupFile03">Choose file</label>
                        </div>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="form-group">
                    <button class="btn btn-primary " type="submit">Add</button>
                </div>
            </form>
        </div>
    </div>
    <div class="card-columns">
        <#list messages as message>
            <div class="card my-3">
                <div>
                    <#if message.filename?has_content>
                        <img src="/img/${message.filename}" class="card-img-top">
                    </#if>
                </div>
                <div class="m-2">
                    <span>${message.text}</span>
                    <i>#${message.tag}</i>
                </div>
                <div class="card-footer text-muted">
                    ${message.authorName}
                    <button class="btn btn-primary editBtn ml-5" href="getMessageById/${message.id}">Edit</button>
                </div>
            </div>
        <#else>
            No messages
        </#list>
    </div>
    <div class="editModal">
        <@m.modal/>
    </div>


</@c.page>
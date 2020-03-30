<#macro modal>
    <form method="post" action="/save">
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Edit message</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <div class="form-group">
                            <label for="id" class="col-form-label">Id:</label>
                            <input type="text" class="form-control" id="id" name="id" value="" readonly>
                        </div>
                        <div class="form-group">
                            <label for="text" class="col-form-label">Text:</label>
                            <input type="text" class="form-control" id="text" name="text" value="">
                        </div>
                        <div class="form-group">
                            <label for="tag" class="col-form-label">Tag:</label>
                            <input type="text" class="form-control" id="tag" name="tag" value="">
                        </div>

                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <input type="text" id="filename" name="filename" class="custom-file-input" hidden>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</#macro>
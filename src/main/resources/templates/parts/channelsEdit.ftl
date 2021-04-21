<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
   Добавить канал
</a>

<div class="collapse <#if channel??>show</#if>" id="collapseExample">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" class="form-control ${(nameError??)?string('is-invalid', '')}"
                       value="<#if channel??>${channel.name}</#if>"
                       name="name" placeholder="Введите Имя канала"/>
            <#if nameError??>
                <div class="invalid-feedback">
                ${nameError}
                </div>
            </#if>
            </div>
            <div class="form-group">
                <input type="number" class="form-control"
                       value="<#if channel?has_content></#if>"
                       name="number" placeholder="Номер на пульте">
            <#if numError??>
                <div class="invalid-feedback">
                ${numError}
                </div>
            </#if>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" id="customFile">
                    <label class="custom-file-label" for="customFile">Выберите лого</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />

            <div class="form-group">
                <button type="submit" class="btn btn-primary">Добавить</button>
            </div>
        </form>
    </div>
</div>
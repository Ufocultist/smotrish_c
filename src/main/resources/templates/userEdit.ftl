<#import "parts/common.ftl" as c>

<@c.page>
<div>
    <h5>User Editor</h5>
</div>
<form action="/user" method="post">
    <div class="form-group row">
            <label class="col-sm-2 col-form-label">UserName</label>
        <div class="col-sm-10">
            <input type="text" name="username" class="form-control" value="${user.username}">
        </div>
    </div>
    <div class="form-group row">
            <label class="col-sm-2 col-form-label">FirstName</label>
        <div class="col-sm-10">
            <input type="text" name="firstname" class="form-control" value="${user.firstname}">
        </div>
    </div>
    <div class="form-group row">
            <label class="col-sm-2 col-form-label">LastName</label>
        <div class="col-sm-10">
            <input type="text" name="lastname" class="form-control" value="${user.lastname}">
        </div>
    </div>
    <div class="form-group row">
            <label class="col-sm-2 col-form-label">Email</label>
        <div class="col-sm-10">
            <input type="text" name="email" class="form-control" value="${user.email}">
        </div>
    </div>

    <div class="form-group row">
            <label class="col-sm-2 col-form-label">Active</label>
        <div class="col-sm-10">
            <input type="text" name="active" class="form-control" value="${user.active?c}">
        </div>
    </div>

    <div class="form-group row">
    <label class="col-sm-2 col-form-label">Birthday</label>
        <div class="col-sm-10">
    <input type="date" name="dob" value="${user.dob}">
        </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Sex</label>
        <div class="col-sm-10">
            <input type="text" name="gender" value="${user.gender}">
        </div>
    </div>


    <div>
    <label>Roles</label>
                <#list roles as role>
                    <div>
                        <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
                    </div>
                </#list>
    </div>

        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
    </table>
    <button class="btn btn-primary" type="submit">Save changes</button>

</form>
</@c.page>
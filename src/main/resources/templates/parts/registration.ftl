
<#macro registration>
<form action="/registration" method="post" xmlns="http://www.w3.org/1999/html">

    <div class="form row">

        <div class="form-group col-md-6">
            <label>Firstname:</label>
            <input type="text" name="firstname"
                   class="form-control ${(firstnameError??)?string('is-invalid', '')}"
                   placeholder="Firstname"/>
            <#if firstnameError??>
                <div class="invalid-feedback">
                ${firstnameError}
                </div>
            </#if>

        </div>
        <div class="form-group col-md-6">
            <label>Lastname:</label>
            <input type="text" name="lastname"
                   class="form-control ${(lastnameError??)?string('is-invalid', '')}"
                   placeholder="Lastname"/>
            <#if lastnameError??>
                <div class="invalid-feedback">
                ${lastnameError}
                </div>
            </#if>
        </div>


        <div class="form-group col-md-6">
            <label>Username:</label>
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroupPrepend3">@</span>
                </div>
                <input type="text" name="username" value="<#if user??>${user.username}</#if>"
                       class="form-control ${(usernameError??)?string('is-invalid', '')}"
                       placeholder="User name"/>
                <#if usernameError??>
                    <div class="invalid-feedback">
                    ${usernameError}
                    </div>
                </#if>
            </div>
        </div>

        <div class="form-group col-md-6">
            <label>Email:</label>
            <input type="email" name="email" value="<#if user??>${user.email}</#if>"
                   class="form-control ${(emailError??)?string('is-invalid', '')}"
                   placeholder="user@example.com"/>
            <#if emailError??>
                <div class="invalid-feedback">
                ${emailError}
                </div>
            </#if>
        </div>

        <div class="form-group col-md-6">
            <label>Password:</label>
            <input type="password" name="password"
                   class="form-control ${(passwordError??)?string('is-invalid', '')}"
                   placeholder="Password"/>
            <#if passwordError??>
                <div class="invalid-feedback">
                ${passwordError}
                </div>
            </#if>
        </div>

        <div class="form-group col-md-6">
            <label>Reenter Password:</label>
            <input type="password" name="password2"
                   class="form-control ${(password2Error??)?string('is-invalid', '')}"
                   placeholder="Retype Password"/>
            <#if password2Error??>
                <div class="invalid-feedback">
                ${password2Error}
                </div>
            </#if>
        </div>

        <div class="form-group col-md-6">
            <label>Date of birth</label>
            <input type="date" name="dob"
                   class="form-control ${(dobError??)?string('date_format', '')}"
                   placeholder="Date of Birth"/>
            <#if dobError??>
                <div class="invalid-feedback">
                ${dobError}
                </div>
            </#if>
        </div>

        <div class="form-group col-md-6">
            <label>Sex</label>
            <div class="row">

            <div class="col-md-6 select-outline">
            <select class="mdb-select md-form md-outline colorful-select dropdown-primary">
            <option value="disabled selected">Choose your option</option>">
                <option value="1">MALE</option>
                <option value="2">FEMALE</option>
                <option value="3">OTHER</option>
            </select>

            <#if genderError??>
                <div class="invalid-feedback">
                ${genderError}
                </div>
            </#if>
        </div>
    </div>
        </div>

    </div>

    <div class="form-group">
        <div class="form-check">
            <input class="form-check-input is-invalid" type="checkbox" value="" id="invalidCheck3" required>
            <label class="form-check-label" for="invalidCheck3">
                Agree to terms and conditions
            </label>
            <div class="invalid-feedback">
                You must agree before submitting.
            </div>
        </div>
    </div>

    <div class="form-group col-md-6">
        <div class="g-recaptcha" data-sitekey="6Ldvm5oUAAAAADA-0r3EUy4vXFYo3DSlTrgYJeYY"></div>
        <#if captchaError??>
            <div class="alert alert-danger" role="alert">
            ${captchaError}
            </div>
        </#if>
    </div>

    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <button class="btn btn-primary" type="submit">Complete Registration</button>
</form>
</#macro>
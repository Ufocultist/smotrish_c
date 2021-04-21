<#import "parts/common.ftl" as c>
<#import "parts/registration.ftl" as r>
<@c.page>
Registration Form
${message?ifExists}
    <@r.registration />
</@c.page>
<#import "parts/common.ftl" as c>
    <@c.page>
    <#if isCurrentUser>
        <#include "parts/channelsEdit.ftl" />
    </#if>
    <div class="mt-3">
        <#include "parts/channelsList.ftl"/>
    </div>
</@c.page>
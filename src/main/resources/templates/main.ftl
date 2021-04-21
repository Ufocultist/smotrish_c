<#import "parts/common.ftl" as c>

<@c.page>
<div class="dorm-row">
    <div class="form-group">
        <form method="get" action="/main" class="form-inline">
            <input type="text" name="filter" class="form-control" value="${filter!""}" placeholder="Искать по Имени">
            <button type="submit" class="btn btn-primary ml-2">Найти</button>
        </form>
    </div>
</div>
    <#include "parts/channelsEdit.ftl" />
<div class="mt-3">
    <#include "parts/channelsList.ftl" />
</div>
</@c.page>
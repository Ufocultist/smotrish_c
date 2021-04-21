<#include "security.ftl">
<div>
    <h5>Channel List</h5
</div>
<table class="table table-bordered table-dark">
    <thread>
        <tr>
            <th scope="col" width="5%">№</th>
            <th scope="col" width="6%">Логотип</th>
            <th scope="col" width="20%">Имя</th>
            <th scope="col">Программа</th>
            <th scope="col" width="6%">Правка</th>
            <th scope="col" width="10%">Удалить</th>
        </tr>
    </thread>
    <tbody>
    <#list channels as channel>
    <tr>
        <td>${channel.number}</td>
        <td>
            <#if channel.filename??>
                <img src="/img/${channel.filename}" class="img-thumbnail">
            </#if>
        </td>
        <td>${channel.name}</td>
        <td></td>
        <td><a href="/user-channels/${channel.id}?channel=${channel.id}"><img src="/img/settin.jpg" width="50" height="50"></a></td>
        <td><a href="/user-channels/delete/${channel.id}"><img src="/img/trash.jpg" width="50" height="50"></a></td>
    <#else>
        No channels
    </tr>
    </#list>
    </tbody>
</table>
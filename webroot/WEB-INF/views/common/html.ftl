<#-- HTML页面相关的通用宏和方法定义  -->
<#macro profit profit=0>
    <#if  profit gt 0 >
    <td class="bg">${profit}</td>
    <#elseif  profit lt 0>
    <td class="red">${profit}</td>
    <#else>
    <td class="bg">${profit}</td>
    </#if>
</#macro>

<#macro profit_rate profit_rate=0 suffix="">
    <#if profit_rate gt 80 >
    <td class="green">#{profit_rate;m2M2}${suffix}</td>
    <#elseif profit_rate gt 65>
    <td class="LightSkyBlue">#{profit_rate;m2M2}${suffix}</td>
    <#elseif profit_rate gt 50>
    <td class="PaleVioletRed">#{profit_rate;m2M2}${suffix}</td>
    <#else>
    <td class="red">#{profit_rate;m2M2}${suffix}</td>
    </#if>
</#macro>

<#macro compare num=0>
    <#if num gt 0 >
    ${num}
    <#elseif num lt 0>
    <span style="color:red;font-weight:bold;">${num}</span>
    <#else>
    ${num}
    </#if>
</#macro>

<#macro compare_reverse num=0>
    <#if num lt 0 >
    ${num}
    <#elseif num gt 0>
    <span style="color:red;font-weight:bold;">${num}</span>
    <#else>
    ${num}
    </#if>
</#macro>


<#-- 生成html表单的标签 -->
<#macro form action id='' method='POST' enctype='' class='' style=''>
<@compress single_line=true>
<form action="${action}" method="${method}"
<#if (id?length > 0)>       id="${id}"</#if>
<#if (enctype?length > 0)>  enctype="${enctype}"</#if>
<#if (class?length > 0)>    class="${class}"</#if>
<#if (style?length > 0)>    style="${style}"</#if>
>
</@compress>
<#nested/>
</form>
</#macro>


<#-- 
生成分页链接
obj_count  对象个数
current_page    当前页 
page_size   每页个数
size    几个页签
 -->
<#macro pagination obj_count  url='' current_page=p  page_size=page_size  size=5  style='' anchor=''  >
<@compress single_line=true>
<#if (obj_count > page_size)>
	<ul class="pagination">
        <#local param_char='?'/>
        <#if (url?index_of('?') >=0)>
            <#local param_char='&'/>
        </#if>  
        <#if !(url?ends_with('?') || url?ends_with('&'))>
            <#local the_url = url + param_char />
        <#else>
            <#local the_url = url/>
        </#if>
        <#local page_count = (obj_count / page_size)?int />
        <#if (obj_count % page_size) != 0>
            <#local page_count = page_count + 1 />
        </#if> 
        <#if (page_count == 0)>
            <#local page_count = 1/>
        </#if>
        <#local pre_page = current_page - 1 /> <#-- 上一页-->
        <#local next_page = current_page + 1 /> <#-- 下一页-->
        <#local begin_idx = current_page - (current_page % size) + 1/>
        <#if (begin_idx > current_page)>
            <#local end_idx = begin_idx/>
            <#local begin_idx = end_idx - size + 1/>
        <#else>
            <#local end_idx = begin_idx + size - 1/>
        </#if>
        <#if (end_idx > page_count)> <#local end_idx = page_count /> </#if>
		
		<#-- 上一页-->
        <li class="prev <#if (current_page==1)>disabled</#if>"><a href="${the_url}page=${pre_page}&pageSize=${page_size}${anchor}"><span class="fa fa-chevron-left"></span></a><li>
        <#if (begin_idx > 1)>
            <li><a href="${the_url}page=1&page_size=${page_size}${anchor}">1</a></li>
        </#if>
        <#list begin_idx..end_idx as idx>
            <li <#if (idx?number==current_page)>class="active"</#if>><a href="${the_url}page=${idx}&pageSize=${page_size}${anchor}">${idx}</a>
        </#list>
        <#if (end_idx < page_count)><li><a href="${the_url}page=${page_count}&pageSize=${page_size}${anchor}" >${page_count}</a></li></#if>   
        <#-- 下一页-->       
        <#if (current_page< page_count)><li class="next"><a href="${the_url}page=${next_page}&pageSize=${page_size}${anchor}"><span class="fa fa-chevron-right"></span></a></li></#if>
    </ul>
</#if>
</@compress>
</#macro>


<#-- 网站所用到的全局函数定义  -->

<#function getSession name default=''>
    <#return session.getAttribute(name)!default/>
</#function>
<#function getRequest name default=''>
	<#return request.getParameter(name)!default/>
</#function>

<#function color_select percentage=0 >
	<#if (percentage > 70)>
		<#return "color_bg_light_blue"/>
	<#elseif (percentage > 40)>
		<#return "color_bg_yellow"/>
	<#else>
		<#return "color_bg_light_red"/>
	</#if>
</#function>


<#function menu_chinese name="index" >
	<#if name=="index">
		<#return "首页"/>
	<#elseif name=="cp">
		<#return "客户信息管理"/>
	<#elseif name=="customer">
		<#return "发行人信息管理"/>
	<#elseif name=="contract">
		<#return "合同管理"/>
	<#elseif name=="bond">
		<#return "债券市场信息管理"/>
	<#elseif name=="project">
		<#return "项目管理"/>
	<#elseif name=="rating_basic">
		<#return "企业基本信息"/>
	<#elseif name=="rating_stockholder">
		<#return "股东构成"/>
	<#elseif name=="rating_finance_data">
		<#return "财务数据"/>
	<#elseif name=="rating_finance_analysis">
		<#return "财务分析"/>
	<#elseif name=="rating_rating">
		<#return "系统评分"/>
	</#if>
</#function>




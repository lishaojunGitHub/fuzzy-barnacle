<@layout.index menu="rating_basic" menuid=1 style="padding-left:6px!important;padding-right:2px!important;">
<style>
.table{font-size:14px!important}
.LightSkyBlue{background-color:#0088cc;}
</style>
<section class="panel">
	<header class="panel-heading">
		<form action="/admin/rating/basic" method="POST">
			<div class="form-group  alert alert-primary">
				<div class="col-md-2 col-xs-11"><input type="text" class="form-control  input-sm mb-md" name="customer" value="中国交通建设股份有限公司" ></div>
				<div class="col-md-3 col-xs-11">
					<button class="btn  btn-sm btn-success">查询</button>
				</div>
			</div>
		</form>
	</header>
	<div class="panel-body">
		<table class="table table-bordered mb-none">
		<tbody>
			<#if customer!="" && bean!=null>
			<tr>
				<td class="LightSkyBlue" width=120px>企业名称</td>
				<td colspan="3"  style="text-align:left;">${bean.getStr("name")}</td>
			</tr>
			<tr>
				<td class="LightSkyBlue">企业性质</td>
				<td>${bean.getStr("property")}</td>
				<td class="LightSkyBlue">企业类型</td>
				<td>${bean.getStr("industry_name1")}</td>
			</tr>
			<tr>
				<td class="LightSkyBlue">地址</td>
				<td>${bean.getStr("office")}</td>
				<td class="LightSkyBlue">网站</td>
				<td>${bean.getStr("webSite")}</td>
			</tr>
			<tr>
				<td class="LightSkyBlue">公司介绍</td>
				<td colspan="3" style="text-align:left;">${bean.getStr("note")}</td>
			</tr>
		</tbody>
		</table>
		<#elseif customer="">
		    <tr>
				<td class="LightSkyBlue" width=120px>企业名称</td>
				<td colspan="3"  style="text-align:left;">中国交通建设股份有限公司</td>
			</tr>
			<tr>
				<td class="LightSkyBlue">企业性质</td>
				<td>中央国有企业</td>
				<td class="LightSkyBlue">企业类型</td>
				<td>工业制造</td>
			</tr>
			<tr>
				<td class="LightSkyBlue">地址</td>
				<td>北京市西城区德胜门外大街85号</td>
				<td class="LightSkyBlue">网站</td>
				<td>www.ccccltd.cn</td>
			</tr>
			<tr>
				<td class="LightSkyBlue">公司介绍</td>
				<td colspan="3" style="text-align:left;">公司是目前中国最大的港口设计及建设企业；中国领先的公路、桥梁建设及设计企业；中国领先的铁路建设企业；中国最大、世界第二大的疏浚企业；全球最大的集装箱起重机制造商；中国最大的国际工程承包商，中国最大的国际设计公司。公司业务足迹遍及中国所有省、市、自治区及港澳特区和世界76个国家和地区。公司荣列ENR全球最大225家国际承包商第17位，连续三年稳居中国上榜企业第1名；综合业绩考核位列中央企业第5名，连续四年获评国资委A级企业；荣获“中国最佳诚信企业”、“全国交通运输企业文化建设优秀单位”、“中央企业优秀社会责任实践证书”等荣誉称号。</td>
			</tr>
			
		<#elseif bean==null>
			<div class="alert alert-danger">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
				<strong>无法获取公司信息，请确认！</strong>
			</div>
		<#elseif customer!="">
			<div class="alert alert-danger">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
				<strong>请输入查询公司名称！</strong>
			</div>
		</#if>
	</div>
</section>
<script>
(function($) {
	'use strict';
	var datatableInit = function() {
		$('#datatable-default').dataTable({"pageLength": 50});
	};
	$(function() {
		datatableInit();
	});
}).apply(this,[jQuery]);
</script>
</@layout.index>
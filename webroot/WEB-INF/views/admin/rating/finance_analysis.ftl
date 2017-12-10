<@layout.index menu="rating_finance_analysis" menuid=1 style="padding-left:6px!important;padding-right:2px!important;">
<style>
.table{font-size:13px!important}
</style>
<section class="panel">
	<header class="panel-heading">
		<form action="/admin/rating/financeAnalysis" method="POST">
			<div class="form-group alert alert-primary">
				<div class="col-md-2 col-xs-11"><input type="text" class="form-control input-sm mb-md" name="customer" value="${customer}" placeholder="公司名称"></div>
				<div class="col-md-2">
					<div class="col-md-12">
						<select name="reportPeriod" class="form-control input-sm mb-md">
							<option <#if reportPeriod==1>selected="selected"</#if> value="1">最新报告</option>
							<option <#if reportPeriod==2>selected="selected"</#if> value="2">3月内报告</option>
							<option <#if reportPeriod==3>selected="selected"</#if> value="3">更久报告</option>
						</select>
					</div>
				</div>
				<div class="col-md-2">
					<div class="col-md-12">
						<select name="statementType" class="form-control input-sm mb-md">
							<option <#if statementType==408001000>selected="selected"</#if> value="408001000">合并报表</option>
							<option <#if statementType==408002000>selected="selected"</#if> value="408002000">合并报表(单季度)</option>
							<option <#if statementType==408003000>selected="selected"</#if> value="408003000">合并报表(单季度调整)</option>
							<option <#if statementType==408004000>selected="selected"</#if> value="408004000">合并报表(调整)</option>
							<option <#if statementType==408005000>selected="selected"</#if> value="408005000">合并报表(更正前)</option>
							<option <#if statementType==408006000>selected="selected"</#if> value="408006000">母公司报表</option>
							<option <#if statementType==408007000>selected="selected"</#if> value="408007000">母公司报表(单季度)</option>
							<option <#if statementType==408008000>selected="selected"</#if> value="408008000">母公司报表(单季度调整)</option>
							<option <#if statementType==408009000>selected="selected"</#if> value="408009000">母公司报表(调整)</option>
							<option <#if statementType==408010000>selected="selected"</#if> value="408010000">母公司报表(更正前)</option>
						</select>
					</div>
				</div>
				<div class="col-md-2">
					<select name="account" class="form-control input-sm mb-md">
						<option value="万元">万元</option>
					</select>
				</div>
				<div class="col-md-2">
					<select name="account" class="form-control input-sm mb-md">
						<option value="人民币">人民币</option>
						
					</select>
				</div>
				<div class="col-md-1 col-xs-11">
					<button class="btn  btn-sm btn-success">搜索</button>
				</div>
			</div>
		</form>
	</header>
	<div class="panel-body">
		<#if customer!="" && bean!=null>
		<table class="table table-bordered mb-none">
			<#if list!=null && list?size gt 0>
			<tbody>
				<thead>
					<tr>
						<th>项目</th>
						<th>年报日期</th>
						<th>净资产</th>
						<th>报告期</th>
						<th>报表类型</th>
						<th>债券简称</th>
						<th>债券代码</th>
					</tr>
				</thead>
				<tbody>
					<#list list as bean>
					<tr>
						<td>${customer}</td>
						<td>${bean.date?substring(0,10)}</td>
						<td>${bean.TOT_CUR_ASSETS}</td>
						<td>${bean.REPORT_PERIOD}</td>
						<td>${bean.STATEMENT_TYPE}</td>
						<td>${bean.S_INFO_NAME}</td>
						<td>${bean.S_INFO_WINDCODE}</td>
					</tr>
					</#list>
				</tbody>
			</tbody>
			<#else>
				<tr>
					<td colspan=3 style="text-align:center">
						<div class="alert alert-danger">
							<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
							<strong>无法获取数据！</strong>
						</div>
					</td>
				</tr>
			</#if>
		</table>
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
Morris.Line({
	resize: true,
	element: 'financeData',
	data: [{"cost":2865.43,"keywordnum":814,"x":"2017-11-30"},{"cost":2959.8,"keywordnum":873,"x":"2017-11-29"},{"cost":2763.06,"keywordnum":829,"x":"2017-11-28"},{"cost":2412.95,"keywordnum":747,"x":"2017-11-27"},{"cost":3070.07,"keywordnum":710,"x":"2017-11-26"},{"cost":3048.74,"keywordnum":755,"x":"2017-11-25"},{"cost":2359.41,"keywordnum":696,"x":"2017-11-24"},{"cost":1713.74,"keywordnum":581,"x":"2017-11-23"},{"cost":1654.38,"keywordnum":490,"x":"2017-11-22"},{"cost":841.68,"keywordnum":281,"x":"2017-11-21"}],
	xkey: 'x',
	ykeys: ['cost','keywordnum'],
	labels: ['花费','关键词数量'],
	hideHover: true,
	lineColors: ['#0088cc', '#734ba9'],
});
</script>
</@layout.index>
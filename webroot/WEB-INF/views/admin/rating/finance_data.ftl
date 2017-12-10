<@layout.index menu="rating_finance_data" menuid=1 style="padding-left:6px!important;padding-right:2px!important;">
<style>
.table{font-size:13px!important}
</style>
<section class="panel">
	<header class="panel-heading">
		<form action="/admin/rating/financeData" method="POST">
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
				<div class="col-md-2" >
					<div class="col-md-12">
						<select name="account" class="form-control input-sm mb-md">
							<option value="">最新报表</option>
							<#list accountList as bean>
							<option value="${bean.username}" <#if account==bean.username>selected="selected"</#if>>${bean.username}</option>
							</#list>
						</select>
					</div>
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
	<div class="panel-body>
		<div class="col-md-8">
			<section class="panel">
				<#if (customer!="" && bean!=null) || debug??>
				<header class="panel-heading">
					<h2 class="panel-title">财务数据</h2>
					<p class="panel-subtitle"></p>
				</header>
					<#if json!=null && json?length gt 3>
					<div class="panel-body">
						<div class="chart chart-md" id="financeData"></div>
					</div>
					<#else>
					<div class="alert alert-danger">
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
						<strong>无法获取数据！</strong>
					</div>
					</#if>
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
			    <#elseif customer == "">
			    <header class="panel-heading">
					<h2 class="panel-title">财务数据</h2>
					<p class="panel-subtitle"></p>
				</header>
				<div class="panel-body">
						<div class="chart chart-md" id="financeData0"></div>
				</div>
				</#if>
			</section>
		</div>
	</div>
</section>
<script>
Morris.Line({
	resize: true,
	element: 'financeData',
	data: ${json},
	xkey: 'x',
	ykeys: ['d1','d2'],
	labels: ['流动资产','非流动资产'],
	hideHover: true,
	lineColors: ['#0088cc', '#734ba9'],
});



</script>
</@layout.index>
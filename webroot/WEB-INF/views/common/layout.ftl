<#include "/WEB-INF/views/common/f_global.ftl">
<#macro index title='' keywords='' desc=''  flag=true  menu='' menuid=1 submenuid=1 style="">
<!DOCTYPE html>
<html>
<head>
	<!-- Basic -->
	<meta charset="UTF-8">
	<title>电力生产企业主体信用评级系统</title>
	<meta name="keywords" content="HTML5 Admin Template" />
	<meta name="description" content="Porto Admin - Responsive HTML5 Template">
	<meta name="author" content="okler.net">
	<!-- Mobile Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<!-- Vendor CSS -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="/assets/vendor/bootstrap/css/bootstrap.css" />
	<link rel="stylesheet" href="/assets/vendor/font-awesome/css/font-awesome.css" />
	<link rel="stylesheet" href="/assets/vendor/magnific-popup/magnific-popup.css" />
	<link rel="stylesheet" href="/assets/vendor/bootstrap-datepicker/css/datepicker3.css" />
	<!--<link rel="stylesheet" href="/assets/vendor/select2/select2.css" />-->
	<link rel="stylesheet" href="/assets/vendor/jquery-datatables-bs3/assets/css/datatables.css" />
	<!-- Specific Page Vendor CSS -->
	<link rel="stylesheet" href="/assets/vendor/jquery-ui/css/ui-lightness/jquery-ui-1.10.4.custom.css" />
	<link rel="stylesheet" href="/assets/vendor/bootstrap-multiselect/bootstrap-multiselect.css" />
	<link rel="stylesheet" href="/assets/vendor/morris/morris.css" />
	<!-- Theme CSS -->
	<#if menu=="calendar" || menu="dailybill_calendar">
	<link rel="stylesheet" href="/assets/vendor/fullcalendar/fullcalendar.css" />
	<link rel="stylesheet" href="/assets/vendor/fullcalendar/fullcalendar.print.css" media="print" />
	<#elseif menu=="index">
	<link rel="stylesheet" href="/assets/vendor/chartist/chartist.css" />
	</#if>
	<link rel="stylesheet" href="/assets/stylesheets/theme.css" />
	<!-- Skin CSS -->
	<link rel="stylesheet" href="/assets/stylesheets/skins/default.css" />
	<!-- Theme Custom CSS -->
	<link rel="stylesheet" href="/assets/stylesheets/theme-custom.css">
	
	<!-- Head Libs -->
	<script src="/assets/vendor/modernizr/modernizr.js"></script>
	<!-- Vendor -->
	<script src="/assets/vendor/jquery/jquery.js"></script>
	<script src="/assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
	<script src="/assets/vendor/bootstrap/js/bootstrap.js"></script>
	<script src="/assets/vendor/nanoscroller/nanoscroller.js"></script>
	<script src="/assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script src="/assets/vendor/magnific-popup/magnific-popup.js"></script>
	<script src="/assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>
	<!-- Specific Page Vendor -->
	<script src="/assets/vendor/jquery-appear/jquery.appear.js"></script>
	<script src="/assets/vendor/bootstrap-multiselect/bootstrap-multiselect.js"></script>
	<script src="/assets/vendor/jquery-datatables/media/js/jquery.dataTables.js"></script>
	<script src="/assets/vendor/jquery-datatables/extras/TableTools/js/dataTables.tableTools.min.js"></script>
	<script src="/assets/vendor/jquery-datatables-bs3/assets/js/datatables.js"></script>
	<#if menu=="calendar" || menu="dailybill_calendar">
	<script src="/assets/vendor/fullcalendar/lib/moment.min.js"></script>
	<script src="/assets/vendor/fullcalendar/fullcalendar.js"></script>
	<#elseif menu=="menu">
	<script src="/assets/vendor/jstree/jstree.js"></script>
	<#elseif menu=="rating_finance_data" >
	<script src="/assets/vendor/jquery-appear/jquery.appear.js"></script>
	<script src="/assets/vendor/jquery-easypiechart/jquery.easypiechart.js"></script>
	<script src="/assets/vendor/flot/jquery.flot.js"></script>
	<script src="/assets/vendor/flot-tooltip/jquery.flot.tooltip.js"></script>
	<script src="/assets/vendor/flot/jquery.flot.pie.js"></script>
	<script src="/assets/vendor/flot/jquery.flot.categories.js"></script>
	<script src="/assets/vendor/flot/jquery.flot.resize.js"></script>
	<script src="/assets/vendor/jquery-sparkline/jquery.sparkline.js"></script>
	<script src="/assets/vendor/raphael/raphael.js"></script>
	<script src="/assets/vendor/morris/morris.js"></script>
	<script src="/assets/vendor/gauge/gauge.js"></script>
	<script src="/assets/vendor/snap-svg/snap.svg.js"></script>
	<script src="/assets/vendor/liquid-meter/liquid.meter.js"></script>
	<script src="/assets/vendor/chartist/chartist.js"></script>
	</#if>
	<style type="text/css">
		body {font-family:"Microsoft YaHei"!important;font-size:13px!important;color:#000000!important}
	</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<header class="header">
	<div class="logo-container" style="display:inline-block!important;text-align:center">
		<!--<a href="../" class="logo"><img src="" height="35" alt="Porto Admin" /></a>-->
		<div style="font-size:22px!important;margin:10px">电力生产企业主体信用评级系统 &nbsp;&nbsp;&nbsp;&nbsp; </div>
		<div class="visible-xs toggle-sidebar-left" data-toggle-class="sidebar-left-opened" data-target="html" data-fire-event="sidebar-left-opened">
			<i class="fa fa-bars" aria-label="Toggle sidebar"></i>
		</div>
	</div>
	<div class="header-right">
		<span class="separator"></span>
		<div id="userbox" class="userbox">
			<a href="#" data-toggle="dropdown">
				<figure class="profile-picture">
					<img src="/assets/images/!logged-user.jpg" alt="Joseph Doe" class="img-circle" data-lock-picture="assets/images/!logged-user.jpg">
				</figure>
				<div class="profile-info" data-lock-name="John Doe" data-lock-email="johndoe@okler.com">
					<span class="name">${sessionusername!'管理员'}</span>
					<!--<span class="role">${sessionusername}</span>-->
				</div>
				<i class="fa custom-caret"></i>
			</a>

			<div class="dropdown-menu">
				<ul class="list-unstyled">
					<li class="divider"></li>
					<!--<li><a role="menuitem" tabindex="-1" href="pages-user-profile.html"><i class="fa fa-user"></i> My Profile</a></li>
					<li><a role="menuitem" tabindex="-1" href="#" data-lock-screen="true"><i class="fa fa-lock"></i> Lock Screen</a></li>-->
					<li><a role="menuitem" tabindex="-1" href="/auth/logout"><i class="fa fa-power-off"></i> Logout</a></li>
				</ul>
			</div>
		</div>
	</div>
</header>
<div class="inner-wrapper">
	<!-- start: sidebar -->
	<aside id="sidebar-left" class="sidebar-left" >
		<div class="sidebar-header">
			<div class="sidebar-title" style="color:#abb4be"><b>菜单</b></div>
			<div class="sidebar-toggle hidden-xs" data-toggle-class="sidebar-left-collapsed" data-target="html" data-fire-event="sidebar-left-toggle">
				<i class="fa fa-bars" aria-label="Toggle sidebar"></i>
			</div>
		</div>
		<div class="nano">
			<div class="nano-content">
				<nav id="menu" class="nav-main" role="navigation">
					<ul class="nav nav-main">
						<li <#if menu=="cp">class="nav-active"</#if>>
							<a href="/admin/cp/cp/list">
								<i class="fa fa-user" aria-hidden="true"></i><span>客户信息管理</span>
							</a>
						</li>
				
						<li <#if menu=="project">class="nav-active"</#if>>
							<a href="/admin/project/project/list">
								<i class="fa fa-archive" aria-hidden="true"></i><span>项目管理</span>
							</a>
						</li>
						<li <#if menu=="customer">class="nav-active"</#if>>
							<a href="/admin/customer/customer/list">
								<i class="fa fa-bank" aria-hidden="true"></i><span>发行人信息管理</span>
							</a>
						</li>
						<li <#if menu=="bond">class="nav-active"</#if>>
							<a href="/admin/bond/bond/list">
								<i class="fa fa-rmb" aria-hidden="true"></i><span>债券市场信息管理</span>
							</a>
						</li>
						
						<li class="nav-parent nav-expanded">
							<a><i class="fa fa-database" aria-hidden="true"></i><span>评级系统</span></a>
							<ul class="nav nav-children">
								<li class="<#if menu=='rating_basic'>nav-active</#if>"><a href="/admin/rating/basic">企业基本信息</a></li>
								<li class="<#if menu=='rating_finance_data'>nav-active</#if>"><a href="/admin/rating/financeData">财务数据</a></li>
								<li class="<#if menu=='rating_finance_analysis'>nav-active</#if>"><a href="/admin/rating/financeAnalysis">财务分析</a></li>
								<li class="<#if menu=='rating_rating'>nav-active</#if>"><a href="/admin/rating/rating">系统评分</a></li>
							</ul>
						</li>
						<#if sessiontree??>
						<#list sessiontree as tree>
						<li class="nav-parent <#if menuid==tree.id>nav-expanded</#if>">
							<a>
								<i class="fa ${tree.style}" aria-hidden="true"></i>
								<span>${tree.name}</span>
							</a>
							<ul class="nav nav-children">
								<#list sessionSubMap1.get(tree.id) as subtree>
								<li class="<#if menu==subtree.en>nav-active</#if> <#if subtree.isleaf==2>nav-parent</#if> <#if submenuid==subtree.id>nav-expanded</#if>" >
									<a href="${subtree.url}">${subtree.name}</a>
									<#if subtree.isleaf==2>
									<ul class="nav nav-children ">
										<#list sessionSubMap2.get(subtree.id) as subtree2>
										<li <#if menu==subtree2.en>class="nav-active"</#if>>
											<a href="${subtree2.url}">${subtree2.name}</a>
										</li>
										</#list>
									</ul>
									</#if>
								</li>
								</#list>
							</ul>
						</li>
						</#list>
						</#if>
					</ul>
				</nav>
				<hr class="separator" />
			</div>
		</div>
	</aside>
	<!-- end: sidebar -->
	<section role="main" class="content-body" style="${style}">
		<header class="page-header">
			<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${menu_chinese(menu)}</h2>
		</header>
		<!-- start: page -->
		<#nested>
		<!-- end: page -->
	</section>
</div>
<script src="/assets/javascripts/theme.js"></script>  <!-- Theme Base, Components and Settings -->
<script src="/assets/javascripts/theme.custom.js"></script>  <!-- Theme Custom -->
<script src="/assets/javascripts/theme.init.js"></script><!-- Theme Initialization Files -->
</body>
</html>
</#macro>

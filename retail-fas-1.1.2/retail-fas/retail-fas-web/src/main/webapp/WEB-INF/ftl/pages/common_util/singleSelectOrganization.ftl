<!DOCTYPE html>
<head>
    <title>查询</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <#include  "/WEB-INF/ftl/common/header.ftl" >
 	<script type="text/javascript" src="${resourcesUrl}/fas/resources/js/modules/common_util/singleSelectOrganization.js?version=${version}"></script>
</head>
<body class="easyui-layout">

	<div data-options="region:'north',border:false" class="toolbar-region">
		 <@p.toolbar id="toolbar" listData=[
				 {"id":"btn-search","title":"查询","iconCls":"icon-search","action":"singleSelect.search()", "type":0},
	             {"id":"btn-remove","title":"清空","iconCls":"icon-remove","action":"singleSelect.clear()", "type":0}
	           ]
			/>
	
	</div>
	<div  data-options="region:'center',border:false">
	     <div class="easyui-layout" data-options="fit:true" id="subLayout">
			<!--搜索start-->
			<div data-options="region:'north',border:false" >
				<div class="search-div">
				     <form name="singleSelectForm" id="singleSelectForm" method="post">
		       		 	<table class="form-tb">
		       		 		<col width="80" />
						    <col />
						    <col width="80" />
						    <col />
						    <col width="80" />
						    <col />
						    <tbody>
		       		 		<tr>		
		       		 			<th>类型：</th>
		       		 			<td><input<input class="easyui-combobox ipt" readonly="readonly" data-options="valueField:'code',textField:'name',url:BasePath + '/common_util/getOrganizationType'" name="organizationType" id="organizationType"/></td>	       		 	
		       		 			<th>编码：</th>
		       		 			<td><input class="easyui-validatebox ipt" name="multiNo" id="multiNo"/></td>
		       		 			<th>名称：</th>
		       		 			<td><input class="easyui-validatebox ipt"  name="multiName" id="multiName"/></td>
		       		 		</tr>
		       		 		</tbody>
		       		 	</table>
					</form>
				</div>
			</div>
			<!--列表-->
	        <div data-options="region:'center',border:false">
				<table id="singleSelectDG"></table>  					       
			</div>
		 </div>
	</div>
	
</body>
</html>
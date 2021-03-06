<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>公司结账日设置</title>
<#include  "/WEB-INF/ftl/common/header.ftl" >
<script type="text/javascript" src="${resourcesUrl}/fas/resources/js/common/fas.2.0.js?version=${version}"></script>
<script type="text/javascript" src="${resourcesUrl}/fas/resources/js/modules/cost/companySettlePeriod.js?version=${version}"></script>
</head>
<body class="easyui-layout">
		<div data-options="region:'north',border:false">
		      <@p.toolbar id="toolbar" listData=[
					 {"id":"btn-search","title":"查询","iconCls":"icon-search","action" : "dialog.search()", "type":0},
		             {"id":"btn-remove","title":"清空","iconCls":"icon-empty", "action" : "dialog.clear()","type":0},
		             {"id":"btn-export","title":"导出","iconCls":"icon-export", "action" : "dialog.exportExcel()","type":4}
		           ]
				/>
			<!--搜索start-->
			<div class="search-div">
			      <form name="searchForm" id="searchForm" method="post">
						<table class="form-tb">
						 <col width="100"/>
						 <col/>
						 <col width="100"/>
						 <col/>
						 <col width="100"/>
						 <col/>
						 <col width="100"/>
						 <col/>
		                 <tbody>
						 	<tr>
							 	<th>公司名称：</th>
						 		<td>
									<input class="easyui-company ipt"  name="companyNames" id="companyNames" 
									 data-options="inputNoField:'companyNos',inputNameField:'companyNames',multiple:true"/>
									<input type="hidden" name="companyNos" id="companyNos"/>
								</td>
							</tr>
							<tr>
							 	<th>厂商结账日：</th>
							 	<td>
							 		<input class="easyui-datebox ipt"  name="supplierSettleTimeStart" id="supplierSettleTimeStart" data-options="maxDate:'supplierSettleTimeEnd'"/>
							 	</td>
								<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
								<td>
									<input class="easyui-datebox ipt" name="supplierSettleTimeEnd" id="supplierSettleTimeEnd" data-options="minDate:'supplierSettleTimeStart'"/>
								</td>
								<th>跨区结账日：</th>
							 	<td>
							 		<input class="easyui-datebox ipt"  name="transferSettleTimeStart" id="transferSettleTimeStart" data-options="maxDate:'transferSettleTimeEnd'"/>
							 	</td>
								<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
								<td>
									<input class="easyui-datebox ipt" name="transferSettleTimeEnd" id="transferSettleTimeEnd" data-options="minDate:'transferSettleTimeStart'"/>
								</td>
							</tr>
							<tr>
							 	<th>财务结账日：</th>
							 	<td>
							 		<input class="easyui-datebox ipt"  name="accountSettleTimeStart" id="accountSettleTimeStart" data-options="maxDate:'accountSettleTimeEnd'"/>
							 	</td>
								<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
								<td>
									<input class="easyui-datebox ipt" name="accountSettleTimeEnd" id="accountSettleTimeEnd" data-options="minDate:'accountSettleTimeStart'"/>
								</td>
								<th>销售结账日：</th>
							 	<td>
							 		<input class="easyui-datebox ipt"  name="saleSettleTimeStart" id="saleSettleTimeStart" data-options="maxDate:'saleSettleTimeEnd'"/>
							 	</td>
								<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
								<td>
									<input class="easyui-datebox ipt" name="saleSettleTimeEnd" id="saleSettleTimeEnd" data-options="minDate:'saleSettleTimeStart'"/>
								</td>
							</tr>
						 </tbody>
						</table>
					</form>
				</div>
			</div>
			
		<#--列表-->
		<div  data-options="region:'center',border:false">
	     <div class="easyui-layout" data-options="fit:true" id="subLayout">
			 <#--工具栏   -->  
			<div data-options="region:'north',border:false">
				<@p.toolbar id="toolbar3" listData=[
					 {"id":"btn-insert","title":"新增行","iconCls":"icon-add-row", "action" : "editor.insertRow()", "type":0},
		             {"id":"btn-remove","title":"删除行","iconCls":"icon-del-row", "action" : "editor.deleteRow()","type":0},
		             {"id":"btn-save","title":"保存","iconCls":"icon-save", "action" : "editor.save()", "type":7}
		           ]
				/>
            </div>
            
        	<div data-options="region:'center',border:false" id="dataGridDiv">
		      <@p.datagrid id="settlePeriodDataGrid"  loadUrl="" saveUrl="" defaultColumn=""   
		              isHasToolBar="false" onClickRowEdit="false" pagination="true" checkOnSelect="true" selectOnCheck="true"
			           rownumbers="true" singleSelect="false"  
			           columnsJsonList="[
			                  	  {field : 'ck',checkbox:true,notexport:true},
			                  	  {field : 'id',hidden:true,notexport:true},
			                  	  {field : 'companyNo', title : '公司编码', align:'left',halign:'center',width : 80, 
			                  	  	editor:{
				                  		type:'company',
				                  		options:{
				                  			inputWidth:70,
				                  			id:'companyNo_',
				                  			name:'companyNo',
				                  			idField: 'companyNo',
											textField: 'companyNo',
											noField: 'name',
				                  			inputNoField:'companyName_',
				                  			required:true
				                  		}
				                  	}
				                  },
			                  	  {field : 'companyName', title : '公司名称', align:'left',halign:'center',width : 250, 
					                  editor:{
						                  type:'readonlybox',
						                  options:{
						                  	id:'companyName_',
						                  	name:'companyName',
						                  	required:true
						                  }
						              }
				                  },
				                  {field : 'supplierSettleTime',title : '厂商结账日',width: 100,align:'center',
					                  editor:{
										 type:'datebox',
										  options:{
										  	required:true
										  }
										}
								  },
				                  {field : 'transferSettleTime',title : '跨区结账日',width: 100,align:'center',
					                  editor:{
											 type:'datebox',
											 options:{
											 	required:true
											  }
											}
								  },
				                  {field : 'accountSettleTime',title : '财务结账日',width: 100,align:'center',
					                  editor:{
											 type:'datebox',
											 options:{
											 	required:true
											  }
											}
								  },
				                  {field : 'saleSettleTime',title : '销售结账日',width: 100,align:'center',
					                  editor:{
											 type:'datebox',
											 options:{
											 	required:true
											  }
											}
								  },
						          {field : 'remark',title : '备注',width: 200,align:'left',halign:'center',
						          	editor:{
				                  		type:'validatebox'
				                  	}
						          },
				                  {field : 'createUser',title : '创建人',width: 100,align:'center'},
				                  {field : 'createTime',title : '创建时间',width: 150,align:'center'},
				                  {field : 'updateUser',title : '修改人',width: 100,align:'center'},
				                  {field : 'updateTime',title : '修改时间',width: 150,align:'center'}
			              ]" 
				         jsonExtend='{
					         onDblClickRow:function(rowIndex, rowData){
				           	  		 editor.editRow(rowIndex, rowData);
			             			}
			             }'/>
			</div>
		</div>
   </div>
</body>
</html>
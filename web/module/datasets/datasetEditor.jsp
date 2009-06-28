<%@ include file="/WEB-INF/template/include.jsp"%>
<openmrs:require privilege="Manage Reports" otherwise="/login.htm" redirect="/module/reporting/index.htm" />
<%@ include file="../localHeader.jsp"%>

<!-- Wufoo Forms -->
<link type="text/css" href="${pageContext.request.contextPath}/moduleResources/reporting/css/wufoo/structure.css" rel="stylesheet"/>
<link type="text/css" href="${pageContext.request.contextPath}/moduleResources/reporting/css/wufoo/form.css" rel="stylesheet"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/reporting/scripts/wufoo/wufoo.js"></script>

<!-- JQuery DataTables -->
<link type="text/css" href="${pageContext.request.contextPath}/moduleResources/reporting/css/jquery.dataTables/page.css" rel="stylesheet"/>
<link type="text/css" href="${pageContext.request.contextPath}/moduleResources/reporting/css/jquery.dataTables/table.css" rel="stylesheet"/>
<link type="text/css" href="${pageContext.request.contextPath}/moduleResources/reporting/css/jquery.dataTables/custom.css" rel="stylesheet"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/reporting/scripts/jquery.dataTables/jquery.dataTables.js"></script>

<!-- JQuery Autocomplete -->
<link type="text/css" href="${pageContext.request.contextPath}/moduleResources/reporting/css/jquery.autocomplete/jquery.autocomplete.css" rel="stylesheet"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/reporting/scripts/jquery.autocomplete/jquery.js"></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/moduleResources/reporting/scripts/jquery.autocomplete/thickbox-compressed.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/moduleResources/reporting/scripts/jquery.autocomplete/jquery.bgiframe.min.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/moduleResources/reporting/scripts/jquery.autocomplete/jquery.ajaxQueue.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/moduleResources/reporting/scripts/jquery.autocomplete/jquery.autocomplete.js'></script>

<!-- JQuery UI -->
<link type="text/css" href="${pageContext.request.contextPath}/moduleResources/reporting/css/jquery.ui-1.6/ui.all.css" rel="stylesheet"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/reporting/scripts/jquery.ui-1.6/jquery-ui-1.6.custom.min.js"></script>


<script type="text/javascript" charset="utf-8">
$(document).ready(function() {
	$('#dataset-column-table').dataTable( {
		"bPaginate": false,
		"bLengthChange": false,
		"bFilter": false,
		"bSort": false,
		"bInfo": false,
		"bAutoWidth": false
		//"sDom": '<"top"i>rt<"bottom"flp<"clear">'
	} );

	$('#dataset-tabs').tabs();
	$('#dataset-tabs').show();

	
} );
</script>


<div id="page">
	<div id="container">

		<h1>Dataset Editor</h1>
	
	
		<div id="dataset-tabs" class="ui-tabs-hide">			
			<ul>
                <li><a href="#dataset-tabs-details"><span>Details</span></a></li>
                <li><a href="#dataset-tabs-columns"><span>Columns</span></a></li>
            </ul>
		</div>
		
		<div id="dataset-tabs-details">
	
			<form id="datasetForm" name="datasetForm" class="wufoo topLabel" autocomplete="off"
				method="post" action="${pageContext.request.contextPath}/module/reporting/saveDataset.form">
		
				<input type="hidden" id="uuid" name="uuid" value="${dataSetDefinition.uuid}"/>
	
	
				<div id="datasetDetails">
					<ul>		
						<li>
							<label class="desc" for="uuid">ID</label>
							<span>${dataSetDefinition.uuid}</span>
						</li>				
						<li>
							<label class="desc" for="type">Type</label>
							<span>${dataSetDefinition.class.simpleName}</span>
						</li>				
						<li>
							<label class="desc" for="name">Name</label>
							<input id="name" name="name" type="text" class="field text large" 
								value="${dataSetDefinition.name}" size="20" tabindex="1" />
						</li>				
						<li>		
							<label class="desc" for="description">Description</label>
							<textarea id="description" name="description" class="field textarea small" 
								rows="10" cols="20" tabindex="2">${dataSetDefinition.description}</textarea>				
						</li>
						<li class="buttons">
							<input id="saveForm" class="btTxt submit" type="submit" value="Save" tabindex="3" />
							<input id="saveForm" class="btTxt submit" type="submit" value="Cancel" tabindex="4"/>
						</li>
					</ul>
				</div>
			</form>
		</div>
		
		<div id="dataset-tabs-columns">	
			<div id="datasetColumns" style="overflow: auto;">
				<h1>Dataset Columns</h1>
				<table id="dataset-column-table" class="display">
					<thead>
						<tr>
							<th width="5%">Delete</th>
							<th>Column</th>
							<th>Data Type</th>
						</tr>
					</thead>
					<tbody>					
						<c:forEach var="column" items="${dataSetDefinition.columns}" varStatus="status">				
							<tr>
								<td><input type="checkbox" name="deleteColumn" value="${column.columnName}"></td>
								<td>${column.columnName}</td>
								<td>${column.dataType}</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
					</tfoot>
				</table>
			</div>
			<div align="center">
				<button name="button1" disabled>Add Column</button>
				<button name="button1" disabled>Remove Selected</button>
				<button name="button1" onclick="location.href='${pageContext.request.contextPath}/module/reporting/showDatasetPreview.form?uuid=${dataSetDefinition.uuid}&id=${dataSetDefinition.id}&className=${dataSetDefinition.class.name}'">Preview Data</button>	
			</div>

		</div>


	</div>
</div>


<%@ include file="/WEB-INF/template/footer.jsp"%>
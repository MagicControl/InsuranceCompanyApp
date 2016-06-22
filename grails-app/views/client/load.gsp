<!doctype html>
<html>
<head>
    <asset:stylesheet src="bootstrap.css"/>
    <asset:stylesheet src="styles.css"/>
    <asset:javascript src="jquery-2.2.0.min.js"/>
    <asset:javascript src="fileUploader"/>
</head>
<body>
<g:render template="/layouts/header"/>
<div class="container">

    <p>
        Please select *.csv file to upload client data
    </p>
    <p><label class="btn btn-default btn-file">
        Browse <input id="uploadFile" type="FILE" name="csvFile" style="display:none" accept=".csv">
    </label></p>
    <p class="clients-loaded"></p>
    <p class="error"></p>
</div>
</body>
</html>
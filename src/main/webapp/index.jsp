
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%



    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    // the webapi comes from the web xml jersey servlet 
    String swaggerUIPath = basePath+"webapi/api-docs";
%>


<!DOCTYPE html>
<html>
<head>
  <title>Swagger UI</title>
  <link href='https://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'/>
  <link href='css/highlight.default.css' media='screen' rel='stylesheet' type='text/css'/>
  <link href='css/screen.css' media='screen' rel='stylesheet' type='text/css'/>
  <script type="text/javascript" src="lib/shred.bundle.js"></script>
  <script src='lib/jquery-1.8.0.min.js' type='text/javascript'></script>
  <script src='lib/jquery.slideto.min.js' type='text/javascript'></script>
  <script src='lib/jquery.wiggle.min.js' type='text/javascript'></script>
  <script src='lib/jquery.ba-bbq.min.js' type='text/javascript'></script>
  <script src='lib/handlebars-1.0.0.js' type='text/javascript'></script>
  <script src='lib/underscore-min.js' type='text/javascript'></script>
  <script src='lib/backbone-min.js' type='text/javascript'></script>
  <script src='lib/swagger.js' type='text/javascript'></script>
  <script src='lib/swagger-ui.js' type='text/javascript'></script>
  <script src='lib/highlight.7.3.pack.js' type='text/javascript'></script>
  <script type="text/javascript">
    $(function () {
      window.swaggerUi = new SwaggerUi({
      url: "<%= swaggerUIPath %>",
      dom_id: "swagger-ui-container",
      supportedSubmitMethods: ['get', 'post', 'put', 'delete'],
      onComplete: function(swaggerApi, swaggerUi){
        log("Loaded SwaggerUI")
        $('pre code').each(function(i, e) {hljs.highlightBlock(e)});
      },
      onFailure: function(data) {
        log("Unable to Load SwaggerUI");
      },
      docExpansion: "none"
    });

    $('#input_apiKey').change(function() {
      var key = $('#input_apiKey')[0].value;
      log("key: " + key);
      if(key && key.trim() != "") {
        log("added key " + key);
        window.authorizations.add("key", new ApiKeyAuthorization("api_key", key, "query"));
      }
    })
    window.swaggerUi.load();
  });

  </script>
</head>

<body>
 

<div id="message-bar" class="swagger-ui-wrap">
  &nbsp;
</div>

<div id="swagger-ui-container" class="swagger-ui-wrap">

</div>

</body>

</html>

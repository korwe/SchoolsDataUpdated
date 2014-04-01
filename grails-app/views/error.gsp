<!DOCTYPE html>
<html>
	<head>
		<title><g:if env="development">Oops</g:if><g:else>Error</g:else></title>
        <meta name="layout" content="iframe">
		<g:if env="development"><link rel="stylesheet" href="${resource(dir: 'css', file: 'errors.css')}" type="text/css"></g:if>
	</head>
	<body>
			<ul class="errors">
                <img align="center"  width="100%" src="${resource(dir: 'images', file: 'genericErrorScreen.png')}">
				<li>An error has occurred - please contact <a href="mailto:schoolsAdvisor.support@korwe.com">Support</a></li>
			</ul>
          <%--  <g:if env="development">
                <g:renderException exception="${exception}" />
            </g:if>
            <g:else>
		</g:else>--%>
	</body>
</html>

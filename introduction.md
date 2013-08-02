# Introduction

Since Rudder 2.7.0, We have added a Rest API to Rudder. That API Allow you to interact with Rudder without using the webapp.

<span id="api-_-Authentication"/>
## Authentication


To allow usage of that API, you need to be authenticated. Rudder may contains capital informations about your IT, and we don't want those informations to be public.

You need to be authenticated using an API Account. Those accounts can be created in Rudder, the 'API Accounts' page located inside the Administration part.

<p><img title="Rudder API Settings page" alt="Rudder API page" src="img/APISettings.png" class="RudderImage"></p>

Once you have created an API Account, you can now use the API. A token is generated for all accounts and you will need that token to authenticate while using the API.

For any call to API, you will need to add a **_X-API-Token_** header to your request.

<pre class="language-json"><code>curl -X GET -H <span class="str">"X-API-Token: yourToken"</span> http://serverRudder/rudder/api/2/rules</code></pre>

If you perform any action (Creation,Update,Deletion) using the API, the event log generated will have the API account as actor.

<span id="api-_-Versioning"/>
## Versioning

The API will be extended with new features, new functions, new parameters, new response. When there will be new things about the API, we will create a new version of the API. This will allow you to keep your existing scripts (based on previous behavior).

We added two ways to choose API version used:

* In URL : Each URL has can be prefixed by the version you want to use */api/version/function*. version will be integers. there is one exeception, if you want to use the latest version, use *latest* as version

<pre class="language-json"><code><span class="com"># Version 2</span>
curl -X GET -H <span class="str">"X-API-Token: yourToken"</span> http://serverRudder/rudder/api/<span class="kwd">2</span>/rules
<span class="com"># Latest</span>
curl -X GET -H <span class="str">"X-API-Token: yourToken"</span> http://serverRudder/rudder/api/<span class="kwd">latest</span>/rules
<span class="com"># Wrong => 404 not found</span>
curl -X GET -H <span class="str">"X-API-Token: yourToken"</span> http://serverRudder/rudder/api/<span class="kwd">3.14</span>/rules
</code></pre>

* In a header. You can add the **_X-API-Version_** header to your request. The value needs to be an integer. If you use a wrong version you will get a message telling you which version is available

<pre class="language-json"><code><span class="com"># Version 2</span>
curl -X GET <span class="str">"X-API-Token: yourToken"</span> <span class="str">"X-API-Version: <span class="kwd">2</span>" http://serverRudder/rudder/api/rules</span>
<span class="com"># Wrong => Error response indicating which version is available</span>
curl -X GET <span class="str">"X-API-Token: yourToken"</span> <span class="str">"X-API-Version: <span class="kwd">3.14</span>" http://serverRudder/rudder/api/rules</span>
</code></pre>

We may declare some versions as deprecated, in order to remove them in a later version of Rudder, but we will never remove any version without warning

<span id="api-_-Response"/>
## Response format

We defined a generic response format for any result from the API, both Errors and Success are based on the same model. The answer is embedded in a JSON

<pre class="language-json"><code>{
  <span class="str">"action"</span> : <span class="tag">The name of the function that you have called</span>,
  <span class="str">"id"</span> : <span class="tag">The ID of the element you want, missing if not relevant</span>,
  <span class="str">"result"</span> : <span class="tag">The result of your action : <span class="kwd">success</span> or <span class="kwd">error</span></span>,
  <span class="str">"data"</span> : <span class="tag">Only present if this is a <span class="kwd">success</span> and depends on the function, it's usually a JSON object</span>,
  <span class="str">"errorDetails"</span> : <span class="tag">Only present if there is an <span class="kwd">error</span>, it contains the error message</span>
}
</code></pre>

* __Success__ Response are sent with the 200 HTTP code
* __Error__ Response are sent with an Error HTTP code (mostly 5xx ...)

<span id="api-_-HTTP"/>
## HTTP method

Rudder API is based on the usage of HTTP methods (http://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html). We use them indicate what action will be done by the request. For now we use 4 of them : 

* **GET**: look for informations (get Rule Details, get a Group, ...)
* **PUT**: Add a new data (Create a Directive, Clone a Rule, ...)
* **DELETE**: Remove datas (Delete a Node, Delete a Parameter, ...)
* **POST**: Update datas (Update a Directive, Reaload a Group, ...)

<span id="api-_-Parameters"/>
## Parameters

To use Rudder API, you will need to pass datas to the API. Most of them depends of the function and will be described with their function. Some exists for almost all functions and they are describe below.

### Passing parameters

Passing parameters to the API can take three forms:
* As part of the URL
* As request Parameters
* Embedded in JSON

#### As part of the URL

Parameters in URL are used to indicate which data you want to interact with. The function will not work if this data is missing.

<pre class="language-json"><code><span class="com"># Get the Rule of ID "id"</span>
curl http://serverRudder/<span class="tag">/api/rules/</span><span class="kwd">id</span>
</code></pre>

#### Request parameters

In most cases, datas will be sent using request parameters. for each data you want to change, you need to pass one parameter.

Parameters follow the following schema : 

<pre class="language-json"><code><span class="kwd">key</span>=<span class="tag">value</span></code></pre>

 You can pass parameter by two means : 

* As URL parameters: At the end of your url, put a **?** then your first parameter and then a **&** before next parameters

<pre class="language-json"><code><span class="com"># Update the Rule 'id' with a new name, disabled, and setting it one directive </span>
curl -X POST -H <span class="str">"X-API-Token: yourToken"</span>  http://serverRudder/api/rules/2/id<span class="kwd">?</span><span class="tag">"displayName=my new name"</span><span class="kwd">&</span><span class="tag">"enabled=false"</span><span class="kwd">&</span><span class="tag">"directives=aDirectiveId"</span>
</code></pre>

* As request data: You can pass those parameters in the request data, they won't figure in the URL, making it lighter to read, You can pass a file that contains datas

<pre class="language-json"><code><span class="com"># Update the Rule 'id' with a new name, disabled, and setting it one directive (in file directiveId) </span>
curl -X POST -H <span class="str">"X-API-Token: yourToken"</span> http://serverRudder/api/rules/2/id <span class="kwd">-d</span> <span class="tag">"displayName=my new name"</span> <span class="kwd">-d</span> <span class="tag">"enabled=false"</span> <span class="kwd">-d</span> <span class="tag">@directiveId</span>
</code></pre>

#### Embedded in Json

Instead of passing parameters one by one, you pass only one JSON object containing all your datas. You'll also have to set *Content-Type* header to **application/json** (without it the JSON won't be read)

Contrary to request parameters, datas needs to be typed : string needs quotes, bollean/int don't

the (prettified) format is : 

<pre class="language-json"><code>{
  <span class="str">"key1"</span> : <span class="tag">"value1"</span>,
  <span class="str">"key2"</span> : <span class="tag">false</span>,
  <span class="str">"key3"</span> : <span class="tag">42</span>
}
</code></pre>

 Here is an example with an inlined data :  

<pre class="language-json"><code><span class="com"># Update the Rule 'id' with a new name, disabled, and setting it one directive </span>
curl -X POST -H <span class="str">"X-API-Token: yourToken"</span> -H <span class="str">"Content-Type: application/json"</span> http://serverRudder/api/rules/2/id <span class="kwd">-d</span> <span class="tag">'{ <span class="str">"displayName"</span> : <span class="str">"new name"</span>, <span class="str">"enabled"</span> : <span class="kwd">false</span>, <span class="str">"directives"</span> : <span class="str">"directiveId"</span>}'</span>
</code></pre>

You can also pass a file containing the json: 

<pre class="language-json"><code><span class="com"># Update the Rule 'id' with a new name, disabled, and setting it one directive </span>
curl -X POST -H <span class="str">"X-API-Token: yourToken"</span> -H <span class="str">"Content-Type: application/json"</span> http://serverRudder/api/rules/2/id <span class="kwd">-d</span> <span class="tag">@jsonParam</span>
</code></pre>

Note that some parameters cannot be passed in a JSON (general parameters, it will be precised when necessary), and you will need to pass them a URL parameters if you want them to be taken into account (you can't mix JSON and request parameters)

<pre class="language-json"><code><span class="com"># Update the Rule 'id' with a new name, disabled, and setting it one directive with reason message "Reason used" </span>
curl -X POST -H <span class="str">"X-API-Token: yourToken"</span> -H <span class="str">"Content-Type: application/json"</span> "http://serverRudder/api/rules/2/id<span class="tag">?reason=Reason used"</span> -d @jsonParam <span class="kwd">-d "reason=Reason ignored"</span>
</code></pre>

### General parameters

Some parameters are available for almost all API functions. They will be described in this section. All of them cannot be used in JSON parameters, and will need to be passed as request parameters



#### Available for all requests

<table>
				<thead>
					<tr>
						<th style="width: 30%">Field</th>
						<th style="width: 10%">Type</th>
						<th style="width: 70%">Description</th>
					</tr>
				</thead>
				<tbody>
			
					<tr>
						<td class="code">prettify <span class="label label-optional">Optional</span></td>
						<td>Boolean</td>
					<td>
					  Determine if the answer should be prettified (human friendly) or not 
						<p class="default-value">Default value: <code>false</code></p>
						
					</td>
					</tr>
			
				</tbody>
			</table>


#### Available for modification requests (PUT/POST/DELETE)

<table>
				<thead>
					<tr>
						<th style="width: 30%">Field</th>
						<th style="width: 10%">Type</th>
						<th style="width: 70%">Description</th>
					</tr>
				</thead>
				<tbody>
			
					<tr>
						<td class="code">reason <span class="label label-optional">See description </span></td>
						<td>String</td>
					<td>
					  Set the change message. If you set the reason message to be mandatory in /opt/rudder/etc/rudder-web.property (property rudder.ui.changeMessage.mandatory)
						<p class="default-value">Default value: <code>an empty string</code></p>
						
					</td>
					</tr>	

					<tr>
						<td class="code">changeRequestName <span class="label label-optional">Optional</span></td>
						<td>String</td>
					<td>
					  Set the change request name, won't be used if workflow are disabled. The default value depends on the function called
						<p class="default-value">Default value: <code>A default String for each function</code></p>
						
					</td>
					</tr>

					<tr>
						<td class="code">changeRequestDescription <span class="label label-optional">Optional </span></td>
						<td>String</td>
					<td>
					  Set the change request description, won't be used if workflow are disabled.
						<p class="default-value">Default value: <code>an empty string</code></p>
						
					</td>
					</tr>
			
				</tbody>
			</table>

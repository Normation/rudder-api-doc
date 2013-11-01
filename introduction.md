# Introduction

In Rudder 2.7.0, a Rest API was added. This API allows you to interact with Rudder without using the webapp, for example via scripts or cronjobs.

<span id="api-_-Authentication"/>
## Authentication


To use the API, you need to be authenticated. Rudder may contain capital information about your IT, and we don't want that information to be public, do we?

Authentication is done via a dedicated API Account. Those accounts can be created in Rudder, on the 'API Accounts' page located inside the Administration part. API Accounts are not connected to standard user accounts, and are currently global, accessible by admins only.

<p><img title="Rudder API Settings page" alt="Rudder API page" src="img/APISettings.png" class="RudderImage"></p>

Once you have created an API Account, you can now use the API. A token is generated for each account which you will need to authenticate.

For any call to API, you will need to add a **_X-API-Token_** header to your request.

<pre class="language-json"><code>curl -X GET -H <span class="str">"X-API-Token: yourToken"</span> http://rudder.example.com/rudder/api/2/rules</code></pre>

If you perform any action (Creation, Update, Deletion) using the API, the event log generated will record the API account as the actor.

<span id="api-_-Versioning"/>
## Versioning

Each time the API is extended with new features (new functions, new parameters, new responses, ...), we will increment the version number of the API. This will allow you to keep your existing scripts (based on previous behavior). Versions will always be integers (no 2.1 or 3.3, just 2, 3, 4, ...).

The initial REST API is numbered 2, to differentiate it with the partial API already avaiable. One notable exeception is the magic *latest* version, which will always point to the most recent version available (use at your own risk!) (note that this "magic" version is currently only supported in the URL access described below, not via the **_X-API-Version_** header - see http://www.rudder-project.org/redmine/issues/3817).

We added two ways to choose API version used:

* By URL: each URL can be prefixed by the version you want to use, like */api/version/function*. 

<pre class="language-json"><code><span class="com"># Version 2</span>
curl -X GET -H <span class="str">"X-API-Token: yourToken"</span> http://rudder.example.com/rudder/api/<span class="kwd">2</span>/rules
<span class="com"># Latest</span>
curl -X GET -H <span class="str">"X-API-Token: yourToken"</span> http://rudder.example.com/rudder/api/<span class="kwd">latest</span>/rules
<span class="com"># Wrong => 404 not found</span>
curl -X GET -H <span class="str">"X-API-Token: yourToken"</span> http://rudder.example.com/rudder/api/<span class="kwd">3.14</span>/rules
</code></pre>

* By header. You can add the **_X-API-Version_** header to your request. The value needs to be an integer. If you use a wrong version you will get a message telling you which version is available

<pre class="language-json"><code><span class="com"># Version 2</span>
curl -X GET -H <span class="str">"X-API-Token: yourToken"</span> -H <span class="str">"X-API-Version: <span class="kwd">2</span>" http://rudder.example.com/rudder/api/rules</span>
<span class="com"># Wrong => Error response indicating which version is available</span>
curl -X GET -H <span class="str">"X-API-Token: yourToken"</span> -H <span class="str">"X-API-Version: <span class="kwd">3.14</span>" http://rudder.example.com/rudder/api/rules</span>
</code></pre>

In the future, we may declare some versions as deprecated, in order to remove them in a later version of Rudder, but we will never remove any versions without warning, or without leaving a significant period to allow time for migration.

<span id="api-_-Response"/>
## Response format

All responses from the API follow the same generic format. Both Errors and Success are based on the same model. All responses are in JSON format.

<pre class="language-json"><code>{
  <span class="str">"action"</span>: <span class="tag">The name of the called function</span>,
  <span class="str">"id"</span>: <span class="tag">The ID of the element you want, if relevant</span>,
  <span class="str">"result"</span>: <span class="tag">The result of your action: <span class="kwd">success</span> or <span class="kwd">error</span></span>,
  <span class="str">"data"</span>: <span class="tag">Only present if this is a <span class="kwd">success</span> and depends on the function, it's usually a JSON object</span>,
  <span class="str">"errorDetails"</span>: <span class="tag">Only present if this is an <span class="kwd">error</span>, it contains the error message</span>
}
</code></pre>

* __Success__ responses are sent with the 200 HTTP code
* __Error__ responses are sent with an Error HTTP code (mostly 5xx ...)

<span id="api-_-HTTP"/>
## HTTP method

Rudder's REST API is based on the usage of HTTP verbs (http://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html). We use them to indicate what action will be done by the request. Currently, we use four of them: 

* **GET**: search or retrieve information (get Rule Details, get a Group, ...)
* **PUT**: add new objects (Create a Directive, Clone a Rule, ...)
* **DELETE**: remove objects (Delete a Node, Delete a Parameter, ...)
* **POST**: update exsiting objects (Update a Directive, Reload a Group, ...)

<span id="api-_-Parameters"/>
## Parameters

To use Rudder API, you will need to pass data to the API. Most of them depends on the called function and will be described below, in the corresponding function's section. Some exist for almost all functions and they are described here:

### Passing parameters

Passing parameters to the API can take three forms:
* As part of the URL
* As request Parameters
* Embedded in JSON

#### As part of the URL

Parameters in URLs are used to indicate which data you want to interact with. The function will not work if this data is missing.

<pre class="language-json"><code><span class="com"># Get the Rule of ID "id"</span>
curl -H <span class="str">"X-API-Token: yourToken"</span> http://rudder.example.com/<span class="tag">api/2/rules/</span><span class="kwd">id</span>
</code></pre>

#### Request parameters

In most cases, data will be sent using request parameters. for all data you want to change, you need to pass one parameter.

Parameters follow the following schema: 

<pre class="language-json"><code><span class="kwd">key</span>=<span class="tag">value</span></code></pre>

 You can pass parameters by two means: 

* As URL parameters: At the end of your url, put a **?** then your first parameter and then a **&** before next parameters

<pre class="language-json"><code><span class="com"># Update the Rule 'id' with a new name, disabled, and setting it one directive </span>
curl -X POST -H <span class="str">"X-API-Token: yourToken"</span>  http://rudder.example.com/api/rules/2/id<span class="kwd">?</span><span class="tag">"displayName=my new name"</span><span class="kwd">&</span><span class="tag">"enabled=false"</span><span class="kwd">&</span><span class="tag">"directives=aDirectiveId"</span>
</code></pre>

* As request data: You can pass those parameters in the request data, they won't figure in the URL, making it lighter to read, You can pass a file that contains data.

<pre class="language-json"><code><span class="com"># Update the Rule 'id' with a new name, disabled, and setting it one directive (in file directive-info.json) </span>
curl -X POST -H <span class="str">"X-API-Token: yourToken"</span> http://rudder.example.com/api/rules/2/id <span class="kwd">-d</span> <span class="tag">"displayName=my new name"</span> <span class="kwd">-d</span> <span class="tag">"enabled=false"</span> <span class="kwd">-d</span> <span class="tag">@directive-info.json</span>
</code></pre>

#### Embedded in JSON

Instead of passing parameters one by one, you pass only one JSON object containing all your datas. You'll also have to set the *Content-Type* header to **application/json** (without it the JSON content will be ignored).

Contrary to request parameters, datas needs to be typed: strings need quotes, booleans and integers don't.

The (prettified) format is: 

<pre class="language-json"><code>{
  <span class="str">"key1"</span>: <span class="tag">"value1"</span>,
  <span class="str">"key2"</span>: <span class="tag">false</span>,
  <span class="str">"key3"</span>: <span class="tag">42</span>
}
</code></pre>

 Here is an example with an inlined data:  

<pre class="language-json"><code><span class="com"># Update the Rule 'id' with a new name, disabled, and setting it one directive </span>
curl -X POST -H <span class="str">"X-API-Token: yourToken"</span> -H <span class="str">"Content-Type: application/json"</span> http://rudder.example.com/api/rules/2/id <span class="kwd">-d</span> <span class="tag">'{ <span class="str">"displayName"</span>: <span class="str">"new name"</span>, <span class="str">"enabled"</span>: <span class="kwd">false</span>, <span class="str">"directives"</span>: <span class="str">"directiveId"</span>}'</span>
</code></pre>

You can also pass a file containing the JSON: 

<pre class="language-json"><code><span class="com"># Update the Rule 'id' with a new name, disabled, and setting it one directive </span>
curl -X POST -H <span class="str">"X-API-Token: yourToken"</span> -H <span class="str">"Content-Type: application/json"</span> http://rudder.example.com/api/rules/2/id <span class="kwd">-d</span> <span class="tag">@jsonParam</span>
</code></pre>

Note that some parameters cannot be passed in a JSON (general parameters, it will be precised when necessary), and you will need to pass them a URL parameters if you want them to be taken into account (you can't mix JSON and request parameters)

<pre class="language-json"><code><span class="com"># Update the Rule 'id' with a new name, disabled, and setting it one directive with reason message "Reason used" </span>
curl -X POST -H <span class="str">"X-API-Token: yourToken"</span> -H <span class="str">"Content-Type: application/json"</span> "http://rudder.example.com/api/rules/2/id<span class="tag">?reason=Reason used"</span> -d @jsonParam <span class="kwd">-d "reason=Reason ignored"</span>
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
					  Determine if the answer should be prettified (human friendly) or not. We recommend using this for debugging purposes, but not for general script usage as this does add some uncessary load on the server side.
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

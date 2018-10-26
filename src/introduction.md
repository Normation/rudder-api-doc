# Introduction

Rudder exposes a REST API, enabling the user to interact with Rudder without using the webapp, for example in scripts or cronjobs.

<span id="api-_-Authentication"/>
## Authentication

Authenticating against the API is mandatory for every request, as sensitive information like inventories or configuration rules may get exposed.

It is done using a dedicated API Account, than can be created in the web interface on the 'API Accounts' page located inside the Administration part.

API Accounts are not linked to standard user accounts, and currently give full administrative privileges: they must be secured adequately.

<p><img title="Rudder API Settings page" alt="Rudder API page" src="img/APISettings.png" class="RudderImage"></p>

Once you have created an API account, you get a token that will be needed to authenticate every request. This token is the API equivalent of a password, and must
be secured just like a password would be.

On any call to the API, you will need to add a **_X-API-Token_** header to your request to authenticate:

<pre class="language-json"><code>curl -X GET -H <span class="str">"X-API-Token: yourToken"</span> http://rudder.example.com/rudder/api/latest/rules</code></pre>

If you perform any action (Creation, Update, Deletion) using the API, the event log generated will record the API account as the user.

<span id="api-_-Versioning"/>
## Versioning

Each time the API is extended with new features (new functions, new parameters, new responses, ...), it will be assigned a new version number. This will allow you
to keep your existing scripts (based on previous behavior). Versions will always be integers (no 2.1 or 3.3, just 2, 3, 4, ...) or "latest".

The versions start with version 2, since version 1 used to be a non-REST basic API for internal purposes. A notable exception is the *latest* version, which will always point to the most recent version available.

You can change the version of the API used by setting it either within the url or in a header:

* the URL: each URL is prefixed by its version id, like */api/version/function*.

<pre class="language-json"><code><span class="com"># Version 5</span>
curl -X GET -H <span class="str">"X-API-Token: yourToken"</span> http://rudder.example.com/rudder/api/<span class="kwd">2</span>/rules
<span class="com"># Latest</span>
curl -X GET -H <span class="str">"X-API-Token: yourToken"</span> http://rudder.example.com/rudder/api/<span class="kwd">latest</span>/rules
<span class="com"># Wrong (not an integer) => 404 not found</span>
curl -X GET -H <span class="str">"X-API-Token: yourToken"</span> http://rudder.example.com/rudder/api/<span class="kwd">3.14</span>/rules
</code></pre>

* the HTTP headers. You can add the **_X-API-Version_** header to your request. The value needs to be an integer or "latest".

<pre class="language-json"><code><span class="com"># Version 2</span>
curl -X GET -H <span class="str">"X-API-Token: yourToken"</span> -H <span class="str">"X-API-Version: <span class="kwd">2</span>" http://rudder.example.com/rudder/api/rules</span>
<span class="com"># Wrong => Error response indicating which versions are available</span>
curl -X GET -H <span class="str">"X-API-Token: yourToken"</span> -H <span class="str">"X-API-Version: <span class="kwd">3.14</span>" http://rudder.example.com/rudder/api/rules</span>
</code></pre>

In the future, we may declare some versions as deprecated, in order to remove them in a later version of Rudder, but we will never remove any versions without warning, or without a safe
period of time to allow migration from previous versions.

<h4>Existing versions</h4>
<table>
  <thead>
    <tr>
      <th style="width: 20%">Version</th>
      <th style="width: 20%">Rudder versions it appeared in</th>
      <th style="width: 70%">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td class="code">1</td>
      <td class="code">Never released (for internal use only)</td>
      <td>Experimental version</td>
    </tr>
    <tr>
      <td class="code">2 (deleted)</td>
      <td class="code">2.7</td>
      <td>First working version with support for rules, directives, nodes and global parameters</td>
    </tr>
    <tr>
      <td class="code">3 (deleted)</td>
      <td class="code">2.8</td>
      <td>Add change request support</td>
    </tr>
    <tr>
      <td class="code">4 (deprecated)</td>
      <td class="code">2.10</td>
      <td>Add inventory support on nodes</td>
    </tr>
    <tr>
      <td class="code">5 (deprecated)</td>
      <td class="code">3.0</td>
      <td>Allow empty query for groups, add key-values support on nodes</td>
    </tr>
    <tr>
      <td class="code">6</td>
      <td class="code">3.1</td>
      <td>Add compliance support</td>
    </tr>
    <tr>
      <td class="code">7</td>
      <td class="code">3.2</td>
      <td>Add 'level' option in compliance API</td>
    </tr>
    <tr>
      <td class="code">8</td>
      <td class="code">4.0</td>
      <td>Add 'applyPolicy' for nodes and new settings API</td>
    </tr>
    <tr>
      <td class="code">8</td>
      <td class="code">4.1</td>
      <td>Add tags on directive and rules</td>
    </tr>
    <tr>
      <td class="code">9</td>
      <td class="code">Plugin datasource (4.1 and more)</td>
      <td>Add 'datasource' API, trigger datasource fetch for node</td>
    </tr>
    <tr>
      <td class="code">9</td>
      <td class="code">4.2</td>
      <td>Add internal 'ncf' API</td>
    </tr>
    <tr>
      <td class="code">10</td>
      <td class="code">4.3</td>
      <td>Add global compliance, Remove option to use Reverse DNS lookups from Settings API</td>
    </tr>
    <tr>
      <td class="code">11</td>
      <td class="code">5.0</td>
      <td>New system API (replacing old localhost v1 api): status, maintenance operations and server behavior</td>
    </tr>
 
  </tbody>
</table>

<span id="api-_-Response"/>
## Response format

All responses from the API are in the JSON format.

<pre class="language-json"><code>{
  <span class="str">"action"</span>: <span class="tag">The name of the called function</span>,
  <span class="str">"id"</span>: <span class="tag">The ID of the element you want, if relevant</span>,
  <span class="str">"result"</span>: <span class="tag">The result of your action: <span class="kwd">success</span> or <span class="kwd">error</span></span>,
  <span class="str">"data"</span>: <span class="tag">Only present if this is a <span class="kwd">success</span> and depends on the function, it's usually a JSON object</span>,
  <span class="str">"errorDetails"</span>: <span class="tag">Only present if this is an <span class="kwd">error</span>, it contains the error message</span>
}
</code></pre>

* __Success__ responses are sent with the 200 HTTP (Success) code
* __Error__ responses are sent with a HTTP error code (mostly 5xx ...)

### Non compliant data in response

We used to send reponse data that could not be used as parameter. This mostly concerns Boolean fields (like 'enabled', 'dynamic'), that were send in response prefixed by 'is', ie 'isEnabled'. This prevented usage of this data in request using this response as parameter. We harmonized response and parameters in versions 2.11.23, 3.11.12 and 3.2.5 of Rudder, by always sending unprefixed version. To be backward compatible, we added an option to send old data ('isXXX') in response. That option is disabled on new instance, and will be enabled on upgrade of existing servers.

<span id="api-_-HTTP"/>
## HTTP method

Rudder's REST API is based on the usage of HTTP methods (http://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html). We use them to indicate what action will be done by the request. Currently, we use four of them:

* **GET**: search or retrieve information (get Rule Details, get a Group, ...)
* **PUT**: add new objects (Create a Directive, Clone a Rule, ...)
* **DELETE**: remove objects (Delete a Node, Delete a Parameter, ...)
* **POST**: update existing objects (Update a Directive, Reload a Group, ...)

<span id="api-_-Parameters"/>
## Parameters

To use Rudder API, you may need to pass data attributes to the API. Most of them depends on the called function and will be described below, in the corresponding function's section. Some are common to almost all functions and are described here:

### Passing parameters

Parameters to the API can be sent:
* As part of the URL
* As request arguments
* Directly in JSON format

#### As part of the URL

Parameters in URLs are used to indicate which data you want to interact with. The function will not work if this data is missing.

<pre class="language-json"><code><span class="com"># Get the Rule of ID "id"</span>
curl -H <span class="str">"X-API-Token: yourToken"</span> http://rudder.example.com/rudder<span class="tag">/api/latest/rules/</span><span class="kwd">id</span>
</code></pre>

#### Request parameters

In most cases, data will be sent using request parameters. for all data you want to change, you need to pass one parameter.

Parameters follow the following schema:

<pre class="language-json"><code><span class="kwd">key</span>=<span class="tag">value</span></code></pre>

 You can pass parameters by two means:

* As URL parameters: At the end of your url, put a **?** then your first parameter and then a **&** before next parameters

<pre class="language-json"><code><span class="com"># Update the Rule 'id' with a new name, disabled, and setting it one directive </span>
curl -X POST -H <span class="str">"X-API-Token: yourToken"</span>  http://rudder.example.com/rudder/api/rules/latest/{id}<span class="kwd">?</span><span class="tag">"displayName=my new name"</span><span class="kwd">&</span><span class="tag">"enabled=false"</span><span class="kwd">&</span><span class="tag">"directives=aDirectiveId"</span>
</code></pre>

* As request data: You can pass those parameters in the request data, they won't figure in the URL, making it lighter to read, You can pass a file that contains data.

<pre class="language-json"><code><span class="com"># Update the Rule 'id' with a new name, disabled, and setting it one directive (in file directive-info.json) </span>
curl -X POST -H <span class="str">"X-API-Token: yourToken"</span> http://rudder.example.com/rudder/api/rules/latest/{id} <span class="kwd">-d</span> <span class="tag">"displayName=my new name"</span> <span class="kwd">-d</span> <span class="tag">"enabled=false"</span> <span class="kwd">-d</span> <span class="tag">@directive-info.json</span>
</code></pre>

#### Directly in JSON format

Instead of passing parameters one by one, you can instead supply a JSON object containing all you want to do. You'll also have to set the *Content-Type* header to **application/json** (without it the JSON content would be ignored).

The supplied file must contain a valid JSON: strings need quotes, booleans and integers don't, ...

The (human readable) format is:

<pre class="language-json"><code>{
  <span class="str">"key1"</span>: <span class="tag">"value1"</span>,
  <span class="str">"key2"</span>: <span class="tag">false</span>,
  <span class="str">"key3"</span>: <span class="tag">42</span>
}
</code></pre>

Here is an example with inlined data:

<pre class="language-json"><code><span class="com"># Update the Rule 'id' with a new name, disabled, and setting it one directive </span>
curl -X POST -H <span class="str">"X-API-Token: yourToken"</span> -H <span class="str">"Content-Type: application/json"</span> http://rudder.example.com/rudder/api/rules/latest/{id} <span class="kwd">-d</span> <span class="tag">'{ <span class="str">"displayName"</span>: <span class="str">"new name"</span>, <span class="str">"enabled"</span>: <span class="kwd">false</span>, <span class="str">"directives"</span>: <span class="str">"directiveId"</span>}'</span>
</code></pre>

You can also pass a supply the JSON in a file:

<pre class="language-json"><code><span class="com"># Update the Rule 'id' with a new name, disabled, and setting it one directive </span>
curl -X POST -H <span class="str">"X-API-Token: yourToken"</span> -H <span class="str">"Content-Type: application/json"</span> http://rudder.example.com/rudder/api/rules/latest/{id} <span class="kwd">-d</span> <span class="tag">@jsonParam</span>
</code></pre>

Note that some parameters cannot be passed in a JSON (general parameters, it will be precised when necessary), and you will need to pass them a URL parameters if you want them to be taken into account (you can't mix JSON and request parameters)

<pre class="language-json"><code><span class="com"># Update the Rule 'id' with a new name, disabled, and setting it one directive with reason message "Reason used" </span>
curl -X POST -H <span class="str">"X-API-Token: yourToken"</span> -H <span class="str">"Content-Type: application/json"</span> "http://rudder.example.com/rudder/api/rules/latest/{id}<span class="tag">?reason=Reason used"</span> -d @jsonParam <span class="kwd">-d "reason=Reason ignored"</span>
</code></pre>

### General parameters

Some parameters are available for almost all API functions. They will be described in this section.
They must be part of the request and can't be submit in a JSON form.

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
        Set a message to explain the change. If you set the reason messages to be mandatory in the web interface, failing to supply this value will lead to an error.
        <p class="default-value">Default value: <code>an empty string</code></p>
      </td>
    </tr>
    <tr>
      <td class="code">changeRequestName <span class="label label-optional">Optional</span></td>
      <td>String</td>
      <td>
        Set the change request name, is used only if workflows are enabled. The default value depends on the function called
        <p class="default-value">Default value: <code>A default String for each function</code></p>
      </td>
    </tr>
    <tr>
      <td class="code">changeRequestDescription <span class="label label-optional">Optional </span></td>
      <td>String</td>
      <td>
        Set the change request description, is used only if workflows are enabled.
        <p class="default-value">Default value: <code>an empty string</code></p>
      </td>
    </tr>
  </tbody>
</table>

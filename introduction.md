# Introduction

Since Rudder 2.7.0, We have added a Rest API to Rudder. That API Allow you to interact with Rudder without using the webapp.

## Authentication

To allow usage of that API, you need to be authenticated. Rudder may contains capital informations about your IT, and we don't want those informations to be public.

You need to be authenticated using an API Account. Those accounts can be created in Rudder, the 'API Accounts' page located inside the Administration part.

![Rudder API page](../APISettings.png "Rudder API Settings page")

Once you have created an API Account, you can now use the API. A token is generated for all accounts and you will need that token to authenticate while using the API.

For any call to API, you will need to add a **_X-API-Token_** header to your request.

<pre><code>curl -X XXX http://serverRudder/rudder/api/function -H <span class="str">"X-API-Token: yourToken"</span></code></pre>

If you perform any action (Creation,Update,Deletion) using the API, the event log generated will have the API account as actor.

## Versioning

The API will be extended with new features, new functions, new parameters, new response. When there will be new things about the API, we will create a new version of the API. This will allow you to keep your existing scripts (based on previous behavior).

We added two ways to choose API version used:

* In URL : Each URL has can be prefixed by the version you want to use */api/version/function*. version will be integers. there is one exeception, if you want to use the latest version, use *latest* as version

<pre><code><span class="com"># Version 2</span>
curl -X XXX http://serverRudder/rudder/api/<span class="kwd">2</span>/function -H <span class="str">"X-API-Token: yourToken"</span>
<span class="com"># Latest</span>
curl -X XXX http://serverRudder/rudder/api/<span class="kwd">latest</span>/function -H <span class="str">"X-API-Token: yourToken"</span>
<span class="com"># Wrong => 404 not found</span>
curl -X XXX http://serverRudder/rudder/api/<span class="kwd">3.14</span>/function -H <span class="str">"X-API-Token: yourToken"</span>
</code></pre>

* In a header. You can add the **_X-API-Version_** header to your request. The value needs to be an integer. If you use a wrong version you will get a message telling you which version is available

<pre><code><span class="com"># Version 2</span>
curl -X XXX http://serverRudder/rudder/api/function -H <span class="str">"X-API-Token: yourToken"</span> -H <span class="str">"X-API-Version:<span class="kwd">2</span>"</span>
<span class="com"># Wrong => Error response indicating which version is available</span>
curl -X XXX http://serverRudder/rudder/api/function -H <span class="str">"X-API-Token: yourToken"</span> -H <span class="str">"X-API-Version:<span class="kwd">3.14</span>"</span>
</code></pre>

We may declare some versions as deprecated, in order to remove them in a later version of Rudder, but we will never remove any version without warning

## Response format

We defined a generic response format for any result from the API, both Errors and Success are based on the same model. The answer is embedded in a JSON

<pre><code>{
	<span class="str">"action"</span> : <span class="tag">The name of the function that you have called</span>
	<span class="str">"id"</span> : <span class="tag">The ID of the element you want, missing if not relevant</span>
	<span class="str">"result"</span> : <span class="tag">The result of your action : <span class="kwd">success</span> or <span class="kwd">error</span></span>
	<span class="str">"data"</span> : <span class="tag">Only present if this is a <span class="kwd">success</span> and depends on the function, it's usually a JSON object</span>
	<span class="str">"errorDetails"</span> : <span class="tag">Only present if there is an <span class="kwd">error</span>, it contains the error message</span>
}
</code></pre>

__Success__ Response are sent with the 200 HTTP code
__Error__ Response are sent with an Error HTTP code (mostly 5xx ...)


## Parameters

#### Passing parameters

##### As URL parameters

##### With a JSON file

#### General parameters

##### Prettify

##### Reason

##### Change request name

##### Change request description
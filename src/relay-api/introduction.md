# Introduction

Rudder relay exposes an internal REST API, enabling the agents and other services to interact with the relay.

<span id="api-_-Authentication"/>

## Authentication

The relay API are in general not authentified, and it is done on a case-by-case basis:

* remote-run is only accessible to request with the IP of the policy server
* shared-files checks file signature based on known public keys from nodes
* system API is only accessible to local clients and do not permit acess to
  private information not modification abilities

<span id="api-_-Versioning"/>

## Versioning

Each time the API is extended with new features (new functions, new parameters, new responses, ...), it will be assigned a new version number. This will allow you
to keep your existing scripts (based on previous behavior). Versions will always be integers (no 2.1 or 3.3, just 2, 3, 4, ...).

You can change the version of the API used by setting in the URL: each URL is prefixed by its version id, like */relay-api/version/function*.

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
      <td class="code">(none)</td>
      <td class="code">3.2</td>
      <td>Unversionned API providing remote-run, shared-files and shared-folder</td>
    </tr>
    <tr>
      <td class="code">1</td>
      <td class="code">6.0</td>
      <td>First relay API with a version</td>
    </tr>
  </tbody>
</table>

<span id="api-_-Response"/>

## Response format

All responses from the API are in the JSON format.

<pre class="language-json"><code>{
  <span class="str">"action"</span>: <span class="tag">The name of the called function</span>,
  <span class="str">"result"</span>: <span class="tag">The result of your action: <span class="kwd">success</span> or <span class="kwd">error</span></span>,
  <span class="str">"data"</span>: <span class="tag">Only present if this is a <span class="kwd">success</span> and depends on the function, it's usually a JSON object</span>,
  <span class="str">"errorDetails"</span>: <span class="tag">Only present if this is an <span class="kwd">error</span>, it contains the error message</span>
}
</code></pre>

* __Success__ responses are sent with the 200 HTTP (Success) code
* __Error__ responses are sent with a HTTP error code (mostly 5xx ...)

<span id="api-_-HTTP"/>

## HTTP method

Rudder's REST API is based on the usage of HTTP methods (http://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html). We use them to indicate what action will be done by the request. Currently, we use four of them:

* **GET**: search or retrieve information (get Rule Details, get a Group, ...)
* **POST**: update existing objects (Update a Directive, Reload a Group, ...)

<span id="api-_-Parameters"/>

## Parameters

To use Rudder API, you may need to pass data attributes to the API. Most of them depends on the called function and will be described below, in the corresponding function's section.


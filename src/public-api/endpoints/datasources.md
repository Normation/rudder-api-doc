
This file describes REST API v9 for data sources.

Corresponding code is available here:
https://github.com/Normation/rudder/blob/master/rudder-web/src/main/scala/com/normation/rudder/web/rest/DataSourceApi9.scala

/**
  @apiDefine datasourceId

  @apiParam (URL parameters) {String} id Unique identifier of the data source.
*/
/**
  @apiDefine nodeId

  @apiParam (URL parameters) {String} id Unique identifier of a node.
*/
/**
  @apiDefine Mono Mono valued parameters - Those parameters will only work with one value
*/
/**
  @apiDefine Multi Multi valued parameters - Those parameters need to be entered several times, they will add each other to form a list.
*/
/**
  @apiDefine RunConfig [JSON option for "runParameters"] Parameters to configure when the data source is fetched
*/
/**
  @apiDefine HTTP [JSON option for "parameters"] HTTP data source - Parameters used to configure a data source which fetches properties via HTTP queries. You can use Rudder variable expansion (${rudder.node, ${node.properties...}) in specified parameters.
*/
/**
  @apiDefine POSTseePUT For "Update" parameters, see "Create". Only id is not modifiable.
*/



[GET] api/datasources
-----------------

    /**
    @api {get} /api/datasources 1. List all DataSources
    @apiVersion 10.0.0
    @apiName getAllDataSources
    @apiGroup DataSources

    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X GET 'https://rudder.example.com/rudder/api/latest/datasources'

    @apiSuccessExample Success-Response:
    {
      "action": "getAllDataSources",
      "result": "success",
      "data": {
        "datasources": [
          {
            "name": "test-data-source-1",
            "id": "test-data-source-1",
            "description": "Data from http://jsonplaceholder.typicode.com",
            "type": {
              "name": "HTTP",
              "parameters": {
                "url": "http://jsonplaceholder.typicode.com/users/1",
                "headers": {},
                "params": {},
                "path": "",
                "checkSsl": false,
                "requestTimeout": 30,
                "requestMethod": "GET",
                "requestMode": {
                  "name": "byNode"
                }
              }
            },
            "runParameters": {
              "onGeneration": true,
              "onNewNode": true,
              "schedule": {
                "type": "scheduled",
                "duration": 3600
              }
            },
            "updateTimeout": 30,
            "enabled": true
          }
        ]
      }
    }

     */


[GET] api/datasources/{id}
--------------------------

    /**
    @api {get} /api/datasources/{id} 2. Get a data sources details
    @apiVersion 10.0.0
    @apiName getDataSource
    @apiGroup DataSources

    @apiUse datasourceId

    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X GET http://rudder.example.com/rudder/api/latest/datasources/DataSourceID

    @apiSuccessExample Success-Response:
  {
    "action": "getDataSource",
    "result": "success",
    "data": {
      "datasources": [
        {
          "name": "test-data-source-1",
          "id": "test-data-source-1",
          "description": "Data from http://jsonplaceholder.typicode.com",
          "type": {
            "name": "http",
            "parameters": {
              "url": "http://jsonplaceholder.typicode.com/users/1",
              "headers": {},
              "path": "",
              "checkSsl": false,
              "requestTimeout": 5,
              "requestMethod": "GET",
              "requestMode": {
                "name": "byNode"
              }
            }
          },
          "runParameters": {
            "onGeneration": true,
            "onNewNode": true,
            "schedule": {
              "type": "scheduled",
              "duration": 5
            }
          },
          "updateTimeout": 5,
          "enabled": true
        }
      ]
    }
  }
    */

[PUT] api/datasources
-----------------

    /**
    @api {put} /api/datasources 3. Create a new Data Source
    @apiVersion 10.0.0
    @apiName createDataSource
    @apiGroup DataSources

    @apiParam (Mono) {String}        id                              Unique identifier of the data source to create.
    @apiParam (Mono) {String}        name                            The human readable name of the data source to create.
    @apiParam (Mono) {String}        description                     Description of the goal of the data source to create.
    @apiParam (Mono) {Boolean}       enabled                         Enable or disable data source.
    @apiParam (Mono) {Int}           updateTimeout                   Duration in seconds before aborting data source update. The main goal is to prevent never ending requests. If a periodicity if configured, you should set that timeout at a lower value.
    @apiParam (Mono) {JSON}          runParameters                   Parameters to configure when the data source is fetched to update node properties. See below for details.    
    @apiParam (Mono) {Boolean}       runParameters.onGeneration      Trigger a fetch at the begining of a policy generation
    @apiParam (Mono) {Boolean}       runParameters.onNewNode         Trigger a fetch when a new node is accepted, for that node
    @apiParam (Mono) {JSON}          runParameters.schedule          Configure if data source should be fetch periodicaly (see below for configuration)
    @apiParam (Mono) {String=
                     "scheduled",
                     "notscheduled"} runParameters.schedule.type     "scheduled": enable periodic update; "notscheduled": disable them
    @apiParam (Mono) {Int}           runParameters.schedule.duration duration in seconds between the end of an update, and the start of the following.
    @apiParam (Mono) {JSON}          type                            Define and configure data source type. For now, only "http" data source is supported. See below for its Configuration
    @apiParam (Mono) {String="HTTP"} type.name                       Data source type name. Only "http" is supported for now.
    @apiParam (Mono) {JSON}          type.parameters                 Data source type specific parameters. See below for HTTP data source parameters.


    @apiParam (HTTP) {String}              url            URL to contact. Rudder expansion available.
    @apiParam (HTTP) {String="GET","POST"} requestMethod  HTTP method to use to contact the URL.
    @apiParam (HTTP) {JSON}                headers        Represent HTTP headers for the query. JSON array of {"name":"xxx","value":"yyy"}. Rudder expansion available.
    @apiParam (HTTP) {JSON}                headers        Represent HTTP parameters for the query. JSON  array of {"name":"xxx","value":"yyy"}. Rudder expansion available.
    @apiParam (HTTP) {String}              path           JSON path (as defined in https://github.com/jayway/JsonPath/, without the leading "$.") to find the interesting
                                                          sub-json or string/number/boolean value in the answer. Let empty to use the whole answer as value.  
    @apiParam (HTTP) {Boolean}             checkSsl       Check SSL certificate validity for https. Must be set to false for self-signed certificate
    @apiParam (HTTP) {Int}                 requestTimeout Timeout in seconds for each HTTP request
    @apiParam (HTTP) {JSON}                requestMode    Configure the strategy used to query the HTTP data source. For now, only a node by node strategy is available (see below)
    @apiParam (HTTP) {String="byNode"}     requestMode.name Name of the strategy to use. For now, only available is "byNode": make one request for each node

    @apiExample Example usage:
curl -H "X-API-Token: yourToken -X PUT http://rudder.example.com/rudder/api/latest/datasources -H "Content-type: application/json" -d @datasources.json

    @apiExample datasource.json details:
{
  "name": "test-data-source-2",
  "id": "test-data-source-2",
  "description": "Data from http://jsonplaceholder.typicode.com",
  "type": {
    "name": "HTTP",
    "parameters": {
      "url": "http://jsonplaceholder.typicode.com/users/1",
      "headers": {},
      "path": "",
      "checkSsl": false,
      "requestTimeout": 30,
      "requestMethod": "GET",
      "requestMode": {
        "name": "byNode"
      }
    }
  },
  "runParameters": {
    "onGeneration": true,
    "onNewNode": true,
    "schedule": {
      "type": "scheduled",
      "duration": 3600
    }
  },
  "updateTimeout": 30,
  "enabled": true
}


    @apiSuccessExample Success-Response:
{
  "action": "createDataSource",
  "result": "success",
  "data": {
    "datasources": [
      {
        "name": "test-data-source-2",
        "id": "test-data-source-2",
        "description": "Data from http://jsonplaceholder.typicode.com",
        "type": {
          "name": "HTTP",
          "parameters": {
            "url": "http://jsonplaceholder.typicode.com/users/1",
            "headers": {},
            "path": "",
            "checkSsl": false,
            "requestTimeout": 30,
            "requestMethod": "GET",
            "requestMode": {
              "name": "byNode"
            }
          }
        },
        "runParameters": {
          "onGeneration": true,
          "onNewNode": true,
          "schedule": {
            "type": "scheduled",
            "duration": 3600
          }
        },
        "updateTimeout": 30,
        "enabled": true
      }
    ]
  }
}

     */



[POST] api/datasources/{id}
--------------------------

    /**
    @api {post} /api/datasources/{id} 4. Update a Data Source
    @apiVersion 10.0.0
    @apiName updateDataSource
    @apiGroup DataSources

    @apiUse datasourceId

    @apiParam (POSTseePUT) {String} AllParameters See above.


    @apiExample Example usage:
    # Change description and disable a data source
    curl -H "X-API-Token: yourToken" -X POST http://rudder.example.com/rudder/api/latest/datasources/DataSourceID -H "Content-type: application/json" -d @disable-datasource-1.json.json

    @apiExample disable-datasource-1.json.json details:
    {
      "description": "This data source is temporarly no more used and so disabled",
      "enabled": false
    }

    @apiSuccessExample Success-Response:
    {
      "action": "updateDataSource",
      "result": "success",
      "data": {
        "datasources": [
          {
            "name": "test-data-source-1",
            "id": "test-data-source-1",
            "description": "This data source is temporarly no more used and so disabled",
            "type": {
              "name": "HTTP",
              "parameters": {
                "url": "http://jsonplaceholder.typicode.com/users/1",
                "headers": {},
                "path": "",
                "checkSsl": false,
                "requestTimeout": 30,
                "requestMethod": "GET",
                "requestMode": {
                  "name": "byNode"
                }
              }
            },
            "runParameters": {
              "onGeneration": true,
              "onNewNode": true,
              "schedule": {
                "type": "scheduled",
                "duration": 3600
              }
            },
            "updateTimeout": 30,
            "enabled": false
          }
        ]
      }
    }




    */

[DELETE] api/datasources/{id}
--------------------------

  /**
  @api {delete} /api/datasources/{id} 5. Delete a DataSources
  @apiVersion 10.0.0
  @apiName deleteDataSource
  @apiGroup DataSources

  @apiUse datasourceId

  @apiExample Example usage:
  curl -H "X-API-Token: yourToken" -X DELETE http://rudder.example.com/rudder/api/latest/datasources/DataSourceID

  @apiSuccessExample Success-Response:
{
  "action": "getDataSource",
  "result": "success",
  "data": {
    "datasources": [
      {
        "id": "test-data-source-1",
        "message": "Data source test-data-source-1 deleted"
      }
    ]
  }
}

        */




[POST] api/datasources/reload
-----------------------------

  /**
  @api {post} /api/datasources/reload 6. Update properties from data source - all nodes
  @apiVersion 10.0.0
  @apiName fetchDataAllNodes
  @apiGroup DataSources

  @apiDescription This API allows to trigger the update of properties coming from
  data sources for all nodes. The call is asynchrone.

  @apiExample Example usage:
  curl -H "X-API-Token: yourToken" https://rudder.example.com/rudder/api/latest/datasources/reload

  @apiSuccessExample Success-Response:
HTTP/1.1 200 OK
{
"action": "fetchDataAllNodes",
"result": "success",
"data": "Data for all nodes, for all configured data sources are going to be updated"
}

  */
[POST] api/datasources/reload/{datasourceId}
----------------------------------

  /**
  @api {post} /api/datasources/reload/{datasourceId} 7. Update properties from data source with ID ${datasourceId} - all nodes
  @apiVersion 10.0.0
  @apiName fetchDataAllNodes
  @apiGroup DataSources

  @apiUse datasourceId

  @apiDescription This API allows to trigger the update of properties coming from
  data sources for all nodes. The call is asynchrone.

  @apiExample Example usage:
  curl -H "X-API-Token: yourToken" https://rudder.example.com/rudder/api/latest/nodes/fetchData

  @apiSuccessExample Success-Response:
HTTP/1.1 200 OK
{
"action": "fetchDataAllNodes",
"result": "success",
"data": "Data for all nodes, for all configured data sources are going to be updated"
}

  */


[POST] api/datasources/reload/nodes/{nodeId}
--------------------------
    /**
    @api {post} /api/nodes/{id}/fetchData 8. Update properties from data source - node with ID ${nodeId}
    @apiVersion 10.0.0
    @apiName fetchDataOneNode
    @apiGroup DataSources

    @apiUse nodeId

    @apiDescription This API allows to trigger the update of properties coming from
    data sources for that node. The call is asynchrone.

    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X POST  https://rudder.example.com/rudder/api/latest/nodes/NodeID/fetchData

    @apiSuccessExample Success-Response:
HTTP/1.1 200 OK
{
  "action": "fetchDataOneNode",
  "result": "success",
  "data": "Data for node 'nodeID', for all configured data sources, is going to be updated"
}

      */


[POST] api/datasources/reload/{datasourceId}/nodes/{nodeId}
--------------------------
    /**
    @api {post} /api/nodes/{id}/fetchData 9. Update properties from data source ${datasourceId} - node ${nodeId}
    @apiVersion 10.0.0
    @apiName fetchDataOneNode
    @apiGroup DataSources

    @apiUse datasourceId
    @apiUse nodeId

    @apiDescription This API allows to trigger the update of properties coming from
    data source with ID ${datasourceId} for that node. The call is asynchrone.

    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X POST  https://rudder.example.com/rudder/api/latest/nodes/NodeID/fetchData

    @apiSuccessExample Success-Response:
HTTP/1.1 200 OK
{
  "action": "fetchDataOneNode",
  "result": "success",
  "data": "Data for node 'nodeID', for all configured data sources, is going to be updated"
}

      */

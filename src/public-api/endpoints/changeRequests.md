
This file describes REST API v3 for Change requests.

Corresponding code is available here: 
https://github.com/Normation/rudder/blob/master/rudder-web/src/main/scala/com/normation/rudder/web/rest/changeRequest/ChangeRequestAPI3.scala

/**
   @apiDefine changeRequestId

   @apiParam (URL parameters) {integer} id ID of the Change Request.
 */

/**
   @apiDefine Mono Mono valued parameters - Those parameters will only work with one value
 */
/**
   @apiDefine Multi Multi valued parameters - Those parameters need to be entered several times, they will add each other to form a list.
 */

[GET] api/changeRequests
-----------------

    /**
    @api {get} /api/changeRequests 1. List all Changes Requests
    @apiVersion 10.0.0
    @apiName listChangeRequests
    @apiGroup Change Requests
    

    @apiParam (Mono) {WorkflowStatus} [status=open] The status of change requests you want to display.
    <div><span class="values">Possible values: </span><ul class="values"><li>pending validation</li><li>pending deployment</li><li>cancelled</li><li>deployed</li><li>open (pending validation + pending deployment)</li><li>closed (cancelled + deployed)</li><li>all</li></ul></div><br style="clear:both"/>



    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X GET http://rudder.example.com/rudder/api/latest/changeRequests -d "status=open"


    @apiSuccessExample Success-Response:
    {
  "action":"listChangeRequests",
  "result":"success",
  "data":{
    "changeRequests":[{
      "id":42,
      "name":"Remove unused security policy",
      "description":"",
      "status":"Pending validation",
      "acceptable":true,
      "created by":"jon.doe",
      "changes":{
        "directives":[],
        "groups":[],
        "parameters":[],
        "rules":[ {
          "action":"delete Rule"
          "rule":{
            "id":"bb803bc8-2df7-4734-a6b6-454476c82bc6",
            "displayName":"Security Policy",
            "shortDescription":"",
            "longDescription":"",
            "directives":[],
            "targets":[],
            "enabled":false,
            "system":false
          }
        }]
      }
    },{
      "id":45,
      "name":"Add new package policy for Redhat nodes",
      "description":"",
      "status":"Pending deployment",
      "acceptable":false,
      "created by":"jon.doe",
      "changes":{
        "directives":[],
        "groups":[],
        "parameters":[],
        "rules":[ {
          "action":"modify Rule"
          "rule":{
            "id":"06ba8940-ed6c-4102-ba46-93d640a64c36",
            "displayName":"Redhat node configuration",
            "shortDescription":"",
            "longDescription":"",
            "directives": {
              "from" : ["cba93d24-8780-4308-b732-84995125562a","6847ad49-1c7e-4314-b764-ec176b882b6b","19be05b2-fb68-4ae1-acc0-e0ad2eba71fd","0be6fb7c-42c5-419e-9f6f-eb13ac4e4acd"],
              "to" : ["cba93d24-8780-4308-b732-84995125562a","7d44f9ad-9a54-4165-bb46-f66e6c674b39","6847ad49-1c7e-4314-b764-ec176b882b6b","19be05b2-fb68-4ae1-acc0-e0ad2eba71fd","0be6fb7c-42c5-419e-9f6f-eb13ac4e4acd"],
            }
            "targets":["group:3b9be575-590d-4fe4-9fa5-cc166d985ccf"],
            "enabled":false,
            "system":false
          }
        }]
      }

    }]
  }
     */



[GET] api/changeRequests/{id}
--------------------------

    /**
    @api {get} /api/changeRequests/{id} 2. Get a Change Request details
    @apiVersion 10.0.0
    @apiName changeRequestDetails
    @apiGroup Change Requests
     
    @apiUse changeRequestId

    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X GET http://rudder.example.com/rudder/api/latest/changeRequests/42

    @apiSuccessExample Success-Response:
{
  "action":"changeRequestDetails",
  "id" : 42
  "result":"success",
  "data":{
    "changeRequests":[{
      "id":42,
      "name":"Remove unused security policy",
      "description":"",
      "status":"Pending validation",
      "acceptable":true,
      "created by":"jon.doe",
      "changes":{
        "directives":[],
        "groups":[],
        "parameters":[],
        "rules":[ {
          "action":"delete Rule"
          "rule":{
            "id":"bb803bc8-2df7-4734-a6b6-454476c82bc6",
            "displayName":"security policy",
            "shortDescription":"",
            "longDescription":"",
            "directives":[],
            "targets":[],
            "enabled":false,
            "system":false
          }
        }]
      }
    }]
  }
}

    */

[DELETE] api/changeRequests/{id}
--------------------------

    /**
    @api {delete} /api/changeRequests/{id} 3. Decline a Change Request
    @apiVersion 10.0.0
    @apiName declineChangeRequest
    @apiGroup Change Requests
      
    @apiUse changeRequestId

    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X DELETE http://rudder.example.com/rudder/api/latest/changeRequests/42

    @apiSuccessExample Success-Response:
{
  "action":"declineChangeRequest",
  "id" : 42
  "result":"success",
  "data":{
    "changeRequests":[{
      "id":42,
      "name":"Remove unused security policy",
      "description":"",
      "status":"Cancelled",
      "acceptable":true,
      "created by":"jon.doe",
      "changes":{
        "directives":[],
        "groups":[],
        "parameters":[],
        "rules":[ {
          "action":"delete Rule"
          "rule":{
            "id":"bb803bc8-2df7-4734-a6b6-454476c82bc6",
            "displayName":"security policy",
            "shortDescription":"",
            "longDescription":"",
            "directives":[],
            "targets":[],
            "enabled":false,
            "system":false
          }
        }]
      }
    }]
  }
}

    */


[POST] api/changeRequests/{id}
--------------------------

    /**
    @api {post} /api/changeRequests/{id}/accept 4. Accept a Change Request
    @apiVersion 10.0.0
    @apiName acceptChangeRequest
    @apiGroup Change Requests
     
    @apiUse changeRequestId

    @apiParam (Mono) {WorkflowStatus}  status Final status in which the change Request will be after acceptance.
    <div><span class="values">Possible values: </span><ul class="values"><li>pending deployment</li><li>deployed</li></ul></div><br style="clear:both"/>
    


    @apiExample Example usage:
    // Update display name: 
    curl -H "X-API-Token: yourToken" -X POST http://rudder.example.com/rudder/api/latest/changeRequests/42/accept -d "status=deployed"

    @apiSuccessExample Success-Response:
{
  "action":"acceptChangeRequest",
  "id" : 42
  "result":"success",
  "data":{
    "changeRequests":[{
      "id":42,
      "name":"Remove unused security policy",
      "description":"",
      "status":"Deployed",
      "acceptable":true,
      "created by":"jon.doe",
      "changes":{
        "directives":[],
        "groups":[],
        "parameters":[],
        "rules":[ {
          "action":"delete Rule"
          "rule":{
            "id":"bb803bc8-2df7-4734-a6b6-454476c82bc6",
            "displayName":"security policy",
            "shortDescription":"",
            "longDescription":"",
            "directives":[],
            "targets":[],
            "enabled":false,
            "system":false
          }
        }]
      }
    }]
  }
}
   */


[POST] api/changeRequests/{id}
--------------------------

    /**
    @api {post} /api/changeRequests/{id} 5. Update a Change Request
    @apiVersion 10.0.0
    @apiName updateChangeRequest
    @apiGroup Change Requests
     
    @apiUse changeRequestId

    @apiParam (Mono) {String}  [name]         Name the Change Request.
    @apiParam (Mono) {String}  [description]  Description of the Change Request.

    @apiExample Example usage:
    // Update display name: 
    curl -H "X-API-Token: yourToken" -X POST http://rudder.example.com/rudder/api/latest/changeRequests/42  -d "name=new Name of Change Request" -d "description=add a new description"

    @apiSuccessExample Success-Response:
{
  "action":"updateChangeRequest",
  "id" : 42
  "result":"success",
  "data":{
    "changeRequests":[{
      "id":42,
      "name":"new Name of Change Request",
      "description":"add a new description",
      "status":"Pending validation",
      "acceptable":true,
      "created by":"jon.doe",
      "changes":{
        "directives":[],
        "groups":[],
        "parameters":[],
        "rules":[ {
          "action":"delete Rule"
          "rule":{
            "id":"bb803bc8-2df7-4734-a6b6-454476c82bc6",
            "displayName":"security policy",
            "shortDescription":"",
            "longDescription":"",
            "directives":[],
            "targets":[],
            "enabled":false,
            "system":false
          }
        }]
      }
    }]
  }
}

    */

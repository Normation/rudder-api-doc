
This file describe REST API v2 for nodes.

Corresponding code is available here: 
https://github.com/Normation/rudder/blob/master/rudder-web/src/main/scala/com/normation/rudder/web/rest/node/NodeAPI2.scala


== [GET] api/2/nodes 

    /**
    @api {get} /api/2/nodes List accepted nodes
    @apiVersion 2.0.0
    @apiName listAcceptedNodes
    @apiGroup Nodes
    
    @apiExample Example usage:
        curl -H "X-API-TOKEN: Gv2Trr1YJLtfYaaw0aiTA5DmZ9nW2aNu" http://localhost/rudder/api/2/nodes
    
    @apiSuccess {String} TODO
    
    @apiSuccessExample Success-Response:
        HTTP/1.1 200 OK
        {
          "result": "Success"
          TODO
        }
    
    @apiError Internal error
    
    @apiErrorExample Error-Response:
        HTTP/1.1 404 Not Found
        {
          "error": "Error"
        }
     */


== [GET] api/2/nodes/pending

    /**
    @api {get} /api/2/nodes/pending List pending nodes
    @apiVersion 2.0.0
    @apiName listPendingNodes
    @apiGroup Nodes
    
    @apiParam {String} id Unique ID of the node.
    
    @apiSuccess {String} TODO
    
    @apiSuccessExample Success-Response:
        HTTP/1.1 200 OK
        {
          "result": "Success"
          TODO
        }
    
    @apiError Internal error
    
    @apiErrorExample Error-Response:
        HTTP/1.1 404 Not Found
        {
          "error": "Error"
        }
     */


== [GET] api/2/nodes/{id}

    /**
    @api {get} /api/2/nodes/{id} Get information for node with id
    @apiVersion 2.0.0
    @apiName acceptedNodeDetails
    @apiGroup Nodes
    
    @apiParam {String} id Unique ID of the node.
    
    @apiSuccess {String} TODO
    
    @apiSuccessExample Success-Response:
        HTTP/1.1 200 OK
        {
          "result": "Success"
          TODO
        }
    
    @apiError Internal error
    
    @apiErrorExample Error-Response:
        HTTP/1.1 404 Not Found
        {
          "error": "Error"
        }
     */

== [DELETE] api/2/nodes/{id}

    /**
    @api {delete} /api/2/nodes/{id} Delete node with id
    @apiVersion 2.0.0
    @apiName deleteNode
    @apiGroup Nodes
    
    @apiSuccess {String} TODO
    
    @apiSuccessExample Success-Response:
        HTTP/1.1 200 OK
        {
          "result": "Success"
          TODO
        }
    
    @apiError Internal error
    
    @apiErrorExample Error-Response:
        HTTP/1.1 404 Not Found
        {
          "error": "Error"
        }
     */



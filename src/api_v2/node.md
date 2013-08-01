
This file describe REST API v2 for nodes.

Corresponding code is available here: 
https://github.com/Normation/rudder/blob/master/rudder-web/src/main/scala/com/normation/rudder/web/rest/node/NodeAPI2.scala


/**
   @apiDefineStructure nodeId

   @apiParamTitle (URL parameters) URL parameters

   @apiParam (URL parameters) {String} id The id of the Node you want
 */

== [GET] api/nodes 

    /**
    @api {get} /api/nodes List accepted Nodes
    @apiVersion 2.0.0
    @apiName listAcceptedNodes
    @apiGroup Nodes
    
    @apiExample Example usage:
        curl -H "X-API-TOKEN: Gv2Trr1YJLtfYaaw0aiTA5DmZ9nW2aNu" http://localhost/rudder/api/nodes
    
     */


== [GET] api/nodes/pending

    /**
    @api {get} /api/nodes/pending List pending Nodes
    @apiVersion 2.0.0
    @apiName listPendingNodes
    @apiGroup Nodes


     */


== [GET] api/nodes/{id}

    /**
    @api {get} /api/nodes/id Get Node details
    @apiVersion 2.0.0
    @apiName acceptedNodeDetails
    @apiGroup Nodes
    
    @apiStructure nodeId
    
    */

== [DELETE] api/nodes/{id}

    /**
    @api {delete} /api/nodes/id Delete Node
    @apiVersion 2.0.0
    @apiName deleteNode
    @apiGroup Nodes
    

    @apiStructure nodeId
     */


== [POST] api/nodes/pending/{id}

    /**
    @api {post} /api/nodes/id Change pending Node status
    @apiVersion 2.0.0
    @apiName changeNodeStatus
    @apiGroup Nodes

    @apiStructure nodeId

    @apiParam {String} status The new status of the node (refused/accepted)
    
     */
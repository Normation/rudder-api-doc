
This file describe REST API v2 for groups.

Corresponding code is available here: 
https://github.com/Normation/rudder/blob/master/rudder-web/src/main/scala/com/normation/rudder/web/rest/group/GroupAPI2.scala


[GET] api/2/groups
-----------------

    /**
    @api {get} /api/2/groups List all groups
    @apiVersion 2.0.0
    @apiName listGroups
    @apiGroup Groups
    
    @apiExample Example usage:
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X GET http://localhost/rudder/api/groups


     */


[PUT] api/2/groups
-----------------

    /**
    @api {put} /api/2/groups Create a new group
    @apiVersion 2.0.0
    @apiName createGroup
    @apiGroup Groups
    
    @apiExample Example usage:
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X PUT http://localhost/rudder/api/groups -d @nomDeFichierJSON

     */


[PUT] api/2/groups
-----------------

    /**
    @api {put} /api/2/groups Clone a group
    @apiVersion 2.0.0
    @apiName cloneGroup
    @apiGroup Groups
    
    @apiExample Example usage:
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X PUT http://localhost/rudder/api/groups -d “groups=GroupID”

     */

[GET] api/2/groups/{id}
--------------------------

    /**
    @api {get} /api/2/groups/{id} Get group details by id
    @apiVersion 2.0.0
    @apiName groupDetails
    @apiGroup Groups
     
    @apiExample Example usage:
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X GET http://localhost/rudder/api/groups/GroupID

    */

[DELETE] api/2/groups/{id}
--------------------------

    /**
    @api {delete} /api/2/groups/{id} Delete a group by id
    @apiVersion 2.0.0
    @apiName deleteGroup
    @apiGroup Groups
     
    @apiExample Example usage:
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X DELETE http://localhost/rudder/api/groups/GroupID


    */


[POST] api/2/groups/{id}
--------------------------

    /**
    @api {post} /api/2/groups/{id} Update the group with given id
    @apiVersion 2.0.0
    @apiName updateGroup
    @apiGroup Groups
     
    @apiExample Example usage:
    Update display name: 
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X POST http://localhost/rudder/api/groups/GroupID -d "displayName=Name of New Group"

    */

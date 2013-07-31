
This file describe REST API v2 for groups.

Corresponding code is available here: 
https://github.com/Normation/rudder/blob/master/rudder-web/src/main/scala/com/normation/rudder/web/rest/group/GroupAPI2.scala


[GET] api/groups
-----------------

    /**
    @api {get} /api/groups List all groups
    @apiVersion 2.0.0
    @apiName listGroups
    @apiGroup Groups
    
    @apiExample Example usage:
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X GET http://localhost/rudder/api/groups


     */


[PUT] api/groups
-----------------

    /**
    @api {put} /api/groups Create a new group
    @apiVersion 2.0.0
    @apiName createGroup
    @apiGroup Groups
    
    @apiExample Example usage:
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X PUT http://localhost/rudder/api/groups -d @nomDeFichierJSON

     */


[PUT] api/groups
-----------------

    /**
    @api {put} /api/groups Clone a group
    @apiVersion 2.0.0
    @apiName cloneGroup
    @apiGroup Groups
    
    @apiExample Example usage:
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X PUT http://localhost/rudder/api/groups -d “groups=GroupID”

     */

[GET] api/groups/{id}
--------------------------

    /**
    @api {get} /api/groups/{id} Get group details by id
    @apiVersion 2.0.0
    @apiName groupDetails
    @apiGroup Groups
     
    @apiExample Example usage:
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X GET http://localhost/rudder/api/groups/GroupID

    */

[DELETE] api/groups/{id}
--------------------------

    /**
    @api {delete} /api/groups/{id} Delete a group by id
    @apiVersion 2.0.0
    @apiName deleteGroup
    @apiGroup Groups
     
    @apiExample Example usage:
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X DELETE http://localhost/rudder/api/groups/GroupID


    */


[POST] api/groups/{id}
--------------------------

    /**
    @api {post} /api/groups/{id} Update the group with given id
    @apiVersion 2.0.0
    @apiName updateGroup
    @apiGroup Groups
     
    @apiExample Example usage:
    Update display name: 
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X POST http://localhost/rudder/api/groups/GroupID -d "displayName=Name of New Group"

    */

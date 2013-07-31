
This file describe REST API v2 for directives.

Corresponding code is available here: 
https://github.com/Normation/rudder/blob/master/rudder-web/src/main/scala/com/normation/rudder/web/rest/directive/DirectiveAPI2.scala


[GET] api/directives
-----------------

    /**
    @api {get} /api/directives List all directives
    @apiVersion 2.0.0
    @apiName listDirectives
    @apiGroup Directives
    
    @apiExample Example usage:
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X GET http://localhost/rudder/api/directives

     */


[PUT] api/directives
-----------------

    /**
    @api {put} /api/directives Create a new directive
    @apiVersion 2.0.0
    @apiName createDirective
    @apiGroup Directives
    
    @apiExample Example usage:
    curl -H "X-API-Token:TokenId” -H "X-API-Version: 2" -X PUT http://localhost/rudder/api/directives  -d "techniqueName=copyGitFile" -d "displayName=Name of New Directive"

     */


[PUT] api/directives
-----------------

    /**
    @api {put} /api/directives Clone a directive
    @apiVersion 2.0.0
    @apiName cloneDirective
    @apiGroup Directives
    
    @apiExample Example usage:
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X PUT http://localhost/rudder/api/directives  -d "source=DirectiveIDSource" -d "displayName=Name of New Directive”


     */

[GET] api/directives/{id}
--------------------------

    /**
    @api {get} /api/directives/{id} Get directive details by id
    @apiVersion 2.0.0
    @apiName directiveDetails
    @apiGroup Directives
     
    @apiExample Example usage:
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X GET http://localhost/rudder/api/directives/DirectiveID

    */

[DELETE] api/directives/{id}
--------------------------

    /**
    @api {delete} /api/directives/{id} Delete a directive by id
    @apiVersion 2.0.0
    @apiName deleteDirective
    @apiGroup Directives
     
    @apiExample Example usage:
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X DELETE http://localhost/rudder/api/directives/DirectiveID


    */


[POST] api/directives/{id}
--------------------------

    /**
    @api {post} /api/directives/{id} Update the directive with given id
    @apiVersion 2.0.0
    @apiName updateDirective
    @apiGroup Directives
     
    @apiExample Example usage:
    Update display name: 
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X POST http://localhost/rudder/api/directives/DirectiveID  -d "displayName=Name of New Directive"



    */

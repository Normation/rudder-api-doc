
This file describe REST API v2 for directives.

Corresponding code is available here: 
https://github.com/Normation/rudder/blob/master/rudder-web/src/main/scala/com/normation/rudder/web/rest/directive/DirectiveAPI2.scala


[GET] api/2/directives
-----------------

    /**
    @api {get} /api/2/directives List all directives
    @apiVersion 2.0.0
    @apiName listDirectives
    @apiDirective Directives
    
    @apiExample Example usage:
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X GET http://localhost/rudder/api/directives

     */


[PUT] api/2/directives
-----------------

    /**
    @api {put} /api/2/directives Create a new directive
    @apiVersion 2.0.0
    @apiName createDirective
    @apiDirective Directives
    
    @apiExample Example usage:
    curl -H "X-API-Token:TokenId” -H "X-API-Version: 2" -X PUT http://localhost/rudder/api/directives  -d "techniqueName=copyGitFile" -d "displayName=Name of New Directive"

     */


[PUT] api/2/directives
-----------------

    /**
    @api {put} /api/2/directives Clone a directive
    @apiVersion 2.0.0
    @apiName cloneDirective
    @apiDirective Directives
    
    @apiExample Example usage:
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X PUT http://localhost/rudder/api/directives  -d "source=DirectiveIDSource" -d "displayName=Name of New Directive”


     */

[GET] api/2/directives/{id}
--------------------------

    /**
    @api {get} /api/2/directives/{id} Get directive details by id
    @apiVersion 2.0.0
    @apiName directiveDetails
    @apiDirective Directives
     
    @apiExample Example usage:
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X GET http://localhost/rudder/api/directives/DirectiveID

    */

[DELETE] api/2/directives/{id}
--------------------------

    /**
    @api {delete} /api/2/directives/{id} Delete a directive by id
    @apiVersion 2.0.0
    @apiName deleteDirective
    @apiDirective Directives
     
    @apiExample Example usage:
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X DELETE http://localhost/rudder/api/directives/DirectiveID


    */


[POST] api/2/directives/{id}
--------------------------

    /**
    @api {post} /api/2/directives/{id} Update the directive with given id
    @apiVersion 2.0.0
    @apiName updateDirective
    @apiDirective Directives
     
    @apiExample Example usage:
    Update display name: 
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X POST http://localhost/rudder/api/directives/DirectiveID  -d "displayName=Name of New Directive"



    */

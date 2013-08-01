
This file describe REST API v2 for Parameters.

Corresponding code is available here: 
https://github.com/Normation/rudder/blob/master/rudder-web/src/main/scala/com/normation/rudder/web/rest/parameter/ParameterAPI2.scala

/**
   @apiDefineStructure parameterId

   @apiParamTitle (URL parameters) URL parameters

   @apiParam (URL parameters) {String} id The id of the Parameter you want
 */

 /**
   @apiDefineStructure parameterCreation

   @apiParamTitle (Mono) Mono valued parameters - Those parameters will only work with one value

   @apiParam (Mono) {String} [description] description of the Parameter
   @apiParam (Mono) {String} [value] Value of the Parameter 
   @apiParam (Mono) {Boolean} [overridable]
   @apiParam (Mono) {String} id The name of the Parameter to create, this parameter is mandatory

 */

[GET] api/parameters
-----------------

    /**
    @api {get} /api/parameters 1. List all Parameters
    @apiVersion 2.0.0
    @apiName listGroups
    @apiGroup Parameters
    
    @apiExample Example usage:
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X GET http://localhost/rudder/api/parameters


     */


[PUT] api/parameters
-----------------

    /**
    @api {put} /api/parameters 3. Create a new Parameter
    @apiVersion 2.0.0
    @apiName createGroup
    @apiGroup Parameters

    @apiStructure parameterCreation
    
    @apiExample Example usage:
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X PUT http://localhost/rudder/api/parameters -d @nomDeFichierJSON

     */


[GET] api/parameters/{id}
--------------------------

    /**
    @api {get} /api/parameters/{id} 2. Get Parameter details
    @apiVersion 2.0.0
    @apiName parameterDetails
    @apiGroup Parameters

    @apiStructure  parameterId
     
    @apiExample Example usage:
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X GET http://localhost/rudder/api/parameters/ParameterId

    */

[DELETE] api/parameters/{id}
--------------------------

    /**
    @api {delete} /api/parameters/{id} 5. Delete a Parameter
    @apiVersion 2.0.0
    @apiName deleteGroup
    @apiGroup Parameters
     
    @apiStructure  parameterId

    @apiExample Example usage:
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X DELETE http://localhost/rudder/api/parameters/ParameterId


    */


[POST] api/parameters/{id}
--------------------------

    /**
    @api {post} /api/parameters/{id} 4. Update a Parameter
    @apiVersion 2.0.0
    @apiName updateGroup
    @apiGroup Parameters


    @apiStructure  parameterId

   @apiParamTitle (Mono) Mono valued parameters - Those parameters will only work with one value

   @apiParam (Mono) {String} [description] description of the Parameter
   @apiParam (Mono) {String} [value] Value of the Parameter 
   @apiParam (Mono) {Boolean} [overridable]

     
    @apiExample Example usage:
    Update display name: 
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X POST http://localhost/rudder/api/parameters/ParameterId -d "displayName=Name of New Parameter"

    */




This file describe REST API v2 for Parameters.

Corresponding code is available here: 
https://github.com/Normation/rudder/blob/master/rudder-web/src/main/scala/com/normation/rudder/web/rest/parameter/ParameterAPI2.scala

/**
   @apiDefineStructure parameterId

   @apiParamTitle (URL parameters) URL parameters

   @apiParam (URL parameters) {String} id ID/name of the Parameter.
 */

 /**
   @apiDefineStructure parameterCreation

   @apiParamTitle (Mono) Mono valued parameters - Those parameters will only work with one value

   @apiParam (Mono) {String} id             ID/name of the Parameter to create.
   @apiParam (Mono) {String} [description]  Description of the Parameter.
   @apiParam (Mono) {String} [value]        Value of the Parameter.
   @apiParam (Mono) {Boolean} [overridable] The value can be overidden by Node Parameter (not existing in 2.7)

 */

[GET] api/parameters
-----------------

    /**
    @api {get} /api/parameters 1. List all Parameters
    @apiVersion 2.0.0
    @apiName listGroups
    @apiGroup Parameters
    
    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X GET http://rudder.example.com/rudder/api/latest/parameters


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
    curl -H "X-API-Token: yourToken" -X PUT http://rudder.example.com/rudder/api/latest/parameters -d @JSON-file-name

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
    curl -H "X-API-Token: yourToken" -X GET http://rudder.example.com/rudder/api/latest/parameters/ParameterId

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
    curl -H "X-API-Token: yourToken" -X DELETE http://rudder.example.com/rudder/api/latest/parameters/ParameterId


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

   @apiParam (Mono) {String} [description]  Description of the Parameter.
   @apiParam (Mono) {String} [value]        Value of the Parameter.
   @apiParam (Mono) {Boolean} [overridable] The value can be overidden by Node Parameter (not existing in 2.7)


     
    @apiExample Example usage:
    Update display name: 
    curl -H "X-API-Token: yourToken" -X POST http://rudder.example.com/rudder/api/latest/parameters/ParameterId -d "displayName=Name of New Parameter"

    */



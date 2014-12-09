
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
    curl -H "X-API-Token: yourToken" https://rudder.example.com/rudder/api/latest/parameters

    @apiSuccessExample Success-Response:
HTTP/1.1 200 OK
{
  "action": "listParameters",
  "result": "success",
  "data": {
    "parameters": [
      {
        "id": "rudder_file_edit_header",
        "value": "### Managed by Rudder, edit with care ###",
        "description": "Default inform message put in header of managed files by Rudder",
        "overridable": true
      }
    ]
  }
}

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
    curl -H "X-API-Token: yourToken" -H "Content-Type: application/json" -X PUT https://rudder.example.com/rudder/api/latest/parameters -d @JSON-file-name

    @apiSuccessExample Success-Response:
HTTP/1.1 200 OK
{
  "action": "createParameter",
  "id": "rudder_file_edit_footer",
  "result": "success",
  "data": {
    "parameters": [
      {
        "id": "rudder_file_edit_footer",
        "value": "### End of file managed by Rudder ###",
        "description": "Default inform message put in footer of managed files by Rudder",
        "overridable": false
      }
    ]
  }
}
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
    curl -H "X-API-Token: yourToken" https://rudder.example.com/rudder/api/latest/parameters/ParameterId

    @apiSuccessExample Success-Response:
HTTP/1.1 200 OK
{
  "action": "parameterDetails",
  "id": "rudder_file_edit_footer",
  "result": "success",
  "data": {
    "parameters": [
      {
        "id": "rudder_file_edit_footer",
        "value": "### End of file managed by Rudder ###",
        "description": "Default inform message put in footer of managed files by Rudder",
        "overridable": false
      }
    ]
  }
}

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
    curl -H "X-API-Token: yourToken" -X DELETE https://rudder.example.com/rudder/api/latest/parameters/ParameterId

    @apiSuccessExample Success-Response:
HTTP/1.1 200 OK
{
  "action": "deleteParameter",
  "id": "rudder_file_edit_footer",
  "result": "success",
  "data": {
    "parameters": [
      {
        "id": "rudder_file_edit_footer",
        "value": "### Edited by Rudder ###",
        "description": "Default inform message put in footer of managed files by Rudder",
        "overridable": false
      }
    ]
  }
}

    @apiErrorExample Error-Response:
HTTP/1.1 500 Server Error
{
  "action": "deleteParameter",
  "id": "rudder_file_edit_footer",
  "result": "error",
  "errorDetails": "Could not delete Parameter rudder_file_edit_footer cause is: Could not find Parameter rudder_file_edit_footer."
}

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
    curl -H "X-API-Token: yourToken" -X POST https://rudder.example.com/rudder/api/latest/parameters/ParameterId -d "value=### Edited by Rudder ###"

    @apiSuccessExample Success-Response:
HTTP/1.1 200 OK
{
  "action": "updateParameter",
  "id": "rudder_file_edit_footer",
  "result": "success",
  "data": {
    "parameters": [
      {
        "id": "rudder_file_edit_footer",
        "value": "### Edited by Rudder ###",
        "description": "Default inform message put in footer of managed files by Rudder",
        "overridable": false
      }
    ]
  }
}

    */



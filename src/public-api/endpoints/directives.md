
This file describes REST API v2 for directives.

Corresponding code is available here: 
https://github.com/Normation/rudder/blob/master/rudder-web/src/main/scala/com/normation/rudder/web/rest/directive/DirectiveAPI2.scala

/**
   @apiDefine directiveId

   @apiParam (URL parameters) {UUID} id ID of the Directive.
 */

/**
   @apiDefine Mono Mono valued parameters - Those parameters will only work with one value
 */
/**
   @apiDefine Multi Multi valued parameters - Those parameters need to be entered several times, they will add each other to form a list.
 */

[GET] api/directives
-----------------

    /**
    @api {get} /api/directives 1. List all Directives
    @apiVersion 10.0.0
    @apiName listDirectives
    @apiGroup Directives
    
    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X GET http://rudder.example.com/rudder/api/latest/directives

    @apiSuccessExample Success-Response:
{
  "action":"listDirectives",
  "result":"success",
  "data":{
    "directives":[{
      "id":"3877d1c3-d9e6-43cb-aa9d-40961510a34a",
      "displayName":"Copy test file shared folder",
      "shortDescription":"",
      "longDescription":"\n    this is a looooooooooooooooonnnnnnnnnn\n\n\nggggggggggggggggg description !!\"\"\"\"\"\"\n  ",
      "techniqueName":"copyGitFile",
      "techniqueVersion":"1.3",
      "parameters":{
        "section":{
          "name":"sections",
          "sections":[{
            "section":{
              "name":"Copy file and PostHook",
              "sections":[{
                "section":{
                  "name":"Copy file",
                  "vars":[{
                    "var":{
                      "name":"COPYFILE_COMPARE_METHOD",
                      "value":"mtime"
                    }
                  },{
                    "var":{
                      "name":"COPYFILE_DESTINATION",
                      "value":"/tmp/test2"
                    }
                  },{
                    "var":{
                      "name":"COPYFILE_GROUP",
                      "value":"root"
                    }
                  },{
                    "var":{
                      "name":"COPYFILE_NAME",
                      "value":"/tmp/test"
                    }
                  },{
                    "var":{
                      "name":"COPYFILE_OWNER",
                      "value":"root"
                    }
                  },{
                    "var":{
                      "name":"COPYFILE_PERM",
                      "value":"000"
                    }
                  },{
                    "var":{
                      "name":"COPYFILE_RECURSION",
                      "value":"0"
                    }
                  }]
                }
              },{
                "section":{
                  "name":"Post-modification hook",
                  "vars":[{
                    "var":{
                      "name":"COPYFILE_POST_HOOK_COMMAND",
                      "value":""
                    }
                  },{
                    "var":{
                      "name":"COPYFILE_POST_HOOK_RUN",
                      "value":"false"
                    }
                  }]
                }
              }]
            }
          }]
        }
      },
      "priority":5,
      "enabled":true,
      "system":false,
      "policyMode": "default",
      "tags": []
    },{
      "id":"e61c0696-172b-46bb-80a9-d6f5ef1d2f85",
      "displayName":"test local_copy",
      "shortDescription":"",
      "longDescription":"",
      "techniqueName":"fileManagement",
      "techniqueVersion":"2.0",
      "parameters":{
        "section":{
          "name":"sections",
          "sections":[{
            "section":{
              "name":"File to manage",
              "vars":[{
                "var":{
                  "name":"FILE_AND_FOLDER_MANAGEMENT_ACTION",
                  "value":"copy"
                }
              },{
                "var":{
                  "name":"FILE_AND_FOLDER_MANAGEMENT_SOURCE",
                  "value":"/vagrant/node.sh"
                }
              },{
                "var":{
                  "name":"FILE_AND_FOLDER_MANAGEMENT_SYMLINK_ENFORCE",
                  "value":"false"
                }
              }],
              "sections":[{
                "section":{
                  "name":"File",
                  "vars":[{
                    "var":{
                      "name":"FILE_AND_FOLDER_MANAGEMENT_PATH",
                      "value":"/root/test"
                    }
                  }]
                }
              },{
                "section":{
                  "name":"File cleaning options",
                  "vars":[{
                    "var":{
                      "name":"FILE_AND_FOLDER_DELETION_DAYS",
                      "value":"0"
                    }
                  },{
                    "var":{
                      "name":"FILE_AND_FOLDER_DELETION_OPTION",
                      "value":"none"
                    }
                  },{
                    "var":{
                      "name":"FILE_AND_FOLDER_DELETION_PATTERN",
                      "value":".*"
                    }
                  }]
                }
              },{
                "section":{
                  "name":"Permissions",
                  "vars":[{
                    "var":{
                      "name":"FILE_AND_FOLDER_MANAGEMENT_CHECK_PERMISSIONS",
                      "value":"false"
                    }
                  },{
                    "var":{
                      "name":"FILE_AND_FOLDER_MANAGEMENT_GROUP",
                      "value":""
                    }
                  },{
                    "var":{
                      "name":"FILE_AND_FOLDER_MANAGEMENT_OWNER",
                      "value":""
                    }
                  },{
                    "var":{
                      "name":"FILE_AND_FOLDER_MANAGEMENT_PERM",
                      "value":"000"
                    }
                  },{
                    "var":{
                      "name":"FILE_AND_FOLDER_MANAGEMENT_RECURSIVE",
                      "value":"1"
                    }
                  }]
                }
              },{
                "section":{
                  "name":"Post-modification hook",
                  "vars":[{
                    "var":{
                      "name":"FILE_AND_FOLDER_MANAGEMENT_POST_HOOK_COMMAND",
                      "value":""
                    }
                  },{
                    "var":{
                      "name":"FILE_AND_FOLDER_MANAGEMENT_POST_HOOK_RUN",
                      "value":"false"
                    }
                  }]
                }
              }]
            }
          }]
        }
      },
      "priority":5,
      "enabled":true,
      "system":false,
      "policyMode": "default",
      "tags": []
    }]
  }
}
     */


[PUT] api/directives
-----------------

    /**
    @api {put} /api/directives 3. Create a new Directive
    @apiVersion 10.0.0
    @apiName createDirective
    @apiGroup Directives

    @apiParam (Mono) {TechniqueName} techniqueName The name of the technique you want to use to create your Directive.
    @apiParam (Mono) {String}         displayName   The name of the Directive to create.
 
    @apiParam (Mono) {JSON}              [parameters]                                The full list of parameters. This parameter can be empty, but the Directive will not be applied.
    @apiParam (Mono) {String}            [shortDescription]                          Short description of the Directive.
    @apiParam (Mono) {String}            [longDescription]                           Long description of the Directive.
    @apiParam (Mono) {UUID}              [id=autoGenerated]                          Define the id of the Directive to create, Rudder will generate an id if this is missing. You should only use it for specific use case.
    @apiParam (Mono) {Boolean}           [enabled=true]                              Enable the Directive at creation. This parameter can be overriden. Used to be 'isEnabled' in response, look <a href="#non-compliant-data-in-response">here</a> for more details.
    @apiParam (Mono) {TechniqueVersion}  [techniqueVersion=latest Technique version] In which version your technique should be created.
    @apiParam (Mono) {Int}               [priority]                                  Directive priority. Determines which value to use if there are several Directives based on the same technique applied to a Node.
    @apiParam (Mono) {String}            [policyMode=default]                        Policy mode to execute the directive with. Can be "default", "enforce" or "audit".
    @apiParam (Multi) {Tag}              [tags]                                      Tags linked to this directive. As JSON, send an object { "key1":"value1", ..., "keyN":"valueN"}. As query paramereter, send a "key:value" pair for each tag.
 

    
    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X PUT http://rudder.example.com/rudder/api/latest/directives -H "Content-type: application/json" -d @directive.json

    @apiExample directive.json details:
{
  "id": "cf2a6c72-18ae-4f82-a12c-0b887792db41",
  "displayName": "Example Directive",
  "shortDescription": "This in an example Directive to use in Rudder api documentation",
  "longDescription": "",
  "techniqueName": "genericVariableDefinition",
  "techniqueVersion": "2.0",
  "tags": {
    "env" : "production",
    "country" : "FR"
  },
  "parameters": {
    "section": {
      "name": "sections",
      "sections": [
        {
          "section": {
            "name": "Variable definition",
            "vars": [
              {
                "var": {
                  "name": "GENERIC_VARIABLE_CONTENT",
                  "value": "new variable content"
                }
              },
              {
                "var": {
                  "name": "GENERIC_VARIABLE_NAME",
                  "value": "new_variable"
                }
              }
            ]
          }
        }
      ]
    }
  },
  "priority": 3,
  "enabled": true,
  "system": false,
  "policyMode": "default"
}


    @apiSuccessExample Success-Response:
{
  "action":"createDirective",
  "id":"7fb1349e-1f2c-4fca-9c5a-e5858a5b132e",
  "result":"success",
  "data":{
    "directives":[{
      "id": "cf2a6c72-18ae-4f82-a12c-0b887792db41",
      "displayName": "Example Directive",
      "shortDescription": "This in an example Directive to use in Rudder api documentation",
      "longDescription": "",
      "techniqueName": "genericVariableDefinition",
      "techniqueVersion": "2.0",
      "tags": {
        "env" : "production",
        "country" : "FR"
      },
      "parameters": {
        "section": {
          "name": "sections",
          "sections": [
            {
              "section": {
                "name": "Variable definition",
                "vars": [
                  {
                    "var": {
                      "name": "GENERIC_VARIABLE_CONTENT",
                      "value": "new variable content"
                    }
                  },
                  {
                    "var": {
                      "name": "GENERIC_VARIABLE_NAME",
                      "value": "new_variable"
                    }
                  }
                ]
              }
            }
          ]
        }
      },
      "priority": 3,
      "enabled": true,
      "system": false,
      "policyMode": "default"
    }]
  }
}
     */


[PUT] api/directives
-----------------

    /**
    @api {put} /api/directives 6. Clone a Directive
    @apiVersion 10.0.0
    @apiName cloneDirective
    @apiGroup Directives
    

    @apiParam (Mono) {UUID}   source      The id of the Directive the clone will be based onto. missing source will 
    @apiParam (Mono) {String} displayName The name of the Directive to create, this parameter is mandatory
 
    @apiParam (Mono) {JSON} [parameters]                               The full list of parameters. This parameter can be empty, but the Directive will not be applied. 
    @apiParam (Mono) {String} [shortescription]                        Short description of the Directive.
    @apiParam (Mono) {String} [longDescription]                        Long description of the Directive.
    @apiParam (Mono) {UUID} [id=autoGenerated]                         Define the id of the Directive to create, Rudder will generate an id if this is missing. You should only use it for specific use case
    @apiParam (Mono) {Boolean} [enabled=true]                          Enable the Directive at creation. But this parameter can be overriden. Used to be 'isEnabled' in response, look <a href="#non-compliant-data-in-response">here</a> for more details.

    @apiParam (Mono) {Int} [priority=5]                                Directive priority. Determines which value to use if there are several Directives based on the same technique applied to a Node.
    @apiPAram (Mono) {TechniqueVersion} [techniqueVersion=same version as source] Define the technique version used. By default it will used the version of the cloned Directive
    @apiParam (Mono) {String}            [policyMode=default]          Policy mode to execute the directive with. Can be "default", "enforce" or "audit".
    @apiParam (Multi) {Tag}              [tags]                        Tags linked to this directive. As JSON, send an object { "key1":"value1", ..., "keyN":"valueN"}. As query paramereter, send a "key:value" pair for each tag. 

    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X PUT http://rudder.example.com/rudder/api/latest/directives  -d "source=DirectiveIDSource" -d "displayName=Name of New Directive"


     */

[GET] api/directives/{id}
--------------------------

    /**
    @api {get} /api/directives/{id} 2. Get a Directive details
    @apiVersion 10.0.0
    @apiName directiveDetails
    @apiGroup Directives
     
    @apiUse directiveId

    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X GET http://rudder.example.com/rudder/api/latest/directives/DirectiveID

    */

[DELETE] api/directives/{id}
--------------------------

    /**
    @api {delete} /api/directives/{id} 5. Delete a Directive
    @apiVersion 10.0.0
    @apiName deleteDirective
    @apiGroup Directives
      
    @apiUse directiveId

    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X DELETE http://rudder.example.com/rudder/api/latest/directives/DirectiveID


    */


[POST] api/directives/{id}
--------------------------

    /**
    @api {post} /api/directives/{id} 4. Update a Directive
    @apiVersion 10.0.0
    @apiName updateDirective
    @apiGroup Directives
     
    @apiUse directiveId

    @apiParam (Mono) {String}  [displayName]      Name of the Directive to create.
    @apiParam (Mono) {String}  [shortDescription] Short description of the Directive.
    @apiParam (Mono) {String}  [longDescription]  Long description of the Directive.
    @apiParam (Mono) {JSON}    [parameters]       Directive parameters.
    @apiParam (Mono) {Boolean} [enabled]          Enable/disable the Directive. Used to be 'isEnabled' in response, look <a href="#non-compliant-data-in-response">here</a> for more details.

    @apiParam (Mono) {Int}     [priority]         Directive priority. Determines which value to use if there are several Directives based on the same technique applied to a Node.
    @apiParam (Mono) {TechniqueVersion} [techniqueVersion] Technique Version.
    @apiParam (Mono) {String}            [policyMode=default]          Policy mode to execute the directive with. Can be "default", "enforce" or "audit".
    @apiParam (Multi) {Tag}              [tags]   Tags linked to this directive. As JSON, send an object { "key1":"value1", ..., "keyN":"valueN"}. As query paramereter, send a "key:value" pair for each tag.


    @apiExample Example usage:
    # Change long description, priority and a value in parameters
    curl -H "X-API-Token: yourToken" -X POST http://rudder.example.com/rudder/api/latest/directives/cf2a6c72-18ae-4f82-a12c-0b887792db41 -H "Content-type: application/json" -d @directive.json

    @apiExample directive.json details:
{
  "longDescription": "Add a loooooooooooong description",
  "parameters": {
    "section": {
      "name": "sections",
      "sections": [
        {
          "section": {
            "name": "Variable definition",
            "vars": [
              {
                "var": {
                  "name": "GENERIC_VARIABLE_CONTENT",
                  "value": "Change Variable Content"
                }
              },
              {
                "var": {
                  "name": "GENERIC_VARIABLE_NAME",
                  "value": "new_variable"
                }
              }
            ]
          }
        }
      ]
    }
  },
  "priority": 5
}


    @apiSuccessExample Success-Response:
{
  "action":"createDirective",
  "id":"7fb1349e-1f2c-4fca-9c5a-e5858a5b132e",
  "result":"success",
  "data":{
    "directives":[{
      "id": "cf2a6c72-18ae-4f82-a12c-0b887792db41",
      "displayName": "Example Directive",
      "shortDescription": "This in an example Directive to use in Rudder api documentation",
      "longDescription": "Add a loooooooooooong description",
      "techniqueName": "genericVariableDefinition",
      "techniqueVersion": "2.0",
      "tags": {
        "env" : "production",
        "country" : "FR"
      },
      "parameters": {
        "section": {
          "name": "sections",
          "sections": [
            {
              "section": {
                "name": "Variable definition",
                "vars": [
                  {
                    "var": {
                      "name": "GENERIC_VARIABLE_CONTENT",
                      "value": "Change Variable Content"
                    }
                  },
                  {
                    "var": {
                      "name": "GENERIC_VARIABLE_NAME",
                      "value": "new_variable"
                    }
                  }
                ]
              }
            }
          ]
        }
      },
      "priority": 5,
      "enabled": true,
      "system": false,
      "policyMode": "default"
     
    }]
  }
}


    */

[POST] api/directives/{id}/check
--------------------------

    /**
    @api {post} /api/directives/{id}/check 7. Check that update on a Directive is valid
    @apiVersion 10.0.0
    @apiName checkDirective
    @apiGroup Directives
     
    @apiUse directiveId

    @apiParam (Mono) {String}  [displayName]      Name of the Directive to create.
    @apiParam (Mono) {String}  [shortDescription] Short description of the Directive.
    @apiParam (Mono) {String}  [longDescription]  Long description of the Directive.
    @apiParam (Mono) {JSON}    [parameters]       Directive parameters.
    @apiParam (Mono) {Boolean} [enabled]          Enable/disable the Directive. Used to be 'isEnabled' in response, look <a href="#non-compliant-data-in-response">here</a> for more details.

    @apiParam (Mono) {Int}     [priority]         Directive priority. Determines which value to use if there are several Directives based on the same technique applied to a Node.
    @apiParam (Mono) {TechniqueVersion} [techniqueVersion] Technique Version.
    @apiParam (Mono) {String}            [policyMode=default]          Policy mode to execute the directive with. Can be "default", "enforce" or "audit".
    @apiParam (Multi) {Tag}              [tags]   Tags linked to this directive. As JSON, send an object { "key1":"value1", ..., "keyN":"valueN"}. As query paramereter, send a "key:value" pair for each tag.


    @apiExample Example usage:
    // Update display name: 
    curl -H "X-API-Token: yourToken" -X POST http://rudder.example.com/rudder/api/latest/directives/DirectiveID/check  -d "displayName=Name of New Directive"



    */

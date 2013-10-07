
This file describe REST API v2 for directives.

Corresponding code is available here: 
https://github.com/Normation/rudder/blob/master/rudder-web/src/main/scala/com/normation/rudder/web/rest/directive/DirectiveAPI2.scala

/**
   @apiDefineStructure directiveId

   @apiParamTitle (URL parameters) URL parameters

   @apiParam (URL parameters) {UUID} id ID of the Directive.
 */

[GET] api/directives
-----------------

    /**
    @api {get} /api/directives 1. List all Directives
    @apiVersion 2.0.0
    @apiName listDirectives
    @apiGroup Directives
    
    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X GET http://rudder.example.com/rudder/api/2/directives

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
      "isEnabled":true,
      "isSystem":false
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
      "isEnabled":true,
      "isSystem":false
    }]
  }
}
     */


[PUT] api/directives
-----------------

    /**
    @api {put} /api/directives 3. Create a new Directive
    @apiVersion 2.0.0
    @apiName createDirective
    @apiGroup Directives

    @apiParamTitle (Mono) Mono valued parameters - Those parameters will only work with one value

    @apiParam (Mono) {Technique name} techniqueName The name of the technique you want to use to create your Directive.
    @apiParam (Mono) {String}         displayName   The name of the Directive to create.
 
    @apiParam (Mono) {JSON}              [parameters]                                The full list of parameters. This parameter can be empty, but the Directive will not be applied.
    @apiParam (Mono) {String}            [shortDescription]                          Short description of the Directive.
    @apiParam (Mono) {String}            [longDescription]                           Long description of the Directive.
    @apiParam (Mono) {UUID}              [id=autoGenerated]                          Define the id of the Directive to create, Rudder will generate an id if this is missing. You should only use it for specific use case.
    @apiParam (Mono) {Boolean}           [enabled=true]                              Enable the Directive at creation. This parameter can be overriden.
    @apiPAram (Mono) {Technique version} [techniqueVersion=latest Technique version] In which version your tehcnique should be created.

    
    @apiExample Example usage:
    curl -H "X-API-Token: yourToken -X PUT http://rudder.example.com/rudder/api/2/directives  -d "techniqueName=copyGitFile" -d "displayName=Copy a test file from shared folder" -d @parameters

    @apiSuccessExample Success-Response:
    {
    "action":"createDirective",
    "id":"7fb1349e-1f2c-4fca-9c5a-e5858a5b132e",
    "result":"success",
    "data":{
      "directives":[{
        "id":"7fb1349e-1f2c-4fca-9c5a-e5858a5b132e",
        "displayName":"Copy a test file from shared folder",
        "shortDescription":"",
        "longDescription":"",
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
        "isEnabled":false,
        "isSystem":false
      }]
    }
  }
     */


[PUT] api/directives
-----------------

    /**
    @api {put} /api/directives 6. Clone a Directive
    @apiVersion 2.0.0
    @apiName cloneDirective
    @apiGroup Directives
    

    @apiParamTitle (Mono) Mono valued parameters - Those parameters will only work with one value

    @apiParam (Mono) {UUID}   source      The id of the Directive the clone will be based onto. missing source will 
    @apiParam (Mono) {String} displayName The name of the Directive to create, this parameter is mandatory
 
    @apiParam (Mono) {JSON} [parameters]                               The full list of parameters. This parameter can be empty, but the Directive will not be applied. 
    @apiParam (Mono) {String} [shortescription]                        Short description of the Directive.
    @apiParam (Mono) {String} [longDescription]                        Long description of the Directive.
    @apiParam (Mono) {UUID} [id=autoGenerated]                         Define the id of the Directive to create, Rudder will generate an id if this is missing. You should only use it for specific use case
    @apiParam (Mono) {Boolean} [enabled=true]                          Enable the Directive at creation. But this parameter can be overriden.
    @apiParam (Mono) {Int} [priority=5]                                Directive priority. Determine which value to use if there is Directives based on the same technique applied to a Node
    @apiPAram (Mono) {Technique version} [techniqueVersion=same version as source] Define the technique version used. By default it will used the version of the cloned Directive

    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X PUT http://rudder.example.com/rudder/api/2/directives  -d "source=DirectiveIDSource" -d "displayName=Name of New Directive”


     */

[GET] api/directives/{id}
--------------------------

    /**
    @api {get} /api/directives/id 2. Get a Directive details
    @apiVersion 2.0.0
    @apiName directiveDetails
    @apiGroup Directives
     
    @apiStructure directiveId

    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X GET http://rudder.example.com/rudder/api/2/directives/DirectiveID

    */

[DELETE] api/directives/{id}
--------------------------

    /**
    @api {delete} /api/directives/id 5. Delete a Directive
    @apiVersion 2.0.0
    @apiName deleteDirective
    @apiGroup Directives
      
    @apiStructure directiveId

    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X DELETE http://rudder.example.com/rudder/api/2/directives/DirectiveID


    */


[POST] api/directives/{id}
--------------------------

    /**
    @api {post} /api/directives/id 4. Update a Directive
    @apiVersion 2.0.0
    @apiName updateDirective
    @apiGroup Directives
     
    @apiStructure directiveId

    @apiParamTitle (Mono) Mono valued parameters - Those parameters will only work with one value

    @apiParam (Mono) {String}  [displayName]      Name of the Directive to create.
    @apiParam (Mono) {String}  [shortDescription] Short description of the Directive.
    @apiParam (Mono) {String}  [longDescription]  Long description of the Directive.
    @apiParam (Mono) {JSON}    [parameters]       Directive parameters.
    @apiParam (Mono) {Boolean} [enabled]          Enable/disable the Directive.
    @apiParam (Mono) {Int}     [priority]         Directive priority. Determine which value to use if there is Directives based on the same technique applied to a Node.
    @apiParam (Mono) {Technique version} [techniqueVersion] Technique Version.

    @apiExample Example usage:
    // Update display name: 
    curl -H "X-API-Token: yourToken" -X POST http://rudder.example.com/rudder/api/2/directives/DirectiveID  -d "displayName=Name of New Directive"



    */

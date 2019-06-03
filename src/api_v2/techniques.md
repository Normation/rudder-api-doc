
This file describes REST API v2 for techniques.

Corresponding code is available here: 
https://github.com/Normation/rudder/blob/master/rudder-web/src/main/scala/com/normation/rudder/web/rest/technique


 */

/**
   @apiDefine Mono Mono valued parameters - Those parameters will only work with one value
 */
/**
   @apiDefine Multi Multi valued parameters - Those parameters need to be entered several times, they will add each other to form a list.
 */

[GET] api/techniques
-----------------

    /**
    @api {get} /api/techniques 1. List all Techniques
    @apiVersion 8.0.0
    @apiName listTechniques
    @apiGroup Techniques
    
    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X GET http://rudder.example.com/rudder/api/latest/techniques

    @apiSuccessExample Success Response:
{
  "action": "listTechniques",
  "result": "success",
  "data": {
    "techniques": [
      {
        "name": "copyGitFile",
        "versions": [
          "1.0",
          "1.1",
          "1.2",
          "1.3",
          "1.4",
          "1.5",
          "1.6",
          "1.7",
          "2.0",
          "2.1"
        ]
      },
      {
        "name": "aptPackageInstallation",
        "versions": [
          "1.0",
          "1.1",
          "1.2",
          "2.0",
          "3.0",
          "4.0"
        ]
      },
      {
        "name": "variableFromJsonFile",
        "versions": []
      },
      {
        "name": "fstabConfiguration",
        "versions": [
          "1.0",
          "2.0",
          "3.0",
          "4.0"
        ]
      },
      {
        "name": "userManagement",
        "versions": [
          "1.0",
          "2.0",
          "3.0",
          "4.0",
          "5.0",
          "6.0"
        ]
      },
      {
        "name": "sshConfiguration",
        "versions": [
          "1.0",
          "2.0",
          "3.0",
          "4.0",
          "5.0"
        ]
      },
      {
        "name": "checkGenericFileContent",
        "versions": [
          "1.0",
          "2.0",
          "2.1",
          "3.0",
          "3.1",
          "3.2",
          "4.0",
          "5.0",
          "6.0",
          "7.0"
        ]
      },
      {
        "name": "filesPermissions",
        "versions": [
          "1.0",
          "1.1",
          "2.0",
          "2.1"
        ]
      },
      {
        "name": "cronManagement",
        "versions": [
          "1.0",
          "2.0",
          "3.0"
        ]
      },
      {
        "name": "aptPackageManagerSettings",
        "versions": [
          "1.0",
          "2.0",
          "3.0",
          "3.1"
        ]
      },
      {
        "name": "fileAlterationMonitoring",
        "versions": [
          "1.0",
          "2.0"
        ]
      },
      {
        "name": "zypperPackageManagerRepositories",
        "versions": [
          "1.0"
        ]
      },
      {
        "name": "motdConfiguration",
        "versions": [
          "1.0",
          "2.0",
          "3.0",
          "3.1",
          "3.2"
        ]
      },
      {
        "name": "distributePolicy",
        "versions": [
          "1.0"
        ]
      },
      {
        "name": "repoGpgKeyManagement",
        "versions": [
          "1.0"
        ]
      },
      {
        "name": "downloadFile",
        "versions": [
          "1.0",
          "2.0",
          "3.0"
        ]
      },
      {
        "name": "routingManagement",
        "versions": [
          "1.0",
          "2.0"
        ]
      },
      {
        "name": "dnsConfiguration",
        "versions": [
          "1.0",
          "1.1",
          "2.0",
          "3.0"
        ]
      },
      {
        "name": "rpmPackageInstallation",
        "versions": [
          "1.0",
          "2.0",
          "2.1",
          "2.2",
          "3.0",
          "4.0",
          "4.1",
          "5.0",
          "5.1",
          "6.0",
          "6.1",
          "7.0"
        ]
      },
      {
        "name": "genericVariableDefinition",
        "versions": [
          "1.0",
          "1.1",
          "1.2",
          "2.0"
        ]
      },
      {
        "name": "sshKeyDistribution",
        "versions": [
          "1.0",
          "2.0",
          "3.0"
        ]
      }
    ]
  }
}
     */



[GET] api/techniques/{name}/directives
--------------------------

    /**
    @api {get} /api/techniques/{name}/directives 2. List all Directives based on all version of a Technique
    @apiVersion 8.0.0
    @apiName listTechniquesDirectives 
    @apiGroup Techniques
     
    @apiParam (URL parameters) {String} name Name of the Technique.

    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X GET http://rudder.example.com/rudder/api/latest/techniques/checkGenericFileContent/directives

    @apiSuccessExample Success Response:
{
  "action": "listTechniquesDirectives",
  "result": "success",
  "data": {
    "directives": [
      {
        "id": "54d6b022-2324-476b-9d16-6ade3d1371e9",
        "displayName": "cccc",
        "shortDescription": "",
        "longDescription": "",
        "techniqueName": "checkGenericFileContent",
        "techniqueVersion": "6.0",
        "parameters": {
          "section": {
            "name": "sections",
            "sections": [
              {
                "section": {
                  "name": "File to manage",
                  "sections": [
                    {
                      "section": {
                        "name": "Enforce content by section",
                        "vars": [
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_SECTION_MANAGEMENT",
                              "value": "false"
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_SECTION_CONTENT",
                              "value": ""
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_SECTION_FOOTER",
                              "value": ""
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_SECTION_HEADER",
                              "value": ""
                            }
                          }
                        ]
                      }
                    },
                    {
                      "section": {
                        "name": "Enforce content only in zone",
                        "vars": [
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_MIGRATE_TO_ZONE_BOOLEAN",
                              "value": "false"
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_ZONE_FOOTER",
                              "value": "### End of section managed by Rudder"
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_ZONE_HEADER",
                              "value": "### Beginning of section managed by Rudder"
                            }
                          }
                        ]
                      }
                    },
                    {
                      "section": {
                        "name": "File",
                        "vars": [
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_CREATE_BOOLEAN",
                              "value": "true"
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_DELETION_BOOLEAN",
                              "value": "false"
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_ENFORCE",
                              "value": "false"
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_ENFORCE_CREATE_ONLY_BOOLEAN",
                              "value": "false"
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_MODIFICATION_BOOLEAN",
                              "value": "false"
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_ONLY_ZONE_BOOLEAN",
                              "value": "false"
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_PATH",
                              "value": "/tmp/test"
                            }
                          }
                        ]
                      }
                    },
                    {
                      "section": {
                        "name": "File content",
                        "vars": [
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_PAYLOAD",
                              "value": ""
                            }
                          }
                        ]
                      }
                    },
                    {
                      "section": {
                        "name": "Line deletion regular expressions",
                        "vars": [
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_DELETION_REGEXP",
                              "value": "deleteme.*"
                            }
                          }
                        ]
                      }
                    },
                    {
                      "section": {
                        "name": "Line replacement regular expressions",
                        "vars": [
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_MODIFICATION_DESTINATION",
                              "value": ""
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_MODIFICATION_REGEXP",
                              "value": "replaceme.*"
                            }
                          }
                        ]
                      }
                    },
                    {
                      "section": {
                        "name": "Permission adjustment",
                        "vars": [
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_GROUP",
                              "value": "root"
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_OWNER",
                              "value": "root"
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_PERM",
                              "value": "644"
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_PERMISSION_ADJUSTMENT",
                              "value": "false"
                            }
                          }
                        ]
                      }
                    },
                    {
                      "section": {
                        "name": "Post-modification hook",
                        "vars": [
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_POST_HOOK_COMMAND",
                              "value": ""
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_POST_HOOK_RUN",
                              "value": "false"
                            }
                          }
                        ]
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
        "system": false
      }
    ]
  }
}
    */

[GET] api/techniques/{name}/{version}/directives
--------------------------

    /**
    @api {get} /api/techniques/{name}/{version}/directives 3. List all Directives based on one version of a Technique
    @apiVersion 8.0.0
    @apiName listDirectivesVersion
    @apiGroup Techniques
     
    @apiParam (URL parameters) {String} name Name of the Technique.
    @apiParam (URL parameters) {Version} version Version of the Technique.

    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X GET http://rudder.example.com/rudder/api/latest/techniques/checkGenericFileContent/6.0/directives

    @apiSuccessExample Success Response:
{
  "action": "listDirectives",
  "result": "success",
  "data": {
    "directives": [
      {
        "id": "54d6b022-2324-476b-9d16-6ade3d1371e9",
        "displayName": "cccc",
        "shortDescription": "",
        "longDescription": "",
        "techniqueName": "checkGenericFileContent",
        "techniqueVersion": "6.0",
        "parameters": {
          "section": {
            "name": "sections",
            "sections": [
              {
                "section": {
                  "name": "File to manage",
                  "sections": [
                    {
                      "section": {
                        "name": "Enforce content by section",
                        "vars": [
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_SECTION_MANAGEMENT",
                              "value": "false"
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_SECTION_CONTENT",
                              "value": ""
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_SECTION_FOOTER",
                              "value": ""
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_SECTION_HEADER",
                              "value": ""
                            }
                          }
                        ]
                      }
                    },
                    {
                      "section": {
                        "name": "Enforce content only in zone",
                        "vars": [
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_MIGRATE_TO_ZONE_BOOLEAN",
                              "value": "false"
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_ZONE_FOOTER",
                              "value": "### End of section managed by Rudder"
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_ZONE_HEADER",
                              "value": "### Beginning of section managed by Rudder"
                            }
                          }
                        ]
                      }
                    },
                    {
                      "section": {
                        "name": "File",
                        "vars": [
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_CREATE_BOOLEAN",
                              "value": "true"
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_DELETION_BOOLEAN",
                              "value": "false"
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_ENFORCE",
                              "value": "false"
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_ENFORCE_CREATE_ONLY_BOOLEAN",
                              "value": "false"
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_MODIFICATION_BOOLEAN",
                              "value": "false"
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_ONLY_ZONE_BOOLEAN",
                              "value": "false"
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_PATH",
                              "value": "/tmp/test"
                            }
                          }
                        ]
                      }
                    },
                    {
                      "section": {
                        "name": "File content",
                        "vars": [
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_PAYLOAD",
                              "value": ""
                            }
                          }
                        ]
                      }
                    },
                    {
                      "section": {
                        "name": "Line deletion regular expressions",
                        "vars": [
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_DELETION_REGEXP",
                              "value": "deleteme.*"
                            }
                          }
                        ]
                      }
                    },
                    {
                      "section": {
                        "name": "Line replacement regular expressions",
                        "vars": [
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_MODIFICATION_DESTINATION",
                              "value": ""
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_MODIFICATION_REGEXP",
                              "value": "replaceme.*"
                            }
                          }
                        ]
                      }
                    },
                    {
                      "section": {
                        "name": "Permission adjustment",
                        "vars": [
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_GROUP",
                              "value": "root"
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_OWNER",
                              "value": "root"
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_PERM",
                              "value": "644"
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_PERMISSION_ADJUSTMENT",
                              "value": "false"
                            }
                          }
                        ]
                      }
                    },
                    {
                      "section": {
                        "name": "Post-modification hook",
                        "vars": [
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_POST_HOOK_COMMAND",
                              "value": ""
                            }
                          },
                          {
                            "var": {
                              "name": "GENERIC_FILE_CONTENT_POST_HOOK_RUN",
                              "value": "false"
                            }
                          }
                        ]
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
        "system": false
      }
    ]
  }
}
    */



This file describe REST API v6 for compliance.

Corresponding code is available here: 
https://github.com/Normation/rudder/blob/master/rudder-web/src/main/scala/com/normation/rudder/web/rest/compliance/ComplianceAPI6.scala



/**
   @apiDefine ruleId

   @apiParam (URL parameters) {UUID} id ID of the Rule
 */
/**
   @apiDefine nodeId

   @apiParam (URL parameters) {UUID} id ID of the Node
 */



[GET] api/compliance/rules
-----------------

    /**
    @api {get} /api/compliance/rules 1. Display compliance of all Rules
    @apiVersion 6.0.0
    @apiName getRulesCompliance
    @apiGroup compliance
    @apiDescription Get compliance of all Rules available in Rudder
    
    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X GET 'http://rudder.example.com/rudder/api/latest/compliance/rules?prettify=true'
    @apiSuccessExample Success-Response:
      HTTP/1.1 200 OK
      {
        "data": {
          "rules": [
            {
              "directives": [
                {
                  "components": [
                    {
                      "nodes": [
                        {
                          "values": [
                            {
                              "reports": [
                                {
                                  "status": "noReport"
                                }
                              ],
                              "value": "None"
                            }
                          ],
                          "id": "root"
                        }
                      ],
                      "complianceDetails": {
                        "noReport": 100
                      },
                      "compliance": 0,
                      "name": "ZMD process"
                    },
                    {
                      "nodes": [
                        {
                          "values": [
                            {
                              "reports": [
                                {
                                  "status": "noReport"
                                }
                              ],
                              "value": "httpd"
                            }
                          ],
                          "id": "root"
                        }
                      ],
                      "complianceDetails": {
                        "noReport": 100
                      },
                      "compliance": 0,
                      "name": "RHEL/CentOS/SuSE packages"
                    },
                    {
                      "nodes": [
                        {
                          "values": [
                            {
                              "reports": [
                                {
                                  "status": "noReport"
                                }
                              ],
                              "value": "httpd"
                            }
                          ],
                          "id": "root"
                        }
                      ],
                      "complianceDetails": {
                        "noReport": 100
                      },
                      "compliance": 0,
                      "name": "Post-modification hook"
                    }
                  ],
                  "complianceDetails": {
                    "noReport": 100
                  },
                  "compliance": 0,
                  "id": "3225efda-0ede-4de8-8b96-abb901fa86d8"
                }
              ],
              "complianceDetails": {
                "noReport": 100
              },
              "compliance": 0,
              "id": "32377fd7-02fd-43d0-aab7-28460a91347b"
            }
          ]
        },
        "result": "success",
        "action": "getRulesCompliance"
      }

     */

[GET] api/compliance/rules/{id}
--------------------------

    /**
    @api {get} /api/compliance/rules/{id} 2. Get a Rule compliance details
    @apiVersion 6.0.0
    @apiName getRuleCompliance
    @apiGroup compliance 
    @apiDescription Get the compliance details of one Rule, whose ID is specified in the URL
    
    @apiUse ruleId

    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X GET 'http://rudder.example.com/rudder/api/latest/compliance/rules/32377fd7-02fd-43d0-aab7-28460a91347b?prettify=true'
    @apiSuccessExample Success-Response:
      HTTP/1.1 200 OK
      {
        "data": {
          "rules": [
            {
              "directives": [
                {
                  "components": [
                    {
                      "nodes": [
                        {
                          "values": [
                            {
                              "reports": [
                                {
                                  "status": "noReport"
                                }
                              ],
                              "value": "None"
                            }
                          ],
                          "id": "root"
                        }
                      ],
                      "complianceDetails": {
                        "noReport": 100
                      },
                      "compliance": 0,
                      "name": "ZMD process"
                    },
                    {
                      "nodes": [
                        {
                          "values": [
                            {
                              "reports": [
                                {
                                  "status": "noReport"
                                }
                              ],
                              "value": "httpd"
                            }
                          ],
                          "id": "root"
                        }
                      ],
                      "complianceDetails": {
                        "noReport": 100
                      },
                      "compliance": 0,
                      "name": "RHEL/CentOS/SuSE packages"
                    },
                    {
                      "nodes": [
                        {
                          "values": [
                            {
                              "reports": [
                                {
                                  "status": "noReport"
                                }
                              ],
                              "value": "httpd"
                            }
                          ],
                          "id": "root"
                        }
                      ],
                      "complianceDetails": {
                        "noReport": 100
                      },
                      "compliance": 0,
                      "name": "Post-modification hook"
                    }
                  ],
                  "complianceDetails": {
                    "noReport": 100
                  },
                  "compliance": 0,
                  "id": "3225efda-0ede-4de8-8b96-abb901fa86d8"
                }
              ],
              "complianceDetails": {
                "noReport": 100
              },
              "compliance": 0,
              "id": "32377fd7-02fd-43d0-aab7-28460a91347b"
            }
          ]
        },
        "result": "success",
        "action": "getRuleCompliance"
      }

    */

[GET] api/compliance/nodes/
--------------------------

    /**
    @api {get} api/compliance/nodes 3. Get all Nodes compliance 
    @apiVersion 6.0.0
    @apiName getNodesCompliance 
    @apiGroup compliance
    @apiDescription Get the compliance details of all Nodes
    
    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X GET 'https://rudder.example.com/rudder/api/compliance/nodes?prettify=true'
    @apiSuccessExample Success-Response:
      HTTP/1.1 200 OK
      {
        "data": {
          "nodes": [
            {
              "rules": [
                {
                  "directives": [
                    {
                      "components": [
                        {
                          "values": [
                            {
                              "reports": [
                                {
                                  "status": "noReport"
                                }
                              ],
                              "value": "None"
                            }
                          ],
                          "complianceDetails": {
                            "noReport": 100
                          },
                          "compliance": 0,
                          "name": "ZMD process"
                        },
                        {
                          "values": [
                            {
                              "reports": [
                                {
                                  "status": "noReport"
                                }
                              ],
                              "value": "httpd"
                            }
                          ],
                          "complianceDetails": {
                            "noReport": 100
                          },
                          "compliance": 0,
                          "name": "RHEL/CentOS/SuSE packages"
                        },
                        {
                          "values": [
                            {
                              "reports": [
                                {
                                  "status": "noReport"
                                }
                              ],
                              "value": "httpd"
                            }
                          ],
                          "complianceDetails": {
                            "noReport": 100
                          },
                          "compliance": 0,
                          "name": "Post-modification hook"
                        }
                      ],
                      "complianceDetails": {
                        "noReport": 100
                      },
                      "compliance": 0,
                      "id": "3225efda-0ede-4de8-8b96-abb901fa86d8"
                    }
                  ],
                  "complianceDetails": {
                    "noReport": 100
                  },
                  "compliance": 0,
                  "id": "32377fd7-02fd-43d0-aab7-28460a91347b"
                }
              ],
              "complianceDetails": {
                "noReport": 100
              },
              "compliance": 0,
              "id": "root"
            }
          ]
        },
        "result": "success",
        "action": "getNodesCompliance"
      }


    */


[GET] api/compliance/nodes/{id}
-----------------

    /**
    @api {get} api/compliance/nodes/{id} 4. Get Compliance details of a Node 
    @apiVersion 6.0.0
    @apiName getNodeCompliance
    @apiGroup compliance
    @apiDescription Get compliance details of the Node passed as parameter
    
    @apiUse nodeId
    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X GET 'http://rudder.example.com/rudder/api/compliance/nodes/root?prettify=true'
    @apiSuccessExample Success-Response:
      HTTP/1.1 200 OK
      {
        "data": {
          "nodes": [
            {
              "rules": [
                {
                  "directives": [
                    {
                      "components": [
                        {
                          "values": [
                            {
                              "reports": [
                                {
                                  "status": "noReport"
                                }
                              ],
                              "value": "None"
                            }
                          ],
                          "complianceDetails": {
                            "noReport": 100
                          },
                          "compliance": 0,
                          "name": "ZMD process"
                        },
                        {
                          "values": [
                            {
                              "reports": [
                                {
                                  "status": "noReport"
                                }
                              ],
                              "value": "httpd"
                            }
                          ],
                          "complianceDetails": {
                            "noReport": 100
                          },
                          "compliance": 0,
                          "name": "RHEL/CentOS/SuSE packages"
                        },
                        {
                          "values": [
                            {
                              "reports": [
                                {
                                  "status": "noReport"
                                }
                              ],
                              "value": "httpd"
                            }
                          ],
                          "complianceDetails": {
                            "noReport": 100
                          },
                          "compliance": 0,
                          "name": "Post-modification hook"
                        }
                      ],
                      "complianceDetails": {
                        "noReport": 100
                      },
                      "compliance": 0,
                      "id": "3225efda-0ede-4de8-8b96-abb901fa86d8"
                    }
                  ],
                  "complianceDetails": {
                    "noReport": 100
                  },
                  "compliance": 0,
                  "id": "32377fd7-02fd-43d0-aab7-28460a91347b"
                }
              ],
              "complianceDetails": {
                "noReport": 100
              },
              "compliance": 0,
              "id": "root"
            }
          ]
        },
        "result": "success",
        "action": "getNodeCompliance"
      }

      */

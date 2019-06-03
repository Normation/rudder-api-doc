
This file describes REST API v6 for compliance.

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
/**
   @apiDefine ruleLevel

   @apiParam (Mono) {Number}   [level=10] Number of depth level of compliance objects to display 
			          (1:rules, 2:directives, 3:components, 4:nodes, 5:values, 6:reports)
*/
/**
   @apiDefine nodeLevel

    @apiParam (Mono) {Number}   [level=10] Number of depth level of compliance objects to display 
			          (1:nodes, 2:rules, 3:directives, 4:components, 5:values, 6:reports)
	
*/

[GET] api/compliance
-----------------

    /**
    @api {get} /api/compliance 1. Display global compliance of a Rudder server 
    @apiVersion 10.0.0
    @apiName getGlobalCompliance
    @apiGroup Compliance
    @apiDescription Get global compliance of a Rudder server
    
    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X GET 'http://rudder.example.com/rudder/api/latest/compliance?prettify=true'
    @apiSuccessExample Success-Response:
      HTTP/1.1 200 OK
      {
        "action": "getGlobalCompliance",
        "result": "success",
        "data": {
          "globalCompliance": {
            "compliance": 57,
            "complianceDetails": {
              "successAlreadyOK": 48.68,
              "noReport": 36.18,
              "successNotApplicable": 5.92,
              "unexpectedMissingComponent": 2.63,
              "error": 1.32,
              "unexpectedUnknownComponent": 2.63,
              "successRepaired": 2.63
            }
          }
        }
      }

      */


[GET] api/compliance/rules
-----------------

    /**
    @api {get} /api/compliance/rules 2. Display compliance of all Rules
    @apiVersion 8.0.0
    @apiName getRulesCompliance
    @apiGroup Compliance
    @apiDescription Get compliance of all Rules available in Rudder

    @apiUse ruleLevel
	
    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X GET 'http://rudder.example.com/rudder/api/latest/compliance/rules?level=2&prettify=true'
    @apiSuccessExample Success-Response:
      HTTP/1.1 200 OK
      {
        "data": {
          "rules": [{
            "directives": [{
              "compliance": 0,
              "id": "3225efda-0ede-4de8-8b96-abb901fa86d8"
            }],
            "mode": "full-compliance",
            "complianceDetails": {
              "noReport": 100
            },
            "compliance": 0,
            "id": "32377fd7-02fd-43d0-aab7-28460a91347b"
          }]
        },
        "result": "success",
        "action": "getRulesCompliance"
      }

     */

[GET] api/compliance/rules/{id}
--------------------------

    /**
    @api {get} /api/compliance/rules/{id} 3. Get a Rule compliance details
    @apiVersion 8.0.0
    @apiName getRuleCompliance
    @apiGroup Compliance 
    @apiDescription Get the compliance details of one Rule, whose ID is specified in the URL
    
    @apiUse ruleId
    @apiUse ruleLevel

    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X GET 'http://rudder.example.com/rudder/api/latest/compliance/rules/32377fd7-02fd-43d0-aab7-28460a91347b?level=2&prettify=true'
    @apiSuccessExample Success-Response:
      HTTP/1.1 200 OK
      {
        "data": {
          "rules": [{
            "directives": [{
              "compliance": 0,
              "id": "3225efda-0ede-4de8-8b96-abb901fa86d8"
            }],
            "complianceDetails": {
              "noReport": 100
            },
            "compliance": 0,
            "id": "32377fd7-02fd-43d0-aab7-28460a91347b"
            "mode": "full-compliance"
          }]
        },
        "result": "success",
        "action": "getRuleCompliance"
      }

    */

[GET] api/compliance/nodes/
--------------------------

    /**
    @api {get} /api/compliance/nodes 4. Get all Nodes compliance 
    @apiVersion 8.0.0
    @apiName getNodesCompliance 
    @apiGroup Compliance
    @apiDescription Get the compliance details of all Nodes
    
    @apiUse nodeLevel

    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X GET 'https://rudder.example.com/rudder/api/compliance/nodes?level=2&prettify=true'
    @apiSuccessExample Success-Response:
      HTTP/1.1 200 OK
      {
        "data": {
          "nodes": [{
            "rules": [{
              "complianceDetails": {
                "noReport": 100
              },
            "complianceDetails": {
              "noReport": 100
            },
            "compliance": 0,
            "id": "root"
            "mode": full - compliance ",
          }]
        },
        "result": "success",
        "action": "getNodesCompliance"
      }


    */


[GET] api/compliance/nodes/{id}
-----------------

    /**
    @api {get} /api/compliance/nodes/{id} 5. Get Compliance details of a Node 
    @apiVersion 8.0.0
    @apiName getNodeCompliance
    @apiGroup Compliance
    @apiDescription Get compliance details of the Node passed as parameter
    
    @apiUse nodeId
    @apiUse nodeLevel

    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X GET 'http://rudder.example.com/rudder/api/compliance/nodes/root?level=1&prettify=true'
    @apiSuccessExample Success-Response:
      HTTP/1.1 200 OK
      {
        "data": {
          "nodes": [
            "rules": [{
              "compliance": 0,
              "id": "32377fd7-02fd-43d0-aab7-28460a91347b"
            }],
            "mode": "full-compliance",
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


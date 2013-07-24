
This file describe REST API v2 for rules.

Corresponding code is available here: 
https://github.com/Normation/rudder/blob/master/rudder-web/src/main/scala/com/normation/rudder/web/rest/rule/RuleAPI2.scala


[GET] api/2/rules
-----------------

    /**
    @api {get} /api/2/rules List all rules
    @apiVersion 2.0.0
    @apiName listRules
    @apiGroup Rules
    
    @apiExample Example usage:
    curl -H "X-API-Token:cEMKWn38wzgpIZPwmipe1NPeAmfzwroR" -H "X-API-Version: 2" -X GET http://localhost/rudder/api/rules
    

     */


[PUT] api/2/rules
-----------------

    /**
    @api {put} /api/2/rules Create a new rule
    @apiVersion 2.0.0
    @apiName createRule
    @apiGroup Rules
    
    @apiExample Example usage:
    curl -H "X-API-Token:TokenId” -H "X-API-Version: 2" -X PUT http://localhost/rudder/api/rules -d "displayName=Name of New Rule"

     */


[PUT] api/2/rules
-----------------

    /**
    @api {put} /api/2/rules Clone a rule
    @apiVersion 2.0.0
    @apiName cloneRule
    @apiGroup Rules
    
    @apiExample Example usage:
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X PUT http://localhost/rudder/api/rules  -d "source=RuleIDSource" -d "displayName=Name of New Rule”

     */

[GET] api/2/rules/{id}
--------------------------

    /**
    @api {get} /api/2/rules/{id} Get rule details by id
    @apiVersion 2.0.0
    @apiName ruleDetails
    @apiGroup Rules
     
    @apiExample Example usage:
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X GET http://localhost/rudder/api/rules/RuleID

    */

[DELETE] api/2/rules/{id}
--------------------------

    /**
    @api {delete} /api/2/rules/{id} Delete a rule by id
    @apiVersion 2.0.0
    @apiName deleteRule
    @apiGroup Rules
     
    @apiExample Example usage:
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X DELETE http://localhost/rudder/api/rules/RuleID

    */


[POST] api/2/rules/{id}
--------------------------

    /**
    @api {post} /api/2/rules/{id} Update the rule with given id
    @apiVersion 2.0.0
    @apiName updateRule
    @apiGroup Rules
     
    @apiExample Example usage:
    Update display name: 
    curl -H "X-API-Token:TokenId" -H "X-API-Version: 2" -X POST http://localhost/rudder/api/rules/RuleID -d "displayName=Name of Rule"


    */

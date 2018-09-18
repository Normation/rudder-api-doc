
This file describes system REST API 

/**
   @apiDefine nodeId

   @apiParam (URL parameters) {UUID} id ID of the Node.
*/
/**
  @apiDefine Mono Mono valued parameters - Those parameters will only work with one value
 */
/**
  @apiDefine Multi Multi valued parameters - Those parameters need to be entered several times, they will add each other to form a list.
 */
/**
  @apiDefine Query Query parameters - Those parameters will be used to filter Nodes, based on group definition query system
 */
/
== [GET] api/system/status

    /**
    @api {get} /api/system/status 1. Check Rudder web status
    @apiVersion 11.0.0
    @apiName getStatus
    @apiGroup System

    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" https://rudder.example.com/rudder/api/latest/system/status

    @apiSuccessExample Success-Response:
HTTP/1.1 200 OK
{
  "action": "getStatus",
  "result": "success",
  "data": {
    "global": "OK"
  }
}

     */

== [POST] api/system/reload

    /**
    @api {post} /api/system/reload 2. Reload both techniques and dynamic groups
    @apiVersion 11.0.0
    @apiName reloadAll
    @apiGroup System

    @apiExample Example usage (curl):
     curl -H "X-API-Token: yourToken" -X POST 'https://rudder.example.com/rudder/api/latest/system/reload'

    @apiSuccessExample Success Response (curl):
HTTP/1.1 200 OK
{
  "action": "reloadAll",
  "result": "success",
  "data": {
    "groups": "Started",
    "techniques": "Started"
  }
}
*/
== [POST] api/system/techniques/reload

    /**
    @api {post} /api/reload/techniques 3. Reload Technique library
    @apiVersion 11.0.0
    @apiName reloadTechniques
    @apiGroup System

    @apiExample Example usage (curl):
     curl -H "X-API-Token: yourToken" -X POST 'https://rudder.example.com/rudder/api/latest/system/reload/techniques'

    @apiSuccessExample Success Response (curl):
HTTP/1.1 200 OK
{
  "action": "reloadTechniques",
  "result": "success",
  "data": {
    "techniques": "Started"
  }
}
*/
== [POST] api/system/reload/groups

    /**
    @api {post} /api/system/reload/groups 4. Reload dynamic groups
    @apiVersion 11.0.0
    @apiName reloadGroups
    @apiGroup System

    @apiExample Example usage (curl):
     curl -H "X-API-Token: yourToken" -X POST 'https://rudder.example.com/rudder/api/latest/system/reload/groups'

    @apiSuccessExample Success Response (curl):
HTTP/1.1 200 OK
{
  "action": "reloadGroups",
  "result": "success",
  "data": {
    "groups": "Started"
  }
}
*/
== [POST] api/system/regenerate/policies

    /**
    @api {post} /api/regenerate/policies 5. Trigger a new policy generation
    @apiVersion 11.0.0
    @apiName regeneratePolicies
    @apiGroup System

    @apiExample Example usage (curl):
     curl -H "X-API-Token: yourToken" -X POST 'https://rudder.example.com/rudder/api/latest/regenerate/policies'

    @apiSuccessExample Success Response (curl):
HTTP/1.1 200 OK
{
  "action": "regeneratePolicies",
  "result": "success",
  "data": {
    "policies": "Started"
  }
}
*/

== [POST] api/system/update/policies

    /**
    @api {post} /api/system/update/policies 7. Trigger update of policies
    @apiVersion 11.0.0
    @apiName updatePolicies
    @apiGroup System

    @apiExample Example usage (curl):
     curl -H "X-API-Token: yourToken" -X POST 'https://rudder.example.com/rudder/api/latest/update/policies'

    @apiSuccessExample Success Response (curl):
HTTP/1.1 200 OK
{
  "action": "updatePolicies",
  "result": "success",
  "data": {
    "policies": "Started"
  }
}
*/

== [GET] api/system/archives/<kind>

    /**
    @api {get} /api/system/archives/<archiveKind> 8. List Rudder archives
    @apiVersion 11.0.0
    @apiName list<Kind>Archive
    @apiGroup System

    @apiExample Example usage (Full archive):
    curl -H "X-API-Token: yourToken" https://rudder.example.com/rudder/api/latest/system/archives/full

    @apiSuccessExample Success-Response (Full archive):
HTTP/1.1 200 OK
{
  "action": "listFullArchive",
  "result": "success",
  "data": {
    "full": [
      {
        "id": "2018-09-13_18-41-18.748",
        "date": "2018-09-13 at 18:41:18",
        "commiter": "rudder",
        "gitCommit": "f2bae753dd8a98a8879ab1d2a0a2ecb494b18daa"
      }
    ]
  }
}

    @apiExample Example usage (Rule archive):
    curl -H "X-API-Token: yourToken" https://rudder.example.com/rudder/api/latest/system/archives/rules

    @apiSuccessExample Success-Response (Rule archive):
HTTP/1.1 200 OK
{
  "action": "listRulesArchive",
  "result": "success",
  "data": {
    "rules": [
      {
        "id": "2018-09-13_18-41-18.748",
        "date": "2018-09-13 at 18:41:18",
        "commiter": "rudder",
        "gitCommit": "f2bae753dd8a98a8879ab1d2a0a2ecb494b18daa"
      },
      {
        "id": "2018-09-13_18-41-16.901",
        "date": "2018-09-13 at 18:41:16",
        "commiter": "rudder",
        "gitCommit": "eba16f91631cd6248276ad66a9f0f01f1418fe25"
      },
      {
        "id": "2018-09-13_18-41-16.761",
        "date": "2018-09-13 at 18:41:16",
        "commiter": "rudder",
        "gitCommit": "b8ff871bef62f2a64c0e2fe0b9a3c722bf8ac9ee"
      }
    ]
  }
}

    @apiExample Example usage (Directives archive):
    curl -H "X-API-Token: yourToken" https://rudder.example.com/rudder/api/latest/system/archives/directives

    @apiSuccessExample Success-Response (Directive archive):
{
  "action": "listDirectivesArchive",
  "result": "success",
  "data": {
    "directives": [
      {
        "id": "2018-09-14_11-18-13.353",
        "date": "2018-09-14 at 11:18:13",
        "commiter": "rudder",
        "gitCommit": "43a2e9f37131ae797eedfb4776401bc326080f7f"
      },
      {
        "id": "2018-09-14_11-18-12.079",
        "date": "2018-09-14 at 11:18:12",
        "commiter": "rudder",
        "gitCommit": "21e9b8ebc77f0fe550b8c1f2ab4d829fc1804ad8"
      }
    ]
  }
}
    @apiExample Example usage (Groups archive):
    curl -H "X-API-Token: yourToken" https://rudder.example.com/rudder/api/latest/system/archives/groups

    @apiSuccessExample Success-Response (Groups archive):

{
  "action": "listGroupsArchive",
  "result": "success",
  "data": {
    "groups": [
      {
        "id": "2018-09-14_11-18-13.353",
        "date": "2018-09-14 at 11:18:13",
        "commiter": "rudder",
        "gitCommit": "43a2e9f37131ae797eedfb4776401bc326080f7f"
      },
      {
        "id": "2018-09-14_11-18-12.358",
        "date": "2018-09-14 at 11:18:12",
        "commiter": "rudder",
        "gitCommit": "71bd69a18af16e9f6bd2743b6037a964ccda3441"
      }
    ]
  }
}

     */

== [POST] api/system/archives/<kind>

    /**
    @api {post} /api/system/archives/<archiveKind> 9. Create a new Rudder archive
    @apiVersion 11.0.0
    @apiName archive<Kind>
    @apiGroup System

    @apiExample Example usage (Full archive):
    curl -H "X-API-Token: yourToken" -X POST https://rudder.example.com/rudder/api/latest/system/archives/full

    @apiSuccessExample Success-Response (Full archive):
{
  "action": "archiveFull",
  "result": "success",
  "data": {
    "full": {
      "commiter": "Rudder system account",
      "gitCommit": "546de1b211ecc5b7ca295abac2191bc6bb05d44e",
      "id": "2018-09-17_16-06-15.255"
    }
  }
}



      */


/**
   @apiDefine archiveKind

   @apiParam (URL parameters) {Archive kind} kind Kind of the archive you want to manage (full, groups, directives, rules).
*/
/**
  @apiDefine Mono Mono valued parameters - Those parameters will only work with one value
 */
/**
  @apiDefine Multi Multi valued parameters - Those parameters need to be entered several times, they will add each other to form a list.
 */

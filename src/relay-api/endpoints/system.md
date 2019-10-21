This file describes system API 

== [GET] system/status

    /**
    @api {get} /relay-api/system/status 1. Check relay status
    @apiVersion 1.0.0
    @apiName getStatus
    @apiGroup System

    @apiExample Local example usage:
    curl http://localhost:3030/rudder/relay-api/1/system/status

    @apiSuccessExample Success-Response:
HTTP/1.1 200 OK
{
  "data": {
    "database": {
      "status": "success"
    },
    "configuration": {
      "status": "error",
      "details": "configuration parsing error: missing field `node_id` for key `general` at line 45 column 1"
    }
  },
  "result": "success",
  "action": "getStatus"
}

    */

== [GET] system/info

    /**
    @api {get} /relay-api/system/info 2. Get information about Rudder version
    @apiVersion 1.0.0
    @apiName getSystemInfo
    @apiGroup System

    @apiExample Local example usage:
    curl http://localhost:3030/rudder/relay-api/1/system/info

    @apiSuccessExample Success-Response:
HTTP/1.1 200 OK
{
  "action": "getSystemInfo",
  "result": "success",
  "data": {
    "rudder": {
      "major-version": "6.0",
      "full-version": "6.0.1",
    }
  }
}

     */

== [POST] system/reload

    /**
    @api {post} /relay-api/system/reload 3. Reload relay data files and logging configuration
    @apiVersion 1.0.0
    @apiName reloadConfiguration
    @apiGroup System
    @apiDescription Allows to trigger a reload of data files (nodes list, certificates) and logging configuration. Reload is synchronous, and if a success is returned, the reload is already effective.

    @apiExample Local example usage:
    curl -X POST http://localhost:3030/rudder/relay-api/1/system/reload

    @apiSuccessExample Success Response:
HTTP/1.1 200 OK
{
  "result": "success",
  "action": "reloadConfiguration"
}

*/

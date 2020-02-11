
This file describes inventories REST API 

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

== [GET] api/inventories/info

    /**
    @api {get} /api/inventories/info 1. Get information about inventory current processing status
    @apiVersion 12.0.0
    @apiName queueInformation
    @apiGroup Inventories

    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" https://rudder.example.com/rudder/api/latest/

    @apiSuccessExample Success-Response:
HTTP/1.1 200 OK
{
  "action": "queueInformation",
  "result": "success",
  "data": {
    "queueMaxSize": 50,
    "queueSaturated": false
  }
}

    */

== [POST] api/inventories/upload

    /**
    @api {post} /api/inventories/upload 2. Upload an inventory for processing
    @apiVersion 12.0.0
    @apiName uploadInventory
    @apiGroup Inventories

    @apiExample Example usage:
    curl -X POST -H "X-API-Token: yourToken" https://rudder.example.com/rudder/api/latest/inventories/upload -F "file=@inventory-file" -F "signature=@signature-file"

    @apiSuccessExample Success-Response:
HTTP/1.1 200 OK
{
  "action": "uploadInventory",
  "result": "success",
  "data": "Inventory 'file' for Node 'c1bab9fc-bcf6-4d59-a397-84c8e2fc06c0' added to processing queue." 
}



     */

== [POST] api/inventories/watcher/start

    /**
    @api {post} /api/inventories/watcher/start 3. Start inventory file watcher (inotify)
    @apiVersion 12.0.0
    @apiName fileWatcherStart
    @apiGroup Inventories

    @apiExample Example usage (curl):
     curl -H "X-API-Token: yourToken" -X POST 'https://rudder.example.com/rudder/api/latest/inventories/watcher/start'

    @apiSuccessExample Success Response (curl):
HTTP/1.1 200 OK
{
  "action": "fileWatcherStart",
  "result": "success",
  "data": "Incoming inventory watcher started"
}
*/
== [POST] api/inventories/watcher/stop

    /**
    @api {post} /api/reload/watcher/stop 4. Stop inventory file watcher (inotify)
    @apiVersion 12.0.0
    @apiName fileWatcherStop
    @apiGroup Inventories

    @apiExample Example usage (curl):
     curl -H "X-API-Token: yourToken" -X POST 'https://rudder.example.com/rudder/api/latest/inventories/watcher/stop'

    @apiSuccessExample Success Response (curl):
HTTP/1.1 200 OK
{
  "action": "fileWatcherStop",
  "result": "success",
  "data": "Incoming inventory watcher stopped"
}
*/
== [POST] api/inventories/watcher/restart

    /**
    @api {post} /api/inventories/watcher/restart 5. Restart inventory file watcher (inotify)
    @apiVersion 12.0.0
    @apiName fileWatcherRestart
    @apiGroup Inventories

    @apiExample Example usage (curl):
     curl -H "X-API-Token: yourToken" -X POST 'https://rudder.example.com/rudder/api/latest/inventories/watcher/restart'

    @apiSuccessExample Success Response (curl):
HTTP/1.1 200 OK
{
  "action": "fileWatcherRestart",
  "result": "success",
  "data": "Incoming inventory watcher restarted"
}
*/


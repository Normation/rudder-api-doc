This file describes shared-files REST API

 /**
   @apiDefine target_id

   @apiParam (URL parameters) {UUID} target_id ID of the target node
*/

 /**
   @apiDefine source_id

   @apiParam (URL parameters) {UUID} source_id ID of the source node
*/

 /**
   @apiDefine file_id

   @apiParam (URL parameters) {String} file_id ID of the shared file, must match `[A-z0-9_-.]`
*/

== [HEAD] api/shared-files/{target_id}/{source_id}/{file_id}

    /**
    @api {head} /api/shared-files/{target_id}/{source_id}/{file_id} 1. Check if shared file is up to date
    @apiVersion 1.0.0
    @apiName sharedFilesHead
    @apiGroup Shared files
    
    @apiUse target_id
    @apiUse source_id
    @apiUse file_id
    @apiParam (URL parameters) hash Hash of the target file, used for comparison

    @apiDescription Allows checking if the file needs to be updated. If the file is there and the hash matches, returns a `200`, and a `404` in any other case.

    @apiExample Example usage:
    curl http://127.0.0.1:3030/rudder/relay-api/1/shared-files/c745a140-40bc-4b86-b6dc-084488fc906b/37817c4d-fbf7-4850-a985-50021f4e8f41/file?hash=c22a3fb1e9de4bfa697ba258f60f14339b72c3faeb043cb75379b9ebcb2717c3

     */

== [PUT] api/shared-files/{target_id}/{source_id}/{file_id}

    /**
    @api {put} /api/shared-files/{target_id}/{source_id}/{file_id} 2. Share a file with its metadata
    @apiVersion 1.0.0
    @apiName sharedFilesPut
    @apiGroup Shared files
    
    @apiUse target_id
    @apiUse source_id
    @apiUse file_id
    @apiParam (URL parameters) {TTL} ttl TTL of the file, can be a number of seconds or a duration (in the `1d 2h 3m 4s`, `1d`, etc.) form

     */

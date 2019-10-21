This file describes shared-files API

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

== [HEAD] relay-api/shared-files/{target_id}/{source_id}/{file_id}

    /**
    @api {head} /relay-api/shared-files/{target_id}/{source_id}/{file_id} 1. Check if shared file is up to date
    @apiVersion 1.0.0
    @apiName sharedFilesHead
    @apiGroup Shared files
    
    @apiUse target_id
    @apiUse source_id
    @apiUse file_id
    @apiParam (URL parameters) {Hash} hash Hash of the target file, used for comparison

    @apiDescription Allows checking if the file needs to be updated. If the file is there and the hash matches, returns a `200`, and a `404` in any other cases.

    @apiExample Local example usage:
    curl --head http://127.0.0.1:3030/rudder/relay-api/1/shared-files/c745a140-40bc-4b86-b6dc-084488fc906b/37817c4d-fbf7-4850-a985-50021f4e8f41/file?hash=c22a3fb1e9de4bfa697ba258f60f14339b72c3faeb043cb75379b9ebcb2717c3

    @apiExample Example usage:
    curl --head https://rudder.example.com/rudder/relay-api/shared-files/c745a140-40bc-4b86-b6dc-084488fc906b/37817c4d-fbf7-4850-a985-50021f4e8f41/file?hash=c22a3fb1e9de4bfa697ba258f60f14339b72c3faeb043cb75379b9ebcb2717c3

     */

== [PUT] relay-api/shared-files/{target_id}/{source_id}/{file_id}

    /**
    @api {put} /relay-api/shared-files/{target_id}/{source_id}/{file_id} 2. Share a file with its metadata
    @apiVersion 1.0.0
    @apiName sharedFilesPut
    @apiGroup Shared files
    
    @apiUse target_id
    @apiUse source_id
    @apiUse file_id
    @apiParam (URL parameters) {TTL} ttl TTL of the file, can be a number of seconds or a duration (in the `1d 2h 3m 4s`, `1d`, `1 day`, `3 hours`, etc.) form

    @apiParam (Metadata parameters) {Version} header Version of the metadata, for now always `rudder-signature-v1`
    @apiParam (Metadata parameters) {HashType} algorithm Can be `sha256` or `sha512`
    @apiParam (Metadata parameters) {Disgest} digest Signature of the file (can be obtained with `openssl dgst -passin "pass:${PASSPHRASE}" -sha512 -hex -sign "${PRIVKEY}" < "${FILE}"`)
    @apiParam (Metadata parameters) {Hash} hash_value Hash of the file, using the chosen hash type
    @apiParam (Metadata parameters) {HashType} short_pubkey Agent's public key, matching the key used to sign the file
    @apiParam (Metadata parameters) {Hostname} hostname Source node's hostname
    @apiParam (Metadata parameters) {Date} keydate Formatted date, `yyyy-mm-dd HH:mm:ss.ms +XXXX` where XXXX stands for the four timezone digits, according to RFC 822.
    @apiParam (Metadata parameters) {Id} keyid Public key identifier (last 4 bytes of the modulus)

    @apiDescription Allow shared a file, along with metadata and a ttl. The request body a the concatenation
    of the metadata (containing the signature) with the file content, separated by en empty line. The receiving relay will either directly share it if the target node is a sub node, or forward the request to the appropriate relay (sub relay or upstream depending if it is under the current relay or not).

     */

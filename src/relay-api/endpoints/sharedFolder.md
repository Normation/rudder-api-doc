This file describes shared-folder API

== [HEAD] relay-api/shared-folder/{path}/

    /**
    @api {head} /relay-api/shared-folder/{path} 1. Check file hash in the shared-folder
    @apiVersion 1.0.0
    @apiName sharedFolderHash
    @apiGroup Shared folder
    
    @apiDescription Allows checking for a file content hash, typically to check if an update is available. If the file hash matches the computed one, a `304` code is returned. If the file exists but does not match the hash (or the hash is absent), a `200` code id returned. Finally, if the file does not exist, a `404` code is returned. Note that, contrary to what could be expected from a `HEAD` method, the returned `content-length` and `content-type` headers do not match those of the target file (accessible with a `GET`). The client has to authenticate with TLS client authentication using the agent certificate and key, the access is only granted to nodes that are managed by the relay.

    @apiParam (URL parameters) {Path} path Path of the target file, relative to shared-folder directory
    @apiParam {Hash} [hash] Hash of the target file
    @apiParam {HashType} [hash_type=sha256] Hash used, can be `sha256` or `sha512`

    @apiExample Local example usage:
    curl --head http://localhost:3030/rudder/relay-api/1/shared-folder/myapplication/myfile.conf?hash_type=sha256&hash=181210f8f9c779c26da1d9b2075bde0127302ee0e3fca38c9a83f5b1dd8e5d3b
    @apiExample Example usage:
    curl --head --cert "C:\...\etc\ssl\localhost.cert:Rudder-dsc passphrase" --key "C:\...\etc\ssl\localhost.priv" https://rudder.example.com/rudder/relay-api/shared-folder/myapplication/myfile.conf?hash_type=sha256&hash=181210f8f9c779c26da1d9b2075bde0127302ee0e3fca38c9a83f5b1dd8e5d3b

     */

== [GET] relay-api/shared-folder/{path}/

    /**
    @api {get} /relay-api/shared-folder/{path} 2. Get a file from the shared-folder
    @apiVersion 1.0.0
    @apiName sharedFolder
    @apiGroup Shared folder
    
    @apiDescription Allows downloading file from the shared-folder. The client has to authenticate with TLS client authentication using the agent certificate and key, the access is only granted to nodes that are managed by the relay.

    @apiParam (URL parameters) {Path} path Path of the target file, relative to shared-folder directory

    @apiExample Local example usage:
    curl http://localhost:3030/rudder/relay-api/1/shared-folder/myapplication/myfile.conf

    @apiExample Example usage:
    curl --cert "C:\...\etc\ssl\localhost.cert:Rudder-dsc passphrase" --key "C:\...\etc\ssl\localhost.priv" https://rudder.example.com/rudder/relay-api/shared-folder/myapplication/myfile.conf

     */

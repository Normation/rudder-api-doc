This file describes policies API

== [GET] policies/{nodedid}/rules/dsc/rudder.zip

    /**
    @api {get} /policies/{nodeid}/rules/dsc/rudder.zip 1. Download configuration policies for a DSC node
    @apiVersion 1.0.0
    @apiName getDscPolicies
    @apiGroup Policies
    
    @apiDescription Allows downloading configuration policies for a DSC node, it is used by the Windows agent. The client has to authenticate with TLS client authentication using the agent certificate and key, the access to each policy is only possible with the matching certificate.

    @apiParam (URL parameters) {nodeid} path Path of the target file, relative to shared-folder directory

    @apiExample Example usage:
    curl --output rudder.zip --cert "C:\...\etc\ssl\localhost.cert:Rudder-dsc passphrase" --key "C:\...\etc\ssl\localhost.priv" https://rudder.example.com/policies/3c0781e1-b59f-4b7e-a85b-819297dfce1d/rules/dsc/rudder.zip

     */


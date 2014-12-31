
This file describe REST API v2 for nodes.

Corresponding code is available here: 
https://github.com/Normation/rudder/blob/master/rudder-web/src/main/scala/com/normation/rudder/web/rest/node/NodeAPI2.scala


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

== [GET] api/nodes 

    /**
    @api {get} /api/nodes 1. List accepted Nodes
    @apiVersion 2.0.0
    @apiName listAcceptedNodes
    @apiGroup Nodes
    
    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" https://rudder.example.com/rudder/api/latest/nodes

    @apiSuccessExample Success-Response:
HTTP/1.1 200 OK
{
  "action": "listAcceptedNodes",
  "result": "success",
  "data": {
    "nodes": [
      {
        "id": "f5ebcc89-fd10-4d0d-8e58-58f4634a99b9",
        "status": "accepted",
        "hostname": "node2.rudder.local",
        "osName": "Centos",
        "osVersion": "6.3",
        "machineType": "Virtual"
      },
      {
        "id": "d22d59ce-ce56-4e61-913c-2643681289d3",
        "status": "accepted",
        "hostname": "node4.rudder.local",
        "osName": "Centos",
        "osVersion": "6.3",
        "machineType": "Virtual"
      },
      {
        "id": "d348e50e-07a9-4475-b798-3dadc1b01b14",
        "status": "accepted",
        "hostname": "node3.rudder.local",
        "osName": "Centos",
        "osVersion": "6.3",
        "machineType": "Virtual"
      },
      {
        "id": "18e56738-f390-470a-a048-81833ff50dda",
        "status": "accepted",
        "hostname": "node5",
        "osName": "Debian",
        "osVersion": "7.0",
        "machineType": "Virtual"
      },
      {
        "id": "root",
        "status": "accepted",
        "hostname": "server",
        "osName": "Debian",
        "osVersion": "7.0",
        "machineType": "Virtual"
      },
      {
        "id": "332c238d-65aa-4b4b-bd1b-a89749693f61",
        "status": "accepted",
        "hostname": "node1.rudder.local",
        "osName": "Centos",
        "osVersion": "6.3",
        "machineType": "Virtual"
      }
    ]
  }
}
    
     */


== [GET] api/nodes/pending

    /**
    @api {get} /api/nodes/pending 2. List pending Nodes
    @apiVersion 2.0.0
    @apiName listPendingNodes
    @apiGroup Nodes

    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" https://rudder.example.com/rudder/api/latest/nodes/pending

    @apiSuccessExample Success-Response:
HTTP/1.1 200 OK
{
  "action": "listPendingNodes",
  "result": "success",
  "data": {
    "nodes": [
      {
        "id": "7b13f54f-7ab6-4a45-ada7-9049039b87ca",
        "status": "pending",
        "hostname": "node5",
        "osName": "Debian"
      },
      {
        "id": "80ade5bf-aed9-4f57-8beb-aaaf3e63ec04",
        "status": "pending",
        "hostname": "node6",
        "osName": "Ubuntu"
      }
    ]
  }
}


     */

== [GET] api/nodes/{id}

    /**
    @api {get} /api/nodes/{id} 3. Get Node details
    @apiVersion 4.0.0
    @apiName acceptedNodeDetails
    @apiGroup Nodes
    
    @apiUse nodeId

   @apiParam (Multi) {String}        [include=default] Level of information to include from the node inventory. Some base levels are defined (minimal, default, full). you can add fields you want by adding them to the list, possible values are keys from json answer. 


    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" https://rudder.example.com/rudder/api/latest/nodes/NodeID\?include=full

    @apiSuccessExample Success-Response:
HTTP/1.1 200 OK
{
  "action": "nodeDetails",
  "id": "root",
  "result": "success",
  "data": {
    "nodes": [
      {
        "architectureDescription": "x86_64-linux-thread-multi",
        "memories": [
          {
            "slotNumber": "1",
            "description": "DIMM (Multi-bit ECC)"
          }
        ],
        "ram": 996,
        "accounts": [
          "ftp",
          "postfix",
        ],
        "managementTechnology": [
          {
            "name": "CFEngine Community"
          }
        ],
        "ipAddresses": [
          "127.0.0.1",
          "192.168.170.86"
        ],
        "fileSystems": [
          {
            "name": "swap",
            "totalSpace": 2015
          },
          {
            "name": "ext4",
            "freeSpace": 385,
            "totalSpace": 484,
            "mountPoint": "/boot"
          },
          {
            "name": "ext4",
            "freeSpace": 8477,
            "totalSpace": 13646,
            "mountPoint": "/"
          }
        ],
        "managementTechnologyDetails": {
          "cfengineKeys": [
            "MIIBCAKCAQEAv40NlDNdJjHMSJEzDowgWzHcmq2PSqp8eA+brgWpxaqPq3uRO8JWb/YFFbeVQhMF0AyhwpMA048Jbs0WMp1+E4OShsvEeDJJPX1ohc/mmyxHaeW/SvgQ3YhQksBCMkwZK7Xjh73vsCTSbgJewEbJomhaW7uIt7WJeJW5fge4Nrr17MMQqSXZrzg4Q9BwVwQ4zEGnP3xwBFOoPc6N1q2FkIbv7oO53IfiiCvFhuf6mQPhN6SnFjybJ4SSWjh4tSAnGKN2TGbV8csHbJYOXn+/4EYXTNiYBYu2SC2E/j1hew25HeIs5zUbl3iOu+6PcVugeH9pmRQghekLWWZGXUltMwIBIw=="
          ],
          "cfengineUser": "root"
        },
        "os": {
          "type": "Linux",
          "name": "Centos",
          "version": "6.5",
          "fullName": "CentOS release 6.5 (Final)",
          "kernelVersion": "2.6.32-431.20.3.el6.x86_64"
        },
        "software": [
          {
            "name": "libpciaccess",
            "editor": "CentOS",
            "version": "0.13.1-2.el6",
            "description": "PCI access library"
          },
          {
            "name": "libXrender",
            "editor": "CentOS",
            "version": "0.9.7-2.el6",
            "description": "X.Org X11 libXrender runtime library"
          },
          {
            "name": "dbus-libs",
            "editor": "CentOS",
            "version": "1.2.24-7.el6_3",
            "description": "Libraries for accessing D-BUS"
          },
          [...]
          {
            "name": "rudder-webapp",
            "editor": "Normation",
            "version": "2.10.5.release-1.EL.6",
            "description": "Configuration management and audit tool - webapp"
          },
          {
            "name": "rudder-jetty",
            "editor": "Normation",
            "version": "2.10.5.release-1.EL.6",
            "description": "Configuration management and audit tool - Jetty application server"
          }
        ],
        "processors": [
          {
            "name": "QEMU Virtual CPU version 1.1.2",
            "core": 1,
            "speed": 2000,
            "cpuid": "23 06 00 00 FD FB 8B 07",
            "model": 2,
            "thread": 1,
            "stepping": 3,
            "quantity": 1,
            "familyName": "Other",
            "manufacturer": "Intel"
          }
        ],
        "status": "accepted",
        "bios": [
          {
            "name": "Bochs",
            "editor": "Bochs",
            "version": "Bochs",
            "quantity": 1,
            "releaseDate": "2007-01-01 00:00"
          }
        ],
        "networkInterfaces": [
          {
            "name": "lo",
            "status": "Up",
            "macAddress": "00:00:00:00:00:00",
            "ipAddresses": [
              "127.0.0.1"
            ]
          },
          {
            "name": "eth0",
            "status": "Up",
            "macAddress": "52:54:00:1f:e4:16",
            "ipAddresses": [
              "192.168.170.86"
            ]
          }
        ],
        "lastInventoryDate": "2014-09-08 00:52",
        "environmentVariables": {
          "_": "/opt/rudder/bin/perl",
          "HOSTNAME": "my-server-rudder.com",
          "SHLVL": "15",
          "LC_ALL": "C",
          "DEBIAN_FRONTEND": "noninteractive",
          "MAIL": "/var/spool/mail/root",
          "HOME": "/root",
          "LANG": "C",
          "LESSOPEN": "|/usr/bin/lesspipe.sh %s",
          "HISTCONTROL": "ignoredups",
          "LOGNAME": "root",
          "PWD": "/var/rudder",
          "SHELL": "/bin/sh",
          "USER": "root",
          "HISTSIZE": "1000",
          "PATH": "/opt/rudder/bin/:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/var/rudder/cfengine-community/bin:/var/rudder/cfengine-community/bin:/var/rudder/cfengine-community/bin",
          "G_BROKEN_FILENAMES": "1"
        },
        "storage": [
          {
            "name": "vda",
            "type": "disk",
            "quantity": 1,
            "description": "Virtual",
            "manufacturer": "6900"
          }
        ],
        "id": "root",
        "processes": [
          {
            "pid": 264,
            "tty": "?",
            "name": "[jbd2/dm-0-8]",
            "user": "root",
            "started": "2014-07-30 1:41",
            "memory": 0.0,
            "cpuUsage": 0.0,
            "virtualMemory": 0
          },
          {
            "pid": 23434,
            "tty": "?",
            "name": "postgres: rudder rudder 127.0.0.1(41648) idle",
            "user": "postgres",
            "started": "2014-08-19 3:22",
            "memory": 3.700000047683716,
            "cpuUsage": 0.0,
            "virtualMemory": 237428
          },
          [...]
          {
            "pid": 9,
            "tty": "?",
            "name": "[khelper]",
            "user": "root",
            "started": "2014-07-30 0:00",
            "memory": 0.0,
            "cpuUsage": 0.0,
            "virtualMemory": 0
          },
          {
            "pid": 265,
            "tty": "?",
            "name": "[ext4-dio-unwrit]",
            "user": "root",
            "started": "2014-07-30 0:00",
            "memory": 0.0,
            "cpuUsage": 0.0,
            "virtualMemory": 0
          }
        ],
        "hostname": "my-server-rudder.com",
        "machine": {
          "id": "A5D66CFA-F6FB-C7B3-553E-25D69A92ABD5",
          "type": "Virtual",
          "provider": "qemu"
        },
        "policyServerId": "root"
      }
    ]
  }
}


    */

== [POST] api/nodes/pending/{id}

    /**
    @api {post} /api/nodes/pending/{id} 4. Change pending Node status
    @apiVersion 2.0.0
    @apiName changeNodeStatus
    @apiGroup Nodes

    @apiUse nodeId

    @apiParam {String} status The new status of the node (refused/accepted)

    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X POST https://rudder.example.com/rudder/api/latest/nodes/pending/NodeID -d "status=accepted"


     */

== [POST] api/nodes/{id}

    /**
    @api {post} /api/nodes/{id} 5. Set Node properties
    @apiVersion 5.0.0
    @apiName updateNodeProperties
    @apiGroup Nodes

    @apiUse nodeId

    @apiDescription This API allows to set "key=value" properties in node. This properties are then returned in the node details under the "properties" key, and they can be used to define group.
    Value are non-empty UTF-8 strings. Setting a key to the empty string removes it from the list of properties for that node.

    @apiExample Initial content
# Given the "properties.json" JSON file with content:
{ "properties": [
  { "name": "env_type"    , "value": "production" },
  { "name": "shell"       , "value": "/bin/sh" },
  { "name": "utf-8 poetry", "value": "ᚠᛇᚻ᛫ᛒᛦᚦ᛫ᚠᚱᚩᚠᚢᚱ᛫ᚠᛁᚱᚪ᛫ᚷᛖᚻᚹᛦᛚᚳᚢᛗ" }
] }


    @apiExample Set key
# Setting keys from "properties.json":
curl -H "X-API-Token: yourToken" -X POST  -H "Content-Type: application/json" https://rudder.example.com/rudder/api/latest/nodes/NodeID -d @properties.json

    @apiExample Remove key
# Removing the key "utf-8 poetry" from the command line and updating the "env_type" one:
curl -H "X-API-Token: yourToken" -X POST  -H "Content-Type: application/json" https://rudder.example.com/rudder/api/latest/nodes/NodeID -d '{ "properties": [{ "name":"utf-8 poetry", "value":""}, {"name":"env_type", "value":"deprovisioned"}] }'

    @apiExample Remove key (bis)
# Removing the key "env_type" and changing "shell" (no JSON):
curl -H "X-API-Token: yourToken" -X POST  https://rudder.example.com/rudder/api/latest/nodes/NodeID -d "properties=shell=/bin/false" -d "properties=env_type="

    @apiSuccessExample Success-Response:
HTTP/1.1 200 OK
{
  "action": "updateNodeProperties",
  "id": "4db088c8-d849-4f08-bfa9-ac96a22d461a",
  "result": "success",
  "data": {
    "properties": [
      {
        "name": "env_type",
        "value": "production"
      },
      {
        "name": "shell",
        "value": "/bin/sh"
      },
      {
        "name": "utf-8 poetry",
        "value": "ᚠᛇᚻ᛫ᛒᛦᚦ᛫ᚠᚱᚩᚠᚢᚱ᛫ᚠᛁᚱᚪ᛫ᚷᛖᚻᚹᛦᛚᚳᚢᛗ"
      }
    ]
  }
}

      */




== [DELETE] api/nodes/{id}

    /**
    @api {delete} /api/nodes/{id} 6. Delete Node
    @apiVersion 2.0.0
    @apiName deleteNode
    @apiGroup Nodes
    

    @apiUse nodeId

    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X DELETE https://rudder.example.com/rudder/api/latest/nodes/NodeID

    @apiSuccessExample Success-Response:
HTTP/1.1 200 OK
{
  "action": "changePendingNodeStatus",
  "result": "success",
  "data": {
    "nodes": [
      {
        "id": "80ade5bf-aed9-4f57-8beb-aaaf3e63ec04",
        "status": "deleted",
        "hostname": "node6",
        "osName": "Ubuntu",
        "osVersion": "12.10",
        "machineType": "Virtual"
      }
    ]
  }
}

    @apiErrorExample Error-Response:
HTTP/1.1 500 Server Error
{
  "action": "changePendingNodeStatus",
  "result": "error",
  "errorDetails": "Node with ID '80ade5bf-aed9-4f57-8beb-aaaf3e63ec04' was not found"
}

     */




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
/**
  @apiDefine Query Query parameters - Those parameters will be used to filter Nodes, based on group definition query system
 */
/
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

== [GET] api/nodes

    /**
    @api {get} /api/nodes 1. List accepted Nodes
    @apiVersion 6.0.0
    @apiName listAcceptedNodes
    @apiGroup Nodes

    @apiDescription That function allow you to get details of accepted Nodes. You can make query on those Nodes based on inventory criterion. You can use the same queries than those used in NodeGroup queries

    @apiParam (Multi) {String}   [include=default]  Level of information to include from the node inventory. Some base levels are defined (minimal, default, full). You can add fields you want to a base level by adding them to the list, possible values are keys from json answer. If you don't provide a base level, they will be added to default base level, so if you only want os details, use "minimal,os" as the value for this parameter. Details of returned properties at each level are given in the dedicated menu entry.
    @apiParam (Query) {Query}     query             A query json object like we use as query in NodeGroups. A three field json object { 'composition' : 'and', 'select' : 'node', 'where' : [{"objectType":"node","attribute":"OS","comparator":"eq","value":"Linux"}]}, That parameter can be replaced by the three following (select, composition, where)
    @apiParam (Query) {Criterion} where             The criterion you want to find for your nodes like '[{"objectType":"node","attribute":"OS","comparator":"eq","value":"Linux"}]}'
    @apiParam (Query) {String}    [composition=and] Boolean operator to use between each criteria. Other value is "And". Only used if 'where' is defined.
    @apiParam (Query) {String}    [select=node]     What kind of data we want to include. Here we can get policy servers/relay by setting 'nodeAndPolicyServer'. Only used if where is defined.

    @apiExample Example usage (curl):
     # Get all nodes having a hostname starting with node1 and based on Linux
     curl -H "X-API-Token: yourToken" 'https://rudder.example.com/rudder/api/latest/nodes?where=\[\{"objectType":"node","attribute":"OS","comparator":"eq","value":"Linux"\},\{"objectType":"node","attribute":"nodeHostname","comparator":"regex","value":"node1.*"\}\]'

    @apiExample Example usage (python-requests):
     # Get all nodes having a hostname starting with node1 and based on Linux and only display minmal information (id, hostname, status)
     url = "https://rudder.example.com/rudder/api/latest/nodes"
     linux = {"objectType":"node","attribute":"OS","comparator":"eq","value":"Linux"}
     node1 = {"objectType":"node","attribute":"nodeHostname","comparator":"regex","value":"node1.*"}
     where = [ linux, node1 ]
     params = { "where" : json.dumps(where), "include" : "minimal" }
     headers = { "X-API-TOKEN" : "yourToken" }
     requests.get(url, params = params, headers = headers, verify = False)

    @apiSuccessExample Success Response (curl):
HTTP/1.1 200 OK
{
  "action": "listAcceptedNodes",
  "result": "success",
  "data": {
    "nodes": [
      {
        "architectureDescription": "x86_64-linux-thread-multi",
        "managementTechnology": [
          {
            "name": "CFEngine Community"
          }
        ],
        "hostname": "node1",
        "lastInventoryDate": "2015-04-30 13:50",
        "status": "accepted",
        "ipAddresses": [
          "127.0.0.1",
          "10.0.2.15",
          "192.168.42.81"
        ],
        "machine": {
          "id": "35898d4d-a117-6d94-5bf2-2e956de3f6e8",
          "type": "Virtual",
          "provider": "vbox",
          "manufacturer": "innotek GmbH",
          "serialNumber": "0"
        },
        "properties": [
          {
            "name": "utf-8 poetry",
            "value": "ᚠᛇᚻ᛫ᛒᛦᚦ᛫ᚠᚱᚩᚠᚢᚱ᛫ᚠᛁᚱᚪ᛫ᚷᛖᚻᚹᛦᛚᚳᚢᛗ"
          },
          {
            "name": "env_type",
            "value": "dev"
          }
        ],
        "ram": 244,
        "os": {
          "type": "Linux",
          "name": "Debian",
          "version": "7.2",
          "fullName": "Debian GNU/Linux 7.2 (wheezy)",
          "kernelVersion": "3.2.0-4-amd64"
        },
        "id": "dd404bda-2785-4959-abaa-8f37a0bbd85e",
        "policyServerId": "root"
      }
    ]
  }
}

    @apiSuccessExample Success Response (python-requests):
HTTP/1.1 200 OK
{
  "action": "listAcceptedNodes",
  "result": "success",
  "data": {
    "nodes": [
      {
        "hostname": "node1",
        "status": "accepted",
        "id": "dd404bda-2785-4959-abaa-8f37a0bbd85e"
      }
    ]
  }
}

*/

== Node information level details

  /**
    @apiDefine IncludeMinimal Properties returned by include=minimal
   */
  /**
    @apiDefine IncludeDefault Properties returned by include=default
   */
  /**
    @apiDefine IncludeFull    Properties returned by include=full
  */
/**
@api {Response format documentation} /api/nodes/pending,/api/nodes,/api/nodes/{nodeId} 0. Node information format
@apiVersion 6.0.0
@apiGroup Nodes

@apiDescription Here, we are describing all the available properties on node details on each of the three level: minimal, default and full.
As explain in documentation for the "include" parameters in relevants API call, you can also specify the list of included first level
properties you want to get.

A value is returned *only* if it is defined for the node. For example, "license" are rarelly defined for
Linux software and so software won't have that data.

  @apiParam (IncludeMinimal) {String} id       Rudder unique node identifier
  @apiParam (IncludeMinimal) {String} hostname Fully qualified name of the node
  @apiParam (IncludeMinimal) {String} status   Status of the node in Rudder (pending, accepted, deleted)

  @apiParam (IncludeDefault) {String} [architectureDescription] Information about CPU architecture (32/64 bits)
  @apiParam (IncludeDefault) {String} [description] A human intended description of the node
  @apiParam (IncludeDefault) {JSON}   ipAddresses Array of all IPs (v4 and v6) for the node
  @apiParam (IncludeDefault) {String} [lastInventoryDate] Date and time (yyyy-MM-dd HH:mm) of the last generated inventory report (node time)
  @apiParam (IncludeDefault) {JSON}   [machine] Information about the underlying machine
  @apiParam (IncludeDefault) {String} [machine.id] Rudder unique identifier for the machine
  @apiParam (IncludeDefault) {String} [machine.type] Phtsical or Virtual machine
  @apiParam (IncludeDefault) {String} [machine.provider] In the case of VM, the VM technologie
  @apiParam (IncludeDefault) {String} [machine.manufacturer] Information about machine manufacturer
  @apiParam (IncludeDefault) {String} [machine.serialNumber] If available, a unique identifier provided by the machine
  @apiParam (IncludeDefault) {JSON}   os Rudder unique node identifier
  @apiParam (IncludeDefault) {String} os.type Familly of the OS (Windows/Linux/AIX/FreeBSD/...)
  @apiParam (IncludeDefault) {String} os.name OS name (distribution for Linux, name for Windows, ...)
  @apiParam (IncludeDefault) {String} os.version OS Version (depend of the OS Familly and name)
  @apiParam (IncludeDefault) {String} os.fullName The long, detailled name as reported by the OS
  @apiParam (IncludeDefault) {String} [os.servicePack] Service pack level
  @apiParam (IncludeDefault) {String} os.kernelVersion Version of the kernel
  @apiParam (IncludeDefault) {JSON}   managementTechnology Array of management agents and their type running on the node
  @apiParam (IncludeDefault) {JSON}   managementTechnology.name    Agent name (Community, enterprise, ..)
  @apiParam (IncludeDefault) {JSON}   managementTechnology.version Agent version
  @apiParam (IncludeDefault) {String} policyServerId Rudder unique ID of the policy server from which the node get its policies
  @apiParam (IncludeDefault) {JSON}   properties Array of node properties (either set by user or filled by third party sources)
  @apiParam (IncludeDefault) {String} properties.name] Property name
  @apiParam (IncludeDefault) {JSON}   properties.value Property value, which can be a string or a full-fledge JSON data object
  @apiParam (IncludeDefault) {String} [policyMode] Rudder policy mode for the node ("enforce", "audit", or "default" if the node follows the global configuration)
  @apiParam (IncludeDefault) {String} [ram] Available RAM (in MB)
  @apiParam (IncludeDefault) {JSON}   [timezone] Node time zone information
  @apiParam (IncludeDefault) {String} [timezone.name] Timezone name
  @apiParam (IncludeDefault) {String} [timezone.offset] Timezone offset to UTC

  @apiParam (IncludeFull) {JSON}   [accounts] Array of user accounts declared in the node
  @apiParam (IncludeFull) {JSON}   [bios] BIOS information
  @apiParam (IncludeFull) {String} [bios.name] BIOS name
  @apiParam (IncludeFull) {String} [bios.version] BIOS version
  @apiParam (IncludeFull) {String} [bios.editor] BIOS editor
  @apiParam (IncludeFull) {String} [bios.quantity] Number of BIOS on the machine
  @apiParam (IncludeFull) {String} [bios.description] System provided description of the BIOS (long name)
  @apiParam (IncludeFull) {String} [bios.releaseDate] Release date of the BIOS
  @apiParam (IncludeFull) {JSON}   [controllers] Array of physical controller information objects
  @apiParam (IncludeFull) {String} [controllers.name] Controller name
  @apiParam (IncludeFull) {String} [controllers.type] Controller type
  @apiParam (IncludeFull) {String} [controllers.quantity] Quantity of that controller
  @apiParam (IncludeFull) {String} [controllers.description] System provided description of the controller
  @apiParam (IncludeFull) {String} [controllers.manufacturer] Controller manufacturer
  @apiParam (IncludeFull) {JSON}   [environmentVariables] Array of environement variable objects defined on the node in the context of the agent
  @apiParam (IncludeFull) {String} [environmentVariables.name] Environment Variable name
  @apiParam (IncludeFull) {String} [environmentVariables.value] Environment Variable value
  @apiParam (IncludeFull) {JSON}   [fileSystems] Array of file system objects declared on the node.
  @apiParam (IncludeFull) {String} [fileSystems.name] Type of file system (ext4, swap, etc)
  @apiParam (IncludeFull) {String} [fileSystems.mountPoint] Mount point
  @apiParam (IncludeFull) {String} [fileSystems.description] Description of the file system
  @apiParam (IncludeFull) {String} [fileSystems.fileCount] Number of files
  @apiParam (IncludeFull) {String} [fileSystems.freeSpace] Free space remaining
  @apiParam (IncludeFull) {String} [fileSystems.totalSpace] Total space allocated to the file system
  @apiParam (IncludeFull) {String} [managementTechnologyDetails] Array of additionnal information about management technologie
  @apiParam (IncludeFull) {JSON}   [managementTechnologyDetails.cfengineKeys] Array of public key used by the agent
  @apiParam (IncludeFull) {String} [managementTechnologyDetails.cfengineUser] User account used by the agent
  @apiParam (IncludeFull) {JSON}   [memories] Array of memory slot information objects
  @apiParam (IncludeFull) {String} [memories.name] Name of the memory slot or memory module
  @apiParam (IncludeFull) {String} [memories.speed] Memory speed (frequency)
  @apiParam (IncludeFull) {String} [memories.type] Memory slot type
  @apiParam (IncludeFull) {String} [memories.caption] Manufacturer provided information about the module
  @apiParam (IncludeFull) {String} [memories.quantity] Number of modules in that slot
  @apiParam (IncludeFull) {String} [memories.capacity] Size of modules
  @apiParam (IncludeFull) {String} [memories.slotNumber] Slot number
  @apiParam (IncludeFull) {String} [memories.description] System provided description
  @apiParam (IncludeFull) {String} [memories.serialNumber] Serial number of the module.
  @apiParam (IncludeFull) {JSON}   [networkInterfaces] Detailled information about registered network interfaces on the node
  @apiParam (IncludeFull) {String} [networkInterfaces.name] Interface name (for ex "eth0")
  @apiParam (IncludeFull) {String} [networkInterfaces.mask] network interface mask
  @apiParam (IncludeFull) {String} [networkInterfaces.type] information about the type of network interface
  @apiParam (IncludeFull) {String} [networkInterfaces.speed] information about synchronisation speed
  @apiParam (IncludeFull) {String} [networkInterfaces.status] network interface status (enable or not, up or down)
  @apiParam (IncludeFull) {String} [networkInterfaces.dhcpServer] DHCP server managing that network interface
  @apiParam (IncludeFull) {String} [networkInterfaces.macAddress] MAC addresse of the network interface
  @apiParam (IncludeFull) {JSON}   [networkInterfaces.ipAddresses] Array of IP addresses for that network interface
  @apiParam (IncludeFull) {JSON}   [ports] Array of physical port information objects
  @apiParam (IncludeFull) {String} [ports.name] Port name
  @apiParam (IncludeFull) {String} [ports.type] Port type
  @apiParam (IncludeFull) {String} [ports.quantity] quantity of similar ports
  @apiParam (IncludeFull) {String} [ports.description] system provided description of the port
  @apiParam (IncludeFull) {JSON}   [processes] Array of process information objects
  @apiParam (IncludeFull) {String} [processes.pid] PID of the process
  @apiParam (IncludeFull) {String} [processes.tty] TTY to which the process is attached
  @apiParam (IncludeFull) {String} [processes.name] Process name
  @apiParam (IncludeFull) {String} [processes.user] User account who started the process
  @apiParam (IncludeFull) {String} [processes.started] Status of the process (finished, running, etc)
  @apiParam (IncludeFull) {String} [processes.memory] Memory allocated to the process (at inventory time)
  @apiParam (IncludeFull) {String} [processes.cpuUsage] CPU used by the process (at inventory time)
  @apiParam (IncludeFull) {String} [processes.virtualMemory] Virtual memory allocated to the process (at inventory time)
  @apiParam (IncludeFull) {String} [processes.description] System provided description about the process
  @apiParam (IncludeFull) {JSON}   [processors] Array of CPU information objects.
  @apiParam (IncludeFull) {String} [processors.name] CPU name
  @apiParam (IncludeFull) {String} [processors.arch] CPU architecture type
  @apiParam (IncludeFull) {String} [processors.model] CPU model
  @apiParam (IncludeFull) {String} [processors.familyName]
  @apiParam (IncludeFull) {String} [processors.manufacturer]
  @apiParam (IncludeFull) {String} [processors.quantity] Number of CPU with these features
  @apiParam (IncludeFull) {String} [processors.core] Number of core for that CPU
  @apiParam (IncludeFull) {String} [processors.speed] Speed (frequency) of the CPU
  @apiParam (IncludeFull) {String} [processors.cpuid] identifier of the CPU
  @apiParam (IncludeFull) {String} [processors.thread] Number of thread by core for the CPU
  @apiParam (IncludeFull) {String} [processors.externalClock] External clock used by the CPU
  @apiParam (IncludeFull) {String} [processors.stepping] Stepping or power management information
  @apiParam (IncludeFull) {String} [processors.description] system provided description of the CPU
  @apiParam (IncludeFull) {JSONT}  [slots] Array of physical extension slot information objects
  @apiParam (IncludeFull) {String} [slots.name] Slot name or identifier
  @apiParam (IncludeFull) {String} [slots.status] Slot status (used, powered, etc)
  @apiParam (IncludeFull) {String} [slots.quantity] quantity of similar slots
  @apiParam (IncludeFull) {String} [slots.description] system provided description of the slots
  @apiParam (IncludeFull) {JSON}   [software] Array of software on the node. This can be huge (thousands)
  @apiParam (IncludeFull) {String} [software.name] Name of the software (as reported by the node)
  @apiParam (IncludeFull) {String} [software.version] Version of the software
  @apiParam (IncludeFull) {String} [software.editor] Editor of the software
  @apiParam (IncludeFull) {String} [software.description] A description of the software
  @apiParam (IncludeFull) {String} [software.releaseDate] Release date of the software
  @apiParam (IncludeFull) {JSON}   [software.license] Information about the license
  @apiParam (IncludeFull) {String} [software.license.oem] Is this an OEM license (and information)
  @apiParam (IncludeFull) {String} [software.license.name] License name
  @apiParam (IncludeFull) {String} [software.license.productId] License product identifier
  @apiParam (IncludeFull) {String} [software.license.productKey] License key
  @apiParam (IncludeFull) {String} [software.license.description] License description
  @apiParam (IncludeFull) {String} [software.license.expirationDate] License expiration date
  @apiParam (IncludeFull) {JSON}   [sound] Array of sound card information object
  @apiParam (IncludeFull) {String} [sound.name] Sound card name
  @apiParam (IncludeFull) {String} [sound.quantity] quantity of similar sound cards
  @apiParam (IncludeFull) {String} [sound.description] system provided description of the sound card
  @apiParam (IncludeFull) {JSON}   [storage] Array of storage (disks) information objects
  @apiParam (IncludeFull) {String} [storage.name] Storage name
  @apiParam (IncludeFull) {String} [storage.type] Storage type
  @apiParam (IncludeFull) {String} [storage.size] Storage size in MB
  @apiParam (IncludeFull) {String} [storage.model] Storage model
  @apiParam (IncludeFull) {String} [storage.firmware] Storage firmware information
  @apiParam (IncludeFull) {String} [storage.quantity] quantity of similar storage
  @apiParam (IncludeFull) {String} [storage.description] system provided information about the storage
  @apiParam (IncludeFull) {String} [storage.manufacturer] Storage manufacturer
  @apiParam (IncludeFull) {String} [storage.serialNumber] Storage serial number
  @apiParam (IncludeFull) {JSON}   [videos] Array of video card information objects
  @apiParam (IncludeFull) {String} [videos.name] Video card name
  @apiParam (IncludeFull) {String} [videos.memory] quantity of memory for that video card
  @apiParam (IncludeFull) {String} [videos.chipset] information about video card chipset
  @apiParam (IncludeFull) {String} [videos.quantity] quantity of similar video cards
  @apiParam (IncludeFull) {String} [videos.resolution] resolution used by that video card at inventory time
  @apiParam (IncludeFull) {String} [videos.description] system provided description for that video card
  @apiParam (IncludeFull) {JSON}   [virtualMachines] Array of hosted virtual machine information objects
  @apiParam (IncludeFull) {String} [virtualMachines.name] Name of the hosted virtual machine
  @apiParam (IncludeFull) {String} [virtualMachines.type] Type of the hosted virtual machine
  @apiParam (IncludeFull) {String} [virtualMachines.uuid] Unique identifier of the hosted virtual machine
  @apiParam (IncludeFull) {String} [virtualMachines.vcpu] Number of virtual CPU allocated to the hosted virtual machine
  @apiParam (IncludeFull) {String} [virtualMachines.owner] Owner of the hosted virtual machine
  @apiParam (IncludeFull) {String} [virtualMachines.status] Status (up, starting, etc) of the hosted virtual machine
  @apiParam (IncludeFull) {String} [virtualMachines.memory] Memory allocated to the hosted virtual machine
  @apiParam (IncludeFull) {String} [virtualMachines.subsystem] Technologie of the hosted virtual machine
  @apiParam (IncludeFull) {String} [virtualMachines.description] system provided description of the hosted virtual machine

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

== [GET] api/nodes/pending

    /**
    @api {get} /api/nodes/pending 2. List pending Nodes
    @apiVersion 6.0.0
    @apiName listPendingNodes
    @apiGroup Nodes

    @apiParam (Multi) {String}         [include=default] Level of information to include from the node inventory. Some base levels are defined (minimal, default, full). You can add fields you want to a base level by adding them to the list, possible values are keys from json answer. If you don't provide a base level, they will be added to default base level, so if you only want os details, use "minimal,os" as the value for this parameter

    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" https://rudder.example.com/rudder/api/latest/nodes/pending?include=minimal

    @apiSuccessExample Success-Response:
HTTP/1.1 200 OK
{
  "action": "listPendingNodes",
  "result": "success",
  "data": {
    "nodes": [
      {
        "id": "dd404bda-2785-4959-abaa-8f37a0bbd85e",
        "hostname": "node1",
        "status": "pending"
      },
      {
        "id": "f6223b0e-e2aa-4d1f-b6d1-74de8ea8e513",
        "hostname": "node3.rudder.local",
        "status": "pending"
      },
      {
        "id": "root",
        "hostname": "server.rudder.local",
        "status": "pending"
      }
    ]
  }
}


     */

== [GET] api/nodes/{id}

    /**
    @api {get} /api/nodes/{id} 4. Get Node details
    @apiVersion 4.0.0
    @apiName acceptedNodeDetails
    @apiGroup Nodes

    @apiUse nodeId

    @apiParam (Multi) {String}         [include=default] Level of information to include from the node inventory. Some base levels are defined (minimal, default, full). You can add fields you want to a base level by adding them to the list, possible values are keys from json answer. If you don't provide a base level, they will be added to default base level, so if you only want os details, use "minimal,os" as the value for this parameter


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
    @api {post} /api/nodes/pending/{id} 5. Change pending Node status
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
    @api {post} /api/nodes/{id} 6. Set Node properties
    @apiVersion 5.0.0
    @apiName updateNode
    @apiGroup Nodes

    @apiUse nodeId
    @apiParam (Multi) {Property}       properties A property of the Node defined by its name and its value.

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

== [POST] api/nodes/{id}

    /**
    @api {post} /api/nodes/{id} 5. Update Node settings
    @apiVersion 8.0.0
    @apiName updateNode
    @apiGroup Nodes

    @apiUse nodeId
    @apiParam (Multi) {Property}       properties A property of the Node defined by its name and its value. Value are non-empty UTF-8 strings. Setting a key to the empty string removes it from the list of properties for that node.
    @apiParam {PolicyMode}       policy In which mode the node will apply its configuration policy. You can choose between "audit" and "enfoce" modes, or "default" to use the global mode

    @apiDescription This API allows to update the node settings.

    @apiExample Initial content
# Given the "data.json" JSON file with content:
{ "properties": [
  { "name": "env_type"    , "value": "production" },
  { "name": "shell"       , "value": "/bin/sh" },
  { "name": "utf-8 poetry", "value": "ᚠᛇᚻ᛫ᛒᛦᚦ᛫ᚠᚱᚩᚠᚢᚱ᛫ᚠᛁᚱᚪ᛫ᚷᛖᚻᚹᛦᛚᚳᚢᛗ" }
]
, "policyMode" : "audit"
}


    @apiExample Set properties and change to audit mode
# Setting properties from "data.json" and policy mode to audit:
curl -H "X-API-Token: yourToken" -X POST  -H "Content-Type: application/json" https://rudder.example.com/rudder/api/latest/nodes/NodeID -d @properties.json

    @apiExample Remove one property, change another one
# Removing the key "utf-8 poetry" from the command line and updating the "env_type" one:
curl -H "X-API-Token: yourToken" -X POST  -H "Content-Type: application/json" https://rudder.example.com/rudder/api/latest/nodes/NodeID -d '{ "properties": [{ "name":"utf-8 poetry", "value":""}, {"name":"env_type", "value":"deprovisioned"}] }'

    @apiExample Remove a property, change another one and switch to default mode
# Removing the key "env_type" and changing "shell" and use default policy mode:
curl -H "X-API-Token: yourToken" -X POST  https://rudder.example.com/rudder/api/latest/nodes/NodeID -d "properties=shell=/bin/false" -d "properties=env_type=" -d "policyMode=default"

    @apiSuccessExample Set properties and change to audit mode:
HTTP/1.1 200 OK
{
  "action": "updateNode",
  "id": "4db088c8-d849-4f08-bfa9-ac96a22d461a",
  "result": "success",
  "data": {
    "policyMode": "audit",
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

    @apiSuccessExample Remove property and modify another one:
HTTP/1.1 200 OK
{
  "action": "updateNode",
  "id": "4db088c8-d849-4f08-bfa9-ac96a22d461a",
  "result": "success",
  "data": {
    "policyMode": "audit",
    "properties": [
      {
        "name": "env_type",
        "value": "deprovisioned"
      },
      {
        "name": "shell",
        "value": "/bin/sh"
      }
    ]
  }
}
    @apiSuccessExample Remove a property, modify another and change to audit mode:
HTTP/1.1 200 OK
{
  "action": "updateNode",
  "id": "4db088c8-d849-4f08-bfa9-ac96a22d461a",
  "result": "success",
  "data": {
    "policyMode": "default",
    "properties": [
      {
        "name": "shell",
        "value": "/bin/false"
      }
    ]
  }
}
      */




== [DELETE] api/nodes/{id}

    /**
    @api {delete} /api/nodes/{id} 7. Delete Node
    @apiVersion 2.0.0
    @apiName deleteNode
    @apiGroup Nodes


    @apiUse nodeId

    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X DELETE https://rudder.example.com/rudder/api/latest/nodes/NodeID

    @apiSuccessExample Success-Response:
HTTP/1.1 200 OK
{
  "action": "deleteNode",
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
  "action": "deleteNode",
  "result": "error",
  "errorDetails": "Node with ID '80ade5bf-aed9-4f57-8beb-aaaf3e63ec04' was not found"
}

     */

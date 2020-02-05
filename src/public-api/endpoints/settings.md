
This file describes REST API v8 & v10 & v12 for Settings.

Corresponding code is available here: 
https://github.com/Normation/rudder/blob/branches/rudder/4.1/rudder-web/src/main/scala/com/normation/rudder/web/rest/settings/SettingsApi.scala

/**
   @apiDefine settingId

   @apiParam (URL parameters) {String} id ID/name of the Setting
 */

/**
   @apiDefine MonoSetting Mono valued settings - These settings will only work with one value
 */


== Node information level details


/**
@api {Response format documentation} /api/settings 0. List of all available settings
@apiVersion 8.0.0
@apiGroup Settings

@apiDescription Here is the list of all settings that can be managed within Rudder.

  @apiParam {String} [global_policy_mode] Define the default setting for global policy mode, either "enforce" or "audit"
  @apiParam {Boolean} [global_policy_mode_overridable] Allow overrides on this default setting

  @apiParam {Int} [run_frequency]  Agent run schedule - time between agent runs (in minutes)
  @apiParam {Int} [first_run_hour] First agent run time - hour
  @apiParam {Int} [first_run_minute] First agent run time - minute
  @apiParam {Int} [splay_time] Maximum delay after scheduled run time (random interval)

  @apiParam {Int} [modified_file_ttl] Number of days to retain modified files
  @apiParam {Int} [output_file_ttl] Number of days to retain agent output files

  @apiParam {Boolean} [use_reverse_dns] Use reverse DNS lookups on nodes to reinforce authentication to policy server
  @apiParam {Boolean} [require_time_synchronization] Require time synchronization between nodes and policy server

  @apiParam {String} [rsyslog_reporting_protocol] Protocol used for syslog communication between node and server, either "UDP" (default) or "TCP"
  @apiParam {String} [reporting_mode] Compliance reporting mode, either "full-compliance" (default), "changes-only" or "reports-disabled"

  @apiParam {Int} [heartbeat_frequency] Send heartbeat every heartbeat_frequency runs (only on "changes-only" compliance mode)

  @apiParam {Boolean} [log_all_reports] Log all reports received to /var/log/rudder/reports/all.log

  @apiParam {Boolean} [enable_change_message] Enable change audit logs
  @apiParam {Boolean} [mandatory_change_message] Make message mandatory
  @apiParam {String} [change_message_prompt] Explanation to display


  @apiParam {Boolean} [enable_change_request]  Enable Change Requests
  @apiParam {Boolean} [enable_self_validation] Allow self validation
  @apiParam {Boolean} [enable_self_deployment] Allow self deployment

  @apiParam {Boolean} [display_recent_changes_graphs] Display changes graphs

  @apiParam {String} [enable_javascript_directives] Enable script evaluation in Directives
  @apiParam {String} [send_metrics] Send anonymous usage statistics


    */

/**
@api {Response format documentation} /api/settings 0. List of all available settings
@apiVersion 10.0.0
@apiGroup Settings

@apiDescription Here is the list of all settings that can be managed within Rudder.

  @apiParam {String} [global_policy_mode] Define the default setting for global policy mode, either "enforce" or "audit"
  @apiParam {Boolean} [global_policy_mode_overridable] Allow overrides on this default setting

  @apiParam {Int} [run_frequency]  Agent run schedule - time between agent runs (in minutes)
  @apiParam {Int} [first_run_hour] First agent run time - hour
  @apiParam {Int} [first_run_minute] First agent run time - minute
  @apiParam {Int} [splay_time] Maximum delay after scheduled run time (random interval)

  @apiParam {Int} [modified_file_ttl] Number of days to retain modified files
  @apiParam {Int} [output_file_ttl] Number of days to retain agent output files

  @apiParam {Boolean} [require_time_synchronization] Require time synchronization between nodes and policy server

  @apiParam {String} [relay_server_synchronization_method] Method used to synchronize data between Rudder Server and Relays, either "classic" (agent protocol, default), "rsync" (use rsync to synchronize, that you'll need to be manually set up), or "disabled" (use third party system to transmit data)
  @apiParam {Boolean} [relay_server_synchronize_policies] If "rsync" is set as a synchronization method, use rsync to synchronize policies between Rudder Server and Relays. If false, you'll have to synchronize policies yourself.
  @apiParam {Boolean} [relay_server_synchronize_shared_files] If "rsync" is set as a synchronization method, use rsync to synchronize shared files between Rudder Server and Relays. If false, you'll have to synchronize shared files yourself.

  @apiParam {String} [rsyslog_reporting_protocol] Protocol used for syslog communication between node and server, either "UDP" (default) or "TCP"
  @apiParam {String} [reporting_mode] Compliance reporting mode, either "full-compliance" (default), "changes-only" or "reports-disabled"

  @apiParam {Int} [heartbeat_frequency] Send heartbeat every heartbeat_frequency runs (only on "changes-only" compliance mode)

  @apiParam {Boolean} [log_all_reports] Log all reports received to /var/log/rudder/reports/all.log

  @apiParam {Boolean} [enable_change_message] Enable change audit logs
  @apiParam {Boolean} [mandatory_change_message] Make message mandatory
  @apiParam {String} [change_message_prompt] Explanation to display


  @apiParam {Boolean} [enable_change_request]  Enable Change Requests
  @apiParam {Boolean} [enable_self_validation] Allow self validation
  @apiParam {Boolean} [enable_self_deployment] Allow self deployment

  @apiParam {Boolean} [display_recent_changes_graphs] Display changes graphs

  @apiParam {String} [enable_javascript_directives] Enable script evaluation in Directives
  @apiParam {String} [send_metrics] Send anonymous usage statistics

  @apiParam {String} [node_onaccept_default_state] Set default state for node when they are accepted within Rudder, can be "enabled", "ignored", "empty-policies", "initializing", "preparing-eol"
  @apiParam {String} [node_onaccept_default_policyMode] Default policy mode for accepted node, can be "default", "enforce" or "audit"

  @apiParam {Boolean} [unexpected_allows_duplicate] Ignore duplicated compliance reports (default true)
  @apiParam {Boolean} [unexpected_unbound_var_values] Allows multiple reports for configuration based on a multivalued variable (default true)

  @apiParam {Boolean} [rudder_compute_changes] Compute list of changes (repaired reports) per rules (default true)
  @apiParam {Boolean} [rudder_generation_compute_dyngroups] Recompute all dynamic groups at the start of policy generation (default true)
  @apiParam {Boolean} [rudder_save_db_compliance_levels] Store all compliance levels in database (default true)
  @apiParam {Boolean} [rudder_save_db_compliance_details] Store all compliance details in database (default false)

  @apiParam {String} [rudder_generation_max_parallelism] Set the policy generation parrallelism, either as an number of thread (i.e. 4), or a multiplicative of the number of core (x0.5) (default 0.5)
  @apiParam {Int} [rudder_generation_js_timeout] Policy generation JS evaluation of directive parameter timeout in seconds (default 30)
  @apiParam {Boolean} [rudder_generation_continue_on_error] Policy generation continues on error during NodeConfiguration evaluation (default false)


    */

/**
@api {Response format documentation} /api/settings 0. List of all available settings
@apiVersion 11.0.0
@apiGroup Settings

@apiDescription Here is the list of all settings that can be managed within Rudder.

  @apiParam {N/A} [authorized_networks] List all authorized networks. This setting must be changed by relay.
  @apiParam {JSON} [authorized_networks/${policy_server_id}] Set authorized networks for given policy server (root or relay). Expected JSON is: '{"authorized_networks":["192.168.52.0/24", "etc"]}'

  @apiParam {String} [global_policy_mode] Define the default setting for global policy mode, either "enforce" or "audit"
  @apiParam {Boolean} [global_policy_mode_overridable] Allow overrides on this default setting

  @apiParam {Int} [run_frequency]  Agent run schedule - time between agent runs (in minutes)
  @apiParam {Int} [first_run_hour] First agent run time - hour
  @apiParam {Int} [first_run_minute] First agent run time - minute
  @apiParam {Int} [splay_time] Maximum delay after scheduled run time (random interval)

  @apiParam {Int} [modified_file_ttl] Number of days to retain modified files
  @apiParam {Int} [output_file_ttl] Number of days to retain agent output files

  @apiParam {Boolean} [require_time_synchronization] Require time synchronization between nodes and policy server

  @apiParam {String} [relay_server_synchronization_method] Method used to synchronize data between Rudder Server and Relays, either "classic" (agent protocol, default), "rsync" (use rsync to synchronize, that you'll need to be manually set up), or "disabled" (use third party system to transmit data)
  @apiParam {Boolean} [relay_server_synchronize_policies] If "rsync" is set as a synchronization method, use rsync to synchronize policies between Rudder Server and Relays. If false, you'll have to synchronize policies yourself.
  @apiParam {Boolean} [relay_server_synchronize_shared_files] If "rsync" is set as a synchronization method, use rsync to synchronize shared files between Rudder Server and Relays. If false, you'll have to synchronize shared files yourself.

  @apiParam {String} [rsyslog_reporting_protocol] Protocol used for syslog communication between node and server, either "UDP" (default) or "TCP"
  @apiParam {String} [reporting_mode] Compliance reporting mode, either "full-compliance" (default), "changes-only" or "reports-disabled"

  @apiParam {Int} [heartbeat_frequency] Send heartbeat every heartbeat_frequency runs (only on "changes-only" compliance mode)

  @apiParam {Boolean} [log_all_reports] Log all reports received to /var/log/rudder/reports/all.log

  @apiParam {Boolean} [enable_change_message] Enable change audit logs
  @apiParam {Boolean} [mandatory_change_message] Make message mandatory
  @apiParam {String} [change_message_prompt] Explanation to display


  @apiParam {Boolean} [enable_change_request]  Enable Change Requests
  @apiParam {Boolean} [enable_self_validation] Allow self validation
  @apiParam {Boolean} [enable_self_deployment] Allow self deployment

  @apiParam {Boolean} [display_recent_changes_graphs] Display changes graphs

  @apiParam {String} [enable_javascript_directives] Enable script evaluation in Directives
  @apiParam {String} [send_metrics] Send anonymous usage statistics

  @apiParam {String} [node_onaccept_default_state] Set default state for node when they are accepted within Rudder, can be "enabled", "ignored", "empty-policies", "initializing", "preparing-eol"
  @apiParam {String} [node_onaccept_default_policyMode] Default policy mode for accepted node, can be "default", "enforce" or "audit"

  @apiParam {Boolean} [unexpected_allows_duplicate] Ignore duplicated compliance reports (default true)
  @apiParam {Boolean} [unexpected_unbound_var_values] Allows multiple reports for configuration based on a multivalued variable (default true)

  @apiParam {Boolean} [rudder_compute_changes] Compute list of changes (repaired reports) per rules (default true)
  @apiParam {Boolean} [rudder_generation_compute_dyngroups] Recompute all dynamic groups at the start of policy generation (default true)
  @apiParam {Boolean} [rudder_save_db_compliance_levels] Store all compliance levels in database (default true)
  @apiParam {Boolean} [rudder_save_db_compliance_details] Store all compliance details in database (default false)

  @apiParam {String} [rudder_generation_max_parallelism] Set the policy generation parrallelism, either as an number of thread (i.e. 4), or a multiplicative of the number of core (x0.5) (default 0.5)
  @apiParam {Int} [rudder_generation_js_timeout] Policy generation JS evaluation of directive parameter timeout in seconds (default 30)
  @apiParam {Boolean} [rudder_generation_continue_on_error] Policy generation continues on error during NodeConfiguration evaluation (default false)


    */



/**
@api {Response format documentation} /api/settings 0. List of all available settings
@apiVersion 12.0.0
@apiGroup Settings

@apiDescription Here is the list of all settings that can be managed within Rudder.

  @apiParam {N/A} [authorized_networks] List all authorized networks. This setting must be changed by relay.
  @apiParam {JSON} [authorized_networks/${policy_server_id}] Set authorized networks for given policy server (root or relay). Expected JSON is: '{"authorized_networks":["192.168.52.0/24", "etc"]}'

  @apiParam {String} [global_policy_mode] Define the default setting for global policy mode, either "enforce" or "audit"
  @apiParam {Boolean} [global_policy_mode_overridable] Allow overrides on this default setting

  @apiParam {Int} [run_frequency]  Agent run schedule - time between agent runs (in minutes)
  @apiParam {Int} [first_run_hour] First agent run time - hour
  @apiParam {Int} [first_run_minute] First agent run time - minute
  @apiParam {Int} [splay_time] Maximum delay after scheduled run time (random interval)

  @apiParam {Int} [modified_file_ttl] Number of days to retain modified files
  @apiParam {Int} [output_file_ttl] Number of days to retain agent output files

  @apiParam {Boolean} [require_time_synchronization] Require time synchronization between nodes and policy server

  @apiParam {String} [relay_server_synchronization_method] Method used to synchronize data between Rudder Server and Relays, either "classic" (agent protocol, default), "rsync" (use rsync to synchronize, that you'll need to be manually set up), or "disabled" (use third party system to transmit data)
  @apiParam {Boolean} [relay_server_synchronize_policies] If "rsync" is set as a synchronization method, use rsync to synchronize policies between Rudder Server and Relays. If false, you'll have to synchronize policies yourself.
  @apiParam {Boolean} [relay_server_synchronize_shared_files] If "rsync" is set as a synchronization method, use rsync to synchronize shared files between Rudder Server and Relays. If false, you'll have to synchronize shared files yourself.


  @apiParam {String} [rudder_report_protocol_default] Default reporting protocol used, either "HTTPS" or "SYSLOG" (can be overriden on a node basis)
  @apiParam {Boolean} [syslog_protocol_disabled] Completely disable rudder syslog protocol
  @apiParam {String} [rsyslog_reporting_protocol] Protocol used for syslog communication between node and server, either "UDP" (default) or "TCP"
  @apiParam {String} [reporting_mode] Compliance reporting mode, either "full-compliance" (default), "changes-only" or "reports-disabled"


  @apiParam {Int} [heartbeat_frequency] Send heartbeat every heartbeat_frequency runs (only on "changes-only" compliance mode)

  @apiParam {Boolean} [log_all_reports] Log all reports received to /var/log/rudder/reports/all.log

  @apiParam {Boolean} [enable_change_message] Enable change audit logs
  @apiParam {Boolean} [mandatory_change_message] Make message mandatory
  @apiParam {String} [change_message_prompt] Explanation to display


  @apiParam {Boolean} [enable_change_request]  Enable Change Requests
  @apiParam {Boolean} [enable_self_validation] Allow self validation
  @apiParam {Boolean} [enable_self_deployment] Allow self deployment

  @apiParam {Boolean} [display_recent_changes_graphs] Display changes graphs

  @apiParam {String} [enable_javascript_directives] Enable script evaluation in Directives
  @apiParam {String} [send_metrics] Send anonymous usage statistics

  @apiParam {String} [node_onaccept_default_state] Set default state for node when they are accepted within Rudder, can be "enabled", "ignored", "empty-policies", "initializing", "preparing-eol"
  @apiParam {String} [node_onaccept_default_policyMode] Default policy mode for accepted node, can be "default", "enforce" or "audit"

  @apiParam {Boolean} [unexpected_allows_duplicate] Ignore duplicated compliance reports (default true)
  @apiParam {Boolean} [unexpected_unbound_var_values] Allows multiple reports for configuration based on a multivalued variable (default true)

  @apiParam {Boolean} [rudder_compute_changes] Compute list of changes (repaired reports) per rules (default true)
  @apiParam {Boolean} [rudder_generation_compute_dyngroups] Recompute all dynamic groups at the start of policy generation (default true)
  @apiParam {Boolean} [rudder_save_db_compliance_levels] Store all compliance levels in database (default true)
  @apiParam {Boolean} [rudder_save_db_compliance_details] Store all compliance details in database (default false)

  @apiParam {String} [rudder_generation_max_parallelism] Set the policy generation parrallelism, either as an number of thread (i.e. 4), or a multiplicative of the number of core (x0.5) (default 0.5)
  @apiParam {Int} [rudder_generation_js_timeout] Policy generation JS evaluation of directive parameter timeout in seconds (default 30)
  @apiParam {Boolean} [rudder_generation_continue_on_error] Policy generation continues on error during NodeConfiguration evaluation (default false)

    */


[GET] api/settings
-----------------

    /**
    @api {get} /api/settings 1. List all Settings
    @apiVersion 8.0.0
    @apiName getAllSettings
    @apiGroup Settings

    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" https://rudder.example.com/rudder/api/latest/settings

    @apiSuccessExample Success-Response:
HTTP/1.1 200 OK
{
  "action": "getAllSettings",
  "result": "success",
  "data": {
    "settings": {
      "use_reverse_dns": false,
      "global_policy_mode": "enforce",
      "global_policy_mode_overridable": true,
      "run_frequency": 5,
      "first_run_hour": 0,
      "first_run_minute": 0,
      "splay_time": 4,
      "modified_file_ttl": 30,
      "output_file_ttl": 7,
      "require_time_synchronization": true,
      "rsyslog_reporting_protocol": "UDP",
      "reporting_mode": "full-compliance",
      "heartbeat_frequency": 1,
      "log_all_reports": true,
      "enable_change_message": true,
      "mandatory_change_message": false,
      "change_message_prompt": "Please enter a reason explaining this change.",
      "enable_change_request": false,
      "enable_self_validation": true,
      "enable_self_deployment": true,
      "display_recent_changes_graphs": true,
      "enable_javascript_directives": "enabled",
      "send_metrics": "not defined"
    }
  }
}

     */

[GET] api/settings
-----------------

    /**
    @api {get} /api/settings 1. List all Settings
    @apiVersion 10.0.0
    @apiName getAllSettings
    @apiGroup Settings
    
    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" https://rudder.example.com/rudder/api/latest/settings

    @apiSuccessExample Success-Response:
HTTP/1.1 200 OK
{
  "action": "getAllSettings",
  "result": "success",
  "data": {
    "settings": {
      "global_policy_mode": "enforce",
      "global_policy_mode_overridable": true,
      "run_frequency": 5,
      "first_run_hour": 0,
      "first_run_minute": 0,
      "splay_time": 4,
      "modified_file_ttl": 30,
      "output_file_ttl": 7,
      "require_time_synchronization": true,
      "rsyslog_reporting_protocol": "UDP",
      "reporting_mode": "full-compliance",
      "heartbeat_frequency": 1,
      "log_all_reports": true,
      "enable_change_message": true,
      "mandatory_change_message": false,
      "change_message_prompt": "Please enter a reason explaining this change.",
      "enable_change_request": false,
      "enable_self_validation": true,
      "enable_self_deployment": true,
      "display_recent_changes_graphs": true,
      "enable_javascript_directives": "enabled",
      "send_metrics": "not defined",
      "node_onaccept_default_state": "enabled",
      "node_onaccept_default_policyMode": "default",
      "unexpected_allows_duplicate": true,
      "unexpected_unbound_var_values": true,
      "rudder_compute_changes": true,
      "rudder_generation_compute_dyngroups": true,
      "rudder_save_db_compliance_levels": true,
      "rudder_save_db_compliance_details": false,
      "rudder_generation_max_parallelism": "x0.5",
      "rudder_generation_js_timeout": 30,
      "rudder_generation_continue_on_error": false

    }
  }
}

     */

[GET] api/settings
-----------------

    /**
    @api {get} /api/settings 1. List all Settings
    @apiVersion 12.0.0
    @apiName getAllSettings
    @apiGroup Settings
    
    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" https://rudder.example.com/rudder/api/latest/settings

    @apiSuccessExample Success-Response:
HTTP/1.1 200 OK
{
  "action": "getAllSettings",
  "result": "success",
  "data": {
    "settings": {
      "global_policy_mode": "enforce",
      "global_policy_mode_overridable": true,
      "run_frequency": 5,
      "first_run_hour": 0,
      "first_run_minute": 0,
      "splay_time": 4,
      "modified_file_ttl": 30,
      "output_file_ttl": 7,
      "require_time_synchronization": true,
      "rsyslog_reporting_protocol": "UDP",
      "rudder_report_protocol_default": "HTTPS",
      "syslog_protocol_disabled": true,
      "reporting_mode": "full-compliance",
      "heartbeat_frequency": 1,
      "log_all_reports": true,
      "enable_change_message": true,
      "mandatory_change_message": false,
      "change_message_prompt": "Please enter a reason explaining this change.",
      "enable_change_request": false,
      "enable_self_validation": true,
      "enable_self_deployment": true,
      "display_recent_changes_graphs": true,
      "enable_javascript_directives": "enabled",
      "send_metrics": "not defined",
      "node_onaccept_default_state": "enabled",
      "node_onaccept_default_policyMode": "default",
      "unexpected_allows_duplicate": true,
      "unexpected_unbound_var_values": true,
      "rudder_compute_changes": true,
      "rudder_generation_compute_dyngroups": true,
      "rudder_save_db_compliance_levels": true,
      "rudder_save_db_compliance_details": false,
      "rudder_generation_max_parallelism": "x0.5",
      "rudder_generation_js_timeout": 30,
      "rudder_generation_continue_on_error": false

    }
  }
}

     */

[GET] api/settings/{id}
--------------------------

    /**
    @api {get} /api/settings/{id} 2. Get Setting value
    @apiVersion 10.0.0
    @apiName getSetting
    @apiGroup Settings

    @apiUse  settingId
     
    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" https://rudder.example.com/rudder/api/latest/settings/run_frequency

    @apiSuccessExample Success-Response:
HTTP/1.1 200 OK
{
  "action": "getSetting",
  "id": "run_frequency",
  "result": "success",
  "data": {
    "settings": {
      "run_frequency": 5
    }
  }
}
    */


[POST] api/settings/{id}
--------------------------

    /**
    @api {post} /api/settings/{id} 3. Update a Setting
    @apiVersion 10.0.0
    @apiName modifySetting
    @apiGroup Settings


    @apiUse  settingId

    @apiParam (MonoSetting) {String} [value]        Value of the Setting.
     
    @apiExample Example usage:
    curl -H "X-API-Token: yourToken" -X POST https://rudder.example.com/rudder/api/latest/settings/global_policy_mode_overridable -d "value=true"

    @apiSuccessExample Success-Response:
HTTP/1.1 200 OK
{
  "action": "modifySetting",
  "id": "global_policy_mode_overridable",
  "result": "success",
  "data": {
    "settings": {
      "global_policy_mode_overridable": true
    }
  }
}

    */



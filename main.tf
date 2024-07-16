resource "aws_ssm_activation" "this" {
  count              = length(var.activation)
  iam_role           = aws_iam_role.this.id
  description        = lookup(var.activation[count.index], "description")
  expiration_date    = lookup(var.activation[count.index], "expiration_date")
  name               = lookup(var.activation[count.index], "name")
  registration_limit = lookup(var.activation[count.index], "registration_limit")
  tags = merge(
    var.tags,
    lookup(var.activation[count.index], "tags"),
    data.aws_default_tags.this.tags
  )
}

resource "aws_ssm_association" "this" {
  count                            = length(var.association)
  name                             = lookup(var.association[count.index], "name")
  apply_only_at_cron_interval      = lookup(var.association[count.index], "apply_only_at_cron_interval")
  association_name                 = lookup(var.association[count.index], "association_name")
  automation_target_parameter_name = lookup(var.association[count.index], "automation_target_parameter_name")
  compliance_severity              = lookup(var.association[count.index], "compliance_severity")
  document_version                 = lookup(var.association[count.index], "document_version")
  max_concurrency                  = lookup(var.association[count.index], "max_concurrency")
  max_errors                       = lookup(var.association[count.index], "max_errors")
  parameters                       = lookup(var.association[count.index], "parameters")
  schedule_expression              = lookup(var.association[count.index], "schedule_expression")
  tags = merge(
    var.tags,
    lookup(var.association[count.index], "tags"),
    data.aws_default_tags.this.tags
  )

  dynamic "output_location" {
    for_each = lookup(var.association[count.index], "output_location") == null ? [] : ["output_location"]
    content {
      s3_bucket_name = lookup(output_location.value, "s3_bucket_name")
      s3_key_prefix  = lookup(output_location.value, "s3_key_prefix")
      s3_region      = lookup(output_location.value, "s3_region")
    }
  }

  dynamic "targets" {
    for_each = lookup(var.association[count.index], "targets") == null ? [] : ["targets"]
    content {
      key    = lookup(targets.value, "key")
      values = lookup(targets.value, "values")
    }
  }
}

resource "aws_ssm_default_patch_baseline" "this" {
  count = length(var.patch_baseline) == 0 ? 0 : length(var.default_patch_baseline)
  baseline_id = try(
    element(aws_ssm_patch_baseline.this.*.id, lookup(var.default_patch_baseline[count.index], "baseline_id"))
  )
  operating_system = try(
    element(aws_ssm_patch_baseline.this.*.operating_system, lookup(var.default_patch_baseline[count.index], "baseline_id"))
  )
}

resource "aws_ssm_document" "this" {
  count           = length(var.document)
  content         = lookup(var.document[count.index], "content")
  document_type   = lookup(var.document[count.index], "document_type")
  name            = lookup(var.document[count.index], "name")
  document_format = lookup(var.document[count.index], "document_format")
  permissions     = lookup(var.document[count.index], "permissions")
  tags = merge(
    var.tags,
    lookup(var.document[count.index], "tags"),
    data.aws_default_tags.this.tags
  )
  target_type  = lookup(var.document[count.index], "target_type")
  version_name = lookup(var.document[count.index], "version_name")

  dynamic "attachments_source" {
    for_each = lookup(var.document[count.index], "attachments_source") == null ? [] : ["attachments_source"]
    content {
      values = lookup(attachments_source.value, "values")
      key    = lookup(attachments_source.value, "key")
      name   = lookup(attachments_source.value, "name")
    }
  }

  dynamic "parameter" {
    for_each = lookup(var.document[count.index], "parameter") == null ? [] : ["parameter"]
    content {
      type = lookup(parameter.value, "type")
    }
  }
}

resource "aws_ssm_maintenance_window" "this" {
  count                      = length(var.maintenance_window)
  cutoff                     = lookup(var.maintenance_window[count.index], "cutoff")
  duration                   = lookup(var.maintenance_window[count.index], "duration")
  name                       = lookup(var.maintenance_window[count.index], "name")
  schedule                   = lookup(var.maintenance_window[count.index], "schedule")
  allow_unassociated_targets = lookup(var.maintenance_window[count.index], "allow_unassociated_targets")
  description                = lookup(var.maintenance_window[count.index], "description")
  enabled                    = lookup(var.maintenance_window[count.index], "enabled")
  end_date                   = lookup(var.maintenance_window[count.index], "end_date")
  schedule_offset            = lookup(var.maintenance_window[count.index], "schedule_offset")
  schedule_timezone          = lookup(var.maintenance_window[count.index], "schedule_timezone")
  start_date                 = lookup(var.maintenance_window[count.index], "start_date")
  tags = merge(
    var.tags,
    lookup(var.maintenance_window[count.index], "tags"),
    data.aws_default_tags.this.tags
  )
}

resource "aws_ssm_maintenance_window_target" "this" {
  count         = length(var.maintenance_window) == 0 ? 0 : length(var.maintenance_window_target)
  resource_type = lookup(var.maintenance_window_target[count.index], "resource_type")
  window_id = try(
    element(aws_ssm_maintenance_window.this.*.id, lookup(var.maintenance_window_target[count.index], "window_id"))
  )
  name              = lookup(var.maintenance_window_target[count.index], "name")
  description       = lookup(var.maintenance_window_target[count.index], "description")
  owner_information = lookup(var.maintenance_window_target[count.index], "owner_information")

  dynamic "targets" {
    for_each = lookup(var.maintenance_window_target[count.index], "targets")
    content {
      key    = lookup(targets.value, "key")
      values = lookup(targets.value, "values")
    }
  }
}

resource "aws_ssm_maintenance_window_task" "this" {
  count           = length(var.maintenance_window) == 0 ? 0 : length(var.maintenance_window_task)
  max_concurrency = lookup(var.maintenance_window_task[count.index], "max_concurrency")
  max_errors      = lookup(var.maintenance_window_task[count.index], "max_errors")
  task_arn        = lookup(var.maintenance_window_task[count.index], "task_arn")
  task_type       = lookup(var.maintenance_window_task[count.index], "task_type")
  window_id = try(
    element(aws_ssm_maintenance_window.this.*.id, lookup(var.maintenance_window_task[count.index], "window_id"))
  )
  description      = lookup(var.maintenance_window_task[count.index], "description")
  name             = lookup(var.maintenance_window_task[count.index], "name")
  priority         = lookup(var.maintenance_window_task[count.index], "priority")

  dynamic "targets" {
    for_each = lookup(var.maintenance_window_task[count.index], "targets") == null ? [] : ["targets"]
    content {
      key    = lookup(targets.value, "key")
      values = lookup(targets.value, "values")
    }
  }

  dynamic "task_invocation_parameters" {
    for_each = lookup(var.maintenance_window_task[count.index], "task_invocation_parameters") == null ? [] : ["task_invocation_parameters"]
    content {
      dynamic "automation_parameters" {
        for_each = lookup(var.maintenance_window_task, "task_type") == "AUTOMATION" ? lookup(task_invocation_parameters.value, "automation_parameters") : []
        content {
          document_version = lookup(automation_parameters.value, "document_version")

          dynamic "parameter" {
            for_each = lookup(automation_parameters.value, "parameter") == null ? [] : ["automation_parameter"]
            content {
              values = lookup(parameter.value, "values")
              name   = lookup(parameter.value, "name")
            }
          }
        }
      }

      dynamic "lambda_parameters" {
        for_each = lookup(var.maintenance_window_task, "task_type") == "LAMBDA" ? lookup(task_invocation_parameters.value, "lambda_parameters") : []
        content {
          client_context = lookup(lambda_parameters.value, "client_context")
          payload        = lookup(lambda_parameters.value, "payload")
          qualifier      = lookup(lambda_parameters.value, "qualifier")
        }
      }

      dynamic "run_command_parameters" {
        for_each = lookup(var.maintenance_window_task, "task_type") == "RUN_COMMAND" ? lookup(task_invocation_parameters.value, "run_command_parameters") : []
        content {
          comment              = lookup(run_command_parameters.value, "comment")
          document_hash        = lookup(run_command_parameters.value, "document_hash")
          document_hash_type   = lookup(run_command_parameters.value, "document_hash_type")
          document_version     = lookup(run_command_parameters.value, "document_version")
          output_s3_bucket     = lookup(run_command_parameters.value, "output_s3_bucket")
          output_s3_key_prefix = lookup(run_command_parameters.value, "output_s3_key_prefix")
          service_role_arn     = lookup(run_command_parameters.value, "service_role_arn")
          timeout_seconds      = lookup(run_command_parameters.value, "timeout_seconds")

          dynamic "cloudwatch_config" {
            for_each = lookup(run_command_parameters.value, "cloudwatch_config") == null ? [] : ["cloudwatch_config"]
            content {
              cloudwatch_log_group_name = lookup(cloudwatch_config.value, "cloudwatch_log_group_name")
              cloudwatch_output_enabled = lookup(cloudwatch_config.value, "cloudwatch_output_enabled")
            }
          }

          dynamic "notification_config" {
            for_each = lookup(run_command_parameters.value, "notification_config") == null ? [] : ["notification_config"]
            content {
              notification_arn    = lookup(notification_config.value, "notification_arn")
              notification_events = lookup(notification_config.value, "notification_events")
              notification_type   = lookup(notification_config.value, "notification_type")
            }
          }

          dynamic "parameter" {
            for_each = lookup(run_command_parameters.value, "parameter") == null ? [] : ["parameter"]
            content {
              values = lookup(parameter.value, "values")
              name   = lookup(parameter.value, "name")
            }
          }
        }
      }

      dynamic "step_functions_parameters" {
        for_each = lookup(var.maintenance_window_task, "task_type") == "STEP_FUNCTIONS" ? lookup(task_invocation_parameters.value, "step_functions_parameters") : []
        content {
          input = lookup(step_functions_parameters.value, "input")
          name  = lookup(step_functions_parameters.value, "name")
        }
      }
    }
  }
}

resource "aws_ssm_parameter" "this" {
  count           = length(var.parameter)
  name            = lookup(var.parameter[count.index], "name")
  type            = lookup(var.parameter[count.index], "type")
  value           = lookup(var.parameter[count.index], "value")
  allowed_pattern = lookup(var.parameter[count.index], "allowed_pattern")
  data_type       = lookup(var.parameter[count.index], "data_type")
  description     = lookup(var.parameter[count.index], "description")
  insecure_value  = lookup(var.parameter[count.index], "insecure_value")
  key_id          = try(
    element(aws_kms_key.this.*.arn, lookup(var.parameter[count.index], "key_id"))
  )
  tags = merge(
    var.tags,
    lookup(var.parameter[count.index], "tags"),
    data.aws_default_tags.this.tags
  )
  tier = lookup(var.parameter[count.index], "tier")
}

resource "aws_ssm_patch_baseline" "this" {
  count                                = length(var.patch_baseline)
  name                                 = lookup(var.patch_baseline[count.index], "name")
  approved_patches                     = lookup(var.patch_baseline[count.index], "approved_patches")
  approved_patches_compliance_level    = lookup(var.patch_baseline[count.index], "approved_patches_compliance_level")
  approved_patches_enable_non_security = lookup(var.patch_baseline[count.index], "approved_patches_enable_non_security")
  description                          = lookup(var.patch_baseline[count.index], "description")
  operating_system                     = lookup(var.patch_baseline[count.index], "operating_system")
  rejected_patches                     = lookup(var.patch_baseline[count.index], "rejected_patches")
  rejected_patches_action              = lookup(var.patch_baseline[count.index], "rejected_patches_action")
  tags = merge(
    var.tags,
    lookup(var.patch_baseline[count.index], "tags"),
    data.aws_default_tags.this.tags
  )

  dynamic "approval_rule" {
    for_each = lookup(var.patch_baseline[count.index], "approval_rule") == null ? [] : ["approval_rule"]
    content {
      approve_after_days  = lookup(approval_rule.value, "approve_after_days")
      approve_until_date  = lookup(approval_rule.value, "approve_until_date")
      compliance_level    = lookup(approval_rule.value, "compliance_level")
      enable_non_security = lookup(approval_rule.value, "enable_non_security")

      dynamic "patch_filter" {
        for_each = lookup(approval_rule.value, "patch_filter")
        content {
          key    = lookup(patch_filter.value, "key")
          values = lookup(patch_filter.value, "values")
        }
      }
    }
  }

  dynamic "global_filter" {
    for_each = lookup(var.patch_baseline[count.index], "global_filter") == null ? [] : ["global_filter"]
    content {
      key    = lookup(global_filter.value, "key")
      values = lookup(global_filter.value, "values")
    }
  }

  dynamic "source" {
    for_each = lookup(var.patch_baseline[count.index], "source") == null ? [] : ["source"]
    content {
      configuration = lookup(source.value, "configuration")
      name          = lookup(source.value, "name")
      products      = lookup(source.value, "products")
    }
  }
}

resource "aws_ssm_patch_group" "this" {
  count = length(var.patch_baseline) == 0 ? 0 : length(var.patch_group)
  baseline_id = try(
    element(aws_ssm_patch_baseline.this.*.id, lookup(var.patch_group[count.index], "baseline_id"))
  )
  patch_group = lookup(var.patch_group[count.index], "patch_group")
}

resource "aws_ssm_resource_data_sync" "this" {
  count = length(var.s3_bucket) == 0 ? 0 : length(var.resource_data_sync)
  name  = lookup(var.resource_data_sync[count.index], "name")

  dynamic "s3_destination" {
    for_each = lookup(var.resource_data_sync[count.index], "s3_destination")
    content {
      region      = try(
        element(aws_s3_bucket.this.*.region, lookup(s3_destination.value, bucket_id))
      )
      bucket_name = try(
        element(aws_s3_bucket.this.*.bucket, lookup(s3_destination.value, bucket_id))
      )
      kms_key_arn = try(
        element(aws_kms_key.this.*.arn, lookup(s3_destination.value, "kms_key_id"))
      )
      prefix      = try(
        element(aws_s3_bucket.this.*.bucket_prefix, lookup(s3_destination.value, bucket_id))
      )
      sync_format = "JsonSerDe"
    }
  }
}

resource "aws_ssm_service_setting" "this" {
  setting_id    = ""
  setting_value = ""
}
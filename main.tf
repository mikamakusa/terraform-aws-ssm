resource "aws_ssm_activation" "this" {
  count              = length(var.activation)
  iam_role           = aws_iam_role.this.id
  description        = lookup(var.activation[count.index], "description")
  expiration_date    = lookup(var.activation[count.index], "expiration_date")
  name               = lookup(var.activation[count.index], "name")
  registration_limit = lookup(var.activation[count.index], "registration_limit")
  tags               = merge(
    var.tags,
    lookup(var.activation[count.index], "tags"),
    data.aws_default_tags.this.tags
  )
}

resource "aws_ssm_association" "this" {
  name                             = ""
  apply_only_at_cron_interval      = true
  association_name                 = ""
  automation_target_parameter_name = ""
  compliance_severity              = ""
  document_version                 = ""
  max_concurrency                  = ""
  max_errors                       = ""
  parameters                       = {}
  schedule_expression              = ""
  tags                             = {}

  dynamic "output_location" {
    for_each = ""
    content {
      s3_bucket_name = ""
      s3_key_prefix  = ""
      s3_region      = ""
    }
  }

  dynamic "targets" {
    for_each = ""
    content {
      key    = ""
      values = []
    }
  }
}

resource "aws_ssm_default_patch_baseline" "this" {
  baseline_id      = ""
  operating_system = ""
}

resource "aws_ssm_document" "this" {
  content         = ""
  document_type   = ""
  name            = ""
  document_format = ""
  permissions     = {}
  tags            = {}
  target_type     = ""
  version_name    = ""

  dynamic "attachments_source" {
    for_each = ""
    content {
      values = []
      key    = ""
      name   = ""
    }
  }

  dynamic "parameter" {
    for_each = ""
    content {
      type = ""
    }
  }
}

resource "aws_ssm_maintenance_window" "this" {
  cutoff                     = 0
  duration                   = 0
  name                       = ""
  schedule                   = ""
  allow_unassociated_targets = true
  description                = ""
  enabled                    = true
  end_date                   = ""
  schedule_offset            = 0
  schedule_timezone          = ""
  start_date                 = ""
  tags                       = {}
}

resource "aws_ssm_maintenance_window_target" "this" {
  resource_type     = ""
  window_id         = ""
  name              = ""
  description       = ""
  owner_information = ""

  dynamic "targets" {
    for_each = ""
    content {
      key    = ""
      values = []
    }
  }
}

resource "aws_ssm_maintenance_window_task" "this" {
  max_concurrency  = ""
  max_errors       = ""
  task_arn         = ""
  task_type        = ""
  window_id        = ""
  description      = ""
  name             = ""
  priority         = 0
  service_role_arn = ""

  dynamic "targets" {
    for_each = ""
    content {
      key    = ""
      values = []
    }
  }

  dynamic "task_invocation_parameters" {
    for_each = ""
    content {
      dynamic "automation_parameters" {
        for_each = ""
        content {
          document_version = ""

          dynamic "parameter" {
            for_each = ""
            content {
              values = []
              name   = ""
            }
          }
        }
      }

      dynamic "lambda_parameters" {
        for_each = ""
        content {
          client_context = ""
          payload        = ""
          qualifier      = ""
        }
      }

      dynamic "run_command_parameters" {
        for_each = ""
        content {
          comment              = ""
          document_hash        = ""
          document_hash_type   = ""
          document_version     = ""
          output_s3_bucket     = ""
          output_s3_key_prefix = ""
          service_role_arn     = ""
          timeout_seconds      = 0

          dynamic "cloudwatch_config" {
            for_each = ""
            content {
              cloudwatch_log_group_name = ""
              cloudwatch_output_enabled = true
            }
          }

          dynamic "notification_config" {
            for_each = ""
            content {
              notification_arn    = ""
              notification_events = []
              notification_type   = ""
            }
          }

          dynamic "parameter" {
            for_each = ""
            content {
              values = []
              name   = ""
            }
          }
        }
      }

      dynamic "step_functions_parameters" {
        for_each = ""
        content {
          input = ""
          name  = ""
        }
      }
    }
  }
}

resource "aws_ssm_parameter" "this" {
  name            = ""
  type            = ""
  value           = ""
  allowed_pattern = ""
  arn             = ""
  data_type       = ""
  description     = ""
  insecure_value  = ""
  key_id          = ""
  tags            = {}
  tier            = ""
}

resource "aws_ssm_patch_baseline" "this" {
  name                                 = ""
  approved_patches                     = []
  approved_patches_compliance_level    = ""
  approved_patches_enable_non_security = true
  description                          = ""
  operating_system                     = ""
  rejected_patches                     = []
  rejected_patches_action              = ""
  tags                                 = {}

  dynamic "approval_rule" {
    for_each = ""
    content {
      approve_after_days  = 0
      approve_until_date  = ""
      compliance_level    = ""
      enable_non_security = true

      dynamic "patch_filter" {
        for_each = ""
        content {
          key    = ""
          values = []
        }
      }
    }
  }

  dynamic "global_filter" {
    for_each = ""
    content {
      key    = ""
      values = []
    }
  }

  dynamic "source" {
    for_each = ""
    content {
      configuration = ""
      name          = ""
      products      = []
    }
  }
}

resource "aws_ssm_patch_group" "this" {
  baseline_id = ""
  patch_group = ""
}

resource "aws_ssm_resource_data_sync" "this" {
  name = ""

  dynamic "s3_destination" {
    for_each = ""
    content {
      region      = ""
      bucket_name = ""
      kms_key_arn = ""
      prefix      = ""
      sync_format = ""
    }
  }
}

resource "aws_ssm_service_setting" "this" {
  setting_id    = ""
  setting_value = ""
}
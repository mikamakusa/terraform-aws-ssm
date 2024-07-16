variable "tags" {
  type    = map(string)
  default = {}
}

variable "bucket_name" {
  type    = string
  default = null
}

variable "kms_key_name" {
  type    = string
  default = null
}

variable "activation" {
  type = list(object({
    id                 = number
    iam_role           = string
    description        = optional(string)
    expiration_date    = optional(string)
    name               = optional(string)
    registration_limit = optional(number)
    tags               = optional(map(string))
  }))
  default     = []
  description = <<EOF
    EOF
}

variable "association" {
  type = list(object({
    id                               = number
    name                             = string
    apply_only_at_cron_interval      = optional(bool)
    association_name                 = optional(string)
    automation_target_parameter_name = optional(string)
    compliance_severity              = optional(string)
    document_version                 = optional(string)
    max_concurrency                  = optional(string)
    max_errors                       = optional(string)
    parameters                       = optional(map(string))
    schedule_expression              = optional(string)
    tags                             = optional(string)
    output_location = optional(list(object({
      s3_bucket_name = string
      s3_key_prefix  = optional(string)
      s3_region      = optional(string)
    })), [])
    targets = optional(list(object({
      key    = string
      values = list(string)
    })), [])
  }))
  default     = []
  description = <<EOF
    EOF
}

variable "default_patch_baseline" {
  type = list(object({
    id               = number
    baseline_id      = number
    operating_system = string
  }))
  default     = []
  description = <<EOF
    EOF
}

variable "document" {
  type = list(object({
    id              = number
    content         = string
    document_type   = string
    name            = string
    document_format = optional(string)
    permissions     = optional(map(string))
    tags            = optional(map(string))
    target_type     = optional(string)
    version_name    = optional(string)
    attachments_source = optional(list(object({
      values = list(string)
      key    = string
      name   = optional(string)
    })), [])
    parameter = optional(list(object({
      type = optional(string)
    })), [])
  }))
  default     = []
  description = <<EOF
    EOF
}

variable "maintenance_window" {
  type = list(object({
    id                         = number
    cutoff                     = number
    duration                   = number
    name                       = string
    schedule                   = string
    allow_unassociated_targets = optional(bool)
    description                = optional(string)
    enabled                    = optional(bool)
    end_date                   = optional(string)
    schedule_offset            = optional(number)
    schedule_timezone          = optional(string)
    start_date                 = optional(string)
    tags                       = optional(map(string))
  }))
  default     = []
  description = <<EOF
    EOF
}

variable "maintenance_window_target" {
  type = list(object({
    id                = number
    resource_type     = string
    window_id         = number
    name              = optional(string)
    description       = optional(string)
    owner_information = optional(string)
    targets = list(object({
      key    = string
      values = list(string)
    }))
  }))
  default     = []
  description = <<EOF
    EOF
}

variable "maintenance_window_task" {
  type = list(object({
    id               = number
    max_concurrency  = string
    max_errors       = string
    task_arn         = string
    task_type        = string
    window_id        = number
    description      = optional(string)
    name             = optional(string)
    priority         = optional(number)
    service_role_arn = optional(string)
    targets = optional(list(object({
      key    = string
      values = list(string)
    })), [])
    task_invocation_parameters = optional(list(object({
      automation_parameters = optional(list(object({
        document_version = optional(string)
        parameter = optional(list(object({
          values = list(string)
          name   = string
        })), [])
      })), [])
      lambda_parameters = optional(list(object({
        client_context = optional(string)
        payload        = optional(string)
        qualifier      = optional(string)
      })), [])
      run_command_parameters = optional(list(object({
        comment              = optional(string)
        document_hash        = optional(string)
        document_hash_type   = optional(string)
        document_version     = optional(string)
        output_s3_bucket     = optional(string)
        output_s3_key_prefix = optional(string)
        service_role_arn     = optional(string)
        timeout_seconds      = optional(number)
        cloudwatch_config = optional(list(object({
          cloudwatch_log_group_name = optional(string)
          cloudwatch_output_enabled = optional(bool)
        })), [])
        notification_config = optional(list(object({
          notification_arn    = optional(string)
          notification_events = optional(list(string))
          notification_type   = optional(string)
        })), [])
        parameter = optional(list(object({
          values = list(string)
          name   = string
        })), [])
      })), [])
      step_functions_parameters = optional(list(object({
        input = optional(string)
        name  = optional(string)
      })), [])
    })), [])
  }))
  default     = []
  description = <<EOF
    EOF
}

variable "parameter" {
  type = list(object({
    id              = number
    name            = string
    type            = string
    value           = string
    allowed_pattern = optional(string)
    arn             = optional(string)
    data_type       = optional(string)
    description     = optional(string)
    insecure_value  = optional(string)
    key_id          = optional(string)
    tags            = optional(map(string))
    tier            = optional(string)
  }))
  default     = []
  description = <<EOF
    EOF
}

variable "patch_baseline" {
  type = list(object({
    id                                   = number
    name                                 = string
    approved_patches                     = optional(list(string))
    approved_patches_compliance_level    = optional(string)
    approved_patches_enable_non_security = optional(bool)
    description                          = optional(string)
    operating_system                     = optional(string)
    rejected_patches                     = optional(list(string))
    rejected_patches_action              = optional(string)
    tags                                 = optional(map(string))
    approval_rule = optional(list(object({
      approve_after_days  = optional(string)
      approve_until_date  = optional(string)
      compliance_level    = optional(string)
      enable_non_security = optional(bool)
      patch_filter = list(object({
        key    = string
        values = list(string)
      }))
    })), [])
    global_filter = optional(list(object({
      key    = string
      values = list(string)
    })), [])
    source = optional(list(object({
      configuration = string
      name          = string
      products      = list(string)
    })), [])
  }))
  default     = []
  description = <<EOF
    EOF
}

variable "patch_group" {
  type = list(object({
    id          = number
    baseline_id = string
    patch_group = string
  }))
  default     = []
  description = <<EOF
    EOF
}

variable "resource_data_sync" {
  type = list(object({
    id   = number
    name = string
    s3_destination = list(object({
      region      = string
      bucket_name = string
      kms_key_arn = optional(string)
      prefix      = optional(string)
      sync_format = optional(string)
    }))
  }))
  default     = []
  description = <<EOF
    EOF
}

variable "service_setting" {
  type = list(object({
    id            = number
    setting_id    = string
    setting_value = string
  }))
  default     = []
  description = <<EOF
    EOF
}

variable "assume_role_policy" {
  type = string
}

variable "iam_role_name" {
  type = string
}
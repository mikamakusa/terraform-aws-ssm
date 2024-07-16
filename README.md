## Requirements

| Name | Version    |
|------|------------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | \>= 5.58.0 |

## Providers

| Name | Version    |
|------|------------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | \>= 5.58.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_ssm_activation.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_activation) | resource |
| [aws_ssm_association.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_association) | resource |
| [aws_ssm_default_patch_baseline.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_default_patch_baseline) | resource |
| [aws_ssm_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_document) | resource |
| [aws_ssm_maintenance_window.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_maintenance_window) | resource |
| [aws_ssm_maintenance_window_target.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_maintenance_window_target) | resource |
| [aws_ssm_maintenance_window_task.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_maintenance_window_task) | resource |
| [aws_ssm_parameter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_patch_baseline.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_patch_baseline) | resource |
| [aws_ssm_patch_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_patch_group) | resource |
| [aws_ssm_resource_data_sync.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_resource_data_sync) | resource |
| [aws_ssm_service_setting.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_service_setting) | resource |
| [aws_default_tags.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/default_tags) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activation"></a> [activation](#input\_activation) | n/a | <pre>list(object({<br>    id                 = number<br>    iam_role           = string<br>    description        = optional(string)<br>    expiration_date    = optional(string)<br>    name               = optional(string)<br>    registration_limit = optional(number)<br>    tags               = optional(map(string))<br>  }))</pre> | `[]` | no |
| <a name="input_association"></a> [association](#input\_association) | n/a | <pre>list(object({<br>    id                               = number<br>    name                             = string<br>    apply_only_at_cron_interval      = optional(bool)<br>    association_name                 = optional(string)<br>    automation_target_parameter_name = optional(string)<br>    compliance_severity              = optional(string)<br>    document_version                 = optional(string)<br>    max_concurrency                  = optional(string)<br>    max_errors                       = optional(string)<br>    parameters                       = optional(map(string))<br>    schedule_expression              = optional(string)<br>    tags                             = optional(string)<br>    output_location = optional(list(object({<br>      s3_bucket_name = string<br>      s3_key_prefix  = optional(string)<br>      s3_region      = optional(string)<br>    })), [])<br>    targets = optional(list(object({<br>      key    = string<br>      values = list(string)<br>    })), [])<br>  }))</pre> | `[]` | no |
| <a name="input_assume_role_policy"></a> [assume\_role\_policy](#input\_assume\_role\_policy) | n/a | `string` | n/a | yes |
| <a name="input_default_patch_baseline"></a> [default\_patch\_baseline](#input\_default\_patch\_baseline) | n/a | <pre>list(object({<br>    id          = number<br>    baseline_id = number<br>  }))</pre> | `[]` | no |
| <a name="input_document"></a> [document](#input\_document) | n/a | <pre>list(object({<br>    id              = number<br>    content         = string<br>    document_type   = string<br>    name            = string<br>    document_format = optional(string)<br>    permissions     = optional(map(string))<br>    tags            = optional(map(string))<br>    target_type     = optional(string)<br>    version_name    = optional(string)<br>    attachments_source = optional(list(object({<br>      values = list(string)<br>      key    = string<br>      name   = optional(string)<br>    })), [])<br>    parameter = optional(list(object({<br>      type = optional(string)<br>    })), [])<br>  }))</pre> | `[]` | no |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | n/a | `string` | n/a | yes |
| <a name="input_kms_key"></a> [kms\_key](#input\_kms\_key) | n/a | <pre>list(object({<br>    id                                 = number<br>    bypass_policy_lockout_safety_check = optional(bool)<br>    custom_key_store_id                = optional(string)<br>    customer_master_key_spec           = optional(string)<br>    deletion_window_in_days            = optional(number)<br>    description                        = optional(string)<br>    enable_key_rotation                = optional(bool)<br>    is_enabled                         = optional(bool)<br>    key_usage                          = optional(string)<br>    multi_region                       = optional(bool)<br>    policy                             = optional(string)<br>    rotation_period_in_days            = optional(number)<br>    tags                               = optional(map(string))<br>    xks_key_id                         = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | n/a | <pre>list(object({<br>    id                         = number<br>    cutoff                     = number<br>    duration                   = number<br>    name                       = string<br>    schedule                   = string<br>    allow_unassociated_targets = optional(bool)<br>    description                = optional(string)<br>    enabled                    = optional(bool)<br>    end_date                   = optional(string)<br>    schedule_offset            = optional(number)<br>    schedule_timezone          = optional(string)<br>    start_date                 = optional(string)<br>    tags                       = optional(map(string))<br>  }))</pre> | `[]` | no |
| <a name="input_maintenance_window_target"></a> [maintenance\_window\_target](#input\_maintenance\_window\_target) | n/a | <pre>list(object({<br>    id                = number<br>    resource_type     = string<br>    window_id         = number<br>    name              = optional(string)<br>    description       = optional(string)<br>    owner_information = optional(string)<br>    targets = list(object({<br>      key    = string<br>      values = list(string)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_maintenance_window_task"></a> [maintenance\_window\_task](#input\_maintenance\_window\_task) | n/a | <pre>list(object({<br>    id               = number<br>    max_concurrency  = string<br>    max_errors       = string<br>    task_arn         = string<br>    task_type        = string<br>    window_id        = number<br>    description      = optional(string)<br>    name             = optional(string)<br>    priority         = optional(number)<br>    targets = optional(list(object({<br>      key    = string<br>      values = list(string)<br>    })), [])<br>    task_invocation_parameters = optional(list(object({<br>      automation_parameters = optional(list(object({<br>        document_version = optional(string)<br>        parameter = optional(list(object({<br>          values = list(string)<br>          name   = string<br>        })), [])<br>      })), [])<br>      lambda_parameters = optional(list(object({<br>        client_context = optional(string)<br>        payload        = optional(string)<br>        qualifier      = optional(string)<br>      })), [])<br>      run_command_parameters = optional(list(object({<br>        comment              = optional(string)<br>        document_hash        = optional(string)<br>        document_hash_type   = optional(string)<br>        document_version     = optional(string)<br>        output_s3_bucket     = optional(string)<br>        output_s3_key_prefix = optional(string)<br>        service_role_arn     = optional(string)<br>        timeout_seconds      = optional(number)<br>        cloudwatch_config = optional(list(object({<br>          cloudwatch_log_group_name = optional(string)<br>          cloudwatch_output_enabled = optional(bool)<br>        })), [])<br>        notification_config = optional(list(object({<br>          notification_arn    = optional(string)<br>          notification_events = optional(list(string))<br>          notification_type   = optional(string)<br>        })), [])<br>        parameter = optional(list(object({<br>          values = list(string)<br>          name   = string<br>        })), [])<br>      })), [])<br>      step_functions_parameters = optional(list(object({<br>        input = optional(string)<br>        name  = optional(string)<br>      })), [])<br>    })), [])<br>  }))</pre> | `[]` | no |
| <a name="input_parameter"></a> [parameter](#input\_parameter) | n/a | <pre>list(object({<br>    id              = number<br>    name            = string<br>    type            = string<br>    value           = string<br>    allowed_pattern = optional(string)<br>    data_type       = optional(string)<br>    description     = optional(string)<br>    insecure_value  = optional(string)<br>    key_id          = optional(number)<br>    tags            = optional(map(string))<br>    tier            = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_patch_baseline"></a> [patch\_baseline](#input\_patch\_baseline) | n/a | <pre>list(object({<br>    id                                   = number<br>    name                                 = string<br>    approved_patches                     = optional(list(string))<br>    approved_patches_compliance_level    = optional(string)<br>    approved_patches_enable_non_security = optional(bool)<br>    description                          = optional(string)<br>    operating_system                     = optional(string)<br>    rejected_patches                     = optional(list(string))<br>    rejected_patches_action              = optional(string)<br>    tags                                 = optional(map(string))<br>    approval_rule = optional(list(object({<br>      approve_after_days  = optional(string)<br>      approve_until_date  = optional(string)<br>      compliance_level    = optional(string)<br>      enable_non_security = optional(bool)<br>      patch_filter = list(object({<br>        key    = string<br>        values = list(string)<br>      }))<br>    })), [])<br>    global_filter = optional(list(object({<br>      key    = string<br>      values = list(string)<br>    })), [])<br>    source = optional(list(object({<br>      configuration = string<br>      name          = string<br>      products      = list(string)<br>    })), [])<br>  }))</pre> | `[]` | no |
| <a name="input_patch_group"></a> [patch\_group](#input\_patch\_group) | n/a | <pre>list(object({<br>    id          = number<br>    baseline_id = string<br>    patch_group = string<br>  }))</pre> | `[]` | no |
| <a name="input_resource_data_sync"></a> [resource\_data\_sync](#input\_resource\_data\_sync) | n/a | <pre>list(object({<br>    id   = number<br>    name = string<br>    s3_destination = list(object({<br>      bucket_id   = number<br>      kms_key_id = optional(number)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_s3_bucket"></a> [s3\_bucket](#input\_s3\_bucket) | n/a | <pre>list(object({<br>    id                  = number<br>    bucket              = optional(string)<br>    bucket_prefix       = optional(string)<br>    force_destroy       = optional(bool)<br>    object_lock_enabled = optional(bool)<br>    tags                = optional(map(string))<br>  }))</pre> | `[]` | no |
| <a name="input_service_setting"></a> [service\_setting](#input\_service\_setting) | n/a | <pre>list(object({<br>    id            = number<br>    setting_id    = string<br>    setting_value = string<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_activation"></a> [activation](#output\_activation) | n/a |
| <a name="output_association_id"></a> [association\_id](#output\_association\_id) | n/a |
| <a name="output_document_id"></a> [document\_id](#output\_document\_id) | n/a |
| <a name="output_maintenance_window_id"></a> [maintenance\_window\_id](#output\_maintenance\_window\_id) | n/a |
| <a name="output_maintenance_window_target_id"></a> [maintenance\_window\_target\_id](#output\_maintenance\_window\_target\_id) | n/a |
| <a name="output_maintenance_window_task_id"></a> [maintenance\_window\_task\_id](#output\_maintenance\_window\_task\_id) | n/a |

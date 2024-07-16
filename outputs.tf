output "activation" {
  value = try(
    aws_ssm_activation.this.*.id,
    aws_ssm_activation.this.*.activation_code
  )
}

output "association_id" {
  value = try(
    aws_ssm_association.this.*.id,
    aws_ssm_association.this.*.association_id
  )
}

output "document_id" {
  value = try(
    aws_ssm_document.this.*.id
  )
}

output "maintenance_window_id" {
  value = try(
    aws_ssm_maintenance_window.this.*.id
  )
}

output "maintenance_window_task_id" {
  value = try(
    aws_ssm_maintenance_window_task.this.*.id
  )
}

output "maintenance_window_target_id" {
  value = try(
    aws_ssm_maintenance_window_target.this.*.id
  )
}
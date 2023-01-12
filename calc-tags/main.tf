
locals {
  run_pst_tz  = timeadd(time_static.resource_creation.rfc3339, "-8h")
  run_time    = formatdate("YYYY-MM-DD_hh:mm:ss", local.run_pst_tz)
  run_created = join(" ", [local.run_time, "PST"])
  calculated_tags = {
    Creation_Time          = local.run_created
    Pipeline_Creation_User = static_data.creation_metadata.output.pipeline_caller
  }
}

resource "time_static" "resource_creation" {
}

resource "static_data" "creation_metadata" {
  data = { pipeline_caller = "${var.requested_for} - ${var.requested_for_email}" }
  lifecycle {
    ignore_changes = [data]
  }
}

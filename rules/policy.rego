package rules.tf_aws_ec2_ebs_optimized_instance

__rego__metadoc__ := {
  "id": "CP_R00019",
  "title": "EC2 instances should be EBS optimized",
  "description": "Checks whether EBS optimization is enabled for your EC2 instances that can be EBS-optimized.",
  "custom": {
    "severity": "Low"
  }
}

resource_type = "aws_instance"

default allow = false

# the following instance types are by-defualt EBS optimized
# ref: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-optimized.html
ebs_optimized_by_default = {
    "a1.medium",
    "a1.large",
    "a1.xlarge",
    "a1.2xlarge",
    "a1.4xlarge",
    "a1.metal",
    "c4.large",
    "c4.xlarge",
    "c4.2xlarge",
    "c4.4xlarge",
    "c4.8xlarge",
    "c5.large",
}

allow {
  input.ebs_optimized == true
} {
  input.instance_type == ebs_optimized_by_default[_]
}

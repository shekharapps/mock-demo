resource "aws_instance" "instance" {
  iam_instance_profile    = aws_iam_instance_profile.iam_instance_profile.id
  ebs_optimized = true
}

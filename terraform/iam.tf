data "template_file" "codebuild_policy" {
  template = "${file("${path.module}/policies/codebuild_policy.json")}"

  vars {
    aws_s3_bucket_arn = "${aws_s3_bucket.source.arn}"
  }
}

resource "aws_iam_role" "codebuild_role" {
  name               = "${var.stage}-${var.name}-codebuild"
  assume_role_policy = "${file("${path.module}/policies/codebuild_role.json")}"
}

resource "aws_iam_role" "codepipeline_role" {
  name = "${var.stage}-${var.name}-codepipeline"

  assume_role_policy = "${file("${path.module}/policies/codepipeline_role.json")}"
}

data "template_file" "codepipeline_policy" {
  template = "${file("${path.module}/policies/codepipeline.json")}"

  vars {
    aws_s3_bucket_arn = "${aws_s3_bucket.source.arn}"
  }
}

resource "aws_iam_role_policy" "codebuild_policy" {
  name   = "${var.stage}-${var.name}-codebuild"
  role   = "${aws_iam_role.codebuild_role.id}"
  policy = "${data.template_file.codebuild_policy.rendered}"
}

resource "aws_iam_role_policy" "codepipeline_policy" {
  name   = "${var.stage}-${var.name}-codepipeline"
  role   = "${aws_iam_role.codepipeline_role.id}"
  policy = "${data.template_file.codepipeline_policy.rendered}"
}
resource "aws_iam_role" "this" {
  name               = "drone-${var.name}"
  assume_role_policy = "${data.aws_iam_policy_document.assume_role.json}"
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = [
        # mg-tech-ops account - where MG's drone cluster runs
        "arn:aws:iam::904675262287:root",
        # this account - where the role is created
        "arn:aws:iam::${var.account_id}:role/protected/saml-administrator",
      ]
    }

    # See https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-user_externalid.html
    # and https://en.wikipedia.org/wiki/Confused_deputy_problem
    # for why we do this.
    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values   = ["${var.external_id}"]
    }
  }
}

resource "aws_iam_role_policy" "main" {
  name   = "main"
  role   = "${aws_iam_role.this.id}"
  policy = "${var.policy_document}"
}

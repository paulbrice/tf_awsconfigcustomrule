{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowCloudWatchLogAccess",
      "Effect": "Allow",
      "Action": [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*"
    },
    {
      "Sid": "AllowAWSConfigAccess",
      "Effect": "Allow",
      "Action": [
        "config:Put*",
        "config:Get*",
        "config:List*",
        "config:Describe*"
      ],
      "Resource": "*"
    }
  ]
}

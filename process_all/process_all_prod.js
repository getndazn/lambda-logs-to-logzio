'use strict';

const regions = [ "us-east-1", "eu-central-1", "us-west-2", "ap-northeast-1" ];

const accountId = "728650748678";
const shipLogsFuncName = "cloudwatch-logs-prod-ship-logs";
const prefixes = [
  "/aws/lambda/be_prod_jappred-web",
  "/aws/lambda/be_prod_rs-translations-web-api",
  "/aws/lambda/be_prod_rs-web",
  "/aws/lambda/be_prod_rs-articles",
  "/aws/lambda/be_prod_rs-labels",
  "/aws/lambda/be_prod_s3-buckets-replication",
  "/aws/lambda/be_prod_push-notification-device-registration",
  "/aws/lambda/be_prod_push-notification-sender",
  "/aws/lambda/be_prod_notifi",

  "pushnotifi_prod"
];

require('./process_all').processAll(shipLogsFuncName, accountId, regions, prefixes);

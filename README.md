# drawonline.io

## Description
Simple HTML web site to use as whiteboard, running at AWS S3.
[drawonline.io](http://drawonline.io)

## Components
- static html, css, js files under `public_html` folder
- AWS CloudFormation code to;
  - Create buckets, configure S3 static web hosting
  - CodePipeline to deploy static files to S3 from master branch (nested CloudFormation for isolation of resources)

## Contribution
If you feel it's also helping you, feel free to create PR.

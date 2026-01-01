ARG AWS_ACCOUNT_ID
ARG AWS_REGION=ap-northeast-1
ARG ECR_PREFIX=ecr-template-demo-ecr-public

FROM ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_PREFIX}/nginx/nginx:stable-alpine

COPY index.html /usr/share/nginx/html/index.html

ARG ECR_REGISTRY
ARG AWS_REGION=ap-northeast-1

FROM ${ECR_REGISTRY}.dkr.ecr.${AWS_REGION}.amazonaws.com/ecr-public/nginx/nginx:stable-alpine

COPY index.html /usr/share/nginx/html/index.html

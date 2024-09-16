FROM frappe/bench:latest

ARG DB_HOST
ARG REDIS_HOST
ARG DB_PASS
ARG LMS_BRANCH_NAME
ARG LMS_REPO_URL

WORKDIR /usr/app/lms

COPY docker/init.sh .
COPY docker/entrypoint.sh .

RUN bash init.sh $DB_HOST $REDIS_HOST $DB_PASS $LMS_BRANCH_NAME $LMS_REPO_URL

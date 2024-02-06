#/bin/bash
set -ex

cd frappe-bench
bench new-site lms.localhost \
--force \
--mariadb-root-password $1 \
--admin-password admin \
--no-mariadb-socket

bench --site lms.localhost install-app lms
bench --site lms.localhost set-config developer_mode 1
bench --site lms.localhost clear-cache
bench --site lms.localhost set-config mute_emails 1
bench use lms.localhost
bench start

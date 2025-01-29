# Changelog

## 0.7.0 - UNRELEASED

- Change internal server port to 5001 (new binaries/container images required), Create a [Prometheus Operator ServiceMonitor CRD](https://github.com/prometheus-operator/prometheus-operator/blob/main/Documentation/user-guides/running-exporters.md) to collect metrics from services/pods.

## 0.6.0 - 03-01-2025

- Configure liveness probes to wait 10 seconds before starting to check the health of the pod
- Upgrade to redis 7.4.1, pull it from AWS ECR, since it is faster when running in AWS and there is no risk of throttling (unlike DockerHub)
- Add the ability to downgrade tenant DB migrations (DO NOT USE IN PRODUCTION)
- Add the ability to add additional annotations to the provision job (automatic provisioner)

## 0.5.1 - 22-10-2024

- Fix DB Proxy NLB annotations indentation so additional annotations are rendered properly

## 0.5.0 - 10-10-2024

- **IMPORTANT** The UC Software now uses the `secretsmanager:TagResource` when creating secrets, so this permissions needs to be added to the IAM role that the UC Software uses.
  Additionally the IAM role needs to have the `secretsmanager:DeleteSecret` permission if the Access Policy Secrets feature is used.
- Simplify redis cache config by making username & password optional (removed them from the configmap used in this chart)
- Fix log server URL in base config file
- Run DB Proxy NLB health checks on on port 1200 instead of 3306, it is configurable from the values file `dbproxy.mysql.healthCheckPort`
- Configure MySQL Ports for DB Proxy NLB in the values file `dbproxy.mysql.ports`

## 0.4.0 - 10-09-2024

- Add logger config to base config file
- Remove the limitation of requiring to install the chart into a specific namespace (`userclouds`) chart can now be installed into any kubernetes namespace.
- Allow configuring resources requests & limits for pods

## 0.3.0 - 05-09-2024

- Update configmap to use the correct pattern for service specific base config files
- Don't use `helm.sh/chart` label is deployment & service selector values since those are immutable.
- Don't hard code namespace for redis in common cache configuration (use `{{ .Release.Namespace }}` instead)

## 0.2.0 - 29-08-2024

- Initial release of the chart

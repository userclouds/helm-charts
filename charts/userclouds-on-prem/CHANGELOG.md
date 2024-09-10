# Changelog

## 0.4.0 - 10-09-2024

- Add logger config to base config file
- Remove the limitation of requiring to install the chart into a specific namespace (`userclouds`) chart can now be installed into any kubernetes namespace.
- Allow configuring resources requests & limits for pods

## 0.3.0 - 05-09-2024

- Update configmap to use the correct pattern for service specific base config files
- Don't use `helm.sh/chart`  label is deployment & service selector values since those are immutable.
- Don't hard code namespace for redis in common cache configuration (use `{{ .Release.Namespace }}` instead)

## 0.2.0 - 29-08-2024

- Initial release of the chart

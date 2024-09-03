# Changelog

## 0.3.0 - TBD

- Update configmap to use the correct pattern for service specific base config files
- Don't use `helm.sh/chart`  label is deployment & service selector values since those are immutable.
- Don't hard code namespace for redis in common cache configuration (use `{{ .Release.Namespace }}` instead)

## 0.2.0 - 29-08-2024

- Initial release of the chart

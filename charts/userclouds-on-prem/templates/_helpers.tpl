
{{- define "userclouds.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "userclouds.labels" -}}
helm.sh/chart: {{ include "userclouds.chart" . }}
app.kubernetes.io/name: userclouds
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{- define "userclouds.envVars" -}}
- name: "POD_NAME"
  valueFrom:
    fieldRef:
      fieldPath: metadata.name
- name: K8S_POD_NAMESPACE
  valueFrom:
    fieldRef:
      fieldPath: metadata.namespace
# config/base_onprem.yaml
- name: PG_PASSWORD
  valueFrom:
    secretKeyRef:
      name: postgresql-creds
      key: password
- name: UC_API_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: userclouds-api-client-secret
      key: client_secret
- name: UC_CONFIG_DIR
  value: /userclouds/configmaps,/userclouds/config/
- name: UC_UNIVERSE
  value: onprem
- name: UC_REGION
  value: customerlocal
- name: UC_ON_PREM_CUSTOMER_DOMAIN
  value: ".{{ .Values.config.customerDomain }}"
{{- end }}


{{- define "userclouds.envVars.googleAuth" -}}
- name: GOOGLE_CLIENT_ID
  valueFrom:
    secretKeyRef:
      name: userclouds-google-auth
      key: client_id
- name: GOOGLE_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: userclouds-google-auth
      key: client_secret
{{- end }}

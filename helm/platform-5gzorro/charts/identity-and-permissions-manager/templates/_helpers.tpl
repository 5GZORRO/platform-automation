{{/*
Expand the name of the chart.
*/}}
{{- define "identity-and-permissions-manager.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "identity-and-permissions-manager.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "identity-and-permissions-manager.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "identity-and-permissions-manager.labels" -}}
helm.sh/chart: {{ include "identity-and-permissions-manager.chart" . }}
{{ include "identity-and-permissions-manager.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "identity-and-permissions-manager.selectorLabels" -}}
app.kubernetes.io/name: {{ include "identity-and-permissions-manager.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
identity-and-permissions-manager/role: {{ .Values.idp.role }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "identity-and-permissions-manager.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "identity-and-permissions-manager.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

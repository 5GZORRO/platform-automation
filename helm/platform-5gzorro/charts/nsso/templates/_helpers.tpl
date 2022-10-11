{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "nsso.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create imagePullSecret from global variables.
*/}}
{{- define "imagePullSecret" }}
{{- printf "{\"auths\": {\"%s\": {\"auth\": \"%s\"}}}" .Values.global.imageCredentials.registry (printf "%s:%s" .Values.global.imageCredentials.username .Values.global.imageCredentials.password | b64enc) | b64enc }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "nsso.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}


{{/*
Common labels
*/}}
{{- define "nsso.labels" -}}
helm.sh/chart: {{ include "nsso.chart" . }}
{{ include "nsso.selectorLabels" . }}
{{- if .Values.AppVersion }}
app.kubernetes.io/version: {{ .Values.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "nsso.selectorLabels" -}}
app.kubernetes.io/name: {{ include "nsso.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
nsso/role: {{ .Values.role }}

{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "nsso.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "nsso.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "nsso.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

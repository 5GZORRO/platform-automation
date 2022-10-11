(function(window) {
  window["env"] = window["env"] || {};

  // Environment variables
  window["env"]["baseUrl"] = "{{ if .Values.service.name }}name: {{ .Values.service.name }}{{- else }}name: {{ include "nsso.fullname" . }}{{ end }}";
  window["env"]["debug"] = true;
})(this);
{{ if .Values.service.name }}name: {{ .Values.service.name }}{{- else }}name: {{ include "nsso.fullname" . }}{{ end }}
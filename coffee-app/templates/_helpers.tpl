{{/*
Expand the name of the chart.
*/}}
{{- define "coffee-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "coffee-app.frontend.name" -}}frontend{{- end }}

{{- define "coffee-app.backend.name" -}}backend{{- end }}

{{- define "coffee-app.resizer.name" -}}resizer{{- end }}


{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "coffee-app.fullname" -}}
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
{{- define "coffee-app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "coffee-app.frontend.labels" -}}
helm.sh/chart: {{ include "coffee-app.chart" . }}
frontendVersion: {{ splitList ":" .Values.frontend.image.name | last | quote }}
{{ include "coffee-app.frontend.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "coffee-app.backend.labels" -}}
helm.sh/chart: {{ include "coffee-app.chart" . }}
backendVersion: {{ splitList ":" .Values.backend.image.name | last | quote }}
{{ include "coffee-app.backend.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "coffee-app.resizer.labels" -}}
helm.sh/chart: {{ include "coffee-app.chart" . }}
resizerVersion: {{ splitList ":" .Values.resizer.image.name | last | quote }}
{{ include "coffee-app.resizer.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "coffee-app.labels" -}}
helm.sh/chart: {{ include "coffee-app.chart" . }}
{{ include "coffee-app.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "coffee-app.frontend.selectorLabels" -}}
app.kubernetes.io/name: {{ include "coffee-app.frontend.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "coffee-app.backend.selectorLabels" -}}
app.kubernetes.io/name: {{ include "coffee-app.backend.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "coffee-app.resizer.selectorLabels" -}}
app.kubernetes.io/name: {{ include "coffee-app.resizer.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "coffee-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "coffee-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "coffee-app.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "coffee-app.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
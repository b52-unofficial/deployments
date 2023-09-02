{{- define "geth.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "geth.fullname" -}}
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
{{- define "geth.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "geth.labels" -}}
app: {{ include "geth.fullname" . }}
helm.sh/chart: {{ include "geth.chart" . }}
{{ include "geth.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "geth.annotations" -}}
service.beta.kubernetes.io/aws-load-balancer-type: "nlb"
{{- end }}

{{/*
Selector labels
*/}}
{{- define "geth.selectorLabels" -}}
alpha.eksctl.io/cluster-name: {{ .Values.deploy.cluster }}
alpha.eksctl.io/nodegroup-name: {{ .Values.deploy.nodeLabel }}
{{- end }}

{{/*
Application Selector labels for service selector
*/}}
{{- define "geth.podSelectorLabels" -}}
app: {{ include "geth.fullname" . }}
helm.sh/chart: {{ include "geth.chart" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "geth.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "geth.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

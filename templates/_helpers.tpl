{{/* Generate rabbitmq names */}}
{{- define "rabbitmq.name" }}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Generate rabbitmq image */}}
{{- define "rabbitmq.image" }}
{{- if .Values.image.registry }}
{{- printf "%s/%s:%s" .Values.image.registry .Values.image.rabbitmq.repository .Values.image.rabbitmq.tag -}}
{{- else -}}
{{- printf "%s:%s" .Values.image.rabbitmq.repository .Values.image.rabbitmq.tag -}}
{{- end -}}
{{- end -}}

{{/* Generate busybox image */}}
{{- define "busybox.image" }}
{{- if .Values.image.registry }}
{{- printf "%s/%s:%s" .Values.image.registry .Values.image.busybox.repository .Values.image.busybox.tag -}}
{{- else -}}
{{- printf "%s:%s" .Values.image.busybox.repository .Values.image.busybox.tag -}}
{{- end -}}
{{- end -}}

{{/* Generate rabbitmq mirror queue */}}
{{- define "mirrorqueue-init-command" }}
{{- printf "rabbitmqctl set_policy %s '%s' '%s'" .Values.rabbitmq.mirrorQueue.mirrorPolicyName .Values.rabbitmq.mirrorQueue.mirrorQueuePattern .Values.rabbitmq.mirrorQueue.definition }}
{{- end }}
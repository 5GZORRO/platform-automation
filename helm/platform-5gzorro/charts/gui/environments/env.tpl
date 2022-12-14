window._API_MARKET_PLACE = {{ .Values.marketPlaceUrl | quote }}
window._API_LPT = {{ .Values.legalProseUrl | quote }}
window._API_GOVERNANCE = {{ .Values.governanceUrl | quote }}
window._API_IPM = {{ .Values.identityPermissionsUrl | quote }}
window._API_SMART_CONTRACT = {{ .Values.smartContractUrl | quote }}
window._XRM_ENDPOINT = {{ .Values.resourceManagerEndpoint | quote }}
window._XRM_DISCOVERY_API_KEY = {{ .Values.resourceManagerDiscoveryApiKey | quote }}
window._XRM_TRANSLATOR_API_KEY = {{ .Values.resourceManagerTraslatorApiKey | quote }}
window._RAPP_DISCOVERY_API_KEY = {{ .Values.rappDiscoveryApiKey | quote }}
window._SLICE_DISCOVERY_API_KEY = {{ .Values.sliceDiscoveryApiKey | quote }}
window._APP_ENV = 'development'
window._LEDGER_IDENTITY = {{ .Values.ledgerIdentity | quote }}
window._HOST = 'BCN'
window._PROFILE = {{ .Values.role | quote }}
window._API_SRSD = {{ .Values.srsdUrl | quote }}
window._API_ISSM = {{ .Values.issmUrl | quote }}
window._API_RAPP = {{ .Values.rappUrl | quote }}
window._VERIFICATION_KEY = '5gzorroidportalnsmm'
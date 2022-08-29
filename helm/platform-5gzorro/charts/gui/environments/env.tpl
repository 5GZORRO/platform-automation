configValues: |
  window._API_MARKET_PLACE = {{ .Values.marketPlaceUrl }}
  window._API_LPT = {{ .Values.legalProseUrl }}
  window._API_GOVERNANCE = {{ .Values.governanceUrl }}
  window._API_IPM = {{ .Values.identityPermissionsUrl }}
  window._API_SMART_CONTRACT = {{ .Values.smartContractUrl}}
  window._XRM_ENDPOINT = {{ .Values.resourceManagerEndpoint }}
  window._XRM_DISCOVERY_API_KEY = {{ .Values.resourceManagerDiscoveryApiKey }}
  window._XRM_TRANSLATOR_API_KEY = {{ .Values.resourceManagerTraslatorApiKey }}
  window._RAPP_DISCOVERY_API_KEY = {{ .Values.rappDiscoveryApiKey }}
  window._SLICE_DISCOVERY_API_KEY = {{ .Values.sliceDiscoveryApiKey }}
  window._APP_ENV = 'development'
  window._VERIFICATION_KEY = '5gzorroidportalnsmm'
  window._LEDGER_IDENTITY = {{ .Values.ledgerIdentity }}
  window._HOST = 'BCN'
  window._PROFILE = {{ .Values.role }}
  window._API_SRSD = {{ .Values.srsdUrl }}
  window._API_ISSM = {{ .Values.issmUrl }}
  window._API_RAPP = {{ .Values.rappUrl }}
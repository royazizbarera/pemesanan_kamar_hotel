
  /// Detail status code
  // Informational 1xx
  const String continueCode = '100';
  const String switchingProtocols = '101';
  const String processing = '102'; // WebDAV; RFC 2518
  const String earlyHints = '103'; // RFC 8297

  // Success 2xx
  const String ok = '200';
  const String created = '201';
  const String accepted = '202';
  const String nonAuthoritativeInformation = '203';
  const String noContent = '204';
  const String resetContent = '205';
  const String partialContent = '206';
  const String multiStatus = '207'; // WebDAV; RFC 4918
  const String alreadyReported = '208'; // WebDAV; RFC 5842
  const String imUsed = '226'; // RFC 3229

  // Redirection 3xx
  const String multipleChoices = '300';
  const String movedPermanently = '301';
  const String found = '302';
  const String seeOther = '303';
  const String notModified = '304';
  const String useProxy = '305';
  const String switchProxy = '306';
  const String temporaryRedirect = '307';
  const String permanentRedirect = '308'; // RFC 7238

  // Client Errors 4xx
  const String badRequest = '400';
  const String unauthorized = '401';
  const String paymentRequired = '402';
  const String forbidden = '403';
  const String notFound = '404';
  const String methodNotAllowed = '405';
  const String notAcceptable = '406';
  const String proxyAuthenticationRequired = '407';
  const String requestTimeout = '408';
  const String conflict = '409';
  const String gone = '410';
  const String lengthRequired = '411';
  const String preconditionFailed = '412';
  const String payloadTooLarge = '413';
  const String uriTooLong = '414';
  const String unsupportedMediaType = '415';
  const String rangeNotSatisfiable = '416';
  const String expectationFailed = '417';
  const String imATeapot = '418'; // RFC 2324
  const String misdirectedRequest = '421'; // RFC 7540
  const String unprocessableEntity = '422'; // WebDAV; RFC 4918
  const String locked = '423'; // WebDAV; RFC 4918
  const String failedDependency = '424'; // WebDAV; RFC 4918
  const String tooEarly = '425'; // RFC 8470
  const String upgradeRequired = '426';
  const String preconditionRequired = '428'; // RFC 6585
  const String tooManyRequests = '429'; // RFC 6585
  const String requestHeaderFieldsTooLarge = '431'; // RFC 6585
  const String unavailableForLegalReasons = '451';

  // Server Errors 5xx
  const String internalServerError = '500';
  const String notImplemented = '501';
  const String badGateway = '502';
  const String serviceUnavailable = '503';
  const String gatewayTimeout = '504';
  const String httpVersionNotSupported = '505';
  const String variantAlsoNegotiates = '506';
  const String insufficientStorage = '507'; // WebDAV; RFC 4918
  const String loopDetected = '508'; // WebDAV; RFC 5842
  const String notExtended = '510';
  const String networkAuthenticationRequired = '511';

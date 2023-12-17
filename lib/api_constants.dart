library diamond.api_constants;

import 'dart:core';

String issuer = '';
String authorizePath = '';
// paths for other flows
String authorizeUrl = '$issuer$authorizePath';
String tokenUrl = '${issuer}realms/...';
String endSessionUrl = '${issuer}realms/...';
String userInfoUrl = '${issuer}realms/...';
String revokeUrl = '${issuer}realms/...';

// PKCE Flow variables
String issuerHost = Uri.parse(issuer).host;
String redirectUri = 'ebdaa-business.com';
String clientSecret = '...';
String clientId = '...';

///state – RECOMMENDED. This is an opaque value used by the client to maintain
///state between the request and callback. Your client application will
///need to generate this random alphanumeric string of characters and
///include it in the request. The authorization server will attach
///this value to a redirect_uri as a query string parameter.
///This “state” parameter SHOULD be used for preventing cross-site
// /request forgery.
// The page that handles the response from the
//authorization server will need to read this value and compare it to
//the original one that was sent with an initial request.
//The two values must match,
String state = "fj8o3n7bdy1op5";
String grantType = 'authorization_code';
String responseType = 'code';
List<String> scopesList = [];

String? authCode;

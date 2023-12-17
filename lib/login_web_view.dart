import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pkce_oauth/challenge_generator.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '/api_constants.dart' as constants;
import 'package:http/http.dart' as http;

class LoginWebViewApp extends StatefulWidget {
  const LoginWebViewApp({super.key});

  @override
  State<LoginWebViewApp> createState() => _LoginWebViewAppState();
}

class _LoginWebViewAppState extends State<LoginWebViewApp> {
  late final WebViewController controller;

  // Generate the code verifier and code challenge
  // they should be saved somewhere for later use
  final codeVerifier = challengeGenerator().codeVerifier;
  final codeChallenge = challengeGenerator().codeChallenge;




  // Generate the authorization url
  final authUrl = Uri.https(constants.issuerHost, constants.authorizePath, {
    'client_id': constants.clientId,
    'response_type': 'code',
    'redirect_uri': constants.redirectUri,
    'state': constants.state,
    //'scope': constants.scopesList.join(' '),
    // 'code_challenge': codeChallenge,
    // 'code_challenge_method': 'S256',
  });
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        authUrl,
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest navigation) async {
            if (  navigation.url.startsWith(
                constants.redirectUri)) {

              navigation.url.contains('code=')
                  ? constants.authCode = Uri.parse(navigation.url).queryParameters['code']
                  : null;

              try {
                final response = await http.Client().post(
                  Uri.parse(constants.tokenUrl),
                  headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                  },
                  body: {
                    'grant_type': 'authorization_code',
                    'client_id': constants.clientId,
                    'client_secret': constants.clientSecret,
                    'code': constants.authCode,
                    'redirect_uri': constants.redirectUri,
                    //'code_verifier': codeVerifier,
                  },
                ).then((response) {
                  final values = jsonDecode(response.body);

                  //the response should then contain the token and refresh token,
                  // Provider.of<AuthProvider>(context, listen: false).setTokens(
                  //     accessToken: values['access_token'], refreshToken:values['refresh_token']);

                  Navigator.of(context).pop();
                });
              } catch (e) {
                print(e);
              }

              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}

# pkce_oauth


## Description
This project demonstrates the implementation of the OAuth 2.0 authorization flow with Proof Key for Code Exchange (PKCE) for authentication. It provides a web view for users to authenticate with a third-party service and obtain an authorization code, which is then exchanged for an access token.
more about the flow : https://www.appsdeveloperblog.com/pkce-verification-in-authorization-code-grant/

## Features
- Implements the PKCE flow for secure authentication
- Uses a web view to display the authentication page
- Handles the callback URL to retrieve the authorization code
- Exchanges the authorization code for an access token
- Makes authenticated API requests using the access token


## Configuration
1. Open the `lib/constants.dart` file.
2. Update the `authUrl` variable with the authentication URL provided by the third-party service.
3. Update the `tokenUrl` variable with the token exchange URL provided by the third-party service.
4. change any needed variables in that file
5. open `lib/login_web_view`and uncomment lines 34,35,65 to use code challange and code verifier.


## Usage
please read the code carefully first, and refactor the needed paramters to match your needa
1. Run the application: `flutter run`
2. The application will open a web view displaying the authentication page.
3. Authenticate with the third-party service using your credentials.
4. After successful authentication, the application will retrieve the authorization code and exchange it for an access token.
5. You can now make authenticated API requests using the access token.

## Contributing
Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.



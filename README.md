# Neuron Login

[![Build Status](https://api.cirrus-ci.com/github/flutter/plugins.svg)](https://cirrus-ci.com/github/flutter/plugins/master)

Flutter login package from Neuron with 🥰 . Supports for iOS and Android.

## Usage

Add this line to `pubspec.yaml`


```
   dependencies:
     neuron_login:

```

## Import

```
import 'package:neuron_login/neuron_login.dart';

```

## Example

```
  LoginPage(
    buttonColor: Colors.red,
    splashButtonColor: Colors.grey,
    buttonText: 'SELANJUTNYA',
    buttonTextColor: Colors.white,
    base64Image: 'assets/images/logo_tsat.png',
    forgotPassword: true,
    forgotPasswordText: 'Lupa Password?',
    forgotPasswordTextColor: Colors.red,
    buttonRegisterColor: Colors.grey,
    splashButtonRegisterColor: Colors.grey,
    buttonRegisterText: 'DAFTAR',
    buttonRegisterTextColor: Colors.white,
    buttonRegister: true,
    labelInputUsername: 'E-mail',
    labelInputPassword: 'Password',
    onButtonTap: (loginData) {
      print(loginData.username);
      print(loginData.password);
      print(loginData.rememberMe.toString());
    },
    onForgotPasswordTap: (boolean){
      print('Forgot Password Tapped');
    },
    onButtonRegisterTap: (boolean){
      print('Button Register Tapped');
    },
  ),
```

| Function | Description |
| ------ | ------ |
| buttonColor | Set color for button submit |
| splashButtonColor | Set splash button submit color |
| buttonText | Set text for button submit |
| buttonTextColor | Set text color for button submit |
| base64Image | Image asset link |
| forgotPassword | Show or hide forgot password |
| forgotPasswordText | Set text for forgot password text |
| forgotPasswordTextColor | Set text color for forgot password |
| buttonRegisterColor | Set color for button register |
| splashButtonRegisterColor | Set splash button register color |
| buttonRegisterText | Set text for button register |
| buttonRegisterTextColor | Set text color for button register |
| buttonRegister | Show or hide button register |
| labelInputUsername | Label and hint text for input username |
| labelInputPassword | Label and hint text for input password |
| onButtonTap | Return if button login tapped |
| onForgotPasswordTap | Return if text forgot password tapped |
| onButtonRegisterTap | Return if button register tapped |
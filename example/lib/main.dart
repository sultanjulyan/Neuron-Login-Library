import 'package:flutter/material.dart';
import 'package:neuron_login/neuron_login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neuron Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: LoginPage(
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
      ),
    );
  }
}

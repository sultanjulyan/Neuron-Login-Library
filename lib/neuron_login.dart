library neuron_login;

import 'package:flutter/material.dart';
import 'model/form_user.dart';

class LoginPage extends StatefulWidget {
  final ValueChanged<FormUser> onButtonTap;
  final Color buttonColor;
  final Color splashButtonColor;
  final String buttonText;
  final Color buttonTextColor;
  final ValueChanged<bool> onForgotPasswordTap;
  final bool forgotPassword;
  final String forgotPasswordText;
  final Color forgotPasswordTextColor;
  final ValueChanged<bool> onButtonRegisterTap;
  final Color buttonRegisterColor;
  final Color splashButtonRegisterColor;
  final String buttonRegisterText;
  final Color buttonRegisterTextColor;
  final bool buttonRegister;
  final String base64Image;
  final String labelInputUsername;
  final String labelInputPassword;

  const LoginPage(
      {Key key,
      this.onButtonTap,
      this.buttonColor,
      this.splashButtonColor,
      this.buttonText,
      this.buttonTextColor,
      this.onForgotPasswordTap,
      this.forgotPassword,
      this.forgotPasswordText,
      this.forgotPasswordTextColor,
      this.onButtonRegisterTap,
      this.buttonRegisterColor,
      this.splashButtonRegisterColor,
      this.buttonRegisterText,
      this.buttonRegisterTextColor,
      this.buttonRegister,
      this.labelInputUsername,
      this.labelInputPassword,
      this.base64Image})
      : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isHidden = true;

  void _toogleVisible() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool _isForgotPasswordShow;
    bool _isButtonRegisterShow;

    if (widget.forgotPassword != null) {
      _isForgotPasswordShow = widget.forgotPassword;
    } else {
      _isForgotPasswordShow = false;
    }

    final imageLayout = new Container(
      margin: const EdgeInsets.only(top: 50.0),
      child: new Center(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              height: 130.0,
              child: widget.base64Image != null ? Image.asset(widget.base64Image) : new Container(),
            ),
          ],
        ),
      ),
    );

    final labelForm = new Container(
      margin: const EdgeInsets.only(top: 60.0),
      child: new Text(
        'Login Ke Akun Anda',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 20.0,
        ),
      ),
    );

    final labelInputUsername = new Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        new Container(
          margin: const EdgeInsets.only(top: 20.0),
          child: new Text(
            widget.labelInputUsername != null ? widget.labelInputUsername : 'Email / No.Hp',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.0,
            ),
          ),
        ),
        new Container(
          margin: const EdgeInsets.only(top: 5.0),
          child: new TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            decoration: InputDecoration(
              prefixIcon: new Icon(
                Icons.mail_outline,
                color: Color(0XFF8A8A8A),
              ),
              hintText: widget.labelInputUsername != null ? widget.labelInputUsername : 'Email',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
          ),
        ),
      ],
    );

    final labelInputPassword = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        new Container(
          margin: const EdgeInsets.only(top: 20.0),
          child: new Text(
            widget.labelInputPassword != null ? widget.labelInputPassword : 'Password',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.0,
            ),
          ),
        ),
        new Container(
          margin: const EdgeInsets.only(top: 5.0),
          child: new TextFormField(
            controller: passwordController,
            autofocus: false,
            obscureText: isHidden,
            decoration: InputDecoration(
              prefixIcon: new Icon(
                Icons.lock_outline,
                color: Color(0XFF8A8A8A),
              ),
              suffixIcon: new IconButton(
                icon: Icon(isHidden ? Icons.visibility_off : Icons.visibility, size: 18),
                onPressed: _toogleVisible,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                color: Color(0XFF8A8A8A),
              ),
              hintText: widget.labelInputPassword != null ? widget.labelInputPassword : 'Password',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
          ),
        ),
      ],
    );

    final layoutRememberForgot = new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Row(
          children: <Widget>[
            new Checkbox(
              value: rememberMe,
              onChanged: (bool value) {
                setState(() {
                  rememberMe = value;
                });
              },
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (rememberMe == true) {
                    rememberMe = false;
                  } else if (rememberMe == false) {
                    rememberMe = true;
                  }
                });
                print(rememberMe);
              },
              child: new Text(
                'Ingat Saya',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
        _isForgotPasswordShow
            ? new GestureDetector(
                onTap: () {
                  widget.onForgotPasswordTap(true);
                },
                child: new Container(
                  child: new Text(
                    widget.forgotPasswordText != null
                        ? widget.forgotPasswordText
                        : 'Lupa Password?',
                    style: TextStyle(
                      color: widget.forgotPasswordTextColor != null
                          ? widget.forgotPasswordTextColor
                          : Colors.blue,
                    ),
                  ),
                ),
              )
            : new Container(),
      ],
    );

    final buttonLogin = new Container(
      margin: const EdgeInsets.only(top: 20.0),
      width: double.infinity,
      height: 45.0,
      child: new FlatButton(
        splashColor: widget.splashButtonColor,
        onPressed: () {
          widget.onButtonTap(new FormUser(
              username: emailController.text,
              password: passwordController.text,
              rememberMe: rememberMe));
        },
        child: Text(widget.buttonText != null ? widget.buttonText : 'SELANJUTNYA'),
        textColor: widget.buttonTextColor != null ? widget.buttonTextColor : Colors.white,
        color: widget.buttonColor != null ? widget.buttonColor : Color(0XFF0A5B75),
        shape: StadiumBorder(),
      ),
    );

    final buttonRegister = new Container(
      margin: const EdgeInsets.only(top: 10.0),
      width: double.infinity,
      height: 45.0,
      child: new FlatButton(
        splashColor: widget.splashButtonRegisterColor,
        onPressed: () {
          widget.onButtonRegisterTap(true);
        },
        child: Text(widget.buttonRegisterText != null ? widget.buttonRegisterText : 'DAFTAR'),
        textColor:
            widget.buttonRegisterTextColor != null ? widget.buttonRegisterTextColor : Colors.white,
        color: widget.buttonRegisterColor != null ? widget.buttonRegisterColor : Color(0XFF0A5B75),
        shape: StadiumBorder(),
      ),
    );

    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
        child: new Container(
          padding: new EdgeInsets.all(35.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              imageLayout,
              labelForm,
              labelInputUsername,
              labelInputPassword,
              layoutRememberForgot,
              buttonLogin,
              buttonRegister
            ],
          ),
        ),
      ),
    );
  }
}

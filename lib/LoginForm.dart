import 'package:flutter/material.dart';
import 'package:login_form/HomePage.dart';
import 'package:login_form/RegisterPage.dart';
import 'package:login_form/style.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late String errormessage;
  late bool isError;

  @override
  void initState() {
    errormessage = "This is an error message";
    isError = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void checkLogin(username, password) {
    setState(() {
      if (username == "") {
        errormessage = "Username cannot be empty";
        isError = true;
      } else if (password == "") {
        errormessage = "Password cannot be empty";
        isError = true;
      } else if (username != "admin" || password != "admin") {
        errormessage = "Invalid username or password";
        isError = true;
      } else {
        isError = false;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage(username: username)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login Form', style: txtstyle),
              const SizedBox(height: 40),
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: btnstyle,
                onPressed: () {
                  checkLogin(usernameController.text, passwordController.text);
                },
                child: Text('Login', style: txtstyle2),
              ),
              const SizedBox(height: 20),
              (isError)
                  ? Text(errormessage, style: errortxtstyle)
                  : Container(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text('Register here', style: txtstyle3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

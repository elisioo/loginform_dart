import 'package:flutter/material.dart';
import 'package:login_form/LoginForm.dart';
import 'package:login_form/style.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
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

  void checkRegister(username, password, confirmPassword, email, phone) {
    setState(() {
      if (username == "") {
        errormessage = "Username cannot be empty";
        isError = true;
      } else if (password == "") {
        errormessage = "Password cannot be empty";
        isError = true;
      } else if (confirmPassword != password) {
        errormessage = "Passwords do not match";
        isError = true;
      } else if (email == "") {
        errormessage = "Email cannot be empty";
        isError = true;
      } else if (phone == "") {
        errormessage = "Phone number cannot be empty";
        isError = true;
      } else {
        //Registration success — clear errors
        isError = false;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginForm()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Register Page', style: txtstyle),
                  const SizedBox(height: 20),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Name',
                      prefixIcon: Icon(Icons.account_box),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Confirm Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Phone Number',
                      prefixIcon: Icon(Icons.phone),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: btnstyle,
                    onPressed: () {
                      checkRegister(
                        usernameController.text,
                        passwordController.text,
                        confirmPasswordController.text,
                        emailController.text,
                        phoneController.text,
                      );
                    },
                    child: Text('Register', style: txtstyle2),
                  ),
                  const SizedBox(height: 20),
                  (isError)
                      ? Text(errormessage, style: errortxtstyle)
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_firebase/screens/login_screen.dart';

class SignUpFormPage extends StatefulWidget {
  const SignUpFormPage({super.key});

  @override
  State<SignUpFormPage> createState() => _SignUpFormPageState();
}

class _SignUpFormPageState extends State<SignUpFormPage> {
  bool obscureText = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  /// show and hide password function
  void togglePassword() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  String? validateEmail(value) {
    if (value == null || !value.contains('@')) {
      return 'Enter a valid email address';
    }
    return null;
  }
// validate password
  String? validatePassword(String? value) {
    if (value == null || value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name required';
    } else if (value[0] != value[0].toUpperCase()) {
      return 'First character must be capitalized';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Full Name
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Full Name',
              prefixIcon: Icon(Icons.person),
            ),
            validator: validateName,
          ),
          const SizedBox(height: 16),
          // E-mail
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
            ),
            validator: validateEmail,
          ),
          const SizedBox(height: 16),

          // Password
          TextFormField(
            controller: passwordController,
            obscureText: obscureText,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              labelText: 'Password',
              suffixIcon: IconButton(
                onPressed: togglePassword,
                icon:
                    Icon(obscureText ? Icons.visibility_off : Icons.visibility),
              ),
            ),
            validator: validatePassword,
          ),
          const SizedBox(height: 16),

          /// Confirm password
          TextFormField(
            controller: confirmPasswordController,
            obscureText: obscureText,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              labelText: 'Confirm Password',
              suffixIcon: IconButton(
                onPressed: togglePassword,
                icon:
                    Icon(obscureText ? Icons.visibility_off : Icons.visibility),
              ),
            ),
            validator: validateConfirmPassword,
          ),
          const SizedBox(height: 16),

          // Signup Button
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  try {
                    // Attempt to create a user with Firebase
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                    );

                    // Check if the user was successfully created
                    if (credential.user != null) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        // Prevents dismissing the dialog by tapping outside it
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Success'),
                            content: const Text("Account Created successfully"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    PageRouteBuilder(
                                      pageBuilder:
                                          (context, animation1, animation2) =>
                                              const LoginScreen(),
                                      transitionsBuilder: (context, animation1,
                                          animation2, child) {
                                        return FadeTransition(
                                            opacity: animation1, child: child);
                                      },
                                      transitionDuration:
                                          const Duration(milliseconds: 1000),
                                    ),
                                  );
                                },
                                child: const Text('Okay'),
                              )
                            ],
                          );
                        },
                      );
                    }
                  } on FirebaseAuthException catch (e) {
                    String errorMessage =
                        'An unexpected error occurred. Please try again.';
                    if (e.code == 'weak-password') {
                      errorMessage = 'The password provided is too weak.';
                    } else if (e.code == 'email-already-in-use') {
                      errorMessage =
                          'The account already exists for that email.';
                    }

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Registration Error'),
                          content: Text(errorMessage),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                } else {
                  SnackBar snackBar = SnackBar(
                    content: Text('Entered wrong data'),
                    duration: const Duration(seconds: 2),
                    action: SnackBarAction(
                      label: "OK",
                      onPressed: () {},
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: const Text('Create Account'),
            ),
          ),
          /// Login button
          SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}

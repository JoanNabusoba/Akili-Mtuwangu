import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:myapp/ui/login.dart';
import 'package:myapp/ui/widgets/akili_btn.dart';
import 'package:myapp/ui/widgets/akili_textfield.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    final _formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      backgroundColor: const Color(0xffFDF3E4),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create Account',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                AkiliTextfield(
                  keyboardType: TextInputType.emailAddress,
                  labelText: "Email",
                  name: 'email',
                  hintText: 'mate@icloud.com',
                  prefixIcon: Icons.email_outlined,
                ),
                const SizedBox(height: 20),
                AkiliTextfield(
                  keyboardType: TextInputType.text,
                  labelText: "Password",
                  name: 'password',
                  obscureText: true,
                  hintText: '*********',
                  prefixIcon: Icons.lock_outline,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Password must contain at least 6 characters, including upper + lowercase and numbers.',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                AkiliTextfield(
                  keyboardType: TextInputType.text,
                  labelText: "Confirm Password",
                  name: 'confirmpassword',
                  hintText: '3xample',
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                if (passwordController.text != confirmPasswordController.text &&
                    confirmPasswordController.text.isNotEmpty)
                  const Text(
                    'Passwords do not match',
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  ),
                const SizedBox(height: 40),
                Center(
                  child: AkiliButton(
                    text: 'Continue',
                    onPressed: () async {
                      // Basic validation
                      if (passwordController.text !=
                          confirmPasswordController.text) {
                        // Show error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Passwords do not match'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else if (passwordController.text.length < 6 ||
                          !passwordController.text.contains(RegExp(r'[A-Z]')) ||
                          !passwordController.text.contains(RegExp(r'[a-z]')) ||
                          !passwordController.text.contains(RegExp(r'[0-9]'))) {
                        // Show error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Password must contain at least 6 characters, including upper + lowercase and numbers.',
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        // Proceed with signup

                        var password = _formKey.currentState!.value['password'];
                        var emailAddress =
                            _formKey.currentState!.value['email'];

                        var user = ParseUser(
                          emailAddress,
                          password,
                          emailAddress,
                        );
                        var response = await user.create();

                        if (response.success) {
                          Get.offAll(() => Login());
                          Get.snackbar(
                            "Success",
                            "Account created successfully",
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        } else {
                          Get.snackbar(
                            "Error",
                            response.error!.message,
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        }
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'By creating an account, you agree to our\n',
                          style: TextStyle(color: Colors.black54, fontSize: 12),
                        ),
                        TextSpan(
                          text: 'Conditions of Use',
                          style: TextStyle(
                            color: Color(0xFFFF5E00),
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: ' nad ',
                          style: TextStyle(color: Colors.black54, fontSize: 12),
                        ),
                        TextSpan(
                          text: 'Privacy Notice',
                          style: TextStyle(
                            color: Color(0xFFFF5E00),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

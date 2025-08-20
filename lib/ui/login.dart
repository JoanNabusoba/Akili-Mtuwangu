import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:myapp/ui/dashboard.dart';
import 'package:myapp/ui/signup.dart';
import 'package:myapp/ui/widgets/akili_btn.dart';
import 'package:myapp/ui/widgets/akili_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body
      body: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(253, 232, 209, 1)),
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            //Image
            Container(
              width: Get.width * 0.6,
              height: Get.height * .35,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('img/banner2.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            //Column for form
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 248, 238, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                width: Get.width,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: SingleChildScrollView(
                  child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      children: [
                        //Title
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Sign In",
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(height: 20),
                        AkiliTextfield(
                          name: "Email",
                          hintText: "Enter email",
                          prefixIcon: Icons.person,
                          labelText: "Email",
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 10),
                        AkiliTextfield(
                          name: "Password",
                          hintText: "Enter password",
                          prefixIcon: Icons.lock,
                          labelText: "Password",
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        //Forgot Password
                        Container(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password?",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color.fromRGBO(253, 94, 0, 1),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        //Akili button
                        AkiliButton(
                          text: "Login",
                          onPressed: () {
                            Get.to(() => Dashboard());
                          },
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color.fromRGBO(253, 94, 0, 1),
                              width: 1,
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Get.to(() => Signup());
                            },
                            child: Text(
                              "Create Account",
                              style: TextStyle(
                                color: Color.fromRGBO(253, 94, 0, 1),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

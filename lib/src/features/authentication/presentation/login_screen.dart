import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medbridge/src/common_widgets/app_logo.dart';
import 'package:medbridge/src/common_widgets/custom_snackbar.dart';
import 'package:medbridge/src/common_widgets/main_button.dart';
import 'package:medbridge/src/common_widgets/text_field_custom.dart';
import 'package:medbridge/src/features/authentication/presentation/sign_up_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  bool buttonActive = true;

  //  global key for the form on this screen
  final _formKey = GlobalKey<FormState>();

  bool buttonIsDisabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: MainButton(
            disabled: buttonActive ? false : true,
            //disabled: buttonIsDisabled,
            text: "Log in",
            onpressed: () async {
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.

                setState(() {
                  buttonActive = false;
                });
                // String response = await value.register(
                //     emailController.text,
                //     passwordController.text,
                //     userNameController.text,
                //     phoneNumberController.text);
                // if (response == "success") {
                //   // Navigator.push(
                //   //     context,
                //   //     MaterialPageRoute(
                //   //         builder: (context) => const LoginScreen()));
                // } else {
                //   CustomSnackBar.show(context, response, true);
                //   setState(() {
                //     buttonActive = true;
                //   });
                // }
              }
            }),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              AppLogo(),
              // const SizedBox(
              //   height: 20,
              // ),
              const Text(
                "Login to your account",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 7,
              ),
              const Text(
                "Welcome Back!",
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              const SizedBox(
                height: 40,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFieldCustom(
                      controller: emailController,
                      label: "Email",
                      keyBoardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldCustom(
                      obscureText: true,
                      controller: passwordController,
                      label: "Password",
                      keyBoardType: TextInputType.visiblePassword,
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    "Dont have an account?",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF082163),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 25,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.black.withOpacity(0.8),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Input(
                        hint: 'Name',
                        icon: Icon(Icons.person),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Input(
                        hint: 'Phone Number',
                        icon: Icon(Icons.phone),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Input(
                        hint: 'Email',
                        icon: Icon(Icons.email),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Input(
                        hint: 'Password',
                        icon: const Icon(Icons.key),
                        hideText: !showPassword,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Input(
                        hint: 'Confirm Password',
                        icon: const Icon(Icons.key),
                        hideText: !showPassword,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: showPassword,
                            onChanged: (value) {
                              setState(() {
                                showPassword = value!;
                              });
                            },
                          ),
                          const Text('Show Password'),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Button(
                        label: 'Register',
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.blue.shade700,
                            Colors.blue.shade300,
                          ],
                        ),
                        labelColor: Colors.white,
                        icon: const Icon(
                          Icons.person_add,
                          color: Colors.white,
                          size: 25,
                        ),
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            //TODO: Register function here
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an accout?',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Login'),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

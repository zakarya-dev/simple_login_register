import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fpl/screens/register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                          'Login',
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
                        hint: 'Email',
                        icon: Icon(Icons.email),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Input(
                        hint: 'Password',
                        icon: Icon(Icons.key),
                        hideText: true,
                      ),
                      TextButton(
                        onPressed: () {
                          // TODO: forgot password function here
                        },
                        child: const Text('Forgot Password?'),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Button(
                        label: 'Login',
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
                          Icons.lock_open,
                          color: Colors.white,
                          size: 25,
                        ),
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            debugPrint('here');
                            //TODO: login function here
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
                    'Don`t have an accout?',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const Register(),
                        ),
                      );
                    },
                    child: const Text('Register Now!'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.label,
    required this.onTap,
    this.backColor,
    this.borderRadius,
    this.gradient,
    this.icon,
    this.labelColor,
    this.width,
  }) : super(key: key);

  final VoidCallback onTap;
  final String label;
  final Widget? icon;
  final Color? backColor, labelColor;
  final Gradient? gradient;
  final double? width;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 30,
        ),
        decoration: BoxDecoration(
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(10)),
          color: backColor ?? Colors.white,
          gradient: gradient,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 20,
                color: labelColor ?? Colors.black,
              ),
            ),
            SizedBox(
              width: icon == null ? 0 : 5,
            ),
            icon ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class Input extends StatelessWidget {
  const Input({
    Key? key,
    this.hint,
    this.errorMessage = 'required',
    this.controller,
    this.focusNode,
    this.hintTextStyle,
    this.icon,
    this.inputTextStyle,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.textDirection,
    this.nullable = false,
    this.hideText = false,
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  final String? hint;
  final String errorMessage;
  final void Function(String?)? onChanged, onSubmitted;
  final VoidCallback? onTap;
  final Widget? icon;
  final bool nullable, hideText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextStyle? inputTextStyle, hintTextStyle;
  final TextAlign textAlign;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      validator: nullable
          ? null
          : (input) {
              if (input == null || input.isEmpty) {
                return errorMessage;
              }
              return null;
            },
      onTap: onTap,
      controller: controller,
      focusNode: focusNode,
      obscureText: hideText,
      keyboardType: keyboardType,
      style: inputTextStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: hintTextStyle,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 10,
        ),
        prefixIcon: icon,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.black,
            width: 0.5,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.black,
            width: 0.5,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.red,
            width: 0.5,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
      ),
    );
  }
}

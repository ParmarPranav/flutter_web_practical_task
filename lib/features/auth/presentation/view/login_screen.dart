import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../responsive_layout.dart';
import '../controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static final AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ResponsiveLayout(
        mobile: MobileView(
          emailController: controller.emailController,
          passwordController: controller.passwordController,
          emailError: controller.emailError.value,
          passwordError: controller.passwordError.value,
          onLogin: controller.validateAndLogin,
          obscurePassword: controller.obscurePassword.value,
          togglePasswordVisibility: controller.togglePasswordVisibility,
        ),
        tablet: TabletView(
          emailController: controller.emailController,
          passwordController: controller.passwordController,
          emailError: controller.emailError.value,
          passwordError: controller.passwordError.value,
          onLogin: controller.validateAndLogin,
          obscurePassword: controller.obscurePassword.value,
          togglePasswordVisibility: controller.togglePasswordVisibility,
        ),
        desktop: DesktopView(
          emailController: controller.emailController,
          passwordController: controller.passwordController,
          emailError: controller.emailError.value,
          passwordError: controller.passwordError.value,
          onLogin: controller.validateAndLogin,
          obscurePassword: controller.obscurePassword.value,
          togglePasswordVisibility: controller.togglePasswordVisibility,
        ),
      ),
    );
  }
}

class DesktopView extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String? emailError;
  final String? passwordError;
  final VoidCallback onLogin;
  final bool obscurePassword;
  final VoidCallback togglePasswordVisibility;

  const DesktopView({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.emailError,
    required this.passwordError,
    required this.onLogin,
    required this.obscurePassword,
    required this.togglePasswordVisibility,
  });

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      backgroundColor: isLightTheme ? Colors.white : Colors.blueGrey[900],
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.blue.shade900,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello folks! 👋',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'We\'re thrilled to have you here! 😃',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Let’s make today a little more magical! ✨',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: _loginForm(
              emailController,
              passwordController,
              emailError,
              passwordError,
              onLogin,
              obscurePassword: obscurePassword,
              togglePasswordVisibility: togglePasswordVisibility,
              context: context,
            ),
          ),
        ],
      ),
    );
  }
}

class TabletView extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String? emailError;
  final String? passwordError;
  final VoidCallback onLogin;
  final bool obscurePassword;
  final VoidCallback togglePasswordVisibility;

  const TabletView({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.emailError,
    required this.passwordError,
    required this.onLogin,
    required this.obscurePassword,
    required this.togglePasswordVisibility,
  });

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      backgroundColor: isLightTheme ? Colors.white : Colors.blueGrey[900],

      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blue.shade900,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Hello folks! 👋',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'We\'re thrilled to have you here! 😃',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Let’s make today a little more magical! ✨',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: _loginForm(
              emailController,
              passwordController,
              emailError,
              passwordError,
              onLogin,
              obscurePassword: obscurePassword,
              togglePasswordVisibility: togglePasswordVisibility,
              context: context,
            ),
          ),
        ],
      ),
    );
  }
}

class MobileView extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String? emailError;
  final String? passwordError;
  final VoidCallback onLogin;
  final bool obscurePassword;
  final VoidCallback togglePasswordVisibility;

  const MobileView({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.emailError,
    required this.passwordError,
    required this.onLogin,
    required this.obscurePassword,
    required this.togglePasswordVisibility,
  });

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      backgroundColor: isLightTheme ? Colors.white : Colors.blueGrey[900],

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          _loginForm(
            emailController,
            passwordController,
            emailError,
            passwordError,
            onLogin,
            obscurePassword: obscurePassword,
            togglePasswordVisibility: togglePasswordVisibility,
            context: context,
          ),
        ],
      ),
    );
  }
}

Widget _loginForm(
  TextEditingController emailController,
  TextEditingController passwordController,
  String? emailError,
  String? passwordError,
  VoidCallback onLogin, {
  required bool obscurePassword,
  required VoidCallback togglePasswordVisibility,
  required BuildContext context,
}) {

  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Welcome Back!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 25),

        CupertinoTextField(
          controller: emailController,
          placeholder: 'Email',
          keyboardType: TextInputType.emailAddress,
          prefix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: const Icon(
              CupertinoIcons.mail,
              color: CupertinoColors.systemGrey,
            ),
          ),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: emailError == '' ? Colors.grey : Colors.red,
            ),
          ),
        ),
        if (emailError != null)
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                emailError,
                style: const TextStyle(color: Colors.red, fontSize: 14),
              ),
            ),
          ),

        const SizedBox(height: 10),


        CupertinoTextField(
          controller: passwordController,
          placeholder: 'Password',
          obscureText: obscurePassword,

          prefix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: const Icon(
              CupertinoIcons.lock,
              color: CupertinoColors.systemGrey,
            ),
          ),
          suffix: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: togglePasswordVisibility,

            child: Icon(
              obscurePassword ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
              color: CupertinoColors.systemGrey,
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: passwordError == '' ? Colors.grey : Colors.red,
            ),
          ),
        ),
        if (passwordError != null)
          Align(
            alignment: Alignment.topLeft,

            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                passwordError,
                style: const TextStyle(color: Colors.red, fontSize: 14),
              ),
            ),
          ),

        const SizedBox(height: 20),

        SizedBox(
          width: MediaQuery.of(Get.context!).size.width * 0.35,
          child: ElevatedButton(
            onPressed: onLogin,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade900,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 7 ),
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white,fontSize: 18),
              ),
            ),
          ),
        )
      ],
    ),
  );
}

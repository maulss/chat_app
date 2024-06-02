import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/widgets/button_widget.dart';
import 'package:chat_app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, this.onTap});
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void login(BuildContext context) async {
    final authService = AuthService();
    try {
      await authService.signInWithEmailAndPassword(
        emailController.text,
        passController.text,
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "Welcome back, buddy !",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFieldWidget(
              controller: emailController,
              hintText: "Email",
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldWidget(
              controller: passController,
              hintText: "Password",
              obscureText: true,
            ),
            const SizedBox(
              height: 25,
            ),
            ButtonWidget(
              text: "Login",
              onTap: () => login(context),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Dont have account? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

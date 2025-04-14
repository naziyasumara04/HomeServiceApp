import 'package:flutter/material.dart';
import 'package:homeapp/data/local/shared_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constants/app_images.dart';
import '../../../data/local/shared_prefs.dart';
import '../../../routes/route_generator.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;

//saved login data through shared_preference
  Future<void> saveLoginData() async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    await setKeyFromPrefs(
        SharedPreferencesKeys.signInEmail, emailController.text);
    await setKeyFromPrefs(
        SharedPreferencesKeys.signInPassword, passwordController.text);
      // final savedEmail=await getKeyFromPrefs(SharedPreferencesKeys.signInEmail);
    // final savedPassword=await getKeyFromPrefs(SharedPreferencesKeys.signInPassword);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AppImages.appLogo,
          height: 24,
          width: 28,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Enter your email and password to login",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            buildEmailField(),
            const SizedBox(height: 15),
            buildPasswordField(),
            buildForgotPasswordText(),
            const SizedBox(height: 20),
            buildSignInButton(),
            const SizedBox(height: 15),
            buildSignupText(),
            buildOrDivider(),
            socialButton(),
          ],
        ),
      ),
    );
  }

//email field
  Widget buildEmailField() {
    return TextField(
      controller: emailController,
      decoration: const InputDecoration(
        labelText: "Enter your email",
        prefixIcon: Icon(Icons.email_outlined),
        border: OutlineInputBorder(),
      ),
    );
  }

//password field
  Widget buildPasswordField() {
    return TextField(
      controller: passwordController,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: "Enter your password",
        prefixIcon: const Icon(Icons.lock_outline),
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
    );
  }

  //text
   Widget buildForgotPasswordText() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/forgotPassword');
        },
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.blueAccent, fontSize: 14),
        ),
      ),
    );
  }

  //signIn button
  Widget buildSignInButton(){
    return  CustomButton(
      btnText: "Sign In",
      onTap: () async {
        if (emailController.text.isNotEmpty &&
            passwordController.text.isNotEmpty) {
          // Save data
          await saveLoginData();

          // Optionally validate saved data
          final prefs = await SharedPreferences.getInstance();
          final savedEmail = prefs.getString(SharedPreferencesKeys.signInEmail);
          final savedPassword = prefs.getString(SharedPreferencesKeys.signInPassword);

          if (savedEmail != null && savedPassword != null) {
            // Navigator.pushNamed(context, AppRoutes.accountSetup);
            Navigator.pushNamed(context, AppRoutes.otp);
          } else {
            Navigator.pushNamed(context, AppRoutes.otp);
          }
        } else {
          Navigator.pushNamed(context, AppRoutes.otp);
        }
      },

    );
  }

  //signup text
  Widget buildSignupText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("New to FixIt? "),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/signup');
          },
          child: const Text(
            "Sign up now",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  //Divider
  Widget buildOrDivider() {
    return Row(
      children: const [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text("Or"),
        ),
        Expanded(child: Divider()),
      ],
    );
  }

  //Social Buttons
  Widget socialButton() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomSocialButton(
            text: 'Google',
            imageUrl: AppImages.googleImg,
          ),
          CustomSocialButton(
            text: 'Facebook',
            imageUrl: AppImages.facebookImg,
          )
        ],
      ),
    );
  }


}

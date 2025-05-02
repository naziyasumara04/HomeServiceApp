import 'package:flutter/material.dart';
import 'package:homeapp/data/local/shared_keys.dart';
import 'package:homeapp/screens/auth/forget_password/forget_password_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/helpers/validators.dart';
import '../../../data/local/shared_prefs.dart';
import '../../../routes/route_generator.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_social_button.dart';
import '../../../widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  Future<void> saveLoginData() async {
    // await prefs.setString(SharedPreferencesKeys.signInEmail, emailController.text);
    await setKeyFromPrefs(
        SharedPreferencesKeys.signInEmail, emailController.text);
    await setKeyFromPrefs(
        SharedPreferencesKeys.signInPassword, passwordController.text);
  }

  void _signIn() async {
    if (_formKey.currentState!.validate()) {
      // Save login data
      await saveLoginData();
      final prefs = await SharedPreferences.getInstance();
      final savedEmail = prefs.getString(SharedPreferencesKeys.signInEmail);
      final savedPassword =
          prefs.getString(SharedPreferencesKeys.signInPassword);

      if (savedEmail != null && savedPassword != null) {
        Navigator.pushReplacementNamed(context, AppRoutes.otp);
      } else {
        Navigator.pushNamed(context, AppRoutes.signIn);
      }
    } else {
      // Optional: show error SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fix the errors in red')),
      );
    }
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                "Enter your email and password to login",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              _buildEmailField(),
              const SizedBox(height: 15),
              _buildPasswordField(),
              buildForgotPasswordText(),
              const SizedBox(height: 20),
              _signInButton(),
              const SizedBox(height: 15),
              buildSignupText(),
              buildOrDivider(),
              socialButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return CustomTextField(
      validator: validateEmail,
      controller: emailController,
      hintText: "Enter your email",
      prefixIcon: Icon(Icons.email_outlined),
    );
  }

  Widget _buildPasswordField() {
    return CustomTextField(
        validator: validatePassword,
        controller: passwordController,
        obscureText: _obscureText,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
          ),
        ),
        hintText: "Enter your password",
        prefixIcon: const Icon(Icons.lock_outline));
  }

  Widget buildForgotPasswordText() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => ForgetPasswordScreen()));
          Navigator.pushNamed(context, '/forgetPassword');
        },
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.blueAccent, fontSize: 14),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return CustomButton(btnText: "Sign In", onTap: _signIn);
  }

  Widget buildSignupText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("New to FixIt?"),
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

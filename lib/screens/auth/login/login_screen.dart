// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:homeapp/routes/route_generator.dart';
// import '../../../core/constants/app_colors.dart';
// import '../../../core/constants/app_images.dart';
// import '../../../widgets/custom_button.dart';
// import '../../../widgets/custom_social_button.dart';
// import '../../../widgets/custom_textfield.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   bool _obscureText = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: AppBar(
//           title: Image.asset(
//             AppImages.appLogo,
//             height: 24,
//             width: 28,
//           ),
//         ),
//         body: buildBody());
//   }
//
//   Widget buildBody() {
//     return Column(
//       children: [
//         SizedBox(
//           height: 10.h,
//         ),
//         signinText(),
//         SizedBox(
//           height: 15.h,
//         ),
//         email(),
//         SizedBox(
//           height: 10.h,
//         ),
//         password(),
//         forgetpasswordText(),
//         SizedBox(
//           height: 20.h,
//         ),
//         CustomButton(
//           btnText: "Sign In",
//           onTap: () {
//             Navigator.pushNamed(context, AppRoutes.otp);
//           },
//         ),
//         SizedBox(
//           height: 5.h,
//         ),
//         signupText(),
//         orCont(),
//         loginText(),
//         socialButton(),
//       ],
//     );
//   }
//
//   Widget signinText() {
//     return Padding(
//       padding: const EdgeInsets.all(14.0),
//       child: Center(
//         child: Text(
//           "Enter your email and password to login",
//           style: TextStyle(
//             fontSize: 18.sp,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget email() {
//     return CustomTextField(
//       hintText: 'Enter your email',
//       prefixIcon: Icon(Icons.email_outlined),
//       controller: emailController,
//     );
//   }
//
//   Widget password() {
//     return CustomTextField(
//       hintText: "Enter your password",
//       prefixIcon: Icon(Icons.lock_outline),
//       controller: passwordController,
//       obscureText: _obscureText,
//       suffixIcon: IconButton(
//         icon: Icon(
//           _obscureText
//               ? Icons.visibility_off
//               : Icons.visibility, // Change icon based on state
//         ),
//         onPressed: () {
//           setState(() {
//             _obscureText = !_obscureText;
//           });
//         },
//       ),
//     );
//   }
//
//   Widget forgetpasswordText() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           InkWell(
//             onTap: () {
//               Navigator.pushNamed(context, AppRoutes.forgetPassword);
//             },
//             child: Text(
//               "Forget Password?",
//               style: TextStyle(color: AppColors.darkGreyColor, fontSize: 14),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget signupText() {
//     return Padding(
//       padding: const EdgeInsets.all(14.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             "New to fixIt? ",
//             style: TextStyle(
//               fontSize: 16.sp,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           InkWell(
//               onTap: () {
//                 Navigator.pushNamed(context, AppRoutes.signup);
//               },
//               child: Text(
//                 "Sign up now",
//                 style: TextStyle(
//                   color: AppColors.lightBlueColor,
//                   fontSize: 16.sp,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
//
//   Widget orCont() {
//     return Padding(
//       padding: const EdgeInsets.all(14.0),
//       child: Row(
//         children: [
//           Expanded(child: Divider(thickness: 0.7, height: 10)),
//           SizedBox(
//             width: 10.w,
//           ),
//           Text("Or"),
//           SizedBox(
//             width: 10.w,
//           ),
//           Expanded(child: Divider())
//         ],
//       ),
//     );
//   }
//
//   Widget loginText() {
//     return Padding(
//       padding: const EdgeInsets.all(14.0),
//       child: Text("Log in with"),
//     );
//   }
//
//   Widget socialButton() {
//     return Padding(
//       padding: const EdgeInsets.all(14.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           CustomSocialButton(
//             text: 'Google',
//             imageUrl: AppImages.googleImg,
//           ),
//           CustomSocialButton(
//             text: 'Facebook',
//             imageUrl: AppImages.facebookImg,
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_images.dart';
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
            CustomButton(
              btnText: "Sign In",
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.otp);
              },
            ),
            const SizedBox(height: 15),
            buildSignupText(),
            buildOrDivider(),
            socialButton(),
          ],
        ),
      ),
    );
  }

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

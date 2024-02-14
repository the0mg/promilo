import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:http/http.dart' as http;
import 'package:promilo/const/app_btn.dart';
import 'package:promilo/const/app_text.dart';
import 'package:promilo/const/color_const.dart';
import 'package:promilo/const/img_const.dart';
import 'package:promilo/const/txt_field.dart';
import 'package:promilo/dashboard/dashboard_screen.dart';
import 'package:promilo/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController mailCtr = TextEditingController();
  TextEditingController pwdCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double unitHeightValue = size.width * 0.0022;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'promillo',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 16
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40,),
            AppText(
              text: 'Hi, Welcome back!',
              fontSize: 21,
              txtWeight: FontWeight.w700,
            ),
            const SizedBox(height: 40,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: 'Please Sign in to continue',
                  fontSize: 19,
                ),
                const SizedBox(height: 10,),
                TxtField(
                  ctr: mailCtr,
                  txtInputType: TextInputType.emailAddress,
                  hintTxt: 'Enter Email or Mob No.',
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppText(
                      text: 'Sign in with OTP',
                      textColor: ColorConst.secondaryColor,
                      txtWeight: FontWeight.w600,
                      fontSize: 17,
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
                const SizedBox(height: 15,),
                AppText(
                  text: 'Password',
                  fontSize: 19,
                ),
                const SizedBox(height: 10,),
                TxtField(
                  ctr: pwdCtr,
                  txtInputType: TextInputType.visiblePassword,
                  hintTxt: 'Enter password',
                ),
                const SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.check_box_outline_blank_outlined,
                          color: ColorConst.secondaryColor.withOpacity(0.2),
                        ),
                        const SizedBox(width: 5,),
                        AppText(
                          text: 'Remember me',
                          textColor: Colors.grey,
                          fontSize: 15,
                        ),
                      ],
                    ),
                    AppText(
                      text: 'Forget Password',
                      textColor: ColorConst.secondaryColor,
                      fontSize: 17,
                      txtWeight: FontWeight.w600,
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
                const SizedBox(height: 25,),
                AppBtn(
                  text: 'Submit',
                  width: size.width,
                  fontSize: 17,
                  txtWeight: FontWeight.w600,
                  bgColor: ColorConst.btnColor,
                  borderColor: ColorConst.secondaryColor,
                  onPress: () => loginUser(),
                ),
                const SizedBox(height: 25,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 0.8,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 7,),
                    AppText(
                      text: 'or',
                      textColor: Colors.black,
                      fontSize: 15,
                    ),
                    const SizedBox(width: 7,),
                    Expanded(
                      child: Container(
                        height: 0.8,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25,),
                staticWid(),
              ],
            ),
          ],
        ),
      ).marginSymmetric(horizontal: 15, vertical: 15),
    );
  }

  Widget staticWid(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImgConst.gglLogo, width: 25, height: 25, fit: BoxFit.fill,),
            const SizedBox(width: 5,),
            Image.asset(ImgConst.linkdinLogo, width: 40, height: 40, fit: BoxFit.fill,),
            const SizedBox(width: 5,),
            Image.asset(ImgConst.fbLogo, width: 25, height: 25, fit: BoxFit.fill,),
            const SizedBox(width: 5,),
            Image.asset(ImgConst.instaLogo, width: 35, height: 35, fit: BoxFit.fill,),
            const SizedBox(width: 0,),
            Image.asset(ImgConst.wpLogo, width: 40, height: 40, fit: BoxFit.fill,),
          ],
        ),
        const SizedBox(height: 22,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              text: 'Business User?',
              textColor: Colors.grey,
              fontSize: 17,
              txtWeight: FontWeight.w600,
              textAlign: TextAlign.end,
            ),
            AppText(
              text: 'Don\'t have an account',
              textColor: Colors.grey,
              fontSize: 17,
              txtWeight: FontWeight.w600,
              textAlign: TextAlign.end,
            ),
          ],
        ),
        const SizedBox(height: 6,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              text: 'Login Here',
              textColor: ColorConst.secondaryColor,
              fontSize: 17,
              txtWeight: FontWeight.w600,
              textAlign: TextAlign.end,
            ),
            AppText(
              text: 'Sign Up',
              textColor: ColorConst.secondaryColor,
              fontSize: 17,
              txtWeight: FontWeight.w600,
              textAlign: TextAlign.end,
            ),
          ],
        ),
        const SizedBox(height: 60,),
        AppText(
          text: 'By continuing, you agree to',
          textColor: Colors.grey,
          fontSize: 16,
          txtWeight: FontWeight.w600,
          textAlign: TextAlign.end,
        ),
        const SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: 'Promilo\'s',
              textColor: Colors.grey,
              fontSize: 16,
              txtWeight: FontWeight.w600,
              textAlign: TextAlign.end,
            ),
            AppText(
              text: ' Terms of Use & Privacy Policy',
              textColor: Colors.black,
              fontSize: 16,
              txtWeight: FontWeight.w600,
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ],
    );
  }

  bool isValidEmail(String mail) {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(mail);
  }

  bool isValid(){
    if(mailCtr.text.trim()==''){
      showMsg('Please enter email');
      return false;
    }else if(isValidEmail(mailCtr.text.trim())==false){
      showMsg('Please enter valid email');
      return false;
    }else if(pwdCtr.text.trim()==''){
      showMsg('Please enter password');
      return false;
    }
    return true;
  }

  showMsg(String msg){
    var snackBar = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> loginUser() async {

    const String url = 'https://apiv2stg.promilo.com/user/oauth/token';
    // final String username = 'test45@yopmail.com';
    // final String password = 'Test@123'; // SHA256 hash of the password
    final String username = mailCtr.text;
    final String password = pwdCtr.text; // SHA256 hash of the password

    // Convert the password to SHA256 hash
    final String hashedPassword = _sha256(password);

    // Create the FormData
    final formData = http.MultipartRequest('POST', Uri.parse(url));
    formData.fields.addAll({
      'username': username,
      'password': hashedPassword,
      'grant_type': 'password',
    });

    // Set the authorization header
    formData.headers.addAll({
      'Authorization': 'Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg==',
    });

    try {
      final response = await http.Response.fromStream(await formData.send());
      if (response.statusCode == 200) {
        // Handle successful login
        print('Login successful');
        print('Response body: ${response.body}');
        Get.offAll(()=> DashboardAppScreen());
        // Get.to(()=> HomeScreen());
      } else {
        // Handle error
        print('Error: ${response.statusCode}');
        print('Error body: ${response.body}');
        showMsg('Something went wrong');
      }
    } catch (e) {
      // Handle network error
      print('Error: $e');
    }
  }

// Function to compute SHA256 hash
  String _sha256(String input) {
    final bytes = utf8.encode(input); // Convert input to bytes
    final digest = sha256.convert(bytes); // Compute SHA256 hash
    return digest.toString();
  }

}

import 'package:flutter/material.dart';
import 'package:ppkdjp_flutter/helper/preference.dart';
import 'package:ppkdjp_flutter/meet_sepuluh/thank_you_page.dart';

class TugasSepuluhFlutter extends StatefulWidget {
  const TugasSepuluhFlutter({super.key});
  // static const String id = "/tugas_sepuluh_flutter";

  @override
  State<TugasSepuluhFlutter> createState() => _TugasSepuluhFlutterState();
}

class _TugasSepuluhFlutterState extends State<TugasSepuluhFlutter> {
  // final bool _obscureText = true; // Controls whether the password is hidden
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _domicileController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: SizedBox(
            width: 183,
            height: 28,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back_ios, size: 18),
                SizedBox(width: 24),
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Gilroy',
                    color: Color(0xff262626),
                  ),
                ),
              ],
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: _formKey,
        child: DefaultTextStyle(
          style: TextStyle(fontFamily: 'Gilroy'),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  'Welcome!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff262626),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Create your account to sign in',
                  style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                ),
                SizedBox(height: 30),
                _textLabel('Full Name'),
                SizedBox(height: 10),
                TextFormField(
                  controller: _nameController,
                  decoration: _inputDecoration('Jane Doe'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                _textLabel('Email Address'),
                SizedBox(height: 10),
                TextFormField(
                  controller: _emailController,
                  decoration: _inputDecoration('janedoe@mail.com'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!value.contains('@')) {
                      return 'Email must contain "@"';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                _textLabel('Phone Number'),
                SizedBox(height: 10),
                TextFormField(
                  controller: _phoneController,
                  decoration: _inputDecoration('08123456789'),
                ),
                SizedBox(height: 20),
                _textLabel('Domicile'),
                SizedBox(height: 10),
                TextFormField(
                  controller: _domicileController,
                  decoration: _inputDecoration('Jakarta'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your domicile';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      dialogSuccess(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 37, 33, 243),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                    minimumSize: Size(double.infinity, 48),
                    elevation: 5,
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Sign In',
                      style: TextStyle(color: Colors.orange, fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: Colors.grey[400], thickness: 0.5),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Or Sign Up With',
                        style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                      ),
                    ),
                    Expanded(
                      child: Divider(color: Colors.grey[400], thickness: 0.5),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xfffafafa),
                          foregroundColor: Color(0xff262626),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 20,
                          ),
                        ),
                        icon: Image.asset(
                          'assets/icons/google.png',
                          width: 20,
                          height: 20,
                        ),
                        label: Text('Google', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xfffafafa),
                          foregroundColor: Color(0xff262626),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 20,
                          ),
                        ),
                        icon: Image.asset(
                          'assets/icons/facebook.png',
                          width: 20,
                          height: 20,
                        ),
                        label: Text('Facebook', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text _textLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  InputDecoration _inputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey[400]),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide(color: Colors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide(color: Colors.blue, width: 1),
      ),
      // Add these to keep border same on error
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide(color: Colors.red), // same as enabledBorder
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide(
          color: Colors.red,
          width: 1.5,
        ), // same as focusedBorder
      ),
      // Optionally, hide the error text or style it to be invisible:
      // errorStyle: TextStyle(
      //   height: 0,
      //   fontSize: 0,
      // ), // hides the error message visually
    );
  }

  Future<dynamic> dialogSuccess(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              Icon(
                Icons.check_circle,
                color: Color.fromARGB(255, 37, 33, 243),
                size: 28,
              ),
              SizedBox(width: 8),
              Text(
                "Success",
                style: TextStyle(
                  color: Color.fromARGB(255, 37, 33, 243),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _infoText("Your Name", _nameController.text),
              _infoText("Your Email", _emailController.text),
              _infoText("Your Phone Number", _phoneController.text),
              _infoText("Your Domicile", _domicileController.text),
            ],
          ),
          actionsPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey.shade700,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: Colors.grey.shade200,
              ),
              child: Text("Close", style: TextStyle(fontSize: 16)),
            ),
            ElevatedButton(
              onPressed: () {
                PreferenceHandler.saveLogin(true);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => ThankYouPage(
                          name: _nameController.text,
                          domicile: _domicileController.text,
                        ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 37, 33, 243),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 5,
              ),
              child: Text(
                "Continue",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _infoText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          text: '$label: ',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade800,
            fontSize: 16,
          ),
          children: [
            TextSpan(
              text: value,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

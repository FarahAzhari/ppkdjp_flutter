import 'package:flutter/material.dart';
import 'package:ppkdjp_flutter/meet_16/database/db_helper.dart';
import 'package:ppkdjp_flutter/meet_16/model/user_model.dart';

class RegisterScreenApp extends StatefulWidget {
  const RegisterScreenApp({super.key});
  static const String id = "/register_screen_app";

  @override
  State<RegisterScreenApp> createState() => _RegisterScreenAppState();
}

class _RegisterScreenAppState extends State<RegisterScreenApp> {
  bool _obscureText = true; // Controls whether the password is hidden
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
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
                _textLabel('Email Address'),
                SizedBox(height: 10),
                TextFormField(
                  controller: _emailController,
                  decoration: _inputDecoration('Enter your email'),
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
                _textLabel('Full Name'),
                SizedBox(height: 10),
                TextFormField(
                  controller: _nameController,
                  decoration: _inputDecoration('Enter your name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                _textLabel('Username'),
                SizedBox(height: 10),
                TextFormField(
                  controller: _usernameController,
                  decoration: _inputDecoration('Enter your username'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                _textLabel('Phone Number'),
                SizedBox(height: 10),
                TextFormField(
                  controller: _phoneController,
                  decoration: _inputDecoration('Enter your phone number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your phone number";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                _textLabel('Password'),
                SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                  obscureText: _obscureText, // Hide or show password text
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(color: Colors.grey[300]),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide(color: Colors.blue, width: 1),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ), // same as enabledBorder
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 1.5,
                      ), // same as focusedBorder
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText
                            ? Icons.visibility_off
                            : Icons.visibility, // Toggle between eye icons
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText =
                              !_obscureText; // Toggle the password visibility
                        });
                      },
                    ),
                  ),
                ),

                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    //   dialogSuccess(context);
                    // }
                    if (_formKey.currentState!.validate()) {
                      print('Email: ${_emailController.text}');
                      print('Name: ${_nameController.text}');
                      print('Username: ${_usernameController.text}');
                      print('Phone: ${_phoneController.text}');
                      print('Password: ${_passwordController.text}');
                      DbHelper.registerUser(
                        data: UserModel(
                          name: _nameController.text,
                          username: _usernameController.text,
                          email: _emailController.text,
                          phone: _phoneController.text,
                          password: _passwordController.text,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Registration Successful!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.pop(context);
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
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.orange, fontSize: 14),
                      ),
                    ),
                  ],
                ),
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
        // fontWeight: FontWeight.bold,
      ),
    );
  }

  InputDecoration _inputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey[300]),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide(color: Colors.grey),
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

  // Future<dynamic> dialogSuccess(BuildContext context) {
  //   return showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         backgroundColor: Colors.white,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(20),
  //         ),
  //         title: Row(
  //           children: [
  //             Icon(
  //               Icons.check_circle,
  //               color: Color.fromARGB(255, 37, 33, 243),
  //               size: 28,
  //             ),
  //             SizedBox(width: 8),
  //             Text(
  //               "Success",
  //               style: TextStyle(
  //                 color: Color.fromARGB(255, 37, 33, 243),
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 22,
  //               ),
  //             ),
  //           ],
  //         ),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             _infoText("Your Name", _nameController.text),
  //             _infoText("Your Email", _emailController.text),
  //             _infoText("Your Phone Number", _phoneController.text),
  //             _infoText("Your Domicile", _domicileController.text),
  //           ],
  //         ),
  //         actionsPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.pop(context),
  //             style: TextButton.styleFrom(
  //               foregroundColor: Colors.grey.shade700,
  //               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(12),
  //               ),
  //               backgroundColor: Colors.grey.shade200,
  //             ),
  //             child: Text("Close", style: TextStyle(fontSize: 16)),
  //           ),
  //           ElevatedButton(
  //             onPressed: () {
  //               PreferenceHandler.saveLogin(true);
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                   builder:
  //                       (context) => ThankYouPage(
  //                         name: _nameController.text,
  //                         domicile: _domicileController.text,
  //                       ),
  //                 ),
  //               );
  //             },
  //             style: ElevatedButton.styleFrom(
  //               backgroundColor: Color.fromARGB(255, 37, 33, 243),
  //               padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(12),
  //               ),
  //               elevation: 5,
  //             ),
  //             child: Text(
  //               "Continue",
  //               style: TextStyle(fontSize: 16, color: Colors.white),
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // Widget _infoText(String label, String value) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 4.0),
  //     child: RichText(
  //       text: TextSpan(
  //         text: '$label: ',
  //         style: TextStyle(
  //           fontWeight: FontWeight.w600,
  //           color: Colors.grey.shade800,
  //           fontSize: 16,
  //         ),
  //         children: [
  //           TextSpan(
  //             text: value,
  //             style: TextStyle(
  //               fontWeight: FontWeight.normal,
  //               color: Colors.grey.shade600,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

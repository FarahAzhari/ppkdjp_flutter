import 'package:flutter/material.dart';

class TugasEnamFlutter extends StatefulWidget {
  const TugasEnamFlutter({super.key});

  @override
  State<TugasEnamFlutter> createState() => _TugasEnamFlutterState();
}

class _TugasEnamFlutterState extends State<TugasEnamFlutter> {
  bool _obscureText = true; // Controls whether the password is hidden
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60, // match approx top + height if you want exact height
        backgroundColor: Colors.white, // or whatever your bg is
        elevation: 0,
        titleSpacing:
            0, // remove default left padding on title to control it ourselves
        title: Padding(
          padding: const EdgeInsets.only(left: 24), // left padding as per figma
          child: SizedBox(
            width: 183,
            height: 28,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                ), // your leading icon, size ~28 fits well
                SizedBox(width: 24), // spacing between icon and text
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18, // adjust font size to fit 28 height nicely
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Gilroy',
                    color: Color(0xff262626),
                  ),
                ),
              ],
            ),
          ),
        ),
        automaticallyImplyLeading:
            false, // disable default leading to fully customize
      ),
      body: DefaultTextStyle(
        style: TextStyle(fontFamily: 'Gilroy'),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 70 - 28),
              Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff262626),
                ),
              ),
              SizedBox(height: 168 - 148),
              Text(
                'Sign In to your account',
                style: TextStyle(
                  fontSize: 14,
                  // fontWeight: FontWeight.w700,
                  color: Colors.grey[400],
                ),
              ),
              SizedBox(height: 50),
              Text(
                'Email Address',
                style: TextStyle(
                  fontSize: 14,
                  // fontWeight: FontWeight.bold,
                  color: Colors.grey[400],
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  // contentPadding: EdgeInsets.zero,
                  hintText: 'Farah Azhari',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(color: Colors.blue, width: 1),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Password',
                style: TextStyle(
                  fontSize: 14,
                  // fontWeight: FontWeight.bold,
                  color: Colors.grey[400],
                ),
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: _obscureText, // Hide or show password text
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(color: Colors.blue, width: 1),
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
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight, // Align to the right
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all<EdgeInsets>(
                      EdgeInsets.zero,
                    ), // Use WidgetStateProperty instead of MaterialStateProperty
                  ),
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.orange, // Blue color for the link
                      fontSize: 12,
                      fontWeight: FontWeight.bold, // Adjust text size as needed
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                    255,
                    37,
                    33,
                    243,
                  ), // Blue background color
                  foregroundColor: Colors.white, // White text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      24,
                    ), // Same radius as TextField
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 24,
                  ), // Adjust padding for size
                  minimumSize: Size(
                    double.infinity,
                    48,
                  ), // Make the button width fill the container
                  elevation: 5, // Adds elevation (shadow)
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 16, // Font size
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 14,
                      // fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.orange, // Blue color for the link
                      fontSize: 14,
                      // fontWeight: FontWeight.bold, // Adjust text size as needed
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey[400], // Set the line color
                      thickness: 0.5, // Line thickness
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ), // Space between the text and the divider
                    child: Text(
                      'Or Sign In With',
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
                        backgroundColor: Color(
                          0xfffafafa,
                        ), // Blue background for Google
                        foregroundColor: Color(0xff262626), // White text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            24,
                          ), // Rounded corners
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 20,
                        ), // Adjust padding
                      ),
                      icon: Image.asset(
                        'assets/icons/google.png', // Replace with your Google icon image path
                        width: 20, // Icon size
                        height: 20, // Icon size
                      ),
                      label: Text('Google', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(
                          0xfffafafa,
                        ), // Blue background for Google
                        foregroundColor: Color(0xff262626), // White text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            24,
                          ), // Rounded corners
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 20,
                        ), // Adjust padding
                      ),
                      icon: Image.asset(
                        'assets/icons/facebook.png', // Replace with your Google icon image path
                        width: 20, // Icon size
                        height: 20, // Icon size
                      ),
                      label: Text('Facebook', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 14,
                        // fontWeight: FontWeight.bold,
                        color: Colors.grey[400],
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Join Us',
                      style: TextStyle(
                        color: Colors.orange, // Blue color for the link
                        fontSize: 14,
                        // fontWeight: FontWeight.bold, // Adjust text size as needed
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

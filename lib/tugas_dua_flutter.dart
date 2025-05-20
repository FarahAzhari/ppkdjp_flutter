import 'package:flutter/material.dart';

class TugasDuaFlutter extends StatelessWidget {
  const TugasDuaFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffedeffb),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 35),
          child: Icon(Icons.arrow_back_ios, size: 18),
        ),
        title: Text('Profile Lengkap', style: TextStyle(fontSize: 18)),
        centerTitle: true,
        backgroundColor: Color(0xffedeffb),
        actions: [
          IconButton(
            icon: Padding(
              padding: const EdgeInsets.only(right: 35),
              child: Icon(Icons.more_vert),
            ), // Two-dot list is uncommon, this is typically three dots
            onPressed: () {
              // You can implement your action or open a menu here
              showMenu(
                context: context,
                position: RelativeRect.fromLTRB(1000, 80, 0, 0),
                items: [
                  PopupMenuItem(child: Text("Edit Profile")),
                  PopupMenuItem(child: Text("Sign-out")),
                ],
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(child: CircleAvatar(radius: 50)),
          SizedBox(height: 20),
          Center(
            child: Text(
              'Farah Azhari',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email, size: 18, color: Colors.blueAccent),
                  SizedBox(width: 8),
                  Text('farah@mail.com', style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.call, size: 18, color: Colors.green),
                // SizedBox(width: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Spacer(),
                ),
                Text('+628123456789', style: TextStyle(color: Colors.green)),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 380,
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xff71bdb8),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.feed, color: Colors.white),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Postingan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '50 Posts',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(width: 100), // Space between columns
                Icon(Icons.people, color: Colors.white),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Followers',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '200k',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 50,
            width: 380,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Center(child: Text('Posts')),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Center(child: Text('Likes')),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white, // Background color of the tweet
              borderRadius: BorderRadius.circular(16), // Rounded corners
            ),
            child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment
                      .start, // Align top of image with top of text
              children: [
                // Profile Photo
                CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                    'https://via.placeholder.com/150', // Replace with actual profile image URL
                  ),
                ),
                SizedBox(width: 12), // Space between image and text
                // Name and Tweet Column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Display Name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

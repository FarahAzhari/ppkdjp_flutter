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

        ///APPBAR
        title: Text('Profile Lengkap', style: TextStyle(fontSize: 18)),
        centerTitle: true,
        backgroundColor: Color(0xffedeffb),
        actions: [
          IconButton(
            icon: Padding(
              padding: const EdgeInsets.only(right: 35),
              child: Icon(Icons.more_vert),
            ),
            onPressed: () {
              // Implement your action or open a menu here
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
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                'assets/images/cat.png', // Replace with actual profile image URL
              ),
            ),
          ),
          SizedBox(height: 20),

          ///BARIS 1
          Center(
            child: Text(
              'Farah Azhari',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              ///BARIS 2
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

          ///BARIS 3
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Icon(Icons.call, size: 18, color: Colors.green),
                Padding(
                  padding: const EdgeInsets.only(right: 35),
                  child: Text(
                    '+628123456789',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
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

          /// BARIS 5
          SizedBox(
            height: 50,
            width: 380,
            child: Padding(
              padding: EdgeInsets.only(left: 35, right: 35),
              child: Text(
                'Professional napper, snack thief, and expert at ignoring you when you need me most.',
              ),
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

              ///BARIS 4
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 5),
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Center(
                        child: Text('Posts', style: TextStyle(fontSize: 18)),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 5),
                      height: 40,
                      decoration: BoxDecoration(
                        // color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Center(
                        child: Text('Likes', style: TextStyle(fontSize: 18)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),

          //Posts
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white, // Background color of the posts
            ),
            child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment
                      .start, // Align top of image with top of text
              children: [
                // Profile Photo
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(
                    'assets/images/cat2.png', // Replace with actual profile image URL
                  ),
                ),
                SizedBox(width: 12), // Space between image and text
                // Name and Posts Column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '#RepostedFrom Princess',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Well, I look beautiful indeed.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white, // Background color of the posts
            ),
            child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment
                      .start, // Align top of image with top of text
              children: [
                // Profile Photo
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(
                    'assets/images/dog1.png', // Replace with actual profile image URL
                  ),
                ),
                SizedBox(width: 12), // Space between image and text
                // Name and Posts Column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '#RepostedFrom Barkley McSnuggles',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Zoomies at 3 AM: because I'm a good boy. Also, I ate the couch. 🐾 But I'm still a good boy, right?",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white, // Background color of the posts
            ),
            child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment
                      .start, // Align top of image with top of text
              children: [
                // Profile Photo
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(
                    'assets/images/capybara1.png', // Replace with actual profile image URL
                  ),
                ),
                SizedBox(width: 12), // Space between image and text
                // Name and Posts Column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chillberto McSnore',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Just chillin' by the pond... someone throw me a snack or at least some good vibes.#ZEN",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white, // Background color of the posts
            ),
            child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment
                      .start, // Align top of image with top of text
              children: [
                // Profile Photo
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(
                    'assets/images/cat3.jpg', // Replace with actual profile image URL
                  ),
                ),
                SizedBox(width: 12), // Space between image and text
                // Name and Posts Column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '#RepostedFrom Sir Mc-Claw',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Slept on the keyboard again. Now there's a gggggggg in my search history. I’m basically a genius",
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

      ///BARIS 6
      bottomNavigationBar: Container(
        height: 50,
        color: Color(0xff71bdb8), // Background color of the navbar
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.home, color: Colors.white, size: 24), // Home icon
            Icon(Icons.search, color: Colors.white, size: 24), // Search icon
            Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 24,
            ), // Profile icon
          ],
        ),
      ),
    );
  }
}

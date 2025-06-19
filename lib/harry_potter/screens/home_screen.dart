import 'package:flutter/material.dart';
import 'package:ppkdjp_flutter/constant/app_image.dart';
import 'package:ppkdjp_flutter/harry_potter/screens/characters_screen.dart';
import 'package:ppkdjp_flutter/harry_potter/screens/house_selection_screen.dart';

class HomeScreen extends StatelessWidget {
  final HogwartsHouse selectedHouse;

  const HomeScreen({this.selectedHouse = HogwartsHouse.none, super.key});

  String _getBackgroundImage(HogwartsHouse house) {
    switch (house) {
      case HogwartsHouse.gryffindor:
        return AppImage.gryffindorBg;
      case HogwartsHouse.slytherin:
        return AppImage.slytherinBg;
      case HogwartsHouse.ravenclaw:
        return AppImage.ravenclawBg;
      case HogwartsHouse.hufflepuff:
        return AppImage.hufflepuffBg;
      case HogwartsHouse.none:
      default:
        return AppImage.hogwarts; // Your specified default
    }
  }

  Color _getAccentColor(HogwartsHouse house) {
    switch (house) {
      case HogwartsHouse.gryffindor:
        return const Color(0xFFC50000);
      case HogwartsHouse.slytherin:
        return const Color(0xFF1A472A);
      case HogwartsHouse.ravenclaw:
        return const Color(0xFF222F5B);
      case HogwartsHouse.hufflepuff:
        return const Color(0xFFFFDB00);
      default:
        return const Color(0xFF785834);
    }
  }

  Color _getLightAccentColor(HogwartsHouse house) {
    switch (house) {
      case HogwartsHouse.gryffindor:
        return const Color(0xFFEEBA30);
      case HogwartsHouse.slytherin:
        return const Color(0xFFAAA5A5);
      case HogwartsHouse.ravenclaw:
        return const Color(0xFF1e82d4);
      case HogwartsHouse.hufflepuff:
        return const Color(0xFFFFDB00);
      default:
        return Colors.white70;
    }
  }

  String _getMainCrestImage(HogwartsHouse house) {
    switch (house) {
      case HogwartsHouse.gryffindor:
        return AppImage.gryffindor;
      case HogwartsHouse.slytherin:
        return AppImage.slytherin;
      case HogwartsHouse.ravenclaw:
        return AppImage.ravenclaw;
      case HogwartsHouse.hufflepuff:
        return AppImage.hufflepuff;
      case HogwartsHouse.none:
      default:
        return AppImage.hogwarts;
    }
  }

  // Helper widget to build a single menu item
  Widget _buildMenuItem(
    BuildContext context,
    String title,
    String iconPath,
    VoidCallback onTap,
    Color iconColor,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: iconColor.withOpacity(0.3), width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, height: 40, color: iconColor),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'NotoSerif',
                fontSize: 12,
                color: iconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String backgroundImage = _getBackgroundImage(selectedHouse);
    final Color accentColor = _getAccentColor(selectedHouse);
    final Color lightAccentColor = _getLightAccentColor(selectedHouse);
    final String mainCrestImage = _getMainCrestImage(selectedHouse);
    final String houseName = selectedHouse.toString().split('.').last;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.darken,
              ),
              child: Image.asset(backgroundImage, fit: BoxFit.cover),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                  stops: const [0.0, 0.4, 1.0],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: lightAccentColor,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Image.asset(
                        AppImage.hogwarts, // Using your specified crest image
                        height: 40,
                        color: lightAccentColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Center(
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(
                          0.8,
                        ), // Using your specified opacity
                        BlendMode.modulate,
                      ),
                      child: Image.asset(mainCrestImage, fit: BoxFit.contain),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // About
                    },
                    icon: const Icon(
                      Icons.info_outline_rounded,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'About',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'NotoSerif',
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accentColor.withOpacity(0.8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(
                          color: lightAccentColor.withOpacity(0.7),
                          width: 1,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Welcome to Wizarding School!',
                  style: TextStyle(
                    fontFamily: 'NotoSerif',
                    fontSize: 24,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black.withOpacity(0.8),
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Houses of Hogwarts School',
                  style: TextStyle(
                    fontFamily: 'NotoSerif',
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: lightAccentColor.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 20),

                // --- PASSING COLORS TO CHARACTERS SCREEN HERE ---
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      padding: const EdgeInsets.all(0),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        _buildMenuItem(
                          context,
                          'Students',
                          AppImage.charIcon,
                          () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder:
                                    (context) => CharactersScreen(
                                      selectedHouse: selectedHouse,
                                      characterType: CharacterType.student,
                                      accentColor:
                                          accentColor, // <--- PASS ACCENT COLOR
                                      lightAccentColor:
                                          lightAccentColor, // <--- PASS LIGHT ACCENT COLOR
                                    ),
                              ),
                            );
                          },
                          lightAccentColor,
                        ),
                        _buildMenuItem(context, 'Staff', AppImage.staffIcon, () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:
                                  (context) => CharactersScreen(
                                    selectedHouse: selectedHouse,
                                    characterType: CharacterType.staff,
                                    accentColor:
                                        accentColor, // <--- PASS ACCENT COLOR
                                    lightAccentColor:
                                        lightAccentColor, // <--- PASS LIGHT ACCENT COLOR
                                  ),
                            ),
                          );
                        }, lightAccentColor),
                      ],
                    ),
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

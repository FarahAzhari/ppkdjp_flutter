// lib/screens/character_detail_screen.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ppkdjp_flutter/constant/app_image.dart';
import 'package:ppkdjp_flutter/harry_potter/models/character_model.dart';
import 'package:ppkdjp_flutter/harry_potter/screens/house_selection_screen.dart'; // For HogwartsHouse enum in _getBackgroundImage

class CharacterDetailScreen extends StatelessWidget {
  final CharacterModel character;
  final Color
  accentColor; // Passed from CharactersScreen for thematic consistency
  final Color
  lightAccentColor; // Passed from CharactersScreen for thematic consistency

  const CharacterDetailScreen({
    required this.character,
    required this.accentColor,
    required this.lightAccentColor,
    super.key,
  });

  // Helper function to get background image path based on the character's house
  String _getBackgroundImage(House characterHouse) {
    // Convert CharacterModel's House enum to HogwartsHouse enum for mapping
    HogwartsHouse equivalentHogwartsHouse = HogwartsHouse.none;
    for (var hgHouse in HogwartsHouse.values) {
      if (hgHouse.toString().split('.').last.toLowerCase() ==
          characterHouse.toString().split('.').last.toLowerCase()) {
        equivalentHogwartsHouse = hgHouse;
        break;
      }
    }

    switch (equivalentHogwartsHouse) {
      case HogwartsHouse.gryffindor:
        return AppImage.gryffindorBg;
      case HogwartsHouse.slytherin:
        return AppImage.slytherinBg;
      case HogwartsHouse.ravenclaw:
        return AppImage.ravenclawBg;
      case HogwartsHouse.hufflepuff:
        return AppImage.hufflepuffBg;
      case HogwartsHouse
          .none: // If character's house is not a recognized HogwartsHouse or is EMPTY
      default:
        // Fallback to a general HP background or a dark default
        return AppImage.hogwarts; // Using the splash screen's default
    }
  }

  // Helper for displaying details row
  Widget _buildDetailRow(String label, String? value, Color textColor) {
    if (value == null || value.isEmpty) {
      return const SizedBox.shrink(); // Don't show if value is empty or null
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100, // Fixed width for labels
            child: Text(
              '$label:',
              style: TextStyle(
                fontFamily: 'NotoSerif',
                fontWeight: FontWeight.bold,
                color: textColor.withOpacity(0.8),
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontFamily: 'NotoSerif',
                color: textColor,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper for displaying boolean details
  Widget _buildBooleanDetailRow(String label, bool value, Color textColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: TextStyle(
                fontFamily: 'NotoSerif',
                fontWeight: FontWeight.bold,
                color: textColor.withOpacity(0.8),
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value ? 'Yes' : 'No',
              style: TextStyle(
                fontFamily: 'NotoSerif',
                color: textColor,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String backgroundImage = _getBackgroundImage(character.house);
    final String houseDisplayName =
        character.house != House.EMPTY
            ? character.house.toString().split('.').last
            : 'Unknown';

    return Scaffold(
      body: Stack(
        children: [
          // Background Image and Overlay
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
            child: CustomScrollView(
              // Use CustomScrollView for flexible scroll behavior with slivers
              slivers: [
                SliverAppBar(
                  expandedHeight:
                      250.0, // Height for the flexible space (image)
                  floating: false, // Does not float
                  pinned: true, // Pins the app bar to the top when scrolled
                  backgroundColor: accentColor.withOpacity(0.5),
                  elevation: 0,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: lightAccentColor),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    titlePadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    title: Text(
                      character.name,
                      style: TextStyle(
                        fontFamily: 'NotoSerif',
                        fontSize: 20,
                        color: lightAccentColor,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black.withOpacity(0.8),
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                    background:
                        character.image.isNotEmpty
                            // ? Image.network(
                            //   character.image,
                            //   fit: BoxFit.contain,
                            //   errorBuilder: (context, error, stackTrace) {
                            //     return Image.asset(
                            //       'assets/images/placeholder.png', // Placeholder for image load errors
                            //       fit: BoxFit.contain,
                            //     );
                            //   },
                            // )
                            ? CachedNetworkImage(
                              // --- USING CachedNetworkImage ---
                              imageUrl: character.image,
                              fit: BoxFit.contain,
                              placeholder:
                                  (context, url) => Center(
                                    // Show a loading indicator
                                    child: CircularProgressIndicator(
                                      color: lightAccentColor.withOpacity(0.5),
                                    ),
                                  ),
                              errorWidget:
                                  (context, url, error) => Image.asset(
                                    // Show placeholder on error
                                    AppImage.placeholder,
                                    fit: BoxFit.contain,
                                  ),
                            )
                            : Image.asset(
                              AppImage
                                  .placeholder, // Placeholder if no image URL
                              fit: BoxFit.contain,
                            ),
                  ),
                ),
                SliverToBoxAdapter(
                  // Use SliverToBoxAdapter for regular widgets inside CustomScrollView
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        _buildDetailRow(
                          'House',
                          houseDisplayName,
                          lightAccentColor,
                        ),
                        _buildDetailRow(
                          'Species',
                          character.species,
                          lightAccentColor,
                        ),
                        _buildDetailRow(
                          'Gender',
                          character.gender.toString().split('.').last,
                          lightAccentColor,
                        ),
                        _buildDetailRow(
                          'Date of Birth',
                          character.dateOfBirth,
                          lightAccentColor,
                        ),
                        _buildDetailRow(
                          'Year of Birth',
                          character.yearOfBirth?.toString(),
                          lightAccentColor,
                        ),
                        _buildBooleanDetailRow(
                          'Wizard',
                          character.wizard,
                          lightAccentColor,
                        ),
                        _buildDetailRow(
                          'Ancestry',
                          character.ancestry.toString().split('.').last,
                          lightAccentColor,
                        ),
                        _buildDetailRow(
                          'Eye Colour',
                          character.eyeColour.toString().split('.').last,
                          lightAccentColor,
                        ),
                        _buildDetailRow(
                          'Hair Colour',
                          character.hairColour.toString().split('.').last,
                          lightAccentColor,
                        ),
                        // Wand details
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 16.0,
                          ),
                          child: Text(
                            'Wand Details:',
                            style: TextStyle(
                              fontFamily: 'NotoSerif',
                              fontWeight: FontWeight.bold,
                              color: lightAccentColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        _buildDetailRow(
                          '  Wood',
                          character.wand.wood,
                          lightAccentColor,
                        ),
                        _buildDetailRow(
                          '  Core',
                          character.wand.core.toString().split('.').last,
                          lightAccentColor,
                        ),
                        _buildDetailRow(
                          '  Length',
                          character.wand.length?.toStringAsFixed(1),
                          lightAccentColor,
                        ),
                        _buildDetailRow(
                          'Patronus',
                          character.patronus.toString().split('.').last,
                          lightAccentColor,
                        ),
                        _buildBooleanDetailRow(
                          'Hogwarts Student',
                          character.hogwartsStudent,
                          lightAccentColor,
                        ),
                        _buildBooleanDetailRow(
                          'Hogwarts Staff',
                          character.hogwartsStaff,
                          lightAccentColor,
                        ),
                        _buildDetailRow(
                          'Actor',
                          character.actor,
                          lightAccentColor,
                        ),
                        _buildDetailRow(
                          'Alternate Actors',
                          character.alternateActors.join(', '),
                          lightAccentColor,
                        ),
                        _buildBooleanDetailRow(
                          'Alive',
                          character.alive,
                          lightAccentColor,
                        ),
                        // Optionally display alternateNames if they exist
                        if (character.alternateNames.isNotEmpty)
                          _buildDetailRow(
                            'Alternate Names',
                            character.alternateNames.join(', '),
                            lightAccentColor,
                          ),
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

// lib/screens/characters_screen.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ppkdjp_flutter/harry_potter/api/hp_api.dart' as api_service;
import 'package:ppkdjp_flutter/harry_potter/models/character_model.dart';
import 'package:ppkdjp_flutter/harry_potter/screens/character_detail_screen.dart';
import 'package:ppkdjp_flutter/harry_potter/screens/house_selection_screen.dart';

enum CharacterType { student, staff, all }

class CharactersScreen extends StatefulWidget {
  final HogwartsHouse selectedHouse;
  final CharacterType characterType;
  final Color accentColor;
  final Color lightAccentColor;

  const CharactersScreen({
    required this.selectedHouse,
    required this.accentColor,
    required this.lightAccentColor,
    this.characterType = CharacterType.all,
    super.key,
  });

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late Future<List<CharacterModel>> _charactersFuture;
  List<CharacterModel> _allCharacters = [];
  List<CharacterModel> _filteredCharacters = [];
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _fetchAndFilterCharacters();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  // --- MODIFIED: _fetchAndFilterCharacters to return Future<void> for onRefresh ---
  Future<void> _fetchAndFilterCharacters() async {
    final String selectedHouseApiName =
        widget.selectedHouse.toString().split('.').last;

    // Set the new future, this will trigger FutureBuilder to go into waiting state
    setState(() {
      _charactersFuture = api_service.getCharactersByHouse(
        selectedHouseApiName,
      );
    });

    try {
      final fetchedList = await _charactersFuture; // Await the new future
      _allCharacters = fetchedList;
      _applyFilters(); // Apply filters once new data is fetched
    } catch (error) {
      // If an error occurs, ensure lists are cleared and print error
      setState(() {
        _allCharacters = [];
        _filteredCharacters = [];
      });
      print('Error fetching characters: $error');
      // Optionally show a SnackBar or Toast to the user here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to load characters: $error'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _onSearchChanged() {
    if (_searchQuery != _searchController.text) {
      setState(() {
        _searchQuery = _searchController.text;
        _applyFilters();
      });
    }
  }

  void _applyFilters() {
    final House selectedModelHouseEnum = House.values.firstWhere(
      (h) =>
          h.toString().split('.').last.toLowerCase() ==
          widget.selectedHouse.toString().split('.').last.toLowerCase(),
      orElse: () => House.EMPTY,
    );

    List<CharacterModel> currentFilteredList =
        _allCharacters
            .where((char) => char.house == selectedModelHouseEnum)
            .toList();

    if (widget.characterType == CharacterType.student) {
      currentFilteredList =
          currentFilteredList
              .where((char) => char.hogwartsStudent == true)
              .toList();
    } else if (widget.characterType == CharacterType.staff) {
      currentFilteredList =
          currentFilteredList
              .where((char) => char.hogwartsStaff == true)
              .toList();
    }

    if (_searchQuery.isNotEmpty) {
      final query = _searchQuery.toLowerCase();
      currentFilteredList =
          currentFilteredList.where((char) {
            return char.name.toLowerCase().contains(query) ||
                (char.alternateNames.any(
                  (name) => name.toLowerCase().contains(query),
                )) ||
                char.species.toLowerCase().contains(query) ||
                (char.house != House.EMPTY &&
                    char.house
                        .toString()
                        .split('.')
                        .last
                        .toLowerCase()
                        .contains(query));
          }).toList();
    }

    setState(() {
      _filteredCharacters = currentFilteredList;
    });
  }

  String _getBackgroundImage(HogwartsHouse house) {
    switch (house) {
      case HogwartsHouse.gryffindor:
        return 'assets/images/gryffindor_bg.jpg';
      case HogwartsHouse.slytherin:
        return 'assets/images/slytherin_bg.jpg';
      case HogwartsHouse.ravenclaw:
        return 'assets/images/ravenclaw_bg.jpg';
      case HogwartsHouse.hufflepuff:
        return 'assets/images/hufflepuff_bg.jpg';
      case HogwartsHouse.none:
      default:
        return 'assets/images/hogwarts_crest.png'; // Make sure this path is correct
    }
  }

  // --- NEW: Helper method to build the character list/messages ---
  Widget _buildCharacterListContent(String appBarTitle) {
    if (_filteredCharacters.isEmpty && _searchQuery.isNotEmpty) {
      return Center(
        child: Text(
          'No results for "$_searchQuery" in ${appBarTitle.split(' ')[0]} ${appBarTitle.split(' ')[1]}.',
          textAlign: TextAlign.center,
          style: TextStyle(color: widget.lightAccentColor, fontSize: 16),
        ),
      );
    } else if (_filteredCharacters.isEmpty) {
      // This case handles when there are no characters after initial fetch or filtering
      return Center(
        child: Text(
          'No characters found for ${appBarTitle.split(' ')[0]} ${appBarTitle.split(' ')[1]}.',
          textAlign: TextAlign.center,
          style: TextStyle(color: widget.lightAccentColor, fontSize: 16),
        ),
      );
    }

    return ListView.builder(
      // --- ADDED: AlwaysScrollableScrollPhysics for RefreshIndicator to work ---
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      itemCount: _filteredCharacters.length,
      itemBuilder: (context, index) {
        final character = _filteredCharacters[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          color: Colors.black.withOpacity(0.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              color: widget.lightAccentColor.withOpacity(0.5),
              width: 1,
            ),
          ),
          child: InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder:
                      (context) => CharacterDetailScreen(
                        character: character,
                        accentColor: widget.accentColor,
                        lightAccentColor: widget.lightAccentColor,
                      ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading:
                    character.image.isNotEmpty
                        ? CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                            character.image,
                          ),
                          radius: 30,
                        )
                        : CircleAvatar(
                          radius: 30,
                          backgroundColor: widget.accentColor.withOpacity(0.3),
                          child: Icon(
                            Icons.person,
                            color: widget.lightAccentColor,
                          ),
                        ),
                title: Text(
                  character.name,
                  style: TextStyle(
                    color: widget.lightAccentColor,
                    fontFamily: 'NotoSerif',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  '${character.house != House.EMPTY ? character.house.toString().split('.').last : 'Unknown House'} | ${character.species}',
                  style: TextStyle(
                    color: widget.lightAccentColor.withOpacity(0.7),
                    fontFamily: 'NotoSerif',
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String appBarTitle;
    if (widget.characterType == CharacterType.student) {
      appBarTitle =
          '${widget.selectedHouse.toString().split('.').last} Students';
    } else if (widget.characterType == CharacterType.staff) {
      appBarTitle = '${widget.selectedHouse.toString().split('.').last} Staff';
    } else {
      appBarTitle =
          '${widget.selectedHouse.toString().split('.').last} Characters';
    }

    final String backgroundImage = _getBackgroundImage(widget.selectedHouse);

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
                AppBar(
                  title: Text(
                    appBarTitle,
                    style: TextStyle(
                      fontFamily: 'NotoSerif',
                      color: widget.lightAccentColor,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.8),
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                  backgroundColor: widget.accentColor.withOpacity(0.5),
                  elevation: 0,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: widget.lightAccentColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Container(
                  color: widget.accentColor.withOpacity(0.6),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: TextField(
                    controller: _searchController,
                    cursorColor: widget.lightAccentColor,
                    style: TextStyle(
                      color: widget.lightAccentColor,
                      fontFamily: 'NotoSerif',
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search characters...',
                      hintStyle: TextStyle(
                        color: widget.lightAccentColor.withOpacity(0.7),
                        fontFamily: 'NotoSerif',
                      ),
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.3),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: widget.lightAccentColor.withOpacity(0.5),
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: widget.lightAccentColor.withOpacity(0.5),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: widget.lightAccentColor,
                          width: 1.5,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: widget.lightAccentColor.withOpacity(0.8),
                      ),
                      suffixIcon:
                          _searchQuery.isNotEmpty
                              ? IconButton(
                                icon: Icon(
                                  Icons.clear,
                                  color: widget.lightAccentColor,
                                ),
                                onPressed: () {
                                  _searchController.clear();
                                  _searchQuery = '';
                                  _applyFilters();
                                  FocusScope.of(context).unfocus();
                                },
                              )
                              : null,
                    ),
                  ),
                ),
                // --- WRAPPED FutureBuilder with RefreshIndicator ---
                Expanded(
                  child: RefreshIndicator(
                    color:
                        widget
                            .lightAccentColor, // Color of the refresh indicator icon
                    backgroundColor: widget.accentColor.withOpacity(
                      0.9,
                    ), // Background color of the refresh indicator
                    onRefresh:
                        _fetchAndFilterCharacters, // This is the method that runs when you pull down
                    child: FutureBuilder<List<CharacterModel>>(
                      future: _charactersFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          // Only show the central spinner if no data has been loaded yet.
                          // If _allCharacters is not empty, it means we are refreshing existing data,
                          // and the RefreshIndicator itself provides the visual feedback.
                          if (_allCharacters.isEmpty) {
                            return Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  widget.lightAccentColor,
                                ),
                              ),
                            );
                          }
                          // If data is already there, continue showing the list while refreshing in background
                          return _buildCharacterListContent(appBarTitle);
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              'Error loading characters: ${snapshot.error}', // More user-friendly error message
                              style: TextStyle(color: widget.lightAccentColor),
                            ),
                          );
                        } else if (!snapshot.hasData ||
                            _allCharacters.isEmpty) {
                          // This handles cases where data fetching completed, but no data was returned
                          // (e.g., API returned empty list, or an unexpected state)
                          return Center(
                            child: Text(
                              'No characters found for ${widget.selectedHouse.toString().split('.').last}.',
                              style: TextStyle(color: widget.lightAccentColor),
                            ),
                          );
                        } else {
                          // Data loaded successfully, build the list content
                          return _buildCharacterListContent(appBarTitle);
                        }
                      },
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

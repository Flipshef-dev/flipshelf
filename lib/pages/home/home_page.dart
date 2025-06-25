import 'package:flipshelf/models/book.dart';
import 'package:flipshelf/models/book_card.dart';
import 'package:flipshelf/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int selectedCategoryIndex = 0;
  late TextEditingController _searchController;
  late AnimationController _toggleAnimationController;
  late Animation<double> _toggleAnimation;
  String _searchQuery = '';
  bool _isSearching = false;

  final List<String> categories = [
    'All',
    'Technology',
    'Crime',
    'Health',
    'Romance',
    'Education',
    'Entertainment',
  ];

  final List<Book> books = [
    Book(
      id: 1,
      title: 'One Piece',
      author: 'Eiichiro Oda',
      coverColor: Color(0xFFB91C1C),
      coverImage: 'assets/images/onepiece.png',
      aboutAuthor:
          "J.D. Salinger was an American writer, best known for his 1951 novel The Catcher in the Rye. Before its publication, Salinger published several short stories in Story magazine",
      rating: 3,
      overview:
          "The Catcher in the Rye is a novel by J. D. Salinger, partially published in serial form in 1945–1946 and as a novel in 1951. It was originally intended for adults but is often read by adolescents for its theme of angst, alienation and as a critique......",
    ),
    Book(
      id: 2,
      title: 'Attack on Titan',
      author: 'Hajime Isayama',
      coverColor: Color(0xFF059669),
      coverImage: 'assets/images/onepiece.png',
      aboutAuthor:
          "Hajime Isayama is a Japanese manga artist best known for the manga series Attack on Titan.",
      rating: 4,
      overview:
          "Attack on Titan is a Japanese manga series written and illustrated by Hajime Isayama. Set in a world where humanity lives inside cities surrounded by enormous walls...",
    ),
    Book(
      id: 3,
      title: 'Naruto',
      author: 'Masashi Kishimoto',
      coverColor: Color(0xFFDC2626),
      coverImage: 'assets/images/onepiece.png',
      aboutAuthor:
          "Masashi Kishimoto is a Japanese manga artist known for creating the Naruto series.",
      rating: 4,
      overview:
          "Naruto is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, a young ninja...",
    ),
  ];

  final List<Book> newArrivals = [
    Book(
      id: 4,
      title: 'Story of Roronoa Zoro',
      author: 'Eiichiro Oda',
      coverColor: Color.fromARGB(255, 61, 220, 36),
      coverImage: 'assets/images/zoro.png',
      aboutAuthor:
          "Eiichiro Oda is a Japanese manga artist and the creator of the series One Piece.",
      rating: 3.5,
      overview:
          "The story follows Roronoa Zoro, a skilled swordsman who dreams of becoming the world's greatest swordsman...",
    ),
    Book(
      id: 5,
      title: 'Demon Slayer',
      author: 'Koyoharu Gotouge',
      coverColor: Color.fromARGB(255, 147, 51, 234),
      coverImage: 'assets/images/zoro.png',
      aboutAuthor:
          "Koyoharu Gotouge is a Japanese manga artist known for the series Demon Slayer.",
      rating: 4.5,
      overview:
          "Demon Slayer follows Tanjiro Kamado, a young boy who becomes a demon slayer after his family is slaughtered...",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(_onSearchChanged);

    _toggleAnimationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );

    _toggleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _toggleAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateToggleAnimation();
    });
  }

  void _updateToggleAnimation() {
    if (mounted) {
      final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
      if (themeProvider.isDarkMode) {
        _toggleAnimationController.forward();
      } else {
        _toggleAnimationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _toggleAnimationController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text.toLowerCase();
      _isSearching = _searchQuery.isNotEmpty;
    });
  }

  // List<Book> get filteredBooks {
  //   if (_searchQuery.isEmpty) {
  //     return books;
  //   }
  //   return books.where((book) {
  //     return book.title.toLowerCase().contains(_searchQuery) ||
  //         book.author.toLowerCase().contains(_searchQuery);
  //   }).toList();
  // }

  // List<Book> get filteredNewArrivals {
  //   if (_searchQuery.isEmpty) {
  //     return newArrivals;
  //   }
  //   return newArrivals.where((book) {
  //     return book.title.toLowerCase().contains(_searchQuery) ||
  //         book.author.toLowerCase().contains(_searchQuery);
  //   }).toList();
  // }

  void _clearSearch() {
    _searchController.clear();
    FocusScope.of(context).unfocus();
  }
  void _toggleDrawer() {}

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    // Update animation based on theme
    if (themeProvider.isDarkMode) {
      _toggleAnimationController.forward();
    } else {
      _toggleAnimationController.reverse();
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            _buildTopBar(context, themeProvider),
            // Content
            _buildContent(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context, ThemeProvider themeProvider) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              _toggleDrawer();
            },
            icon: Icon(Icons.menu),
            iconSize: 28,
            color: Theme.of(context).colorScheme.secondary,
          ),
          Row(
            children: [
              // Will be removed in future if not fix (oviously i'm too lazy to fix this rn)
              // _buildThemeToggle(themeProvider, context),
              const SizedBox(width: 16),
              Hero(
                tag: 'profile_avatar',
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blue[100],
                  child: Icon(Icons.person, color: Colors.blue[800]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildThemeToggle(
    ThemeProvider themeProvider,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        themeProvider.toggleTheme();
        _updateToggleAnimation();
      },
      child: Container(
        width: 60,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
            width: 1.2,
          ),
        ),
        child: AnimatedBuilder(
          animation: _toggleAnimation,
          builder: (context, child) {
            return Stack(
              children: [
                Positioned(
                  left: _toggleAnimation.value * 30,
                  top: 1,
                  child: Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(80),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      themeProvider.isDarkMode
                          ? Icons.dark_mode
                          : Icons.light_mode,
                      size: 16,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Welcome message
                  Text(
                    "Welcome to Book Haven",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'What would you like to read today?',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Enhanced search bar
                  _buildEnhancedSearchBar(context),
                  const SizedBox(height: 30),
                  // Categories
                  _buildCategorySection(context),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          // Book list
          _buildBookSection(context, 'Featured Books', books),
          // New arrivals
          _buildBookSection(context, 'New Arrivals', newArrivals),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }

  Widget _buildEnhancedSearchBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[800]
            : Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search books, authors...',
          hintStyle: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey[400]
                : Colors.grey[500],
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey[400]
                : Colors.grey[500],
          ),
          suffixIcon: _isSearching
              ? IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey[400]
                        : Colors.grey[500],
                  ),
                  onPressed: _clearSearch,
                )
              : Icon(
                  Icons.mic,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey[400]
                      : Colors.grey[500],
                ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
        style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      ),
    );
  }

  Widget _buildCategorySection(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedCategoryIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategoryIndex = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(right: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    categories[index],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w400,
                      color: isSelected
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(
                              context,
                            ).colorScheme.secondary.withAlpha(200),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 3,
                    width: isSelected ? 20 : 0,
                    decoration: BoxDecoration(
                      color: Colors.red[600],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBookSection(
    BuildContext context,
    String title,
    List<Book> bookList,
  ) {
    if (bookList.isEmpty && _isSearching) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
                const SizedBox(height: 16),
                Text(
                  'No books found',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Try searching with different keywords',
                  style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 290,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: bookList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      "/book_view",
                      arguments: bookList[index],
                    );
                  },
                  child: Hero(
                    tag: 'book_${bookList[index].id}_$index',
                    child: Container(
                      width: 160,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: BookCard(book: bookList[index]),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
  
}

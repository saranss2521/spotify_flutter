import 'package:flutter/material.dart';
import 'playlist_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // ===== QUICK ACCESS GRID DATA =====
  static final List<Map<String, String>> _quickGridItems = [
    {"title": "OK Computer", "image": "assets/home/ok_computer.png"},
    {"title": "Blur: the best of", "image": "assets/home/blur_best.png"},
    {"title": "Govinda", "image": "assets/home/govinda.png"},
    {"title": "Playlist Viper", "image": "assets/home/playlist_viper.png"},
    {"title": "The last Dinner Party", "image": "assets/home/last_dinner.png"},
    {"title": "Entering the 3 Body Problem", "image": "assets/home/3body.png"},
    {"title": "The Cure", "image": "assets/home/the_cure.png"},
    {"title": "Guts (spilled)", "image": "assets/home/guts.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Column(
          children: [
            // ===== HEADER =====
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Recently played',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // ===== SCROLLABLE CONTENT =====
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // ===== QUICK ACCESS GRID (NEW) =====
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _quickGridItems.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 3.4,
                        ),
                        itemBuilder: (_, index) {
                          final item = _quickGridItems[index];
                          return _QuickGridTile(
                            title: item["title"]!,
                            image: item["image"]!,
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 28),

                    // ===== RECENTLY PLAYED (EXISTING) =====
                    SizedBox(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        children: const [
                          _AlbumCard(
                            title: '1 (Remastered)',
                            imagePath: 'assets/home/beatles_1.png',
                            isCircle: false,
                          ),
                          _AlbumCard(
                            title: 'Lana Del Rey',
                            imagePath: 'assets/home/lana.png',
                            isCircle: true,
                          ),
                          _AlbumCard(
                            title: 'Marvin Gaye',
                            imagePath: 'assets/home/marvin.png',
                            isCircle: true,
                          ),
                          _AlbumCard(
                            title: 'Indie Pop',
                            imagePath: 'assets/home/indie.png',
                            isCircle: false,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    // ===== YOUR 2025 IN REVIEW (EXISTING) =====
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '#SPOTIFYWRAPPED',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Your 2025 in review',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: const [
                              Expanded(
                                child: _ReviewCard(
                                  title: 'Your Top Songs 2025',
                                  imagePath:
                                      'assets/home/top_songs_2021.png',
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: _ReviewCard(
                                  title: 'Your Artists Revealed',
                                  imagePath:
                                      'assets/home/artists_revealed.png',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    // ===== EDITOR'S PICKS (EXISTING) =====
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Editor's picks",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        children: const [
                          _AlbumCard(
                            title: 'Ed Sheeran, Big Sean...',
                            imagePath:
                                'assets/home/editor_a1.png',
                            isCircle: false,
                          ),
                          _AlbumCard(
                            title: 'Mitski, Tame Impala...',
                            imagePath:
                                'assets/home/editor_front_left.png',
                            isCircle: false,
                          ),
                          _AlbumCard(
                            title: 'Charli XCX',
                            imagePath:
                                'assets/home/editor_yellow.png',
                            isCircle: false,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickGridTile extends StatelessWidget {
  final String title;
  final String image;

  const _QuickGridTile({
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                PlaylistScreen(title: title, image: image),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
              child: Image.asset(
                image,
                width: 56,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AlbumCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool isCircle;

  const _AlbumCard({
    required this.title,
    required this.imagePath,
    required this.isCircle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PlaylistScreen(title: title, image: imagePath),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(isCircle ? 75 : 8),
              child: Image.asset(
                imagePath,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 150,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const _ReviewCard({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 13),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
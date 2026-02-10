import 'package:flutter/material.dart';
import 'playlist_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // ===== QUICK ACCESS GRID DATA =====
  static final List<Map<String, String>> _quickGridItems = [
    {"title": "Action Hits", "image": "assets/genres/action.png"},
    {"title": "Comedy Central", "image": "assets/genres/comedy.png"},
    {"title": "Indie Vibes", "image": "assets/genres/indie.png"},
    {"title": "Pop Essentials", "image": "assets/genres/pop.png"},
    {"title": "Romance Playlist", "image": "assets/genres/romance.png"},
    {"title": "Indie Mix", "image": "assets/genres/indie.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== HEADER WITH ICONS =====
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Latest Release',
                          style: TextStyle(
                            color: Colors.white,
                             fontSize: 22,
                             fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 12),
                        
                      ],
                    ),
                    const Icon(
                      Icons.notifications_outlined,
                      color: Colors.white70,
                      size: 24,
                    ),
                  ],
                ),
              ),

              // ===== QUICK ACCESS GRID =====
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _quickGridItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 3.2,
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

              const SizedBox(height: 24),

              // ===== YOUR TOP MIXES =====
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Your top mixes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: const [
                    _AlbumCard(
                      title: 'Action Mix',
                      subtitle: 'High energy tracks for your workout',
                      imagePath: 'assets/genres/action.png',
                      isCircle: false,
                    ),
                    _AlbumCard(
                      title: 'Comedy Hits',
                      subtitle: 'Funny and upbeat songs to lift your...',
                      imagePath: 'assets/genres/comedy.png',
                      isCircle: false,
                    ),
                    _AlbumCard(
                      title: 'Indie Mix',
                      subtitle: 'The best indie artists, just for you',
                      imagePath: 'assets/genres/indie.png',
                      isCircle: false,
                    ),
                    _AlbumCard(
                      title: 'Pop Party',
                      subtitle: 'The biggest pop hits right now',
                      imagePath: 'assets/genres/pop.png',
                      isCircle: false,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ===== RECENTLY PLAYED =====
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Recently played',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: const [
                    _AlbumCard(
                      title: 'Romance Ballads',
                      subtitle: 'Love songs for the soul',
                      imagePath: 'assets/genres/romance.png',
                      isCircle: false,
                    ),
                    _AlbumCard(
                      title: 'Action Beats',
                      subtitle: 'Intense workout music',
                      imagePath: 'assets/genres/action.png',
                      isCircle: false,
                    ),
                    _AlbumCard(
                      title: 'Pop Charts',
                      subtitle: 'Top 50 Global',
                      imagePath: 'assets/genres/pop.png',
                      isCircle: false,
                    ),
                    _AlbumCard(
                      title: 'Indie Discovery',
                      subtitle: 'Fresh indie tracks weekly',
                      imagePath: 'assets/genres/indie.png',
                      isCircle: false,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ===== MADE FOR YOU =====
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Made for you',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: const [
                    _AlbumCard(
                      title: 'Comedy Daily Mix',
                      subtitle: 'Upbeat and fun songs mixed for you',
                      imagePath: 'assets/genres/comedy.png',
                      isCircle: false,
                    ),
                    _AlbumCard(
                      title: 'Romance Mix',
                      subtitle: 'Romantic hits and slow jams',
                      imagePath: 'assets/genres/romance.png',
                      isCircle: false,
                    ),
                    _AlbumCard(
                      title: 'Discover Indie',
                      subtitle: 'Your weekly mixtape of fresh indie',
                      imagePath: 'assets/genres/indie.png',
                      isCircle: false,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ===== EPISODES FOR YOU =====
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Episodes for you',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: const [
                    _AlbumCard(
                      title: 'Action Podcasts',
                      subtitle: 'True crime & thriller stories',
                      imagePath: 'assets/genres/action.png',
                      isCircle: false,
                    ),
                    _AlbumCard(
                      title: 'Comedy Hour',
                      subtitle: 'Stand-up and comedy shows',
                      imagePath: 'assets/genres/comedy.png',
                      isCircle: false,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ===== JUMP BACK IN =====
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Jump back in',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: const [
                    _AlbumCard(
                      title: 'Pop Favorites',
                      subtitle: '127 liked songs',
                      imagePath: 'assets/genres/pop.png',
                      isCircle: false,
                    ),
                    _AlbumCard(
                      title: 'Indie Sessions',
                      subtitle: '89 songs',
                      imagePath: 'assets/genres/indie.png',
                      isCircle: false,
                    ),
                    _AlbumCard(
                      title: 'Romance Collection',
                      subtitle: '56 songs',
                      imagePath: 'assets/genres/romance.png',
                      isCircle: false,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ===== RECOMMENDED FOR TODAY =====
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Recommended for today',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: const [
                    _AlbumCard(
                      title: 'Comedy Vibes',
                      subtitle: 'Feel good songs to brighten your day',
                      imagePath: 'assets/genres/comedy.png',
                      isCircle: false,
                    ),
                    _AlbumCard(
                      title: 'Action Packed',
                      subtitle: 'High energy hits for motivation',
                      imagePath: 'assets/genres/action.png',
                      isCircle: false,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ===== LARGE FEATURED CARDS =====
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: const [
                    _FeaturedCard(
                      title: 'Romance Classics',
                      subtitle: 'You listened to this earlier',
                      description:
                          'The most romantic songs of all time. Perfect for date nights and cozy evenings at home with your loved one...',
                      imagePath: 'assets/genres/romance.png',
                      showProgressBar: true,
                    ),
                    SizedBox(height: 16),
                    _FeaturedCard(
                      title: 'Pop Hits 2025',
                      subtitle: 'New Playlist',
                      description:
                          'The biggest pop songs of 2025. Updated every week with the freshest hits from around the world...',
                      imagePath: 'assets/genres/pop.png',
                      showProgressBar: false,
                    ),
                    SizedBox(height: 16),
                    _FeaturedCard(
                      title: 'Indie Essentials',
                      subtitle: 'Trending playlists for you',
                      description:
                          'Discover the best indie artists and tracks. From bedroom pop to alternative rock and everything in between.',
                      imagePath: 'assets/genres/indie.png',
                      showProgressBar: false,
                    ),
                    SizedBox(height: 16),
                    _FeaturedCard(
                      title: 'Action Soundtrack',
                      subtitle: 'Trending Albums',
                      description:
                          'Epic movie soundtracks and high-energy instrumentals to fuel your workout or gaming session.',
                      imagePath: 'assets/genres/action.png',
                      showProgressBar: false,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 100),
            ],
          ),
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
            builder: (_) => PlaylistScreen(title: title, image: image),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                bottomLeft: Radius.circular(4),
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
                  fontSize: 13,
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
  final String subtitle;
  final String imagePath;
  final bool isCircle;

  const _AlbumCard({
    required this.title,
    required this.subtitle,
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
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(isCircle ? 70 : 4),
              child: Image.asset(
                imagePath,
                width: 140,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 12,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _FeaturedCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String imagePath;
  final bool showProgressBar;

  const _FeaturedCard({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imagePath,
    required this.showProgressBar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF282828),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (description.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 12,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  imagePath,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          if (showProgressBar) ...[
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: LinearProgressIndicator(
                value: 0.35,
                backgroundColor: Colors.white.withOpacity(0.2),
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                minHeight: 3,
              ),
            ),
          ],
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.add_circle_outline,
                color: Colors.white.withOpacity(0.7),
                size: 28,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(12),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
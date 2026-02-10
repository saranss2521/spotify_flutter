import 'package:flutter/material.dart';
import 'settings_screen.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  
  bool isGridView = false; // toggle state

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Column(
        children: [

          // ===== FIXED PROFILE HEADER =====
Container(
  width: double.infinity,
  padding: const EdgeInsets.only(top: 60, bottom: 30),
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      colors: [Color(0xFF0F6A73), Color(0xFF121212)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),
  child: Stack(
    children: [

      // ===== SETTINGS BUTTON TOP RIGHT =====
      Positioned(
        top: 0,
        right: 12,
        child: IconButton(
          icon: const Icon(Icons.settings, color: Colors.white, size: 26),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SettingsScreen()),
              );
            },
        ),
      ),

      // ===== PROFILE CONTENT =====
      Column(
        children: [
          const SizedBox(height: 20),

          const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage("assets/home/profile.png"),
          ),
          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "Edit Profile",
              style: TextStyle(color: Colors.white),
            ),
          ),

          const SizedBox(height: 28),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _StatItem(count: "23", label: "PLAYLISTS"),
              _StatItem(count: "58", label: "FOLLOWERS"),
              _StatItem(count: "43", label: "FOLLOWING"),
            ],
          ),
        ],
      ),
    ],
  ),
),

          // ===== ONLY THIS PART SCROLLS =====
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 18),
    children: [
      const SizedBox(height: 20),

      // ===== TITLE + TOGGLE BUTTON =====
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Playlists",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: Icon(
              isGridView ? Icons.view_list : Icons.grid_view,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
          ),
        ],
      ),

      const SizedBox(height: 5),

      // ===== SWITCH VIEW =====
      isGridView ? _playlistGrid() : _playlistList(),

      const SizedBox(height: 10),

      // ===== SEE ALL =====
      ListTile(
        contentPadding: EdgeInsets.zero,
        title: const Text(
          "See all playlists",
          style: TextStyle(color: Colors.white70),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.white54),
        onTap: () {},
      ),

      const SizedBox(height: 40),
    ],
  ),
  ),
        ],
      ),
    );
  }
  Widget _playlistList() {
  return Column(
    children: [
      _playlistTile("Shazam", "7 likes", "assets/home/p1.png"),
      _playlistTile("Roadtrip", "4 likes", "assets/home/p2.png"),
      _playlistTile("Study", "5 likes", "assets/home/p3.png"),
    ],
  );
}
Widget _playlistGrid() {
  final playlists = [
    {"title": "Shazam", "likes": "7 likes", "img": "assets/home/p1.png"},
    {"title": "Roadtrip", "likes": "4 likes", "img": "assets/home/p2.png"},
    {"title": "Study", "likes": "5 likes", "img": "assets/home/p3.png"},
  ];

  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: playlists.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 14,
      mainAxisSpacing: 14,
      childAspectRatio: 0.85,
    ),
    itemBuilder: (_, i) {
      final p = playlists[i];
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              p["img"]!,
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            p["title"]!,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            p["likes"]!,
            style: const TextStyle(color: Colors.white54, fontSize: 12),
          ),
        ],
      );
    },
  );
}



  // ===== PLAYLIST TILE =====
  static Widget _playlistTile(String title, String likes, String image) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.asset(image, width: 52, height: 52, fit: BoxFit.cover),
      ),
      title: Text(title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600)),
      subtitle:
          Text(likes, style: const TextStyle(color: Colors.white54)),
      trailing: const Icon(Icons.chevron_right, color: Colors.white54),
      onTap: () {},
    );
  }
}

class _StatItem extends StatelessWidget {
  final String count;
  final String label;

  const _StatItem({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label,
            style: const TextStyle(color: Colors.white54, fontSize: 11)),
      ],
    );
  }
}
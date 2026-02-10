import 'package:flutter/material.dart';

class PlaylistScreen extends StatelessWidget {
  final String title;
  final String image;

  const PlaylistScreen({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Column(
          children: [

            // ===== HEADER =====
            Stack(
              children: [
                Container(
                  height: 320,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.teal.shade300,
                        const Color(0xFF121212),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),

                Positioned(
                  top: 12,
                  left: 12,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),

                Positioned(
                  top: 12,
                  right: 12,
                  child: IconButton(
                    icon: const Icon(Icons.more_vert, color: Colors.white),
                    onPressed: () {},
                  ),
                ),

                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          image,
                          width: 180,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Made for you',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // ===== ACTION BAR =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  const Icon(Icons.favorite_border, color: Colors.white),
                  const SizedBox(width: 16),
                  const Icon(Icons.download_outlined, color: Colors.white),
                  const SizedBox(width: 16),
                  const Icon(Icons.more_horiz, color: Colors.white),
                  const Spacer(),
                  Container(
                    width: 56,
                    height: 56,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.play_arrow, color: Colors.black, size: 32),
                  )
                ],
              ),
            ),

            // ===== SONG LIST =====
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  _SongTile(title: 'Live Forever - Remastered', artist: 'Oasis'),
                  _SongTile(title: 'This Charming Man', artist: 'The Smiths'),
                  _SongTile(title: 'Lucky Man', artist: 'The Verve'),
                  _SongTile(title: 'The Universal', artist: 'Blur'),
                  _SongTile(title: 'Paranoid Android', artist: 'Radiohead'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SongTile extends StatelessWidget {
  final String title;
  final String artist;

  const _SongTile({required this.title, required this.artist});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
      subtitle: Text(artist,
          style: const TextStyle(color: Colors.white54)),
      trailing: const Icon(Icons.more_vert, color: Colors.white54),
    );
  }
}

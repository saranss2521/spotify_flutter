import 'package:flutter/material.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7B2D2D), // deep red gradient base
      body: SafeArea(
        child: Column(
          children: [
            // ===== TOP BAR =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 28),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    '1 (Remastered)',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // ===== ALBUM ART =====
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/home/beatles_1.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ===== TITLE + HEART =====
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'From Me to You - Mono / Remastered',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4),
                              Text(
                                'The Beatles',
                                style: TextStyle(color: Colors.white70, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.favorite_border, color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // ===== PROGRESS BAR =====
                    Column(
                      children: [
                        Slider(
                          value: 0.3,
                          onChanged: (_) {},
                          activeColor: Colors.white,
                          inactiveColor: Colors.white38,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('0:38', style: TextStyle(color: Colors.white70, fontSize: 12)),
                              Text('1:18', style: TextStyle(color: Colors.white70, fontSize: 12)),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // ===== CONTROLS =====
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(Icons.shuffle, color: Colors.white),
                        const Icon(Icons.skip_previous, color: Colors.white, size: 36),
                        Container(
                          width: 64,
                          height: 64,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.pause, color: Colors.black, size: 36),
                        ),
                        const Icon(Icons.skip_next, color: Colors.white, size: 36),
                        const Icon(Icons.repeat, color: Colors.green),
                      ],
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),

            // ===== LYRICS BAR =====
            Container(
              height: 56,
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.shade700,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Lyrics', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    Text('MORE', style: TextStyle(color: Colors.white)),
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

import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  // start with recent search UI
  bool showBrowse = false;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        showBrowse = _focusNode.hasFocus;
      });
    });
  }

  void cancelSearch() {
    _controller.clear();
    _focusNode.unfocus();
    setState(() => showBrowse = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ===== HEADER =====
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Search",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.camera_alt_outlined,
                          color: Colors.white))
                ],
              ),
            ),

            // ===== SEARCH BAR =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 46,
                      decoration: BoxDecoration(
                        color: showBrowse
                            ? Colors.white.withOpacity(.12)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: _controller,
                        focusNode: _focusNode,
                        cursorColor: showBrowse ? Colors.white : Colors.black,
                        style: TextStyle(
                            color: showBrowse ? Colors.white : Colors.black),
                        decoration: InputDecoration(
                          hintText: "Artists, songs, or podcasts",
                          hintStyle: TextStyle(
                              color: showBrowse
                                  ? Colors.white.withOpacity(.6)
                                  : Colors.black54),
                          prefixIcon: Icon(Icons.search,
                              color: showBrowse
                                  ? Colors.white
                                  : Colors.black54),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),

                  if (showBrowse)
                    TextButton(
                        onPressed: cancelSearch,
                        child: const Text("Cancel",
                            style: TextStyle(color: Colors.white)))
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ===== SWITCH UI =====
            Expanded(
              // child: showBrowse ? _browseUI() : _recentUI(),
              child: _browseUI(),
            )
          ],
        ),
      ),
    );
  }

  // ===== RECENT SEARCH UI (default first) =====
  Widget _recentUI() {

  final items = [
    {"name": "FKA twigs", "sub": "Artist", "img": "assets/artists/fka.png"},
    {"name": "Hozier", "sub": "Artist", "img": "assets/artists/hozier.png"},
    {"name": "Grimes", "sub": "Artist", "img": "assets/artists/fka.png"},
    {"name": "1 (Remastered)", "sub": "Album • Beatles", "img": "assets/artists/hozier.png"},
    {"name": "HAYES", "sub": "Artist", "img": "assets/artists/fka.png"},
    {"name": "Led Zeppelin", "sub": "Artist", "img": "assets/artists/hozier.png"},
    {"name": "Les", "sub": "Song • Gambino", "img": "assets/artists/fka.png"},
  ];

  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (_, i) {
      final item = items[i];

      return ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(
              item["sub"]!.contains("Artist") ? 25 : 6),
          child: Image.asset(
            item["img"]!,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(item["name"]!,
            style: const TextStyle(color: Colors.white)),
        subtitle: Text(item["sub"]!,
            style: const TextStyle(color: Colors.white54)),
      );
    },
  );
}


  // ===== BROWSE UI =====
  Widget _browseUI() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [

        const Text("Your top genres",
            style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        _grid(),

        const SizedBox(height: 20),

        const Text("Popular podcast categories",
            style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        _grid(),

        const SizedBox(height: 20),

        const Text("Browse all",
            style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        _grid(),
      ],
    );
  }

  Widget _grid() {
  final items = [
    {
      "title": "Pop",
      "subtitle": "Hollywood",
      "color": const Color(0xFF8E44AD),
      // "image": "assets/genres/indie.png",
    },
    {
      "title": "Indie",
      "subtitle": "Bollywood",
      "color": const Color(0xFF6C8E2E),
      // "image": "assets/genres/indie.png",
    },
    {
      "title": "Action",
      "subtitle": "Tamil Cinema",
      "color": const Color(0xFF2980B9),
      // "image": "assets/genres/action.png",
    },
    {
      "title": "Comedy",
      "subtitle": "Stand-up",
      "color": const Color(0xFFD35400),
      // "image": "assets/genres/comedy.png",
    },
    {
      "title": "Romance",
      "subtitle": "K-Drama",
      "color": const Color(0xFF27AE60),
      // "image": "assets/genres/romance.png",
    },
    {
      "title": "Thriller",
      "subtitle": "Web Series",
      "color": const Color(0xFF2C3E50),
      // "image": "assets/genres/romance.png",
    },
  ];

  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: items.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 14,
      crossAxisSpacing: 14,
      childAspectRatio: 2.2,
    ),
    itemBuilder: (_, i) {
      final item = items[i];

      return Container(
        decoration: BoxDecoration(
          color: item["color"] as Color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [

            // ===== TEXT =====
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item["title"] as String,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item["subtitle"] as String,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            // ===== SLANTED IMAGE =====
            // Positioned(
            //   right: -10,
            //   bottom: -10,
            //   child: Transform.rotate(
            //     angle: -0.35, // slant angle
            //     child: ClipRRect(
            //       borderRadius: BorderRadius.circular(6),
            //       child: Image.asset(
            //         item["image"] as String,
            //         width: 90,
            //         height: 90,
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      );
    },
  );
}
}

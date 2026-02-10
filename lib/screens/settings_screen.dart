import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),

      body: Column(
        children: [

          // ===== FIXED HEADER (LIKE PROFILE PAGE) =====
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 60, bottom: 25),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0F6A73), Color(0xFF121212)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Stack(
              children: [

                // BACK BUTTON
                Positioned(
                  left: 10,
                  top: 0,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios,
                        color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),

                // TITLE CENTER
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Text(
                      "Settings",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // PROFILE TILE BELOW
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: ListTile(
                    leading: const CircleAvatar(
                      radius: 26,
                      backgroundImage:
                          AssetImage("assets/home/profile.png"),
                    ),
                    title: const Text(
                      "maya",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    subtitle: const Text(
                      "View Profile",
                      style: TextStyle(color: Colors.white54),
                    ),
                    trailing: const Icon(Icons.chevron_right,
                        color: Colors.white54),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),

          // ===== SCROLLABLE SETTINGS LIST =====
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              children: const [
                SizedBox(height: 10),
                _SettingTile("Account"),
                _SettingTile("Data Saver"),
                _SettingTile("Languages"),
                _SettingTile("Playback"),
                _SettingTile("Explicit Content"),
                _SettingTile("Devices"),
                _SettingTile("Car"),
                _SettingTile("Social"),
                _SettingTile("Voice Assistant & Apps"),
                _SettingTile("Audio Quality"),
                _SettingTile("Storage"),
                SizedBox(height: 40),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _SettingTile extends StatelessWidget {
  final String title;
  const _SettingTile(this.title);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(color: Colors.white, fontSize: 16)),
      trailing: const Icon(Icons.chevron_right, color: Colors.white54),
    );
  }
}

import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Top section (background + logo over it)
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: double.infinity,
                  child: Container(color: const Color(0xFF1a1a1a)),
                ),
                Positioned(
                  bottom: 24,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 32,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'assets/icons/spotify_logo.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 35),
            const Text(
              'Millions of Songs.\nFree on Spotify.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 28),
            // Sign up free button
            SizedBox(
              width: 320,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1ED760),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                child: const Text('Sign up free'),
              ),
            ),
            const SizedBox(height: 18),
            // Social buttons
            _SocialButton(
              text: 'Continue with Google',
              icon: 'assets/icons/google.png',
              onPressed: () {},
            ),
            const SizedBox(height: 14),
            _SocialButton(
              text: 'Continue with Facebook',
              icon: 'assets/icons/facebook.png',
              onPressed: () {},
            ),
            const SizedBox(height: 14),
            _SocialButton(
              text: 'Continue with Apple',
              icon: 'assets/icons/apple.png',
              onPressed: () {},
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Log in',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String text;
  final String icon;
  final VoidCallback onPressed;

  const _SocialButton({
    required this.text,
    required this.icon,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 50,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          side: const BorderSide(color: Colors.white, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 12),
            Image.asset(icon, width: 24, height: 24, fit: BoxFit.contain),
            const SizedBox(width: 22),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'main_tab_screen.dart';

class WelcomeModernScreen extends StatefulWidget {
  const WelcomeModernScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeModernScreen> createState() => _WelcomeModernScreenState();
}

class _WelcomeModernScreenState extends State<WelcomeModernScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    );
    _opacityAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn)
    );
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut)
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191B28),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              // App name & tagline
              const Text(
                'Welcome!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Experience your music journey',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 18),
              // SARAN logo text with animation
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) => Opacity(
                  opacity: _opacityAnim.value,
                  child: SlideTransition(
                    position: _slideAnim,
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          colors: [Color(0xFF1ED760), Colors.white],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds);
                      },
                      child: const Text(
                        'SARAN',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w900,
                          fontSize: 36,
                          letterSpacing: 4.5,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black54,
                              offset: Offset(0, 2),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 75),
              // Email login/signup button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const MainTabScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  child: const Text('Continue with Email'),
                ),
              ),
              const SizedBox(height: 18),
              // Google
              _SocialButton(
                text: 'Continue with Google',
                icon: 'assets/icons/google.png',
                onPressed: () {},
              ),
              const SizedBox(height: 14),
              // Apple
              _SocialButton(
                text: 'Continue with Apple',
                icon: 'assets/icons/apple.png',
                onPressed: () {},
              ),
              const SizedBox(height: 26),

              // OR Divider
              Row(
                children: [
                  const Expanded(
                      child: Divider(
                    color: Colors.white24,
                    thickness: 1.2,
                  )),
                  const SizedBox(width: 12),
                  Text(
                    'OR',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                      child: Divider(
                    color: Colors.white24,
                    thickness: 1.2,
                  )),
                ],
              ),

              const SizedBox(height: 22),
              // Social Media Icon Buttons Row: Facebook, Instagram, LinkedIn, Github
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _RoundIconButton(
                    icon: 'assets/icons/facebook.png',
                    color: Color(0xFF1877F3), // Facebook blue
                    onPressed: () {},
                  ),
                  const SizedBox(width: 22),
                  _RoundIconButton(
                    icon: 'assets/icons/instagram.png',
                    color: Color(0xFFC13584), // Instagram pink/purple
                    onPressed: () {},
                  ),
                  const SizedBox(width: 22),
                  _RoundIconButton(
                    icon: 'assets/icons/linkedin.png',
                    color: Color(0xFF0077B5), // LinkedIn blue
                    iconColor: Colors.white,
                    onPressed: () {},
                  ),
                  const SizedBox(width: 22),
                  _RoundIconButton(
                    icon: 'assets/icons/github.png',
                    color: Colors.white, // White background, logo stays dark
                    onPressed: () {},
                  ),
                ],
              ),

              const SizedBox(height: 28),
              // Signup prompt
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.white70, fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        color: Color(0xFF1ED760),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
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
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          side: const BorderSide(color: Colors.white, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 6),
            Image.asset(icon, width: 26, height: 26, fit: BoxFit.contain),
            const SizedBox(width: 20),
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
          ],
        ),
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  final String icon;
  final Color color;
  final VoidCallback onPressed;
  /// When set, the icon is tinted this color (e.g. white logo on colored background).
  final Color? iconColor;

  const _RoundIconButton({
    required this.icon,
    required this.color,
    required this.onPressed,
    this.iconColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget iconWidget = Image.asset(
      icon,
      width: 26,
      height: 26,
      fit: BoxFit.contain,
    );
    if (iconColor != null) {
      iconWidget = ColorFiltered(
        colorFilter: ColorFilter.mode(iconColor!, BlendMode.srcIn),
        child: iconWidget,
      );
    }
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: onPressed,
        child: Ink(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Center(child: iconWidget),
        ),
      ),
    );
  }
}

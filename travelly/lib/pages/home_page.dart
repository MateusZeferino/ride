import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'login_page.dart';

import '../theme/app_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const originalWidth = 560.0;
        const topCropPx = 96.0;
        const bottomCropPx = 158.0;

        final scale = constraints.maxWidth / originalWidth;
        final headerHeight = topCropPx * scale;
        final bottomBarHeight = bottomCropPx * scale;

        return Scaffold(
          backgroundColor: AppColors.background,
          body: Stack(
            children: [
              Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: headerHeight,
                    bottom: bottomBarHeight,
                  ),
                  child: SingleChildScrollView(
                    child: _HomeReferenceBody(
                      topCropPx: topCropPx,
                      bottomCropPx: bottomCropPx,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: _FixedHeader(height: headerHeight, scale: scale),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: _FixedBottomBar(height: bottomBarHeight, scale: scale),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _HomeReferenceBody extends StatelessWidget {
  const _HomeReferenceBody({
    required this.topCropPx,
    required this.bottomCropPx,
  });

  final double topCropPx;
  final double bottomCropPx;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const originalWidth = 560.0;
        const originalHeight = 1948.0;

        final width = constraints.maxWidth;
        final scale = width / originalWidth;
        final topCrop = topCropPx * scale;
        final bottomCrop = bottomCropPx * scale;
        final scaledHeight = originalHeight * scale;
        final contentHeight = scaledHeight - topCrop - bottomCrop;

        return SizedBox(
          height: contentHeight,
          width: width,
          child: ClipRect(
            child: Transform.translate(
              offset: Offset(0, -topCrop),
              child: Image.asset(
                'pages/Tela inicial.png',
                width: width,
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _FixedHeader extends StatelessWidget {
  const _FixedHeader({required this.height, required this.scale});

  final double height;
  final double scale;

  Future<void> _logout(BuildContext context) async {
    await Supabase.instance.client.auth.signOut();
    if (context.mounted) {
      Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: AppColors.background,
      padding: EdgeInsets.symmetric(horizontal: 12 * scale),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => _logout(context),
            child: Container(
              width: 30 * scale,
              height: 30 * scale,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8 * scale),
              ),
              child: Icon(
                Icons.logout,
                color: Colors.white,
                size: 18 * scale,
              ),
            ),
          ),
          const Spacer(),
          Text(
            'HOME',
            style: GoogleFonts.bebasNeue(
              color: AppColors.primary,
              fontSize: 34 * scale,
              letterSpacing: 0.6 * scale,
            ),
          ),
          const Spacer(),
          Icon(
            Icons.notifications,
            color: AppColors.primary,
            size: 20 * scale,
          ),
        ],
      ),
    );
  }
}

class _FixedBottomBar extends StatelessWidget {
  const _FixedBottomBar({required this.height, required this.scale});

  final double height;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(
          top: BorderSide(color: Color(0xFFC7CED6), width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(icon: Icons.home, label: 'Inicio', active: true, scale: scale),
          _NavItem(icon: Icons.person_outline, label: 'Perfil', scale: scale),
          _CenterNavButton(scale: scale),
          _NavItem(icon: Icons.travel_explore, label: 'Viagem', scale: scale),
          _NavItem(icon: Icons.group_outlined, label: 'Amigos', scale: scale),
        ],
      ),
    );
  }
}

class _CenterNavButton extends StatelessWidget {
  const _CenterNavButton({required this.scale});

  final double scale;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58 * scale,
      height: 58 * scale,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.menu, color: Colors.white, size: 30 * scale),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.scale,
    this.active = false,
  });

  final IconData icon;
  final String label;
  final double scale;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final color = active ? const Color(0xFF1E8FFF) : AppColors.primary;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 18 * scale, color: color),
        SizedBox(height: 4 * scale),
        Text(
          label,
          style: GoogleFonts.oswald(
            color: AppColors.primary,
            fontSize: 12 * scale,
          ),
        ),
      ],
    );
  }
}

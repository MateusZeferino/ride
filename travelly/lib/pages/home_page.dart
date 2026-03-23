import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../theme/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  String _resolveDisplayName(User? user) {
    final metadata = user?.userMetadata;
    final username = metadata?['username']?.toString().trim();
    if (username != null && username.isNotEmpty) return username;

    final fullName = metadata?['full_name']?.toString().trim();
    if (fullName != null && fullName.isNotEmpty) return fullName;

    final email = user?.email?.trim();
    if (email != null && email.contains('@')) {
      return email.split('@').first;
    }

    return 'Viajante';
  }

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;
    final displayName = _resolveDisplayName(user);

    final trips = _TripsHorizontalList.allTrips.where((trip) {
      if (_query.isEmpty) return true;
      final query = _query.toLowerCase();
      return trip.city.toLowerCase().contains(query) ||
          trip.stops.toLowerCase().contains(query);
    }).toList();

    final suggestionVisible =
        _query.isEmpty ||
        'divina italia ararangua restaurante'.contains(_query.toLowerCase());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(14, 8, 14, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _TopBar(),
              const SizedBox(height: 12),
              Text(
                'Bom dia, $displayName!',
                style: GoogleFonts.bebasNeue(
                  color: AppColors.primary,
                  fontSize: 46,
                  height: 0.95,
                  letterSpacing: 0.6,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Veja o que está te esperando na estrada',
                style: GoogleFonts.oswald(
                  color: AppColors.textMuted,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 12),
              _SearchBar(
                controller: _searchController,
                onChanged: (value) => setState(() => _query = value.trim()),
              ),
              const SizedBox(height: 12),
              const _PlannerCard(),
              const SizedBox(height: 18),
              const _SectionHeader(title: 'PROXIMAS VIAGENS'),
              const SizedBox(height: 2),
              Text(
                'Clique em uma viagem em aberto para conferir o roteiro',
                style: GoogleFonts.oswald(
                  color: AppColors.textMuted,
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 10),
              _TripsHorizontalList(trips: trips),
              const SizedBox(height: 22),
              const _SectionHeader(title: 'SUGESTOES PRA VOCE'),
              const SizedBox(height: 2),
              Text(
                'Encontre lugares e destinos que sao a sua cara',
                style: GoogleFonts.oswald(
                  color: AppColors.textMuted,
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 10),
              _SuggestionCard(visible: suggestionVisible),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const _BottomNavBar(),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 26,
          height: 26,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            image: const DecorationImage(
              image: AssetImage('assets/images/Foto perfil.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Spacer(),
        Text(
          'HOME',
          style: GoogleFonts.bebasNeue(
            color: AppColors.primary,
            fontSize: 34,
            letterSpacing: 0.6,
          ),
        ),
        const Spacer(),
        const Icon(Icons.notifications, size: 18, color: AppColors.primary),
      ],
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({required this.controller, required this.onChanged});

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: GoogleFonts.oswald(
          color: AppColors.primary,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: 'Pesquise lugares ou pessoas',
          hintStyle: GoogleFonts.oswald(
            color: AppColors.primary.withValues(alpha: 0.8),
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.textMuted,
            size: 18,
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 38,
            minHeight: 40,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          filled: true,
          fillColor: const Color(0xFFD2D9E0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class _PlannerCard extends StatelessWidget {
  const _PlannerCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 14, 12, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF8CA1B7), width: 1),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PENSE, PLANEJE, EXECUTE',
                  style: GoogleFonts.bebasNeue(
                    color: AppColors.primary,
                    fontSize: 20,
                    letterSpacing: 0.4,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Crie um roteiro com origem, destino,\ntipo de rota e paradas no caminho',
                  style: GoogleFonts.oswald(
                    color: AppColors.textMuted,
                    fontSize: 11,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'PLANEJAR SUA PROXIMA VIAGEM',
                    style: GoogleFonts.bebasNeue(
                      color: Colors.white,
                      fontSize: 10.5,
                      letterSpacing: 0.6,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: 105,
              height: 98,
              child: Image.asset(
                'assets/images/Foto - card principal.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.bebasNeue(
            color: AppColors.primary,
            fontSize: 22,
            letterSpacing: 0.4,
          ),
        ),
        const Spacer(),
        Text(
          'ver tudo',
          style: GoogleFonts.oswald(color: AppColors.textMuted, fontSize: 10),
        ),
      ],
    );
  }
}

class _TripsHorizontalList extends StatelessWidget {
  const _TripsHorizontalList({required this.trips});

  static const allTrips = [
    _TripData(
      imagePath: 'assets/images/jpg.jpg',
      city: 'GRAMADO, SC',
      stops: '3 PARADAS',
      date: '30 DEZ | 02 JAN',
      startsAt: '8h',
      endsAt: '20h',
    ),
    _TripData(
      imagePath: 'assets/images/Salvador city Bahia, Brasil, aerial view_.jpg',
      city: 'FLORIANOPOLIS, SC',
      stops: '5 PARADAS',
      date: '01 MAR | 08 ABR',
      startsAt: '4h',
      endsAt: '23h',
    ),
    _TripData(
      imagePath: 'assets/images/aborgue.jpg',
      city: 'SALVADOR, BA',
      stops: '4 PARADAS',
      date: '12 JUL | 20 JUL',
      startsAt: '6h',
      endsAt: '19h',
    ),
  ];

  final List<_TripData> trips;

  @override
  Widget build(BuildContext context) {
    if (trips.isEmpty) {
      return SizedBox(
        height: 120,
        child: Center(
          child: Text(
            'Nenhuma viagem encontrada.',
            style: GoogleFonts.oswald(color: AppColors.textMuted, fontSize: 13),
          ),
        ),
      );
    }

    return SizedBox(
      height: 186,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: trips.length,
        separatorBuilder: (_, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return _TripCard(data: trips[index]);
        },
      ),
    );
  }
}

class _TripData {
  const _TripData({
    required this.imagePath,
    required this.city,
    required this.stops,
    required this.date,
    required this.startsAt,
    required this.endsAt,
  });

  final String imagePath;
  final String city;
  final String stops;
  final String date;
  final String startsAt;
  final String endsAt;
}

class _TripCard extends StatelessWidget {
  const _TripCard({required this.data});

  final _TripData data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 168,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
              color: Color(0x22000000),
              blurRadius: 4,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(6),
              ),
              child: SizedBox(
                height: 88,
                width: double.infinity,
                child: Image.asset(data.imagePath, fit: BoxFit.cover),
              ),
            ),
            Container(
              color: AppColors.primary,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      data.city,
                      style: GoogleFonts.bebasNeue(
                        color: Colors.white,
                        fontSize: 13,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                  Text(
                    data.stops,
                    style: GoogleFonts.bebasNeue(
                      color: Colors.white,
                      fontSize: 13,
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 6, 8, 0),
              child: Text(
                data.date,
                style: GoogleFonts.oswald(
                  color: AppColors.textMuted,
                  fontSize: 9,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 1, 8, 0),
              child: Row(
                children: [
                  Text(
                    data.startsAt,
                    style: GoogleFonts.oswald(
                      color: AppColors.primary,
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    ' - ',
                    style: GoogleFonts.oswald(
                      color: AppColors.textMuted,
                      fontSize: 9,
                    ),
                  ),
                  Text(
                    data.endsAt,
                    style: GoogleFonts.oswald(
                      color: AppColors.primary,
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SuggestionCard extends StatelessWidget {
  const _SuggestionCard({required this.visible});

  final bool visible;

  @override
  Widget build(BuildContext context) {
    if (!visible) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Text(
          'Nenhuma sugestao encontrada.',
          style: GoogleFonts.oswald(color: AppColors.textMuted, fontSize: 13),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x18000000),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: SizedBox(
              height: 240,
              width: double.infinity,
              child: Image.asset(
                'assets/images/italiano.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: AppColors.primary,
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Divina Italia',
                        style: GoogleFonts.oswald(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      'figma/star.svg',
                      width: 14,
                      height: 14,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFFFEDB41),
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '4.8',
                      style: GoogleFonts.oswald(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Restaurante',
                      style: GoogleFonts.oswald(
                        color: const Color(0xFFD5DFE9),
                        fontSize: 10,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Ver detalhes',
                      style: GoogleFonts.oswald(
                        color: const Color(0xFFD5DFE9),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 1),
                Text(
                  'Ararangua, SC',
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontSize: 10.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(top: BorderSide(color: Color(0xFFBAC6D3), width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          _NavItem(
            iconPath: 'figma/house-blank.svg',
            label: 'Inicio',
            active: true,
          ),
          _NavItem(iconPath: 'figma/user.svg', label: 'Perfil'),
          _CenterMenuButton(),
          _NavItem(iconPath: 'figma/map-marker.svg', label: 'Viagem'),
          _NavItem(iconPath: 'figma/users.svg', label: 'Amigos'),
        ],
      ),
    );
  }
}

class _CenterMenuButton extends StatelessWidget {
  const _CenterMenuButton();

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -12),
      child: Container(
        width: 56,
        height: 56,
        decoration: const BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.menu, color: Colors.white, size: 32),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.iconPath,
    required this.label,
    this.active = false,
  });

  final String iconPath;
  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final iconColor = active ? const Color(0xFF1E8FFF) : AppColors.primary;

    return SizedBox(
      width: 56,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 16,
            height: 16,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.oswald(color: AppColors.primary, fontSize: 9),
          ),
        ],
      ),
    );
  }
}

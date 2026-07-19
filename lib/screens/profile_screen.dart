import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/wiewmodel/provider/providers.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProfileProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF263238),
      appBar: AppBar(
        title: const Text('PROFIL', style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF263238),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.transparent,
                child: ClipOval(child: Image.network(user.avatarUrl)),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              user.name.toUpperCase(),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 1.5),
            ),
            const SizedBox(height: 8),
            Text(
              user.email,
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                height: 1,
                color: Colors.white24,
              ),
            ),
            const SizedBox(height: 20),
            _ProfileItem(icon: Icons.history, label: 'Mes commandes'),
            _ProfileItem(icon: Icons.location_on_outline, label: 'Mes adresses'),
            _ProfileItem(icon: Icons.favorite_border, label: 'Mes favoris'),
            _ProfileItem(icon: Icons.settings_outlined, label: 'Paramètres'),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF263238),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                ),
                child: const Text('DECONNEXION', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ProfileItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white, size: 24),
      title: Text(
        label.toUpperCase(),
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.2),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white70),
      contentPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 4),
      onTap: () {},
    );
  }
}

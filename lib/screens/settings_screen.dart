import 'package:flutter/material.dart';

import '../feedback_fx.dart';
import '../stats_store.dart';
import '../theme.dart';
import '../widgets/chunky_button.dart';
import 'onboarding_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key, required this.store});
  final StatsStore store;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  StatsStore get s => widget.store;

  Future<void> _confirmReset() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: AppColors.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
          side: const BorderSide(color: AppColors.ink, width: 2.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('İlerleme sıfırlansın mı?',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
              const SizedBox(height: 8),
              const Text('Öğrenilen kelimeler, doğrular ve seriler silinir. Ayarların kalır.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: AppColors.inkSoft, fontWeight: FontWeight.w700)),
              const SizedBox(height: 20),
              ChunkyButton(
                outlined: true,
                color: AppColors.blush,
                padding: const EdgeInsets.symmetric(vertical: 14),
                onTap: () => Navigator.of(context).pop(true),
                child: const Text('Evet, sıfırla', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900)),
              ),
              const SizedBox(height: 10),
              ChunkyButton(
                outlined: true,
                depth: 4,
                color: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                onTap: () => Navigator.of(context).pop(false),
                child: const Text('Vazgeç', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
              ),
            ],
          ),
        ),
      ),
    );
    if (ok == true) {
      await s.resetProgress();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('İlerleme sıfırlandı')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              children: [
                Row(children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back_rounded, color: AppColors.ink),
                  ),
                  const Text('Ayarlar', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
                ]),
                const SizedBox(height: 12),
                _section('Ses ve titreşim'),
                _box([
                  _switch(
                    icon: Icons.volume_up_rounded,
                    color: AppColors.mint,
                    title: 'Ses efektleri',
                    subtitle: 'Doğru ve yanlış cevap sesleri',
                    value: s.soundOn,
                    onChanged: (v) {
                      setState(() => s.soundOn = v);
                      if (v) FeedbackFx.of(s).correct();
                    },
                  ),
                  _divider(),
                  _switch(
                    icon: Icons.vibration_rounded,
                    color: AppColors.peach,
                    title: 'Titreşim',
                    subtitle: 'Cevap verince hafif titreşim',
                    value: s.hapticsOn,
                    onChanged: (v) => setState(() => s.hapticsOn = v),
                  ),
                ]),
                const SizedBox(height: 20),
                _section('Diğer'),
                _box([
                  _action(
                    icon: Icons.play_circle_rounded,
                    color: AppColors.lavender,
                    title: 'Tanıtımı yeniden göster',
                    onTap: () {
                      s.onboardingDone = false;
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => OnboardingScreen(store: s)),
                        (_) => false,
                      );
                    },
                  ),
                  _divider(),
                  _action(
                    icon: Icons.restart_alt_rounded,
                    color: AppColors.blush,
                    title: 'İlerlemeyi sıfırla',
                    onTap: _confirmReset,
                  ),
                ]),
                const SizedBox(height: 28),
                const Center(
                  child: Text('DilSprint 0.1.0',
                      style: TextStyle(color: AppColors.inkSoft, fontWeight: FontWeight.w700)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _section(String t) => Padding(
        padding: const EdgeInsets.only(left: 4, bottom: 8),
        child: Text(t, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: AppColors.inkSoft)),
      );

  Widget _box(List<Widget> children) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: AppColors.ink, width: 2.5),
          boxShadow: const [BoxShadow(color: AppColors.ink, offset: Offset(0, 4))],
        ),
        child: Column(children: children),
      );

  Widget _divider() => const Divider(height: 1, thickness: 1.5, color: Color(0x222E2A4F));

  Widget _iconBox(IconData icon, Color color) => Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.ink, width: 2),
        ),
        child: Icon(icon, color: AppColors.ink, size: 22),
      );

  Widget _switch({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(children: [
          _iconBox(icon, color),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900)),
              Text(subtitle,
                  style: const TextStyle(fontSize: 13, color: AppColors.inkSoft, fontWeight: FontWeight.w700)),
            ]),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: Colors.white,
            activeTrackColor: AppColors.accent,
          ),
        ]),
      );

  Widget _action({
    required IconData icon,
    required Color color,
    required String title,
    required VoidCallback onTap,
  }) =>
      InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(children: [
            _iconBox(icon, color),
            const SizedBox(width: 12),
            Expanded(child: Text(title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900))),
            const Icon(Icons.chevron_right_rounded, color: AppColors.inkSoft),
          ]),
        ),
      );
}

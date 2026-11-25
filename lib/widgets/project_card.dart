import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/screens/experience_form.dart';
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:myportofolio_mobile/screens/project_form.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () async {
          // Add Project
          if (item.name == "Add Project") {
            final loggedIn = await ensureLoggedIn(context);

            if (!context.mounted || !loggedIn) return;

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text("Kamu telah menekan tombol Add Project!"),
                ),
              );

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProjectFormPage(),
              ),
            );
            return;
          }

          // Add Experience
          if (item.name == "Add Experience") {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text("Kamu telah menekan tombol Add Experience!"),
                ),
              );

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExperienceFormPage(),
              ),
            );
            return;
          }

          // Logout
          if (item.name == "Logout") {
            final authState = context.read<AuthState>();

            if (!authState.isLoggedIn) return;

            await authState.logout();

            if (!context.mounted) return;

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text("Kamu berhasil logout!"),
                ),
              );
            return;
          }

          // SnackBar untuk kartu lainnya
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  "Kamu telah menekan tombol ${item.name}!",
                ),
              ),
            );
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
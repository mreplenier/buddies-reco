import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 1. LA MÉMOIRE : l'onglet actif
  int currentIndex = 0;

  final List<String> entries = <String>[];
  final List<int> colorCodes = <int>[];

  @override
  Widget build(BuildContext context) {
    late final List<Widget> pages = [
      Center(
        child: Column(
          children: [
            Text('🏠 Page Accueil'),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(
                  30,
                ), // pour ajouter des marges autour de la liste
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 120,
                    color: Colors.amber[colorCodes[index]],
                    child: Center(child: Text(entries[index])),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            ),
          ],
        ),
      ),
      const Center(child: Text('🔍 Page Recherche')),
      const Center(child: Text('👤 Page Profil')),
      const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('⚙️ Page Paramètres', textAlign: TextAlign.center),
            Text(
              'Mario c\'est pas un jeu, c\'est une licence ! Lequel, faut être précis !',
            ),
          ],
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Buddies Reco'), centerTitle: true),

      // 3. LE CONTENU : il change selon l'index
      body: pages[currentIndex],

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            entries.add("Nouveau lien spotify");
            colorCodes.add(100);
          });
        },
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
      // 4. LA BARRE DE NAVIGATION
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex, // Allume l'icône selon la mémoire
        onDestinationSelected: (int indexClique) {
          // L'ordre magique pour redessiner
          setState(() {
            currentIndex = indexClique;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Accueil'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Recherche'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profil'),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Paramètres',
          ),
        ],
      ),
    );
  }
}

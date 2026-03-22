import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 1. LA MÉMOIRE : l'onglet actif
  int currentIndex = 0;

  // 2. LA LISTE DES PAGES : ce qu'on affiche au milieu
  final List<Widget> pages = [
    const Center(child: Text('🏠 Page Accueil')),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buddies Reco'), centerTitle: true),

      // 3. LE CONTENU : il change selon l'index
      body: pages[currentIndex],

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

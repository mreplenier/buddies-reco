import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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

  // fonction de text editor pour le lien spotify
  final TextEditingController _linkText = TextEditingController();
  @override
  void dispose() {
    _linkText.dispose();
    super.dispose();
  }

  //fonction d'ajout de lien spotify
  void _addLinkFunction() {
    _dialogBuilder(context);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
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
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsetsGeometry.all(8),
                              child: ClipRRect(
                                // Arrondit les angles de l'image
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  entries[index],
                                  width: 220,
                                  height: 220,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            // Le ressort invisible qui pousse le bouton à droite
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  entries.removeAt(index);
                                });
                              },
                              icon: const Icon(Icons.remove_circle),
                              color: Colors.red[400],
                            ),
                          ],
                        ),
                        const Text(
                          '⭐⭐⭐⭐⭐',
                          textAlign: TextAlign.center,
                          textScaler: TextScaler.linear(2),
                        ),
                      ],
                    ),
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
        onPressed: _addLinkFunction,
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

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Nouveau lien'),
          content: TextFormField(
            controller: _linkText,
            decoration: InputDecoration(label: Text("lien spotify")),
            cursorWidth: 1,
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Retour'),
              onPressed: () {
                Navigator.of(context).pop();
                _linkText.clear();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Ajouter'),
              onPressed: () async {
                final String url = _linkText.text;
                Navigator.of(context).pop();
                _linkText.clear();
                final Map<String, dynamic> responseJson = jsonDecode(
                  (await http.get(
                    Uri.parse('https://open.spotify.com/oembed?url=$url'),
                  )).body,
                );
                setState(() {
                  entries.add(responseJson['thumbnail_url']);
                });
              },
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:test_task/contextual_menu.dart';
import 'package:test_task/js_api.dart';

/// Entrypoint of the application.
void main() {
  runApp(const MyApp());
}

/// The main application widget.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const HomePage(),
    );
  }
}

/// [Widget] displaying the home page consisting of an image and buttons.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

/// State of the [HomePage] widget.
class _HomePageState extends State<HomePage> {
  final TextEditingController urlController = TextEditingController();
  OverlayEntry? overlayEntry;
  final LayerLink _layerLink = LayerLink();

  /// Displays the contextual menu overlay.
  void showOverlay() {
    overlayEntry = OverlayEntry(
      builder: (context) {
        return ContextualMenu(
          overlayEntry: overlayEntry,
          layerLink: _layerLink,
        );
      },
    );

    if (overlayEntry != null) {
      Overlay.of(context).insert(overlayEntry!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image section
            Expanded(
              child: GestureDetector(
                onDoubleTap: () {
                  toggleFullscreen();
                },
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                      ),
                      child: HtmlElementView.fromTagName(tagName: 'img'),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            // URL input and button section
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: urlController,
                    decoration: const InputDecoration(hintText: 'Image URL'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (urlController.text.isEmpty) return;
                    setImageSource(urlController.text);
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                    child: Icon(Icons.arrow_forward),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 64),
          ],
        ),
      ),
      floatingActionButton: CompositedTransformTarget(
        link: _layerLink,
        child: FloatingActionButton(
          onPressed: () {
            showOverlay();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

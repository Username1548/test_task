import 'package:flutter/material.dart';
import 'package:test_task/js_api.dart';

/// [Widget] that displays the contextual menu with two buttons.
class ContextualMenu extends StatefulWidget {
  const ContextualMenu({super.key, this.overlayEntry, required this.layerLink});
  final OverlayEntry? overlayEntry;
  final LayerLink layerLink;

  @override
  State<ContextualMenu> createState() => _ContextualMenuState();
}

class _ContextualMenuState extends State<ContextualMenu> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              widget.overlayEntry?.remove();
            },
            child: Container(
              alignment: Alignment.center,
              color: Colors.black.withValues(alpha: 0.5),
            ),
          ),
          Positioned(
            child: CompositedTransformFollower(
              followerAnchor: Alignment.bottomRight,
              targetAnchor: Alignment.topLeft,
              showWhenUnlinked: false,
              link: widget.layerLink,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {
                          widget.overlayEntry?.remove();
                          enterFullScreen();
                        },
                        child: Text('Enter fullscreen'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {
                          widget.overlayEntry?.remove();
                          exitFullscreen();
                        },
                        child: Text('Exit fullscreen'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            child: CompositedTransformFollower(
              followerAnchor: Alignment.center,
              targetAnchor: Alignment.center,
              showWhenUnlinked: false,
              link: widget.layerLink,
              child: FloatingActionButton(
                onPressed: () {
                  widget.overlayEntry?.remove();
                },
                child: Icon(Icons.add),
              ),
            ),
          )
        ],
      ),
    );
  }
}

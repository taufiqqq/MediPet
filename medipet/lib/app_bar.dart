// app_bar.dart
import 'package:flutter/material.dart';

class SharedAppBar extends AppBar {
  SharedAppBar({Key? key, required Widget title, required BuildContext context})
      : super(
          key: key,
          backgroundColor: Colors.transparent,
          title: title,
          actions: [
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () => _showPopupMenu(context),
            ),
          ],
          automaticallyImplyLeading: false,
          elevation: 0,
        );

  static void _showPopupMenu(BuildContext context) async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
          1000.0, 50.0, 0.0, 0.0), // Adjust the position as needed
      items: [
        PopupMenuItem(
          child: ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context); // Close the menu
              // Check if already on the Home page
              if (ModalRoute.of(context)!.settings.name != '/home') {
                Navigator.pushNamed(
                    context, '/home'); // Navigate to Home page
              }
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            title: Text('Disease Scanner'),
            onTap: () {
              Navigator.pop(context); // Close the menu

              // Check if already on the Disease Scanner page
              if (ModalRoute.of(context)!.settings.name != '/scanner') {
                Navigator.pushNamed(
                    context, '/scanner'); // Navigate to Disease page
              }
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            title: Text('Chat PawPal'),
            onTap: () {
              Navigator.pop(context);

              // Check if already on the Chat PawPal page
              if (ModalRoute.of(context)!.settings.name != '/chat') {
                Navigator.pushNamed(
                    context, '/chat'); // Navigate to Chat page
              }
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            title: Text('Nearby PetCare'),
            onTap: () {
              Navigator.pop(context);

              // Check if already on the Nearby PetCare page
              if (ModalRoute.of(context)!.settings.name != '/petcare') {
                Navigator.pushNamed(
                    context, '/petcare'); // Navigate to PetCare page
              }
            },
          ),
        ),
      ],
      elevation: 8.0,
    );
  }
}

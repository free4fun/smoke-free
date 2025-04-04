import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Language'),
              subtitle: const Text('Select your preferred language'),
              onTap: () {
                // Navigate to language selection screen (to be implemented)
              },
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const Icon(Icons.palette),
              title: const Text('Theme'),
              subtitle: const Text('Light / Dark Mode'),
              trailing: Switch(
                value: Theme.of(context).brightness == Brightness.dark,
                onChanged: (value) {
                  // Implement theme change logic (to be implemented)
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              subtitle: const Text('Enable or disable notifications'),
              trailing: Switch(
                value:
                    true, // This should be linked to your provider or settings state
                onChanged: (value) {
                  // Implement notifications toggle logic (to be implemented)
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              subtitle: const Text('Learn more about this app'),
              onTap: () {
                // Show an about dialog or navigate to an about screen
                showAboutDialog(
                  context: context,
                  applicationName: 'Smoke Free',
                  applicationVersion: '1.0.0',
                  children: [
                    const Text(
                      'Smoke Free is an app designed to help you track and reduce cigarette consumption.',
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

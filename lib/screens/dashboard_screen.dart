import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state_provider.dart';
import '../models/alert.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateProvider>(
      builder: (context, appState, child) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Weather Widget
              _buildWeatherWidget(context, appState),
              
              const SizedBox(height: 24),
              
              // Alerts Section
              _buildAlertsSection(context, appState),
              
              const SizedBox(height: 24),
              
              // Quick Actions
              _buildQuickActions(context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildWeatherWidget(BuildContext context, AppStateProvider appState) {
    final weather = appState.currentWeather;
    if (weather == null) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.1),
            Theme.of(context).colorScheme.primary.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
      ),
      child: Column(
        children: [
          Text(
            '${weather.temperature.round()}°C',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            weather.condition,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildWeatherDetail(
                context,
                'Humidity',
                '${weather.humidity}%',
              ),
              _buildWeatherDetail(
                context,
                'Wind',
                '${weather.windSpeed.round()} km/h',
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Refresh Location/Weather Button
          ElevatedButton.icon(
            onPressed: () async {
              await appState.refreshWeatherData();
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Weather updated with your current location!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Update Location & Weather'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              foregroundColor: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherDetail(BuildContext context, String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }

  Widget _buildAlertsSection(BuildContext context, AppStateProvider appState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Today\'s Alerts',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 16),
        ...appState.alerts.map((alert) => _buildAlertCard(context, alert)),
      ],
    );
  }

  Widget _buildAlertCard(BuildContext context, Alert alert) {
    Color borderColor;
    Color backgroundColor;
    IconData icon;
    
    switch (alert.priority) {
      case 'high':
        borderColor = Colors.red.withOpacity(0.3);
        backgroundColor = Colors.red.withOpacity(0.1);
        icon = Icons.warning;
        break;
      case 'medium':
        borderColor = Colors.orange.withOpacity(0.3);
        backgroundColor = Colors.orange.withOpacity(0.1);
        icon = Icons.info;
        break;
      default:
        borderColor = Colors.blue.withOpacity(0.3);
        backgroundColor = Colors.blue.withOpacity(0.1);
        icon = Icons.notification_important;
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 32,
            color: borderColor.withOpacity(0.8),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  alert.message.split('(')[0].trim(),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                if (alert.message.contains('('))
                  Text(
                    alert.message.split('(')[1].replaceAll(')', ''),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.2,
          children: [
            _buildActionCard(
              context,
              'Ask AI',
              Icons.mic,
              () {
                // Navigate to voice screen
                final mainScreen = context.findAncestorStateOfType<State>();
                if (mainScreen != null && mainScreen.mounted) {
                  (mainScreen as dynamic).setState(() {
                    (mainScreen as dynamic)._currentIndex = 1;
                  });
                }
              },
            ),
            _buildActionCard(
              context,
              'Photo Analysis',
              Icons.camera_alt,
              () {
                // Navigate to camera screen
                final mainScreen = context.findAncestorStateOfType<State>();
                if (mainScreen != null && mainScreen.mounted) {
                  (mainScreen as dynamic).setState(() {
                    (mainScreen as dynamic)._currentIndex = 2;
                  });
                }
              },
            ),
            _buildActionCard(
              context,
              'Weather',
              Icons.wb_sunny,
              () {
                // Navigate to weather screen
                final mainScreen = context.findAncestorStateOfType<State>();
                if (mainScreen != null && mainScreen.mounted) {
                  (mainScreen as dynamic).setState(() {
                    (mainScreen as dynamic)._currentIndex = 3;
                  });
                }
              },
            ),
            _buildActionCard(
              context,
              'Schemes',
              Icons.description,
              () {
                // Navigate to schemes screen
                final mainScreen = context.findAncestorStateOfType<State>();
                if (mainScreen != null && mainScreen.mounted) {
                  (mainScreen as dynamic).setState(() {
                    (mainScreen as dynamic)._currentIndex = 4;
                  });
                }
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionCard(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 32,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

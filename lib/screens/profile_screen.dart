import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state_provider.dart';
import '../providers/theme_provider.dart';
import '../screens/auth_screen.dart';
import '../data/app_data.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isEditing = false;
  final _formKey = GlobalKey<FormState>();
  
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _landAreaController;
  
  String? _selectedDistrict;
  String? _selectedSoilType;
  Set<String> _selectedCrops = {};

  @override
  void initState() {
    super.initState();
    final appState = Provider.of<AppStateProvider>(context, listen: false);
    final user = appState.currentUser;
    
    _nameController = TextEditingController(text: user?.name ?? '');
    _phoneController = TextEditingController(text: user?.phone ?? '');
    _landAreaController = TextEditingController(text: user?.landArea ?? '');
    _selectedDistrict = user?.location.replaceAll(', Kerala', '') ?? '';
    _selectedSoilType = user?.soilType ?? 'Laterite';
    _selectedCrops = Set.from(user?.crops ?? []);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _landAreaController.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate() || _selectedCrops.isEmpty) {
      if (_selectedCrops.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select at least one crop'),
            backgroundColor: Colors.red,
          ),
        );
      }
      return;
    }

    final appState = Provider.of<AppStateProvider>(context, listen: false);
    final currentUser = appState.currentUser!;
    
    final updatedUser = currentUser.copyWith(
      name: _nameController.text.trim(),
      phone: _phoneController.text.trim(),
      location: '$_selectedDistrict, Kerala',
      landArea: _landAreaController.text.trim(),
      soilType: _selectedSoilType!,
      crops: _selectedCrops.toList(),
    );

    await appState.updateProfile(updatedUser);
    
    setState(() {
      _isEditing = false;
    });
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile updated successfully'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  void _cancelEdit() {
    final appState = Provider.of<AppStateProvider>(context, listen: false);
    final user = appState.currentUser;
    
    setState(() {
      _isEditing = false;
      _nameController.text = user?.name ?? '';
      _phoneController.text = user?.phone ?? '';
      _landAreaController.text = user?.landArea ?? '';
      _selectedDistrict = user?.location.replaceAll(', Kerala', '') ?? '';
      _selectedSoilType = user?.soilType ?? 'Laterite';
      _selectedCrops = Set.from(user?.crops ?? []);
    });
  }

  Future<void> _logout() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?\nനിങ്ങൾക്ക് ലോഗ് ഔട്ട് ചെയ്യണമെന്ന് ഉറപ്പാണോ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );

    if (confirm == true && mounted) {
      final appState = Provider.of<AppStateProvider>(context, listen: false);
      await appState.logout();
      
      if (mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const AuthScreen()),
          (route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<AppStateProvider, ThemeProvider>(
      builder: (context, appState, themeProvider, child) {
        final user = appState.currentUser;
        
        if (user == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Header
              Container(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Profile',
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          user.name.split('(')[0].trim(),
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                    if (!_isEditing)
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _isEditing = true;
                          });
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              if (_isEditing) ...[
                _buildEditForm(context),
              ] else ...[
                _buildProfileInfo(context, user),
              ],
              
              const SizedBox(height: 24),
              
              // Theme Toggle
              _buildThemeToggle(context, themeProvider),
              
              const SizedBox(height: 24),
              
              // Logout Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _logout,
                  icon: const Icon(Icons.logout),
                  label: const Text('Logout / പുറത്തുകടക്കുക'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEditForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Edit Profile',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 16),
          
          // Name field
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'പേര് (Name)',
              hintText: 'Enter your name',
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          
          const SizedBox(height: 16),
          
          // Phone field
          TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: 'ഫോൺ നമ്പർ (Phone Number)',
              hintText: 'Enter phone number',
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your phone number';
              }
              final phoneRegex = RegExp(r'^[6-9]\d{9}$');
              if (!phoneRegex.hasMatch(value.trim())) {
                return 'Please enter a valid phone number';
              }
              return null;
            },
          ),
          
          const SizedBox(height: 16),
          
          // District dropdown
          DropdownButtonFormField<String>(
            value: _selectedDistrict,
            decoration: const InputDecoration(
              labelText: 'സ്ഥലം (Location)',
            ),
            items: AppData.keralaDistricts.map((district) {
              return DropdownMenuItem(
                value: district,
                child: Text(district),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedDistrict = value;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select your district';
              }
              return null;
            },
          ),
          
          const SizedBox(height: 16),
          
          // Land area field
          TextFormField(
            controller: _landAreaController,
            decoration: const InputDecoration(
              labelText: 'Land Area',
              hintText: 'e.g., 2.5 acres',
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your land area';
              }
              return null;
            },
          ),
          
          const SizedBox(height: 16),
          
          // Soil type dropdown
          DropdownButtonFormField<String>(
            value: _selectedSoilType,
            decoration: const InputDecoration(
              labelText: 'Soil Type',
            ),
            items: ['Laterite', 'Alluvial', 'Clay', 'Sandy', 'Loam'].map((soil) {
              return DropdownMenuItem(
                value: soil,
                child: Text(soil),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedSoilType = value;
              });
            },
          ),
          
          const SizedBox(height: 16),
          
          // Crops selection
          Text(
            'പ്രധാന വിളകൾ (Main Crops)',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: AppData.crops.map((crop) {
              final isSelected = _selectedCrops.contains(crop);
              return FilterChip(
                label: Text(crop),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _selectedCrops.add(crop);
                    } else {
                      _selectedCrops.remove(crop);
                    }
                  });
                },
              );
            }).toList(),
          ),
          
          const SizedBox(height: 24),
          
          // Save/Cancel buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _cancelEdit,
                  child: const Text('Cancel'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: _saveProfile,
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfo(BuildContext context, user) {
    return Column(
      children: [
        _buildInfoCard(context, 'പേര് (Name)', user.name),
        _buildInfoCard(context, 'ഫോൺ (Phone)', user.phone),
        _buildInfoCard(context, 'സ്ഥലം (Location)', user.location),
        _buildInfoCard(context, 'വിളകൾ (Crops)', user.crops.join(', ')),
        _buildInfoCard(context, 'Land Area', user.landArea),
        _buildInfoCard(context, 'Soil Type', user.soilType),
      ],
    );
  }

  Widget _buildInfoCard(BuildContext context, String label, String value) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildThemeToggle(BuildContext context, ThemeProvider themeProvider) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Theme.of(context).brightness == Brightness.dark 
                    ? Icons.dark_mode 
                    : Icons.light_mode,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 12),
              Text(
                'Theme',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
          Switch(
            value: themeProvider.themeMode == ThemeMode.dark,
            onChanged: (value) {
              themeProvider.setThemeMode(
                value ? ThemeMode.dark : ThemeMode.light,
              );
            },
          ),
        ],
      ),
    );
  }
}

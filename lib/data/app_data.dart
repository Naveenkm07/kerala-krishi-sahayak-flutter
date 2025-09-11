class AppData {
  static const Map<String, dynamic> weather = {
    'current': {
      'location': 'Wayanad, Kerala',
      'temperature': 28,
      'humidity': 78,
      'rainfall': 0,
      'windSpeed': 12,
      'condition': 'Partly Cloudy'
    },
    'forecast': [
      {'day': 'Today', 'temp': '28°C', 'condition': 'Partly Cloudy', 'rain': '10%'},
      {'day': 'Tomorrow', 'temp': '30°C', 'condition': 'Sunny', 'rain': '5%'},
      {'day': 'Day 3', 'temp': '26°C', 'condition': 'Light Rain', 'rain': '80%'},
      {'day': 'Day 4', 'temp': '25°C', 'condition': 'Heavy Rain', 'rain': '90%'},
      {'day': 'Day 5', 'temp': '27°C', 'condition': 'Cloudy', 'rain': '40%'}
    ]
  };

  static const List<Map<String, dynamic>> alerts = [
    {
      'id': 1,
      'type': 'irrigation',
      'message': 'വെള്ളം നൽകാൻ സമയം (Time for irrigation)',
      'priority': 'high',
      'date': '2025-09-11'
    },
    {
      'id': 2,
      'type': 'pest',
      'message': 'Brown plant hopper alert in your area',
      'priority': 'medium',
      'date': '2025-09-10'
    }
  ];

  static const List<Map<String, dynamic>> schemes = [
    {
      'name': 'Pradhan Mantri Fasal Bima Yojana',
      'description': 'Crop Insurance scheme covering all food grains, oilseeds and horticultural crops',
      'eligibility': 'All farmers including sharecroppers and tenant farmers',
      'deadline': '31st December 2025',
      'contact': '1800-200-7710'
    },
    {
      'name': 'Kerala Coconut Development Board Scheme',
      'description': 'Financial assistance for coconut cultivation and processing',
      'eligibility': 'Coconut farmers in Kerala',
      'deadline': '31st March 2026',
      'contact': '0484-2377266'
    },
    {
      'name': 'Organic Farming Promotion Scheme',
      'description': 'Support for transition to organic farming methods',
      'eligibility': 'Farmers interested in organic cultivation',
      'deadline': 'Ongoing',
      'contact': '0471-2302086'
    }
  ];

  static const List<Map<String, dynamic>> pestDiseases = [
    {
      'name': 'Brown Plant Hopper',
      'crop': 'Paddy',
      'symptoms': 'Yellowing and drying of plants from bottom',
      'treatment': 'Apply Imidacloprid 17.8% SL @ 125 ml/acre',
      'prevention': 'Maintain proper water level, avoid excess nitrogen'
    },
    {
      'name': 'Coconut Scale Insect',
      'crop': 'Coconut',
      'symptoms': 'White cotton-like patches on leaves',
      'treatment': 'Spray Malathion 50% EC @ 2ml/litre water',
      'prevention': 'Regular inspection and cleaning of affected parts'
    }
  ];

  static const List<Map<String, dynamic>> cropCalendar = [
    {
      'month': 'September',
      'activities': [
        'Kharif paddy transplanting',
        'Coconut harvest season begins',
        'Spice plantation maintenance',
        'Prepare land for winter crops'
      ]
    },
    {
      'month': 'October',
      'activities': [
        'Post-harvest paddy management',
        'Coconut processing and storage',
        'Winter vegetable sowing',
        'Fertilizer application for perennial crops'
      ]
    }
  ];

  static const Map<String, String> aiResponses = {
    'പാടി കൃഷി': 'Paddy cultivation requires well-drained soil and consistent water supply. For Kerala conditions, use varieties like Jyothi or Uma. Transplant 25-30 day old seedlings with 15cm spacing.',
    'തെങ്ങ് രോഗം': 'Common coconut diseases include bud rot and stem bleeding. Ensure proper drainage, apply bordeaux mixture, and remove affected parts immediately.',
    'weather paddy': 'With current weather conditions, ensure proper drainage in paddy fields. Expected rain in 2 days is beneficial for crop growth.',
    'fertilizer coconut': 'Apply 1.3 kg urea, 2 kg superphosphate, and 2 kg muriate of potash per coconut tree annually in 2-3 splits.',
    'irrigation': 'നിലവിലെ കാലാവസ്ഥാ സാഹചര്യങ്ങൾ പരിഗണിക്കുമ്പോൾ, നെൽകൃഷിയിൽ വെള്ളം കുറവായിരിക്കാം. പതിവ് നിരീക്ഷണം നടത്തുക.',
    'pest control': 'Brown plant hopper is common in monsoon season. Use light traps, maintain proper water level, and apply recommended pesticides if needed.',
    'fertilizer': 'For this season, apply organic compost and reduce chemical fertilizer usage. Rainfall will help nutrient absorption.',
    'coconut': 'Coconut trees need regular inspection during monsoon. Remove dead fronds and check for pest infestation.',
    'spices': 'Spice cultivation requires good drainage during heavy rains. Ensure proper mulching and pest management.'
  };

  static const List<String> keralaDistricts = [
    'Wayanad',
    'Palakkad',
    'Thrissur',
    'Kottayam',
    'Alappuzha',
    'Ernakulam',
    'Idukki',
    'Kollam',
    'Thiruvananthapuram',
    'Pathanamthitta',
    'Kozhikode',
    'Malappuram',
    'Kannur',
    'Kasaragod'
  ];

  static const List<String> crops = [
    'Paddy',
    'Coconut',
    'Spices',
    'Vegetables',
    'Rubber',
    'Tea',
    'Coffee',
    'Cardamom',
    'Pepper',
    'Banana'
  ];
}

# Kerala Krishi Sahayak - Krishi Sakhi 🌾

**Smart India Hackathon 2025 | Problem Statement ID: 25074**

AI-Powered Personal Farming Assistant for Kerala Farmers

> **One-line Pitch:** A Malayalam-first, conversational digital companion that helps smallholder farmers record activities, get personalized advisories, and receive timely reminders using AI and local context.

---

## 🏆 SIH 2025 Submission

**🎯 For Judges & Evaluators:**
- **[📋 Complete SIH Documentation](./README-SIH.md)** - Comprehensive submission details
- **[🎬 Demo Plan & Script](./demo-plan.md)** - 3-minute demo walkthrough  
- **[🧪 Sample Data](./sample_data/)** - Demo farmer profiles and test scenarios
- **[🤖 AI Prompt Engineering](./windsurf_prompts.md)** - Advanced AI conversation templates
- **[📱 Ready APK](./build/app/outputs/flutter-apk/app-debug.apk)** - Install and test immediately

---

## 📱 Overview

Kerala Krishi Sahayak is a comprehensive mobile application designed specifically for farmers in Kerala, India. This Flutter application provides bilingual support (Malayalam/English) and offers intelligent farming assistance through various features including weather forecasting, AI-powered crop advice, pest/disease analysis, and government scheme information.

## ✨ Features

### 🔐 User Authentication
- **Farmer Registration**: Simple onboarding with crop selection and location-based setup
- **Profile Management**: Editable farmer profiles with land area, soil type, and crop preferences
- **Data Persistence**: Local storage using SharedPreferences

### 🏠 Dashboard
- **Weather Widget**: Real-time weather display with temperature, humidity, and conditions
- **Smart Alerts**: Priority-based notifications for irrigation, pest warnings, and farming activities
- **Quick Actions**: Easy access to key app features

### 🤖 AI Assistant
- **Bilingual Chat Interface**: Support for both Malayalam and English queries
- **Crop-Specific Advice**: Intelligent responses for paddy, coconut, spices, and vegetable cultivation
- **Voice Input Simulation**: Voice-to-text capability (simulated for demo)
- **Contextual Responses**: Weather-aware and location-specific farming recommendations

### 📷 Photo Analysis
- **Pest/Disease Detection**: AI-powered analysis of crop photos
- **Treatment Recommendations**: Specific treatment and prevention advice
- **Camera Integration**: Direct photo capture or gallery selection
- **Detailed Results**: Confidence levels and comprehensive information

### 🌤️ Weather Forecasting
- **5-Day Forecast**: Detailed weather predictions for farming planning
- **Farming Advice**: Weather-based recommendations for agricultural activities
- **Visual Weather Display**: Intuitive temperature, humidity, and rainfall indicators

### 📋 Government Schemes
- **Scheme Database**: Comprehensive list of agricultural schemes available in Kerala
- **Detailed Information**: Eligibility criteria, deadlines, and contact information
- **Direct Contact**: Quick access to scheme helpline numbers

### 📅 Farming Calendar
- **Monthly Activities**: Season-specific farming tasks and recommendations
- **Crop Calendar**: Activity scheduling based on crop types and growing seasons
- **Reminder System**: Upcoming task notifications and deadline tracking

### 🎨 User Experience
- **Material Design 3**: Modern UI following latest design guidelines
- **Dark/Light Theme**: System-aware theme switching with manual toggle
- **Responsive Design**: Optimized for various screen sizes
- **Smooth Animations**: Enhanced user experience with fluid transitions

## 🏗️ Technical Architecture

### **Framework**: Flutter 3.10+
### **State Management**: Provider pattern
### **Storage**: SharedPreferences for local data persistence
### **UI**: Material Design 3 with custom theming
### **Image Handling**: image_picker for camera and gallery access
### **Permissions**: permission_handler for camera access

## 📁 Project Structure

```
lib/
├── main.dart                    # App entry point
├── data/
│   └── app_data.dart           # Static data and configurations
├── models/
│   ├── farmer.dart             # Farmer data model
│   ├── weather.dart            # Weather data models
│   └── alert.dart              # Alert, scheme, and pest models
├── providers/
│   ├── app_state_provider.dart # Main app state management
│   └── theme_provider.dart     # Theme management
├── screens/
│   ├── auth_screen.dart        # Registration/login
│   ├── main_screen.dart        # Main app with bottom navigation
│   ├── dashboard_screen.dart   # Dashboard with weather and alerts
│   ├── voice_screen.dart       # AI chat assistant
│   ├── camera_screen.dart      # Photo analysis
│   ├── weather_screen.dart     # Weather details
│   ├── schemes_screen.dart     # Government schemes
│   ├── calendar_screen.dart    # Farming calendar
│   └── profile_screen.dart     # User profile management
└── theme/
    └── app_theme.dart          # Custom theme definitions
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.10.0 or higher
- Dart SDK 3.0.0 or higher
- Android Studio / VS Code with Flutter extensions
- Android device or emulator (API level 21+)
- iOS device or simulator (iOS 12.0+) for iOS testing

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd kerala_krishi_sahayak_flutter
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Build for Production

**Android APK:**
```bash
flutter build apk --release
```

**Android App Bundle:**
```bash
flutter build appbundle --release
```

**iOS:**
```bash
flutter build ios --release
```

## 🔧 Configuration

### Permissions
The app requires the following permissions:
- **Camera**: For crop photo capture
- **Storage**: For accessing gallery images
- **Internet**: For future API integrations (optional)

### Supported Platforms
- ✅ Android (API 21+)
- ✅ iOS (12.0+)
- ✅ Responsive design for tablets

## 📊 Data Models

### Farmer Model
- Personal information (name, phone, location)
- Agricultural details (crops, land area, soil type)
- Registration timestamp

### Weather Model
- Current conditions (temperature, humidity, wind)
- 5-day forecast data
- Location-specific information

### Alert System
- Priority-based notifications
- Category-specific alerts (irrigation, pest, weather)
- Date-based organization

## 🌟 Key Features Implementation

### AI Response System
- Pattern matching for Malayalam and English queries
- Crop-specific knowledge base
- Weather-aware recommendations
- Context-sensitive responses

### Photo Analysis Simulation
- Mock AI analysis with realistic delays
- Pest/disease identification
- Treatment and prevention advice
- Confidence scoring

### Data Persistence
- User profile storage
- Chat history management
- Theme preferences
- Offline capability

## 🔮 Future Enhancements

### Technical Improvements
- **Real API Integration**: Connect to actual weather and agricultural APIs
- **Actual AI Model**: Implement TensorFlow Lite for real pest/disease detection
- **Push Notifications**: Firebase integration for alerts
- **Offline Maps**: Local agricultural extension office locations
- **Voice Recognition**: Real speech-to-text implementation

### Feature Additions
- **Marketplace**: Local agricultural product trading
- **Expert Consultation**: Connect with agricultural specialists
- **Community Features**: Farmer forums and knowledge sharing
- **Crop Management**: Detailed crop lifecycle tracking
- **Financial Tools**: Agricultural loan and insurance information

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is developed for the Smart India Hackathon (SIH) and is intended for educational and competition purposes.

## 👥 Team

- **Project**: Smart India Hackathon 2025
- **Category**: Agricultural Technology
- **Target Users**: Kerala Farmers
- **Language Support**: Malayalam, English

## 📞 Support

For technical support or feature requests, please create an issue in the repository.

---

**Made with ❤️ for Kerala Farmers** 🌾

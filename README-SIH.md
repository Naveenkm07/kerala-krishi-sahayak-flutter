# Krishi Sakhi - AI-Powered Personal Farming Assistant for Kerala Farmers

**Problem Statement ID:** 25074  
**Team:** CodePlays  
**One-line Pitch:** A Malayalam-first, conversational digital companion that helps smallholder farmers record activities, get personalized advisories, and receive timely reminders using AI and local context.

## 🎯 Project Overview

Kerala's smallholder farmers lack personalized, timely advisories that fit their local weather, crops, soil, and practices. Krishi Sakhi is a mobile-first assistant (voice + text) in Malayalam that captures farm profile and activity logs, and uses an AI knowledge engine to generate contextual recommendations, alerts, and simple action items.

## ✨ Core Features

### 🤖 **Real AI Assistant**
- **Google Gemini API Integration** - Intelligent farming responses
- **Bilingual Support** - Malayalam + English conversational interface
- **Context-Aware Advice** - Personalized recommendations based on farmer profile

### 📍 **Smart Location Services**
- **GPS Auto-Detection** - Automatic location detection for accurate weather
- **Location-Based Weather** - Real-time weather data from OpenWeatherMap API
- **Manual Location Refresh** - Update weather and location on demand

### 👨‍🌾 **Farmer-Centric Features**
- **User Authentication & Profiles** - Secure farmer account management
- **Farm Profiling** - Store location, land size, crops, soil type, irrigation method
- **Activity Tracking** - Simple logs: sowing, irrigation, spraying, pest sighting, harvest
- **Photo Analysis** - AI-powered pest/disease detection simulation

### 🌾 **Agricultural Intelligence**
- **Government Schemes Database** - Kerala agricultural programs and subsidies
- **Farming Calendar** - Monthly farming activities and best practices
- **Weather Forecasting** - 5-day weather forecast for planning
- **Alert System** - Timely notifications for farming activities

### 🎨 **Modern UX/UI**
- **Material Design 3** - Clean, accessible interface
- **Dark/Light Themes** - Comfortable viewing in all conditions
- **Offline-First Architecture** - Works without internet, syncs when available
- **Cross-Platform** - Android APK ready, web-capable Flutter codebase

## 🏗️ Technical Architecture

### **Frontend**
- **Framework:** Flutter 3.10+ (Cross-platform mobile development)
- **State Management:** Provider pattern for reactive UI
- **Local Storage:** SharedPreferences for offline data persistence
- **Permissions:** Camera, Location, Internet access

### **Backend Services**
- **AI Engine:** Google Gemini API for intelligent responses
- **Weather Service:** OpenWeatherMap API for live weather data
- **Location Services:** Geolocator package for GPS functionality
- **HTTP Client:** Built-in Flutter HTTP for API communication

### **Key Dependencies**
```yaml
dependencies:
  flutter: sdk: flutter
  provider: ^6.0.5          # State management
  http: ^1.1.0              # API calls
  geolocator: ^10.1.0       # GPS location services
  shared_preferences: ^2.2.2 # Local storage
  image_picker: ^1.0.4      # Camera integration
  permission_handler: ^11.0.1 # System permissions
```

### **Security & Reliability**
- **Environment Variables** - Secure API key management
- **Error Handling** - Graceful fallbacks for API failures
- **Offline Capability** - Local data storage with cloud sync
- **Permission Management** - Proper Android permission handling

## 📱 Requirements & Prerequisites

### **Development Environment**
- Flutter SDK 3.10 or higher
- Android Studio with Android SDK
- Dart SDK (included with Flutter)
- Git for version control

### **API Keys Required**
- Google Gemini API key (Free tier available)
- OpenWeatherMap API key (Free tier available)

### **Device Requirements**
- Android 5.0 (API level 21) or higher
- Internet connectivity for real-time features
- GPS capability for location services
- Camera for photo analysis features

## 🚀 Installation & Setup

### **1. Clone Repository**
```bash
git clone https://github.com/Naveenkm07/kerala-krishi-sahayak-flutter.git
cd kerala-krishi-sahayak-flutter
```

### **2. Install Dependencies**
```bash
flutter pub get
```

### **3. Configure API Keys**
Create a `.env` file in the root directory:
```env
GOOGLE_API_KEY=your_google_gemini_api_key_here
WEATHER_API_KEY=your_openweathermap_api_key_here
```

### **4. Build & Run**
```bash
# For development
flutter run

# Build release APK
flutter build apk --release
```

## 📂 Folder Structure

```
kerala-krishi-sahayak-flutter/
├── android/                 # Android-specific configuration
├── lib/
│   ├── config/             # API configuration
│   ├── data/               # Static app data and constants
│   ├── models/             # Data models (Farmer, Weather, etc.)
│   ├── providers/          # State management (AppStateProvider)
│   ├── screens/            # UI screens (7 main screens)
│   └── main.dart           # App entry point
├── assets/                 # Images and static assets
├── build/                  # Compiled output (APK location)
├── .env                    # Environment variables (not in git)
├── pubspec.yaml           # Dependencies and configuration
└── README-SIH.md          # This file
```

## 🎮 Demo Instructions

### **Step 1: Install APK**
- Copy `build/app/outputs/flutter-apk/app-debug.apk` to Android device
- Enable "Unknown Sources" in Settings
- Install the APK

### **Step 2: User Registration**
- Open Krishi Sakhi app
- Register as a new farmer with:
  - Name: "Demo Farmer"
  - Phone: "9876543210"
  - Location: "Wayanad, Kerala"
  - Crops: ["Rice", "Coconut", "Spices"]

### **Step 3: Test Core Features**

#### **Dashboard & Weather**
- View live weather data for your location
- Tap "Update Location & Weather" to see GPS-based weather
- Check farming alerts and recommendations

#### **AI Assistant**
- Go to "Voice Assistant" tab
- Ask questions like:
  - "What should I do for my rice crop today?"
  - "How to control pests in coconut trees?"
  - "When should I apply fertilizer?"
- Get intelligent, context-aware responses in Malayalam and English

#### **Photo Analysis**
- Use "Photo Analysis" feature
- Take or select photos of crops
- Get AI-powered pest/disease identification

#### **Government Schemes**
- Browse Kerala government agricultural schemes
- Filter by crop type and subsidy amount

#### **Farming Calendar**
- Check monthly farming activities
- Plan seasonal operations

### **Step 4: Test Offline Capability**
- Disconnect internet
- App continues working with cached data
- Reconnect to sync new information

## 🧪 Test Accounts & Sample Data

### **Demo Farmer Profile**
```json
{
  "name": "Ravi Kumar",
  "phone": "9876543210",
  "location": "Wayanad, Kerala",
  "crops": ["Rice", "Coconut", "Black Pepper"],
  "landSize": "2.5 acres",
  "soilType": "Red laterite",
  "irrigationType": "Drip irrigation"
}
```

### **Sample Voice Queries (Malayalam/English)**
- "എന്റെ നെല്ലിന് എന്ത് ചെയ്യണം?" (What should I do for my rice?)
- "How to prevent pest attacks in coconut?"
- "മഴക്കാലത്ത് എന്ത് ശ്രദ്ധിക്കണം?" (What to care during monsoon?)

## 🎯 Unique Value Proposition for Kerala

### **Local-First Design**
- Malayalam-first conversational interface
- Kerala-specific crop calendar and practices
- Local weather integration for accurate advisories

### **Smallholder Farmer Focus**
- Designed for small plots and mixed cropping
- Low-bandwidth operation with offline capability
- Simple voice-based interaction for low literacy users

### **Government Integration Ready**
- Easy export of farming logs for subsidy access
- Integration with Kerala government schemes
- Compliance with local agricultural guidelines

## 📊 Technical Highlights

### **AI & Machine Learning**
- Google Gemini API for natural language processing
- Context-aware recommendation engine
- Bilingual (Malayalam/English) response generation

### **Real-Time Data Integration**
- GPS-based location services
- Live weather API integration
- Automatic data synchronization

### **Offline-First Architecture**
- Local SQLite database for offline operation
- Intelligent caching and sync mechanisms
- Graceful degradation without internet

## 🔒 Security & Privacy

### **Data Protection**
- Environment variables for sensitive API keys
- Local data encryption with SharedPreferences
- No hardcoded credentials in source code

### **Privacy Compliance**
- Minimal data collection (only farming-relevant information)
- Local-first storage with optional cloud sync
- User control over data sharing and permissions

## 📈 Impact Metrics

### **Farmer Engagement**
- Activity logging rate: Target 80% monthly active users
- AI query response accuracy: >90% relevance score
- Feature adoption: Track usage across all 7 screens

### **Technical Performance**
- App load time: <3 seconds on average devices
- AI response time: <5 seconds per query
- Offline capability: 100% core features available offline

## 🚀 Deployment & Scalability

### **Current Status**
- ✅ Functional Android APK ready
- ✅ Real AI integration completed
- ✅ GPS and weather services active
- ✅ All 7 screens implemented and tested

### **Future Enhancements**
- iOS version using same Flutter codebase
- Web Progressive Web App (PWA) deployment
- Backend server for user data synchronization
- Advanced ML models for crop disease detection

## 📞 Support & Contact

### **Repository**
- **GitHub:** https://github.com/Naveenkm07/kerala-krishi-sahayak-flutter
- **APK Download:** Available in repository releases

### **Technical Support**
- **Developer:** Naveen Kumar K M
- **Email:** [Add your email]
- **Documentation:** Available in repository wiki

## 🏆 SIH 2025 Submission Artifacts

### **Deliverables Included**
- ✅ Complete Flutter source code
- ✅ Ready-to-install APK file
- ✅ Comprehensive documentation
- ✅ Demo instructions and test data
- ✅ API integration examples

### **Demo Video Script**
1. **App Installation** (30 sec) - Show APK install process
2. **User Registration** (45 sec) - Demo farmer profile creation
3. **AI Assistant Demo** (90 sec) - Voice queries and intelligent responses
4. **Live Features** (45 sec) - GPS weather, photo analysis
5. **Offline Capability** (30 sec) - Show app working without internet

---

**Built with ❤️ for Kerala Farmers | Smart India Hackathon 2025**

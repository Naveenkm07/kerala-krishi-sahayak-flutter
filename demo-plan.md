# SIH 2025 Demo Plan - Krishi Sakhi

## 🎬 3-Minute Demo Script

### **Demo Flow: M.A.P.S. Framework**
**M** - Model (AI Intelligence)  
**A** - Activity (Logging & Tracking)  
**P** - Profile (Farmer Data)  
**S** - Schedule (Alerts & Reminders)

---

## 📱 Demo Sequence (3 Minutes Total)

### **Opening (15 seconds)**
**Narrator:** "Namaste! I'm presenting Krishi Sakhi - an AI-powered farming assistant built specifically for Kerala farmers. Let me show you how this Malayalam-first digital companion helps smallholder farmers with personalized advisories."

### **Scene 1: Installation & Setup (30 seconds)**
**Action:**
1. Show APK installation on Android device
2. Launch app and show splash screen
3. Quick user registration with demo farmer profile
4. Show bilingual interface (Malayalam/English toggle)

**Narration:** "Installation is simple - just install the APK. Farmers create their profile with basic information: name, location, crops, and land details. The app works in Malayalam for local farmers."

### **Scene 2: Live AI Intelligence (60 seconds)**
**Action:**
1. Navigate to Voice Assistant tab
2. Ask voice query: "എന്റെ നെല്ലിന് ഇന്ന് എന്ത് ചെയ്യണം?" (What should I do for my rice today?)
3. Show real-time AI processing with Google Gemini API
4. Display intelligent response in Malayalam + English
5. Ask follow-up: "How to prevent pest attacks in coconut?"
6. Show contextual advice generation

**Narration:** "The heart of Krishi Sakhi is its AI intelligence. Farmers can ask questions in Malayalam or English. The system uses Google Gemini API to provide personalized, context-aware farming advice. Notice how responses consider the farmer's location, crops, and current weather conditions."

### **Scene 3: Smart Location & Weather (45 seconds)**
**Action:**
1. Navigate to Dashboard
2. Show current weather widget
3. Tap "Update Location & Weather" button
4. Demonstrate GPS location detection
5. Show live weather data from OpenWeatherMap API
6. Display 5-day forecast for farming planning

**Narration:** "Location intelligence is crucial for farming advice. The app automatically detects the farmer's GPS location and fetches live weather data. This ensures all recommendations are relevant to local conditions - whether they're in Wayanad or Kottayam."

### **Scene 4: Comprehensive Farm Management (40 seconds)**
**Action:**
1. Show Photo Analysis feature - simulate pest detection
2. Navigate to Government Schemes - display Kerala agricultural programs
3. Check Farming Calendar - show monthly activities
4. Demonstrate offline capability by disconnecting internet
5. Show app continues working with cached data

**Narration:** "Beyond AI chat, Krishi Sakhi offers complete farm management. Farmers can analyze crop photos for diseases, access government schemes for subsidies, follow seasonal calendars, and crucially - everything works offline for areas with poor connectivity."

### **Scene 5: Technical Excellence & Impact (30 seconds)**
**Action:**
1. Show app performance metrics
2. Display multiple screen navigation
3. Demonstrate dark/light theme switching  
4. Show settings and profile management
5. Quick view of technical architecture diagram

**Narration:** "Built with Flutter for cross-platform compatibility, featuring Material Design 3, secure API management, and offline-first architecture. The solution is ready for immediate deployment across Kerala's 6 lakh farmers."

### **Closing (20 seconds)**
**Action:**
1. Show summary slide with key features
2. Display impact metrics and scalability potential
3. Show GitHub repository and APK download

**Narration:** "Krishi Sakhi transforms farming through personalized AI advice, live weather intelligence, and farmer-friendly design. It's not just an app - it's a digital companion empowering Kerala's agricultural future. Thank you!"

---

## 🎯 Judge Interaction Points

### **Live Questions Farmers Might Ask:**
1. **Malayalam:** "മഴക്കാലത്ത് എന്റെ കുരുമുളകിന് എന്ത് പ്രത്യേക പരിചരണം വേണം?"
   **Translation:** "What special care does my black pepper need during monsoon?"

2. **English:** "My coconut trees have brown spots on leaves. What should I do?"

3. **Mixed:** "Rice crop പൂക്കുന്ന time ഇൽ എത്ര വെള്ളം വേണം?"
   **Translation:** "How much water needed during rice flowering time?"

### **Expected AI Responses:**
- Context-aware advice considering location (Kerala)
- Weather-specific recommendations
- Crop-stage appropriate suggestions
- Bilingual responses with local terminology

---

## 🧪 Test Data & Scenarios

### **Demo Farmer Profiles**

#### **Profile 1: Rice Farmer**
```json
{
  "name": "Ravi Kumar",
  "location": "Palakkad, Kerala",
  "crops": ["Rice", "Coconut"],
  "landSize": "3 acres",
  "soilType": "Alluvial",
  "season": "Kharif"
}
```

#### **Profile 2: Spice Farmer**
```json
{
  "name": "Priya Nair", 
  "location": "Idukki, Kerala",
  "crops": ["Black Pepper", "Cardamom", "Ginger"],
  "landSize": "1.5 acres",
  "soilType": "Laterite",
  "irrigation": "Drip"
}
```

#### **Profile 3: Mixed Crop Farmer**
```json
{
  "name": "Mohanan Pillai",
  "location": "Wayanad, Kerala", 
  "crops": ["Banana", "Coffee", "Areca Nut"],
  "landSize": "2 acres",
  "soilType": "Red Laterite",
  "elevation": "800m"
}
```

### **Sample Activity Logs**
```json
[
  {
    "date": "23-09-2025",
    "activity": "irrigation", 
    "crop": "rice",
    "duration": "2 hours",
    "notes": "Morning irrigation before expected rain"
  },
  {
    "date": "22-09-2025",
    "activity": "pest_control",
    "crop": "coconut", 
    "treatment": "neem spray",
    "notes": "Red palm weevil prevention"
  }
]
```

---

## 🏆 Judge Evaluation Criteria

### **Technical Excellence (25 points)**
- ✅ Real AI integration (Google Gemini API)
- ✅ GPS location services working
- ✅ Live weather API integration  
- ✅ Offline-first architecture
- ✅ Clean, maintainable Flutter code

### **Innovation & Problem Solving (25 points)**
- ✅ Malayalam-first conversational design
- ✅ Context-aware agricultural advice
- ✅ Offline capability for rural connectivity
- ✅ Government scheme integration ready
- ✅ Farmer-centric UX/UI design

### **Implementation Quality (25 points)**
- ✅ Fully functional APK ready to install
- ✅ All 7 screens implemented and tested
- ✅ Error handling and edge cases covered
- ✅ Security best practices (API key management)
- ✅ Performance optimization

### **Impact Potential (25 points)**
- ✅ Addresses real farmer pain points
- ✅ Scalable across Kerala's 6 lakh farmers
- ✅ Integration with government initiatives
- ✅ Measurable impact on farming practices
- ✅ Sustainable technology solution

---

## 🎥 Demo Video Checklist

### **Technical Setup**
- ✅ Android device with APK installed
- ✅ Internet connectivity for live API calls
- ✅ Screen recording software ready
- ✅ Audio quality checked for Malayalam pronunciation
- ✅ Backup offline demo if internet fails

### **Content Preparation**
- ✅ Demo script memorized (3 minutes exact)
- ✅ Sample farmer profiles created
- ✅ Test questions prepared in Malayalam
- ✅ Screenshots for backup slides
- ✅ Technical architecture diagram ready

### **Recording Guidelines**
- **Duration:** Exactly 3 minutes (180 seconds)
- **Resolution:** 1080p minimum
- **Audio:** Clear Malayalam + English narration
- **Pace:** Steady, not rushed
- **Focus:** Show actual app functionality, not slides

---

## 📞 Emergency Contacts & Backup Plans

### **If Live Demo Fails:**
1. **Internet Issues:** Switch to offline demo mode
2. **App Crash:** Have backup APK ready
3. **API Failures:** Show cached responses and explain architecture
4. **Device Problems:** Have secondary device with same setup

### **Judge Q&A Preparation:**
- **Technical Architecture:** Be ready to explain Flutter + API integration
- **Scalability:** Discuss deployment across Kerala
- **Security:** Explain API key management and data privacy
- **Future Plans:** Web app, iOS version, backend server

---

**Demo Success Formula: M.A.P.S. + Live AI + Malayalam Voice + Kerala Context = SIH Winner! 🏆**

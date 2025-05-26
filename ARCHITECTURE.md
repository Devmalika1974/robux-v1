# Fake Robux Generator App Architecture

## Overview
This Flutter app simulates a Robux generator with 4 screens as specified:
1. Username input screen - Collects Roblox username
2. Robux amount selection screen - Offers options: 800, 1100, 2000, 4000 Robux
3. Fake generation process screen - Shows animated progress bar and fake connection messages
4. Offer completion screen - Directs user to an external link (Google.com)

The app uses the Robux color scheme (green, black, gray) with modern design elements including animations and custom UI components.

## File Structure & Components

1. `lib/main.dart`
   - Entry point with navigation setup
   - Configures app theme and routes

2. `lib/theme.dart`
   - Custom theme with Robux colors (green, black, gray)
   - Typography and component styling

3. `lib/models/user_data.dart`
   - Stores username and selected Robux amount
   - Methods for persistence using shared_preferences

4. `lib/screens/username_screen.dart`
   - First screen with attractive input field
   - Form validation and animated UI elements

5. `lib/screens/robux_selection_screen.dart`
   - Grid display of selectable Robux amount options
   - Animated selection cards with visual feedback

6. `lib/screens/generator_screen.dart`
   - Animated progress bar simulation
   - Dynamic status messages that change during generation
   - Auto-navigation after 10 seconds

7. `lib/screens/offer_screen.dart`
   - Final screen with completion message
   - Button to open external URL (Google.com)
   - Option to restart the process

8. `lib/widgets/robux_button.dart`
   - Custom animated button with Robux styling
   - Scale animation on press

9. `lib/widgets/robux_card.dart`
   - Selectable card for Robux amounts
   - Animation and visual feedback on selection

10. `lib/utils/navigation_service.dart`
    - Custom navigation management
    - Slide transitions between screens

11. `android/app/src/main/AndroidManifest.xml`
    - Android configuration with internet permission

12. `ios/Runner/Info.plist`
    - iOS configuration with URL handling

## Key Features

1. Smooth Animations
   - Custom animations for buttons and cards
   - Fade transitions between screens
   - Animated progress indicators

2. Modern UI Design
   - Robux color scheme (green, black, gray)
   - Card-based interface
   - Custom typography

3. User Flow
   - Linear progression through 4 screens
   - Fake "generation" process with realistic messages
   - External URL handling

4. Data Persistence
   - Username and selected amount stored in SharedPreferences
   - Data passed between screens

The app is purely simulated and educational in nature, with all functionality working as specified in the requirements.
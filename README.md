# Balaji - 221501017
Setting up Flutter for development using VS Code and Android Studio involves several steps. Here’s a step-by-step guide to get you started:

Step 1: Install Flutter Download Flutter SDK:

Go to the Flutter download page. Download the latest stable version for your Windows. Extract Flutter SDK:

Extract the downloaded zip file to a location of your choice (e.g., C:\src\flutter for Windows or ~/flutter for macOS/Linux). Update your Path:

Add the Flutter bin directory to your system's PATH environment variable. On Windows: Search for "Environment Variables" in the Start menu. Edit the Path variable and add the full path to the flutter\bin directory. On macOS/Linux: Open a terminal and run nano ~/.bash_profile or nano ~/.zshrc (depending on your shell). Add export PATH="$PATH:[PATH_TO_FLUTTER_GIT_DIRECTORY]/flutter/bin". Save the file and run source ~/.bash_profile or source ~/.zshrc. Step 2: Install Android Studio Download Android Studio:

Go to the Android Studio download page. Download and install Android Studio for your operating system. Set up Android Studio:

Open Android Studio and follow the setup wizard. Install the Android SDK, SDK Platform, and Android Virtual Device (AVD) as prompted. Go to Preferences > Appearance & Behavior > System Settings > Android SDK. Ensure that the necessary SDK platforms and tools are installed (e.g., Android 10.0 (Q) and Android SDK Build-Tools). Create an Android Emulator:

Go to AVD Manager (you can find it in the toolbar). Create a new Virtual Device. Select a device definition and a system image, then follow the prompts to create the emulator. Step 3: Install Visual Studio Code (VS Code) Download VS Code:

Go to the VS Code download page. Download and install VS Code for your operating system. Install Flutter and Dart extensions in VS Code:

Open VS Code. Go to the Extensions view by clicking the Extensions icon in the Activity Bar on the side of the window. Search for Flutter and click Install. The Dart extension will be installed automatically alongside Flutter. Step 4: Set up Flutter in VS Code Check Flutter Installation:

Open a terminal in VS Code. Run flutter doctor to check the installation and to see if there are any dependencies you need to install. The output will guide you to fix any issues. Configure the Flutter SDK Path:

Open the Command Palette (Ctrl+Shift+P) and type Flutter: Select SDK. Select the path to the Flutter SDK directory. Step 5: Connect VS Code with Android Emulator Launch the Android Emulator:

Open Android Studio. Go to AVD Manager. Start the emulator you created. Run Flutter App from VS Code:

Open your Flutter project in VS Code. Ensure the emulator is running. Click on the device selector in the bottom-right corner of VS Code and select the emulator. Press F5 to run the Flutter app. Step 6: (Optional) Install Additional Plugins and Tools Install Flutter DevTools:

Run flutter pub global activate devtools in the terminal. Run flutter pub global run devtools to launch DevTools.

plugins {
    id("com.android.application")
//    id 'org.jetbrains.kotlin.android' // only if you're using Kotlin
//    id "dev.flutter.flutter-gradle-plugin"
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

//def localProperties = new Properties()
//def localPropertiesFile = rootProject.file('local.properties')
//if (localPropertiesFile.exists()) {
//    localPropertiesFile.withReader('UTF-8') { reader ->
//        localProperties.load(reader)
//    }
//}

//def flutterVersionCode ; localProperties.getProperty('flutter.versionCode')
//if (flutterVersionCode == null) {
//    flutterVersionCode = 34
//}

//def flutterVersionName = localProperties.getProperty('flutter.versionName')
//if (flutterVersionName == null) {
//    flutterVersionName = '8.0.2'
//}
//
//def flutterMinSdkVersion = localProperties.getProperty('flutter.minSdkVersion')
//if (flutterMinSdkVersion == null) {
//    flutterMinSdkVersion = '29'
//}
//
//def flutterTargetSdkVersion = localProperties.getProperty('flutter.targetSdkVersion')
//if (flutterTargetSdkVersion == null) {
//    flutterTargetSdkVersion = '37'
//}
//
//def flutterCompileSdkVersion = localProperties.getProperty('flutter.compileSdkVersion')
//if (flutterCompileSdkVersion == null) {
//    flutterCompileSdkVersion = '37'
//}
//
//def keystoreProperties = new Properties()
//def keystorePropertiesFile = rootProject.file('key.properties')
//
//if (keystorePropertiesFile.exists()) {
//    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
//}

android {
    namespace = "niveussolutions.com.niveussolutions"
//    compileSdk = flutter.compileSdkVersion
    compileSdk = 37
    android.ndkVersion="28.2.13676358"
//    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "niveussolutions.com.niveussolutions"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}

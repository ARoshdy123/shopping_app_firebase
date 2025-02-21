# shopping_app_firebase

A Flutter task to make  shopping application that allows users to sign up, sign in and browse products.

## Folder Structure


- `lib/`: Contains the main code for the application.
    - `signup_form.dart`: Contains the sign-up form.
    - `login_form.dart`: Contains the login form.
    - `main.dart`: Entry point of the application.
    - `screens/`: Contains signup screen of the application.
    - `widgets/`: Contains reusable widgets.
    - `consts/url`: Contains url links to enhance the application style.

### Applied Firebase

- `Firebase authentication` : In order to make cloud login and signup for the users
- 
### Applied Animation

- `FadeTransition` : Fade transition applied on signup form before going to main page.

### Applied biometric

- `local_auth`: For biometric (fingerprint) authentication.

### Permission used

- Biometric: to enable authentication using   "androidx.biometric.auth_enabled" android:value="true"

- Fingerprint: to enable authentication using "android.permission.USE_FINGERPRINT"/>

### Adding Localization

- `Arabic` : Adding Arabic language
- `English` : Adding English language


**For Access Device Features - Libraries to Device Features - Add Biometric Authentication using Fingerprint (Bonus task)
You will find in the biometric_fingerprint branch that the first project has not been graded yet**
P.S (Black screen on the video is for adding my fingerprint to access and login)

### Ready for Beta testing

**Added Beta testing using app distribution - `Testing app link` "https://appdistribution.firebase.dev/i/1383e14693e965d0"
- flutter pub add firebase_core
- flutter build apk: to upload the APK on app distribution on firebase for project beta testing.


https://github.com/user-attachments/assets/72221ba8-a8d4-4fcc-b7d4-67420794ab17



![image](https://github.com/user-attachments/assets/b5a34283-8a63-4176-8654-f7fc1c78d01c)

# PWA CI

PWAs can be deployed to both the google play store and the apple App store.

## For google playstore:

### Build and sign app
1. In the FE root run `bubblewrap build`, check you are signing with the correct key and follow the prompts  
2. If you have an existing listing in the Play Store:
  * For “Application ID”, use your existing package name when asked.
  * Make sure to enter a version code higher than its existing versions.
  * When prompted for “Key store location” and “Key name”, pass in the same key store location and key name that you used before. Otherwise the Play Console will reject your new upload because you’ve signed it with different keys.
3. If you’re planning to create a new listing:
  * For “Application ID”, choose a new unique package name.
  * Leave the version code as is (default value of 1).
  * For “Key store location” and “Key name”, you may use the default or enter your preferred path and name. Bubblewrap will then let you know that it couldn’t find a key store at the provided path. Enter “Yes” to let it create a new signing key. Remember the passwords you entered for your new key store and key as you’ll be prompted for them later on when you build.

### Upload your app to Google Play
1. Only if you have a new listing - Follow the tasks in the “Set up your app” section in the dashboard before moving on.
2. Upload your package - We recommend you to publish to Internal Testing Track to speed up the time to start testing in the Play Store. You can access the Internal Testing Track by choosing on Internal testing on the left hand side menu.
3. Click on the “Create new release” button.
4. If you haven’t uploaded a package before, Play Console will offer you to opt in for Play App Signing. This is highly recommended. Click Continue to opt in.
5. Click on the Upload button and choose the app-release-bundle.aab package generated by Bubblewrap.
6. Fill in “Release name” and “Release notes” fields and click Save.
7. Click on “Review release”.
8. Review the release and click on “Start rollout to Internal testing”. If you see a warning with the following message, you can ignore it for now. We’ll configure testers in the next step.

### Choose testers
1. Click on Testers tab under Internal testing page
2. Either click on “Create email list” to create a new testers list. Add email addresses of your testers into this list and save. You can also edit an existing list by clicking on the right arrow button.
3. Enable your testers list by clicking on the checkbox next to it.
4. Save changes
5. Click on the Copy link button under the “How testers join your test” to retrieve the URL to your testing track. Share this link with your testers. Testers need to follow this link and opt-in for receiving the testing version first to install your app.

For more information this resource was helpful https://github.com/chromeos/pwa-play-billing#setup-a-service-account)


## App store/ IOS:

### Packaging
1. Navigate to PWABuilder.com.
2. Enter the URL of your PWA on the homepage.
3. Click Next to navigate to the package selection page.
4. Select Store Package in the iOS section.
5. You will prompted with editable metadata about your app. PWABuilder automatically populates these fields from your manifest.
6. Take note of your Bundle ID, you will need this info to publish to the App Store.
7. Click Generate and your package will download. Your download will contain further instructions for submitting the package, but you can also use these docs.

### Building Your App
1. Unzip the folder you downloaded from PWABuilder on the company iMac.
2. Open a terminal in the src directory.
3. Run this command: pod install
4. Open the .xcworkspace file in your src directory.
5. Click Product > Build in Xcode to build your project.
6. With the project opened in Xcode, click ▶️ to test your PWA in an iPhone simulator. You may also choose other iOS simulators to try our your app on those devices.
 
### Publishing
1. Sign In To the Apple Developer Account
  * To submit your app to the iOS App Store, sign-in to the Apple Developer Account on the company iMac.
2. Create a Bundle ID
  * Next, you will need to create a Bundle ID on your Apple Developer Account that matches the Bundle ID associated with your package from PWABuilder.
  * Navigate to your Apple Developer account page and select Certificates, Identifiers & Profiles
  * Select Identifiers and click the + symbol to add a new identifier.
  * Select App IDs and then choose App as the type.
  * Add any Description that you see fit.
  * Add your Bundle ID. Important: This must match the bundle ID you created with PWABuilder.
  * In the capabilites section, enable Associated Domains and Push Notifications.
  * Click Continue and then Register to finish adding the identifier.(Note If you didn’t take note of your Bundle ID on PWABuilder, you can find it the project.pbxproj file.)
3. Create a Certificate Signing Request (CSR)
  * Next, you will need to use the Keychain Acess application to create a Certificate Signing Request:
  * Launch the Keychain Access app.
  * From the top menu bar, choose: Keychain Access > Certificate Assistant > Request a Certificate from a Certificate Authority
  * Enter your email address and your name. You may leave CA Email Address empty.
  * Choose the Saved to disk option and select Continue.
  * You’ll be prompted to save a .certSigngingRequest file to disk.
4. Create a Certificate
  * Now, you will use the CSR we created in the last step to create a certificate:
  * Navigate back to the Certificates, Identifiers, & Profiles section on your Apple Developer account page from Step 2.
  * Select Certificates and select the + symbol to add a new certificate.
  * Select Apple Distribution and click Continue.
  * You will be prompted to upload a Certificate Signing Request. Choose the file you created in the previous step, and click Continue.
  * On the final screen, Choose Download to save your .cer file to your disk.
  * To install this certificate, open the Keychain Access app and drag your .cer file onto the list of certificates.
5. Create a Provisioning Profile
  * Next, you can use the certificate you created to create a Provisioning Profile:
  * Navigate back to the Certificates, Identifiers, & Profiles section on your Apple Developer account page from Step 2 and 4.
  * Select Profiles and select the + symbol to add a new profile.
  * On the next page, select App Store under Distribution and click Continue.
  * You will be prompted to select an app ID, choose the Bundle ID you created in Step 2 and click Continue.
  * Next, you will be prompted to choose a certificate. Select the certificate you created in the last step and click Continue.
  * You’ll asked for a Provisioning Profile Name. Use your Bundle ID and then click Generate.
  * Finally, select Download to download your .mobileprovision file.
6. Create Your App Reservation
  * Once you have a provisioning profile, you can create an app reservation on your developer account.
  * Go back to your Apple Developer account page and choose App Store Connect.
  * Select My Apps.
  * Select the + symbole and then click New App:
  * You will be prompted for details about your app:
  * Choose iOS for the platform
  * Use any name you would like.
  * Select a language.
  * Select the Bundle ID we created in the previous step.
  * SKU can be any string you would like.
  * Select Full Access under User Access.
  * Finally, click Create to complete your app reservation.
7. Upload Your App Package
  * After you create your app reservation, you’ll be redirected to the app details page. There, you can add metadata about your app, including screenshots, description, and more.
  * After you’ve filled out any data you want to include with your app, it’s time to upload your PWA app package.
  * First, you’ll need to sign in to Xcode:
  * Click Xcode in the top menu bar.
  * Click Preferences.
  * Navigate to the Accounts panel.
  * If you don’t see your Apple Developer account already, click the + symbol in the bottom left.
  * Sign in to your account.
  * Next, you’ll need to assign your project to your account:
  * Select the Project Navigator tab.
  * Select your application.
  * Select Build Settings.
  * Scroll down to the Signing section.
  * Under Code Signing Identity, set Release to Apple Distribution.
  * Under Code Signing Style, set Release to Manual.
  * Under Development Team, set Release to your Apple Developer account team.
  * On the same project page, select Signing & Capabilites and then Release.
  * Under Provisioning Profile, select Download Profile.
  * Choose the profile you created in the previous steps.
  * Lastly, you just need to create an archive and upload it:
  * At the top of Xcode, select your iPhone simulator name and select Any iOS Device (arm64).
  * Next, select Product > Archive from the Mac OS top menu bar.
  * When the archive process finishes, select Distribute App > App Store Connect > Upload.
  * Follow the prompts to upload your application!
8. Submit for Review
  * The last thing you need to do is submit your app for review:
  * Go to your apps list at the App Store Connect.
  * Scroll to the Build section.
  * Click Select a build before you submit your app.
  * Choose the archive you just created.
  * Once you’ve set and reviewed the metadata for your app, hit Submit for Review to complete your submission.
  * Your PWA still has to be approved, but if it is, it will appear in the App Store typically within 24-48 hours.

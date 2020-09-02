# Musclery-Frontend
Musclery TrainingsJournal - Frontend

## Frontend-Team:
Julie Pines, Dennis Neumann, Tobias Lorenz

## How to contribute
Make sure npm is available

### Clone the Repository
<pre><code>git clone https://github.com/Dennis2512/Musclery-Frontend.git</pre></code>
then navigate into the folder with <pre><code>cd Musclery-Frontend </pre></code>

### Setup 
Install NativeScript following these instructions: https://docs.nativescript.org/angular/start/introduction
- Quick-Setup if you want to preview the Applikation with the NativeScript Preview and Playground Apps. Download in AppStore or GooglePlayStore. <br>
- Use the Full Setup if you want to use an Emulator localy on your computer.

### Check if everything is setup correctly 
use the following command to check if everything is setup correctly
<pre><code>tns doctor</pre></code>

### Preview App

#### Preview with Quicksetup for Android Device 
<pre><code>tns preview android</pre></code> <br>
Scan the resulting QR-Code with NativeScript Playground App

#### Preview with Quicksetup for iOS Device
<pre><code>tns preview iOS</pre></code> <br>
Scan the resulting QR-Code with NativeScript Playground App

#### Emulator for Android Device
Open an Emulator with the Android Studio AVD-Manager and type the command
<pre><code>tns run android</pre></code>

##### Error that might occur as an exception on Windwos during the build with tns run android:
Gradle build...
Downloading https://services.gradle.org/distributions/gradle-5.4.1-all.zip
Exception in thread "main" javax.net.ssl.SSLHandshakeException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target

###### How to fix this?
Load the desired version of gradle at: https://services.gradle.org/distributions/ and load this up on your own server only with http so without https

What I tried out and didn't work on my device:
 - Adding the certificate to java (First answer here: https://stackoverflow.com/questions/9619030/resolving-javax-net-ssl-sslhandshakeexception-sun-security-validator-validatore)
 - Installing the latest Java SDK
 
#### Emulator for iOS Device
<pre><code>tns run ios </pre></code> Only works on MacOS!


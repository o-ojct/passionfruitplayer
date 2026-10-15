# Passionfruit Player

A one-button iOS app that plays/pauses the bundled Passionfruit.mp3.

## Option A: Build the .ipa for free with GitHub (no Mac needed)
1. Create a new GitHub repo and upload everything in this folder (including the hidden .github folder).
2. Go to the Actions tab -> "Build IPA" -> Run workflow.
3. When it finishes, download the "PassionfruitPlayer-ipa" artifact (a zip containing PassionfruitPlayer.ipa).
4. The .ipa is UNSIGNED. Install it with Sideloadly or AltStore (signs it with your Apple ID).

## Option B: Build on a Mac
1. brew install xcodegen
2. xcodegen generate
3. Open PassionfruitPlayer.xcodeproj, pick your Team under Signing & Capabilities, and run on your iPhone.

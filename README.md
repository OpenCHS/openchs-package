# openchs-package
Scripts for generating openchs installer packages for different operating systems

To package RPM
Copy the following to resources
1. app.apk
2. openchs-server jar
3. openchs_health_modules.tar.gz
4. openchs_impl.tar.gz

and then Run

./gradlew clean -PopenchsRelease=<release-number> -PbuildNumber=<build-number> buildRpm

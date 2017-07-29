# openchs-package
Scripts for generating openchs installer packages for different operating systems

This builds rpms for openchs server and openchs-reports

This is multi-project gradle build. Copy the relevant artifacts and run

```./gradlew clean buildRpm``` 

to generate the two RPMs

OpenCHS server
--------------

### To create rpm

Copy the following to resources
1. app.apk
2. openchs-server jar
3. openchs_health_modules.tar.gz
4. openchs_impl.tar.gz

and then Run

```./gradlew clean openchs:buildRpm```

It takes parameters openchsRelease and buildNumber

### To run the service

```service openchs start```

First time -- To deploy health modules

```service openchs deploy_health_modules```

```service openchs deploy_impl```

The service by default starts on 8021 port

### To access the app
http://yourdomainname/openchs

The app apk can be downloaded from 

http://yourdomainname/openchs/ext/app.apk

OpenCHS Reports
---------------
OpenCHS reports uses metabase

### For Local Development

Run the metabase.jar from openchs-reports/resources which has h2 databases

Login credentials : admin@openchs.org / passw0rd

### To create rpm

```./gradlew clean openchs-reports:buildRpm```

### To run reports service

```service openchs-reports start```

### To access reports

http://yourdomainname/openchsreports

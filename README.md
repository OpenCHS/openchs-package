# openchs-package
Scripts for generating openchs installer packages for different operating systems

This builds rpms for openchs server and openchs-reports

OpenCHS server
--------------

### To create rpm

Copy the following to resources
1. app.apk
2. openchs-server jar
3. openchs_health_modules.tar.gz
4. openchs_impl.tar.gz

and then Run

```./gradlew clean buildRpm```

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


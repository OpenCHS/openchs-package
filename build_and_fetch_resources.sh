cd ../openchs-server && git stash && git pull && mvn clean install -DskipTests
cd ../openchs-package && cp ../openchs-server/openchs-server-api/target/openchs-server*jar ./openchs/resources/
cd ../openchs-client && git stash && git pull && make release KEYSTORE_PASSWORD=helloworld KEY_PASSWORD=helloworld
cd ../openchs-package && cp ../openchs-client/android/app/build/outputs/apk/app-release.apk ./openchs/resources/app.apk
cd ../openchs-health-modules && git stash && git pull && make deployable
cp output/openchs_health_modules.tar.gz ../openchs-package/openchs/resources/
cd ../lbp-arogyadoot && git stash && git pull && make deployable
cd ../openchs-package && cp ../lbp-arogyadoot/output/openchs_impl.tar.gz ./openchs/resources/


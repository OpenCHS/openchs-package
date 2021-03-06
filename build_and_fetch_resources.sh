cd ../openchs-server && git stash && git pull && mvn clean install -DskipTests
cd ../openchs-package && cp ../openchs-server/openchs-server-api/target/openchs-server*jar ./openchs/resources/
cd ../openchs-client && git stash && git pull && make release
cd ../openchs-package && cp ../openchs-client/packages/openchs-android/android/app/build/outputs/apk/app-release.apk ./openchs/resources/app.apk
cd ../openchs-client/packages/openchs-health-modules/openchs-health-modules && make build_package
cp ../openchs-client/packages/openchs-health-modules/output/openchs_health_modules.tar.gz ../openchs-package/openchs/resources/
cd ../lbp-arogyadoot && git stash && git pull && make build_package
cd ../openchs-package && cp ../lbp-arogyadoot/output/openchs_impl.tar.gz ./openchs/resources/


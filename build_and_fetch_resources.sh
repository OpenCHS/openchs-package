cd ../openchs-server && git stash && git pull && mvn clean install -DskipTests
cd ../openchs-package && cp ../openchs-server/openchs-server-api/target/openchs-server*jar ./openchs/resources/
cd ../openchs-client && git stash && git pull && make release KEYSTORE_PASSWORD=helloworld KEY_PASSWORD=helloworld
cd ../openchs-package && cp ../openchs-client/android/app/build/outputs/apk/app-release.apk ./openchs/resources/app.apk
cd ../lokbiradari-vhw && git stash && git pull && make package_health_modules && make package_impl
cd ../openchs-package && cp ../lokbiradari-vhw/output/openchs_health_modules.tar.gz  ./openchs/resources/
cp ../lokbiradari-vhw/output/openchs_impl.tar.gz ./openchs/resources/


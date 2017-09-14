# <makefile>
# Objects: metabase, data
# Actions: download, start, package
help: ## Targets which do not have help text are not shown
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
	    IFS=$$'#' ; \
	    help_split=($$help_line) ; \
	    help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
	    help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
	    printf "%-30s %s\n" $$help_command $$help_info ; \
	done
# </makefile>


# <metabase>
metabase_version=v0.25.2

download_metabase: ## Downloads metabase jar; uses wget
	cd openchs-reports/resources/ && wget -c --retry-connrefused --tries=0 http://downloads.metabase.com/$(metabase_version)/metabase.jar

start_metabase: ## Starts metabase server
	cd openchs-reports/resources && java -jar metabase.jar
# </metabase>


# <data>
deploy_data: ## Deploys health modules and lbp-implementation data
	cd ../openchs-client/packages/openchs-health-modules && make deploy
	cd ../lbp-arogyadoot && make deploy

redeploy_data: ## Clean deploys health modules and lbp-implementation data
	cd ../openchs-server && make redeploy_schema
	cd ../openchs-client/packages/openchs-health-modules && make deploy
	cd ../lbp-arogyadoot && make deploy
# </data>


# <package>
package: ## Clean deploys health modules and lbp-implementation data
	./gradlew clean collectRpms
# <package>

# <source>
source_pull:
	cd ../openchs-server/ && git pull
	cd ../openchs-client/ && git pull
# </source>
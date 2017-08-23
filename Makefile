# <makefile>
# Objects: metabase, data
# Actions: download, start, package
help:
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


metabase_version=v0.25.2


# <metabase>
download_metabase:
	cd openchs-reports/resources/ && curl -O http://downloads.metabase.com/$(metabase_version)/metabase.jar

start_metabase:
	cd openchs-reports/resources && java -jar metabase.jar
# </metabase>


# <data>
deploy_data:
	cd ../openchs-health-modules && make deploy
	cd ../lbp-arogyadoot && make deploy
# </data>


# <package>
package:
	./gradlew clean collectRpms
# <package>
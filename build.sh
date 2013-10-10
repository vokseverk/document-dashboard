XSLT_FILE=DocumentDashboard
PACKAGE_NAME=Vokseverk.DocumentDashboard

UMBOFF="umbraco \"IGNORE\""
UMBON="umbraco \"INCLUDE\""
TMOFF="textmate \"IGNORE\""
TMON="textmate \"INCLUDE\""

# Create the dist directory if needed
if [[ ! -d dist ]]
	then mkdir dist
fi
# Likewise, create the package dir
if [[ ! -d package ]]
	then mkdir package
fi

# Get the current version
VERSION=`grep -o ' packageVersion \"\(.*\)\"' src/version.ent | awk '{print $2}' | sed 's/"//g'`

# Make sure to use the PRODUCTION entities
sed -i "" "s/$UMBOFF/$UMBON/" src/mocks/entities.ent
sed -i "" "s/$TMON/$TMOFF/" src/mocks/entities.ent

# Transform the development XSLT to a release file
xsltproc --novalid --xinclude --output package/$XSLT_FILE.xslt lib/freezeEntities.xslt src/$XSLT_FILE.xslt
# Transform the package.xml file, pulling in the README
xsltproc --novalid --xinclude --output package/package.xml lib/freezeEntities.xslt src/package.xml

# Copy files to package
cp src/_Dashboards.xslt package/

# Build the ZIP file 
zip -j "dist/$PACKAGE_NAME-$VERSION.zip" package/* -x \*.DS_Store

# Copy the release XSLT into the dist dir for upgraders
cp package/$XSLT_FILE.xslt dist/$XSLT_FILE.xslt

# Go back to DEVELOPMENT versions again
sed -i "" "s/$UMBON/$UMBOFF/" src/mocks/entities.ent
sed -i "" "s/$TMOFF/$TMON/" src/mocks/entities.ent

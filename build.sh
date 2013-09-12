# Create the dist directory if needed
if [[ ! -d dist ]]
	then mkdir dist
fi
# Likewise, create the package dir
if [[ ! -d package ]]
	then mkdir package
fi

# Transform the development XSLT to a release file
xsltproc --novalid --xinclude --output package/DocumentDashboard.xslt lib/freezeEntities.xslt src/DocumentDashboard.xslt
# Transform the package.xml file, pulling in the README
xsltproc --novalid --xinclude --output package/package.xml lib/freezeEntities.xslt src/package.xml

# Copy files to package
# None yet...

# Build the ZIP file 
zip -j dist/Vokseverk.DocumentDashboard.zip package/* -x \*.DS_Store

# Copy the release XSLT into the dist dir for upgraders
cp package/DocumentDashboard.xslt dist/DocumentDashboard.xslt
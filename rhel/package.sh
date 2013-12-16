#!/bin/bash -e

# Take version and release as parameters
version=$1
release=$2

package=python-midonetclient
specfile=rhel/$package.spec
specfile_template=$specfile.template

# Create specfile with correct version

# Delete if it exists for some reason
rm -f $specfile

# Make a copy
cp $specfile_template $specfile
sed -i "s/VERSION_PLACEHOLDER/$version/g" $specfile
sed -i "s/RELEASE_PLACEHOLDER/$release/g" $specfile

git archive HEAD --prefix=$package-$version/ -o ~/rpmbuild/SOURCES/$package-$version.tar
gzip ~/rpmbuild/SOURCES/$package-$version.tar
rpmbuild -ba $specfile
rm -f $specfile

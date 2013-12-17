#!/bin/bash -e

# Take version as parameter
# For RCs, version will look like 1.2.3~rc2
# For full releases, version will look like 1.2.3
version=$1

package=python-midonetclient
changelog=debian/changelog

# Create changelog

# Delete if it exists for some reason
rm -f $changelog

dch --create --package $package -v $version --empty -D precise

dpkg-buildpackage -rfakeroot -b -us -uc
rm -f $changelog


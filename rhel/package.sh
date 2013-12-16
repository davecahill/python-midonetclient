#!/bin/bash -e

version=`grep ^Version rhel/*.spec | cut -d ' ' -f 5`
package=python-midonetclient

git archive HEAD --prefix=$package-$version/ -o ~/rpmbuild/SOURCES/$package-$version.tar
gzip ~/rpmbuild/SOURCES/$package-$version.tar
rpmbuild -ba rhel/$package.spec

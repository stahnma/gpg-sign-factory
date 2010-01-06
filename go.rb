#!/usr/bin/env ruby

require 'yaml'

# Monitor directory for package 
#Package enters factory
#if(package signed by websages team member)
#  resign with websages master key
#else
#  log an error and reject package
#end

#rpm -q --qf '%{NAME}-%{VERSION}-%{RELEASE}.%{ARCH}|%{DSAHEADER:pgpsig}\n' -a

PACKAGE_WATCH_DIR="incoming"
END_PACKAGE_DIR="repo"
GOOD_PUBLIC_KEYS_DIRECTORY='/etc/pki/rpm'
OFFICIAL_KEY='mykey.gpg'

def get_packages_available
   Dir[PACKAGE_WATCH_DIR + "/*"].each do |packagefile|
     puts packagefile
     # check it ends in .deb or .rpm
   end
end

def check_package
end

def good_sign
end

def throw_away
end

get_packages_available

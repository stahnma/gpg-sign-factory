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

GOOD_PUBLIC_KEYS_DIRECTORY='/etc/pki/rpm'
OFFICIAL_KEY='mykey.gpg'

def get_packages_available
end

def check_package
end

def good_sign
end

def throw_away
end

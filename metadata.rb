name             "opscode-pedant"
maintainer       "Christopher Maier"
maintainer_email "cm@opscode.com"
license          "All rights reserved"
description      "Installs and configures Pedant test applications"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

depends "git"

# Just using this to get the ruby recipe until we have an opscode-ruby cookbook
depends "opscode-ci"

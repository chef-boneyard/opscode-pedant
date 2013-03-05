name             "opscode-pedant"
maintainer       "Christopher Maier"
maintainer_email "cm@opscode.com"
license          "All rights reserved"
description      "Installs and configures Pedant test applications"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.1"

depends "git"
depends "opscode-ruby", "~> 0.1.0"

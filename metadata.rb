name             "opscode-pedant"
maintainer       "Christopher Maier"
maintainer_email "cm@opscode.com"
license          "All rights reserved"
description      "Installs and configures Pedant test applications"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.2"

# This is one of the new cookbooks:
# https://github.com/opscode-cookbooks/opscode-ruby
depends "opscode-ruby", "~> 0.1.1"

# This comes from our infrastructure
depends "git"

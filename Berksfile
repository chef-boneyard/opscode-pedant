chef_api :config
site :opscode

metadata

cookbook "opscode-dev-shim", :git => "git@github.com:opscode-cookbooks/opscode-dev-shim.git"
cookbook "opscode-ruby", :git => "git@github.com:opscode-cookbooks/opscode-ruby.git"

group :integration do
  cookbook "opscode-pedant-test", :path => "./test/cookbooks/opscode-pedant-test"
end

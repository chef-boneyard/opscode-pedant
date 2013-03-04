#
# Cookbook Name:: opscode-pedant
# Resource:: opscode_pedant
#
# Copyright 2013, Opscode
#
# All rights reserved - Do Not Redistribute
#

actions :create
default_action :create

attribute :variant,
:name_attribute => true,
:required => true,
:kind_of => String,
:callbacks => {
  "is not a recognized Pedant test project" => lambda do |variant|
    Chef::Resource::OpscodePedant.validate_variant(variant)
  end
}

attribute :checkout_dir,
:kind_of => String,
:default => "/usr/local/src"

attribute :config_dir,
:kind_of => String
# for default value, see initialize method below

attribute :revision,
:kind_of => String,
:default => "master"

attribute :user,
:kind_of => String,
:default => "opscode"

attribute :group,
:kind_of => String,
:default => "opscode"

attribute :git_user,
:kind_of => String,
:default => "opscode"

attribute :config_template,
:kind_of => String
# for default value, see initialize method below

attribute :variables,
:kind_of => Hash

# location of config file
# switch between SSH and non for Github URLs for OSS pedant
# user it's installed as
# Wrapper script for getting the right config file?
# pass in a config template, config variables


def initialize(*args)
  super
  @action = :create
  @variant ||= @name
  @config_dir ||= "/var/opt/opscode/#{@variant}/etc"
  @config_template ||= "#{variant}_config.rb.erb"
end

VALID_VARIANTS = %w{ chef-pedant oc-chef-pedant oc-pushy-pedant oc-reporting-pedant oc-authz-pedant oc-heimdall-pedant }

private

def self.validate_variant(variant)
  VALID_VARIANTS.include?(variant)
end

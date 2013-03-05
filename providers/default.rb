#
# Cookbook Name:: opscode-pedant
# Provider:: opscode_pedant
#
# Copyright 2013, Opscode
#
# All rights reserved - Do Not Redistribute
#

def action_create

  install_prerequisites

  node.set['pedant'][new_resource.variant]['dir'] = "#{new_resource.checkout_dir}/#{new_resource.variant}"
  node.set['pedant'][new_resource.variant]['etc_dir'] = new_resource.config_dir

  directory new_resource.config_dir do
    owner new_resource.user
    group new_resource.group
    mode "0755"
    recursive true
  end

  git new_resource.variant do
    destination node['pedant'][new_resource.variant]['dir']
    repository "git@github.com:opscode/#{new_resource.variant}.git"
    revision new_resource.revision
    user new_resource.git_user
  end

  template "#{new_resource.config_dir}/pedant_config.rb" do
    source new_resource.config_template
    owner new_resource.user
    group new_resource.group
    mode "0644"
    variables(new_resource.variables)
  end

  execute "bundle install" do
    cwd node['pedant'][new_resource.variant]['dir']
    #  user "opscode"
  end

  node.set['pedant'][new_resource.variant]['dir'] = "#{new_resource.checkout_dir}/#{new_resource.variant}"
  node.set['pedant'][new_resource.variant]['etc_dir'] = new_resource.config_dir

end

def install_prerequisites
  @run_context.include_recipe "git"
  @run_context.include_recipe "opscode-ruby"

  directory new_resource.checkout_dir do
    mode "0777"
  end
end

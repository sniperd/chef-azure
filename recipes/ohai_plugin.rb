#
# Cookbook Name:: azure
# Recipe:: ohai_plugin
#
# Copyright (C) 2013 Panagiotis Papadomitsos
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

ohai 'reload_azure' do
  action :nothing
  plugin 'azure'
end

cookbook_file "#{node['ohai']['plugin_path']}/azure.rb" do
  source 'azure.rb'
  owner 'root'
  group 'root'
  mode 00755
  notifies :reload, 'ohai[reload_azure]', :immediately
end

include_recipe 'ohai'

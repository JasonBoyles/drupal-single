# encoding: utf-8
# Author:: Joshua Timberman(<joshua@getchef.com>)
# Cookbook Name:: postfix
# Recipe:: default
#
# Copyright 2009-2014, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'postfix::_common'

if node['postfix']['main']['smtp_sasl_auth_enable'] == 'yes'
  include_recipe 'postfix::sasl_auth'
end

if node['postfix']['main']['use_alias_maps'] == 'yes'
  include_recipe 'postfix::aliases'
end

if node['postfix']['main']['use_transport_maps'] == 'yes'
  include_recipe 'postfix::transports'
end

if node['postfix']['main']['use_access_maps'] == 'yes'
  include_recipe 'postfix::access'
end

if node['postfix']['main']['use_virtual_aliases'] == 'yes'
  include_recipe 'postfix::virtual_aliases'
end

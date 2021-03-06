#
# Cookbook Name:: xml
# Recipe:: default
#
# Copyright 2010-2013, Opscode, Inc.
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

default['xml']['compiletime'] = false

case node['platform_family']
when 'rhel', 'fedora', 'suse'
  default['xml']['packages'] = %w[libxml2-devel libxslt-devel]
when 'ubuntu', 'debian'
  default['xml']['packages'] = %w[libxml2-dev libxslt-dev]
when 'freebsd', 'arch'
  default['xml']['packages'] = %w[libxml2 libxslt]
end

default['xml']['nokogiri']['use_system_libraries'] = false

# Newest versions will not compile with system libraries
# https://github.com/sparklemotion/nokogiri/issues/1099
default['xml']['nokogiri']['version'] = nil

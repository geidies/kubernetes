#
# Copyright:: Copyright (c) 2015 Chef Software, Inc.
# License:: Apache License, Version 2.0
# Authors:  Andre Elizondo (andre@chef.io)
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

require 'spec_helper'

describe 'kubernetes::node' do
  context 'starts and enables the kubernetes node services' do
    cached(:chef_run) do
      ChefSpec::ServerRunner.new(step_into: ['kube_node'])
                            .converge(described_recipe)
    end

    before do
      stub_command('brctl show | grep -q docker0').and_return true
    end

    it 'starts and enables the proxy' do
      expect(chef_run).to pull_docker_image('hyperkube')
      expect(chef_run).to run_docker_container('proxy')
    end

    it 'starts and enables the kubelet' do
      expect(chef_run).to pull_docker_image('hyperkube')
      expect(chef_run).to run_docker_container('kubelet')
    end
  end
end

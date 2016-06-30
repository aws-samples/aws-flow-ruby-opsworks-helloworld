# Copyright 2014-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You
# may not use this file except in compliance with the License. A copy of
# the License is located at
#
#     http://aws.amazon.com/apache2.0/
#
# or in the "license" file accompanying this file. This file is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
# ANY KIND, either express or implied. See the License for the specific
# language governing permissions and limitations under the License.

require 'aws/decider'
require 'json'
require_relative 'helloworld_workflow'

def setup_domain(domain_name, retention_period)
  swf = AWS::SimpleWorkflow.new
  domain = swf.domains[domain_name]
  unless domain.exists?
      swf.domains.create(domain_name, retention_period)
  end
  domain
end

# get the path to the runner configuration file.
if ARGV.length < 1
  puts "Please provide the path to the runner configuration file!"
  exit
end
runner_spec = ARGV[0]

# Read the domain info from the same JSON file that the runner will be using.
helloworld_options = JSON.parse(File.read(runner_spec))
domain = helloworld_options["domain"]
domain_name = domain["name"]
# If retention is not given, default it to 1
retention_period = domain["retention_in_days"] || 1

# For this test, use the first workflow encountered.
workflow_info = helloworld_options["workflow_workers"][0]

task_list_name = workflow_info["task_list"]

domain = setup_domain(domain_name, retention_period)

# Get a workflow client for HelloWorldWorkflow and start a workflow execution
# with the required options.
client = AWS::Flow::workflow_client(domain.client, domain) {
  { from_class: "HelloWorldWorkflow",
    task_list: task_list_name }
}

puts "Starting a workflow execution."
puts "  domain:     #{domain_name}"
puts "  task list:  #{task_list_name}"

# start the workflow, passing it a name to use.
client.start_execution("AWS OpsWorks")

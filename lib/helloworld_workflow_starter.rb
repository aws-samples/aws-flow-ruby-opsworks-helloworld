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
domains = helloworld_options["domains"]

# For this test, use the first workflow encountered.
workflow_info = helloworld_options["workflow_workers"][0]

# we need three bits of info:
domain_name = workflow_info["domain"]
task_list_name = workflow_info["task_list"]
retention_period = 1 # set a default

# Check to see if there's a retention period from the JSON file. If not, then
# the default value will be used.
domains.each do |d|
  if d["name"] == domain_name
    retention_period = d["retention_in_days"]
  end
end

domain = setup_domain(domain_name, retention_period)

# Get a workflow client for HelloWorldWorkflow and start a workflow execution
# with the required options.
client = AWS::Flow::workflow_client(domain.client, domain) {
  { from_class: "HelloWorldWorkflow",
    execution_start_to_close_timeout: 60,
    task_list: task_list_name }
}

puts "Starting a workflow execution."
puts "  domain:     #{domain_name}"
puts "  task list:  #{task_list_name}"

# start the workflow, passing it a name to use.
client.start_execution("AWS OpsWorks")

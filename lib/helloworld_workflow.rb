require_relative "helloworld_activity"

# HelloWorldWorkflow class defines the workflows for the HelloWorld sample
class HelloWorldWorkflow
  extend AWS::Flow::Workflows

  # Define which workflows to run.
  workflow :hello do
    {
      version: '1.2',
      task_list: 'workflow_tasklist'
    }
  end

  # Create an activity client using the activity_client method to schedule
  # activities
  activity_client(:client) { { from_class: "HelloWorldActivity" } }

  # This is the entry point for the workflow
  def hello(name)
    # Use the activity client 'client' to invoke the say_hello activity
    client.say_hello(name)
  end
end

require 'aws/decider'

# The HelloWorldActivity class defines a set of activities for the HelloWorld sample.
class HelloWorldActivity
  extend AWS::Flow::Activities

  # Define which activities to run.
  activity :say_hello do
    {
      version: '1.0',
    }
  end

  # This activity will say hello when invoked by the workflow
  def say_hello(name)
    puts "Hello, #{name}!"
  end
end

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

require_relative "helloworld_activity"

# HelloWorldWorkflow class defines the workflows for the HelloWorld sample
class HelloWorldWorkflow
  extend AWS::Flow::Workflows

  # Define which workflows to run.
  workflow :hello do
    {
      version: '1.0',
      default_execution_start_to_close_timeout: 120
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

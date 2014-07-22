AWS Flow Framework for Ruby: Hello World (OpsWorks) Sample Application
======================================================================

This version of the *Hello World* sample is designed to run on Amazon OpsWorks. It contains a few extra files when
compared to the version in [https://github.com/awslabs/aws-flow-ruby-samples]:

* `helloworld.json` - a file used with the `aws-flow-ruby` command-line utility, also referred to as the *runner*. It
  defines parameters for running the Hello World workflow and activity.

* `flow` directory - contains two files: `activities.rb` and `workflows.rb`, which direct the runner to the files that
  should be loaded and scanned for activities and workflows to execute.

Prerequisites
-------------

The *AWS Flow Framework for Ruby* is required, which can be obtained and installed using the information here:

- <https://aws.amazon.com/swf/flow/>

If you already have [Ruby](https://www.ruby-lang.org/) and [RubyGems](http://rubygems.org/) installed, you can install
the framework by opening a terminal window and typing:

~~~~
gem install aws-flow
~~~~

For more information about setting up the AWS Flow Framework for Ruby, see [Installing the AWS Flow Framework for
Ruby](http://docs.aws.amazon.com/amazonswf/latest/awsrbflowguide/installing.html) in the *AWS Flow Framework for Ruby
Developer Guide*.

Downloading the Sample Code
---------------------------

The code for the AWS Flow Framework for Ruby OpsWorks Hello World sample is available at:

- <https://github.com/awslabs/aws-flow-ruby-opsworks-helloworld>

To view or download the code for all of the AWS Flow Framework for Ruby recipes and samples, go to:

- <https://github.com/awslabs/aws-flow-ruby-samples>

Run the Sample
--------------

**To run the HelloWorld sample:**

1.  Open *two* separate terminal windows and, in each one, change to the the location where you cloned or unarchived the
sample code. For example:

    ~~~~
    cd ~/Downloads/aws-flow-ruby-opsworks-helloworld/
    ~~~~

2.  In each command-line (terminal) window, execute the following
    commands, substituting your AWS Access keys for the example values.

    On Linux, OS X or Unix:

    ~~~~
    export AWS_ACCESS_KEY_ID='your-access-key'
    export AWS_SECRET_ACCESS_KEY='your-secret-key'
    export AWS_REGION='us-east-1'
    ~~~~

    On Windows:

    ~~~~
    set AWS_ACCESS_KEY_ID=your-access-key
    set AWS_SECRET_ACCESS_KEY=your-secret-key
    set AWS_REGION=us-east-1
    ~~~~

3.  Execute the following commands, one in each of the terminal windows:

    In terminal window 1:

    ~~~~
    aws-flow-ruby -f helloworld.json
    ~~~~

    In terminal window 2:

    ~~~~
    ruby lib/hello_world_workflow_starter.rb helloworld.json
    ~~~~

For More Information
--------------------

For more information about the Amazon Simple Workflow service and the
Amazon Flow Framework for Ruby, consult the following resources:

-   [AWS Flow Framework for Ruby Developer
    Guide](http://docs.aws.amazon.com/amazonswf/latest/awsrbflowguide/)
-   [AWS Flow Framework for Ruby API
    Reference](https://docs.aws.amazon.com/amazonswf/latest/awsrbflowapi/)
-   [AWS Flow Framework](http://aws.amazon.com/swf/flow/)
-   [Amazon Simple Workflow Service](http://aws.amazon.com/swf/)


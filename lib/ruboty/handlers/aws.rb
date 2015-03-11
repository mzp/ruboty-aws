require "ruboty/aws/actions/output_ec2_instances"
require "ruboty/aws/actions/count_ec2_running_instances"

module Ruboty
  module Handlers
    class Aws < Base

      env :AWS_ACCESS_KEY_ID, "AWS Access Key ID", optional: false
      env :AWS_SECRET_ACCESS_KEY, "AWS Secret Access Key", optional: false

      on /ec2 show all instances/, name: 'output_ec2_instances', description: 'Output all ec2 instances'
      on /ec2 show count instances/, name: 'count_ec2_running_instances', description: 'Output number of running instances'

      def output_ec2_instances(message)
        Ruboty::Aws::Actions::OutputEc2Instances.new(message).call
      end

      def count_ec2_running_instances(message)
        Ruboty::Aws::Actions::CountEc2RunningInstances.new(message).call
      end
    end
  end
end

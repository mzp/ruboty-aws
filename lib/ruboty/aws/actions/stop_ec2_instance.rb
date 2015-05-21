require 'aws-sdk'

module Ruboty
  module Aws
    module Actions
      class StopEc2Instance < Ruboty::Actions::Base
        def call
          region = "ap-northeast-1"
          ec2 = ::Aws::EC2::Client.new(region: region)
          resp = ec2.stop_instances(instance_ids: [instance])
          resp[:stopping_instances].each do|x|
            message.reply("#{x[:instance_id]}: #{x[:previous_state][:name]} => #{x[:current_state][:name]}")
          end
        rescue => exception
          message.reply("Failed by #{exception.class}")
          raise exception
        end

        private

        def instance
          message[:instance]
        end
      end
    end
  end
end

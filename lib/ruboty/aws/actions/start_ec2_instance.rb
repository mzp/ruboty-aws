require 'aws-sdk'

module Ruboty
  module Aws
    module Actions
      class StartEc2Instance < Ruboty::Actions::Base
        def call
          region = "ap-northeast-1"
          ec2 = ::Aws::EC2::Client.new(region: region)
          resp = ec2.start_instances(instance_ids: [instance])

          resp[:starting_instances].each do|x|
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

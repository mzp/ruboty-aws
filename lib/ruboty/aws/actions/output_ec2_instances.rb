require 'aws-sdk'

module Ruboty
  module Aws
    module Actions
      class OutputEc2Instances < Ruboty::Actions::Base
        def call
          region = "ap-northeast-1"
          ec2 = ::Aws::EC2::Client.new(region: region)
          resp = ec2.describe_instances(max_results: 1000)
          resp.each do |page|
            page.data[:reservations].each do |r|
              r[:instances].each do |i|
                message.reply "#{i[:instance_id]} #{i[:placement][:availability_zone]}: #{i[:state][:name]} #{i[:instance_type]} #{i[:instance_lifecycle]} #{i[:public_ip_address]}"
              end
            end
          end
        end
      end
    end
  end
end

require 'aws-sdk'

module Ruboty
  module Aws
    module Actions
      class CountEc2RunningInstances < Ruboty::Actions::Base
        def call
          region = "ap-northeast-1"
          ec2 = ::Aws::EC2::Client.new(region: region)
          resp = ec2.describe_instances(max_results: 1000)
          cnt = 0
          resp.each do |page|
            page.data[:reservations].each do |r|
              r[:instances].each do |i|
                cnt = cnt + 1 if i[:state][:code] == 16
              end
            end
          end

          message.reply "#{cnt} instances are running in #{region}"
        end
      end
    end
  end
end

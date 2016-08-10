require 'aws-sdk'

Thread.abort_on_exception = true

unless ENV['AWS_PRIVATE_ACCESS_KEY_ID'].nil?
  Aws.config.update(
    region: 'eu-west-1',
    credentials: Aws::Credentials.new(ENV['AWS_PRIVATE_ACCESS_KEY_ID'], ENV['AWS_PRIVATE_SECRET_ACCESS_KEY'])
  )

  Thread.new do
    queue_url = 'https://sqs.eu-west-1.amazonaws.com/062981245876/pr_helper_output'
    poller = Aws::SQS::QueuePoller.new(queue_url)
    puts 'Connected to AWS'
    poller.poll do |msg|
      ChannelManager.process(msg)
    end
  end
end

class BackendMessager
  def initialize(uuid)
    @uuid = uuid
    @client = Aws::SQS::Client.new
  end

  def send(url)
    @client.send_message({
      queue_url: "https://sqs.eu-west-1.amazonaws.com/062981245876/pr_helper_input",
      message_body: url,
      message_attributes: {
        "uuid" => {
          string_value: @uuid,
          data_type: "String", # required
        },
      },
    })
  end
end

json.extract! @message, :id, :identifier, :content, :user_id, :offer_id, :created_at
json.url offer_messages_url(@message, format: :json)
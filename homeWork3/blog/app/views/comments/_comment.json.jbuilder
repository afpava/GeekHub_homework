json.extract! comment, :id, :author, :body, :article_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)

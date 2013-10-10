object @article

attributes :id, :title, :body, :created_at
node(:url) { |article| article_url(article) }

child :author do
  attributes :name, :email
end

child :comments do
  attributes :body
end

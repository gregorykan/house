class BlogSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :created_at, :updated_at, :user_id
  # belongs_to :user
end
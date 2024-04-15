class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :number
  has_many :blogs
end

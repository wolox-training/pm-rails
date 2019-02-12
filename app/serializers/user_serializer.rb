class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :image_url,
             :rents_counter, :comments_counter, :unerad_notifications_count
end

def image_url
  nil
end

def rents_counter
  object.rents.count
end

def comments_counter
  0
end

def unerad_notifications_count
  0
end

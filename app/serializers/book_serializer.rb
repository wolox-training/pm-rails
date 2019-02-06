class BookSerializer < ActiveModel::Serializer
  attributes :id, :genre, :author, :image, :title, :year, :publisher, :created_at, :updated_at

  def image
    { url: object.image }
  end
end

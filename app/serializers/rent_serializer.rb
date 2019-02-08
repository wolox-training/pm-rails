class RentSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :book

  attributes :id, :from, :to, :returned_at, :user, :book

  def from
    object.start_date
  end

  def to
    object.end_date
  end

  def returned_at
    ''
  end
end

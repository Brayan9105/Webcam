# frozen_string_literal: true

class Player < ApplicationRecord
  attribute :picture, :string, default: ''
  
  has_one_attached :picture
  validates :picture, presence: true

  def has_picture?
    File.exist?(ActiveStorage::Blob.service.path_for(picture.key))
  end
end

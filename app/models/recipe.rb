class Recipe < ApplicationRecord
  serialize :ingredients, coder: JSON, type: Array
  has_one_attached :featured_image
  has_rich_text :instructions
  validates :name, presence: true
  belongs_to :user

  attr_accessor :remove_featured_image
  before_save :purge_featured_image, if: -> { remove_featured_image == "1" }

  private

  def purge_featured_image
    featured_image.purge_later
  end
end

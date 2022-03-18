# frozen_string_literal: true

class Book
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :author, type: String
  field :isbn, type: String

  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, presence: true, uniqueness: true

  index({ title: 'text' })
  index({ isbn: 1 }, { unique: true, name: 'isbn_index' })

  scope :title, ->(title) { where(title: /^#{title}/) }
end

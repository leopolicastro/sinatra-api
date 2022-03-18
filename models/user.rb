# frozen_string_literal: true

class User
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :books

  field :name, type: String
  field :email, type: String
  field :password, type: String
  field :admin, type: Boolean

  validates :email, presence: true
  validates :password, presence: true

  index({ email: 'text' })
  scope :admin, -> { where(admin: true) }
end

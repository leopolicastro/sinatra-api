# frozen_string_literal: true

class Todo
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user

  scope :completed, -> { where(complete: true) }
  scope :incomplete, -> { where(complete: false) }

  field :title, type: String
  field :due_date, type: Date
  field :description, type: String
  field :complete, type: Boolean

  validates :title, presence: true
end

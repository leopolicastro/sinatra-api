# frozen_string_literal: true

class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :book

  field :body, type: String

  validates :body, presence: true
end

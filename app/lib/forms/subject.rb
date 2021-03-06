# frozen_string_literal: true

module Forms
  class Subject < Form
    attribute :name, :string

    validates :name, presence: true
    validates :name, length: { minimum: 1, maximum: 128 }
    validates :name, uniqueness: true
  end
end

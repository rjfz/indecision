# frozen_string_literal: true

module Forms
  class User < Form
    attribute :role_id, :uuid
    attribute :email, :string
    attribute :id, :uuid

    validates :role_id, :email, presence: true

  end
end

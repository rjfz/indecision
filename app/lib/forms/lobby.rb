module Forms
  class Lobby < Form
    attribute :lesson_id, :uuid
    attribute :session_date, :datetime
    attribute :name, :string
    attribute :state, :string, default: 'pending'

    validates :lesson_id, :session_date, :name, presence: true
  end
end

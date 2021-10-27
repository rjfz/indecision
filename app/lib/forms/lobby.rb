module Forms
  class Lobby < Form
    attribute :lesson_id, :uuid
    attribute :room_code, :string
    attribute :session_date, :datetime
    attribute :name, :string

    validates :lesson_id, :session_date, :name, presence: true
  end
end

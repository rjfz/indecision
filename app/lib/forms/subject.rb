module Forms
  class Subject < Form

    attribute :name, :string

    validates :name, presence: true
    validates :name, length: { minimum: 4, maximum: 128 }
    validates :name, uniqueness: true
  end
end

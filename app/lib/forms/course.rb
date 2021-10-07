module Forms
  class Course < Form
    attribute :subject_id, :uuid
    attribute :name, :string
    attribute :module_code, :string

    validates :subject_id, :name, :module_code, presence: true
    validates :name, length: { minimum: 6, maximum: 220 }
    validates :module_code, length: { minimum: 4, maximum: 10 }
    validates :name, :module_code, uniqueness: true
  end
end

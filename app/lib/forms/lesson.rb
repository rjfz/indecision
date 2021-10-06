module Forms
 class Lesson < Form

  attribute :course_id, :uuid
  attribute :name, :string
  attribute :number, :integer

  validates :course_id , :name , :number , presence: true
  validates :name, length: { minimum: 6, maximum: 220 }
  validates :number, numericality:  { only_integer: true, greater_than: 0, less_than: 65 }


 end
end

# frozen_string_literal: true

module Forms
  class Year < Form
    attribute :academic_year, :string


    validates :academic_year, presence: true
  end
end

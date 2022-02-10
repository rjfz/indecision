# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_one :anon_user
  has_one_attached :avatar
  belongs_to :role
  has_many :user_subjects
  has_many :subjects, through: :user_subjects
end

# frozen_string_literal: true

# User model
# a simple ueasr model created with Devise gem
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :news, foreign_key: 'author_id'
end

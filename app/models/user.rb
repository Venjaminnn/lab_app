# frozen_string_literal: true

class User < ApplicationRecord
  has_many :lab_reports, dependent: :destroy

  validates :first_name, :last_name, length: { maximum: 100 }, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }, presence: true, length: { maximum: 150 }
end

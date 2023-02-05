# frozen_string_literal: true

class LabReport < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 250 }
  validates :description, length: { maximum: 500 }
  validates :grade, inclusion: { in: %w[A B C D E FX F] }, allow_nil: true
end
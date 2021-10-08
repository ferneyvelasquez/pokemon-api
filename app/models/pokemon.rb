class Pokemon < ApplicationRecord
    validates :number, presence: true, uniqueness: { message: "Number has already taken" }, on: :create
    validates :name, presence: true, uniqueness: { message: "Name has already taken" }
    scope :recent, -> { order(number: :desc) }
end

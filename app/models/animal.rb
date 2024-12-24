class Animal < ApplicationRecord
  enum :family, { mammal: 0, bird: 1, reptile: 2, amphibian: 3, fish: 4, invertebrate: 5 }

  validates :name, presence: true
end

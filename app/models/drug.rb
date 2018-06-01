class Drug < ApplicationRecord
  include AlgoliaSearch
  has_many :treatments
  # validates :name, presence: true, uniqueness: true
  # The seed base validates uniqueness for us.

  algoliasearch do
    attribute :name
  end
end


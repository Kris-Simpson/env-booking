class BookedEnvironment < ApplicationRecord
  belongs_to :environment
  belongs_to :user
end

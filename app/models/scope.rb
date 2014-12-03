class Scope < ActiveRecord::Base
	validates :minimum, :maximum, presence: true
	belongs_to :category

    def self.get_weather_scope(weather)
    self.find_by("minimum <= #{weather} and maximum >= #{weather}")
  end
end

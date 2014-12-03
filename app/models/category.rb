class Category < ActiveRecord::Base
	validates :name, presence: true

	has_many :suggestions
	has_many :items, through: :suggestions
	has_one :scope

  def self.get_suggested_precipitation_type_item(precipitation_type)
    categories = self.where(name: precipitation_type)
    categories ? [] : categories.items
  end

  def self.get_suggested_weather_items(scope)
    scope.category.items
  end

  def self.unique_items(scope, precipitation_type)
    (self.get_suggested_weather_items(scope) + self.get_suggested_precipitation_type_item(precipitation_type)).uniq
  end
end

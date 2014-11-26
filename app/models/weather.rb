class Weather < ActiveRecord::Base

  before_save :convert_to_celsius, if: :fahrenheit?
  before_save :convert_to_fahrenheit, if: :celsius?
  belongs_to :travel_date

private

  def celsius?
    return true if self.celsius
  end

  def fahrenheit?
    return true if self.fahrenheit
  end

  def convert_to_celsius
    self.celsius= (self.fahrenheit - 32) * 5.0 / 9.0

  end

  def convert_to_fahrenheit
    self.fahrenheit = (self.celsius * (9.0 / 5.0)) + 32
  end


end

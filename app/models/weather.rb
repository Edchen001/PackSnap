class Weather < ActiveRecord::Base

  before_save :convert_celsius, if: :fahrenheit?
  before_save :convert_fahrenheit, if: :celsius?
  belongs_to :dates

private

  def celsius?
    return true if self.celsius
  end

  def fahrenheit?
    return true if self.fahrenheit
  end

  def convert_celsius
    self.fahrenheit = (self.celsius * (9.0 / 5.0)) + 32
  end

  def convert_fahrenheit
    self.celsius= (self.fahrenheit - 32) * 5.0 / 9.0
  end


end

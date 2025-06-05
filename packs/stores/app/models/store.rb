module Stores
  class Store
    attr_accessor :name, :location, :website

    def initialize(name:, location:, website: nil)
      @name = name
      @location = location
      @website = website
    end
  end
end

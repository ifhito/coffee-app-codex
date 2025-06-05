module Beans
  class CoffeeBean
    attr_accessor :name, :origin, :variety, :roast_level, :tasting_notes, :purchased_at, :store_id, :user_id

    def initialize(name:, origin:, variety:, roast_level:, tasting_notes: nil, purchased_at: nil, store_id: nil, user_id: nil)
      @name = name
      @origin = origin
      @variety = variety
      @roast_level = roast_level
      @tasting_notes = tasting_notes
      @purchased_at = purchased_at
      @store_id = store_id
      @user_id = user_id
    end
  end
end

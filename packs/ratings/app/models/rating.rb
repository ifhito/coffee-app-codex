module Ratings
  class Rating
    attr_accessor :score, :comment, :coffee_bean_id, :user_id

    def initialize(score:, comment: nil, coffee_bean_id:, user_id:)
      @score = score
      @comment = comment
      @coffee_bean_id = coffee_bean_id
      @user_id = user_id
    end
  end
end

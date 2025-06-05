module Api
  module V1
    class CoffeeBeansController < ApplicationController
      def index
        beans = [
          Beans::CoffeeBean.new(name: 'Ethiopia Yirgacheffe', origin: 'Ethiopia', variety: 'Heirloom', roast_level: 'light'),
          Beans::CoffeeBean.new(name: 'Guatemala Antigua', origin: 'Guatemala', variety: 'Bourbon', roast_level: 'medium')
        ]
        render json: beans.map { |b| bean_hash(b) }
      end

      private

      def bean_hash(bean)
        {
          id: bean.object_id,
          name: bean.name,
          origin: bean.origin,
          variety: bean.variety,
          roast_level: bean.roast_level,
          tasting_notes: bean.tasting_notes
        }
      end
    end
  end
end

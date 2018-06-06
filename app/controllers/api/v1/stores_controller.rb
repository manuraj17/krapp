module Api
  module V1
    class StoresController < ApplicationController
      skip_before_action :verify_authenticity_token

      def new
        render plain: 'Hi, I am krapp'
      end
    
      def create
        Rails.logger.info params
        StorerJob.perform_later(params[:key], params[:value])
        render plain: 'Sent to be stored'
      end
    end
  end
end



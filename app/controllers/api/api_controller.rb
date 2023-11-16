# app/controllers/api/api_controller.rb
module Api
    class ApiController < ApplicationController
      before_action :authenticate_user!
  
      private
  
      def authenticate_user!
        token = request.headers['Authorization']&.split(' ')&.last
        @current_user = User.find_by_token(token)
  
        render json: { error: 'Unauthorized' }, status: :unauthorized unless @current_user
      end
    end
  end
  
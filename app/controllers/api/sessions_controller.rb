# app/controllers/api/sessions_controller.rb
module Api
    class SessionsController < ApplicationController
  
        def create
            user = User.find_by(email: params[:email])
            if params[:password] == user.password
                token = user.generate_token
                render json: { message: 'Successfully signed in!', user_id: user.id, token: token }, status: :ok
            else
                render json: { error: 'Invalid email or password' }, status: :unauthorized
            end
        end
    
        def destroy
            @current_user = User.find_by_token(params[:id])
            head :unauthorized unless @current_user
            render json: { message: 'Successfully signed out!' }, status: :ok
        end

    end
end
  
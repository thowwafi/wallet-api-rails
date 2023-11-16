class Api::WalletsController < Api::ApiController
    before_action :set_user, only: [:show, :update]

    def show
        render json: @user.wallet, status: :ok
    end

    def update
        if @user.wallet.update(wallet_params)
          render json: @user.wallet, status: :ok
        else
          render json: { errors: @user.wallet.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def set_user
        @user = User.find(params[:user_id])
    end

    def wallet_params
        params.require(:wallet).permit(:balance)
    end
end

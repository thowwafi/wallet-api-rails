class Api::EntitiesController < ApplicationController
    before_action :set_entity, only: [:show, :update]

    def show
        render json: {
            entity: @entity.as_json,
            wallet: {
                balance: @entity.wallet.transactions.sum(:amount),
                wallet_info: @entity.wallet.as_json(include: :transactions)
            }
        }, status: :ok
    end

    def update
      if @entity.update(entity_params)
        render json: @entity
      else
        render json: { error: 'Failed to update entity' }, status: :unprocessable_entity
      end
    end

    private

    def set_entity
      @entity = Entity.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Entity not found' }, status: :not_found
    end

    def entity_params
      # Define the allowed parameters for updating the entity
      params.require(:entity).permit(:name, :other_attribute)
    end
end

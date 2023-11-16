class Api::TransactionsController < Api::ApiController
    before_action :authenticate_user! # Assuming you have authentication

    def index
        render json: Transaction.all, status: :ok
    end

    def create
        if transaction_params[:transaction_type] == "debit"
            source_wallet = Wallet.find(transaction_params[:source_wallet_id])
            source_wallet.perform_transaction(transaction_params[:amount], 'debit', target_wallet)
        elsif transaction_params[:transaction_type] == "credit"
            target_wallet = Wallet.find(transaction_params[:target_wallet_id])
            target_wallet.perform_transaction(transaction_params[:amount], 'credit', source_wallet)
        end

        render json: { message: 'Transaction successfully created' }, status: :created
    rescue ActiveRecord::RecordNotFound => e
        render json: { error: "Wallet not found: #{e.message}" }, status: :not_found
    rescue ActiveRecord::RecordInvalid => e
        render json: { error: "Transaction creation failed: #{e.record.errors.full_messages.join(', ')}" }, status: :unprocessable_entity
    rescue StandardError => e
        render json: { error: "An error occurred: #{e.message}" }, status: :internal_server_error
    end
  
    private

    def validate_wallets(source_wallet, target_wallet)
        # Add custom validation logic based on your requirements
        # For example, ensure that the source wallet has enough balance for the transaction
        unless source_wallet.sufficient_balance?(params[:transaction][:amount].to_f)
            raise ActiveRecord::RecordInvalid.new(source_wallet)
        end
    end


    def transaction_params
        params.require(:transaction).permit(:source_wallet_id, :target_wallet_id, :amount, :transaction_type)
    end
end

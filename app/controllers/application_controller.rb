class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found(error)
    render json: ErrorSerializer.new(error).not_found, status: :not_found
  end

  def error_message(errors)
    errors.full_messages.join(', ')
  end
end

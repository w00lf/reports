class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def paginate(collection)
    collection.page(params[:page]).per(params[:per_page])
  end
end

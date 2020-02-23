class HomesController < ApplicationController
  def index
  	@questions = Question.order("created_at DESC").paginate(:page => params[:page], :per_page =>30) if current_user.present?
  end
end

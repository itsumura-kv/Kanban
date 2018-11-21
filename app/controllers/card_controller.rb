class CardController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]

  def new
    @column_id = params[:column_id]
    @users = User.all
    @card = Card.new
  end

  def create
    card = Card.new(card_params)
    if card.save
      redirect_to ''
    else
      render 'new'
    end
    raise
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def logged_in_user
    unless current_user
      redirect_to '/'
    end
  end

  private
    def card_params
      params.require(:card).permit(:title, :due_date, :user)
    end
end

class SportsController < ApplicationController
  before_action :set_sport, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @sports = Sport.all
    respond_with(@sports)
  end

  def show
    respond_with(@sport)
  end

  def new
    @sport = Sport.new
    respond_with(@sport)
  end

  def edit
  end

  def create
    @sport = Sport.new(sport_params)
    @sport.save
    respond_with(@sport)
  end

  def update
    @sport.update(sport_params)
    respond_with(@sport)
  end

  def destroy
    @sport.destroy
    respond_with(@sport)
  end

  private
    def set_sport
      @sport = Sport.find(params[:id])
    end

    def sport_params
      params.require(:sport).permit(:name)
    end
end

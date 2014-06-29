class PondsController < ApplicationController
  before_action :set_pond, only: [:show, :edit, :update, :destroy]

  #get '/ponds'
  def index
    @ponds = Pond.all
  end

  #get '/ponds/:id/edit'
  def edit
  end

  #patch '/ponds/:id'
  def update
    if @pond.update(pond_params)
      redirect_to ponds_path
    else
      render action: "edit"
    end
  end

  #get '/ponds/:id'
  def show
  end

  #get '/ponds/new'
  def new
    @pond = Pond.new
  end

  #post '/ponds'
  def create
    @pond = Pond.new(pond_params)
    if @pond.save
      redirect_to ponds_path
    else
      render action: "new"
    end
  end

  private
  def set_pond
    @pond = Pond.find(params[:id])
  end

  def pond_params
    params.require(:pond).permit(:name, :water_type)
  end

end

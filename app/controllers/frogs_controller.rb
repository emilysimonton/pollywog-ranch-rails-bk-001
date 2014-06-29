class FrogsController < ApplicationController
  before_action :set_frog, only: [:show, :edit, :update, :destroy]

  #get '/frogs'
  def index
    @frogs = Frog.all
    @ponds = Pond.all
  end

  def new
    @frog = Frog.new
    @pond = Pond.find(params[:pond_id])
  end

  def create
    @frog = Frog.new(frog_params)
    @pond = Pond.find(params[:pond_id])
    @pond.frogs << @frog
    if @frog.save
      redirect_to frogs_path
    else
      render action: "new"
    end
  end

  def edit
    @ponds = Pond.all
  end

  def update
    if @frog.update(frog_params)
      redirect_to frogs_path
    else
      render action: "edit"
    end
  end

  def show
  end

  private
  def set_frog
    @frog = Frog.find(params[:id])
  end

  def frog_params
    params.require(:frog).permit(:name, :color, :pond_id)
  end
end

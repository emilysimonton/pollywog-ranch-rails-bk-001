class TadpolesController < ApplicationController
  before_action :set_tadpole, only: [:show, :edit, :update, :destroy, :evolve]

  def index
    @tadpoles = Tadpole.all
    @frogs = Frog.all
  end

  def edit
    @frog = @tadpole.frog
  end

  def evolve
    @frog = Frog.new(:name => @tadpole.name, :color => @tadpole.color, :pond_id => @tadpole.frog.pond_id)
    @tadpole.destroy
    if @frog.save
      redirect_to frogs_path
    else
      render action: "show"
    end
  end

  def update
    if @tadpole.update(tadpole_params)
      redirect_to tadpoles_path
    else
      render action: "edit"
    end
  end

  def show
  end

  def new
    @frog = Frog.find(params[:frog_id])
  end

  def create
    @tadpole = Tadpole.new(tadpole_params)
    @frog = Frog.find(params[:frog_id])
    @tadpole.frog = @frog
    # @pond = Pond.find_by(:id => @frog.pond_id)
    @tadpole.frog.pond = @frog.pond
    if @tadpole.save
      redirect_to tadpoles_path
    else
      render action: "new"
    end
  end

  private
  def set_tadpole
    @tadpole = Tadpole.find(params[:id])
  end

  def tadpole_params
    params.require(:tadpole).permit(:name, :color, :frog_id)
  end
end

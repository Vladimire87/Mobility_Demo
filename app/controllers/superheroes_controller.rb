class SuperheroesController < ApplicationController
  before_action :set_superhero, only: %i[ show edit update destroy ]

  # GET /superheroes or /superheroes.json
  def index
    @superheroes = Superhero.all
  end

  # GET /superheroes/1 or /superheroes/1.json
  def show
  end

  # GET /superheroes/new
  def new
    @superhero = Superhero.new
  end

  # GET /superheroes/1/edit
  def edit
  end

  # POST /superheroes or /superheroes.json
  def create
    @superhero = Superhero.new(superhero_params)

    respond_to do |format|
      if @superhero.save
        format.html { redirect_to superhero_url(@superhero), notice: "Superhero was successfully created." }
        format.json { render :show, status: :created, location: @superhero }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @superhero.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /superheroes/1 or /superheroes/1.json
  def update
    respond_to do |format|
      if @superhero.update(superhero_params)
        format.html { redirect_to superhero_url(@superhero), notice: "Superhero was successfully updated." }
        format.json { render :show, status: :ok, location: @superhero }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @superhero.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /superheroes/1 or /superheroes/1.json
  def destroy
    @superhero.destroy

    respond_to do |format|
      format.html { redirect_to superheroes_url, notice: "Superhero was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_superhero
      @superhero = Superhero.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def superhero_params
      params.require(:superhero).permit(:name, :description)
    end
end

class PetSittersController < ApplicationController
  before_action :set_pet_sitter, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit create update destroy]

  # GET /pet_sitters or /pet_sitters.json
  def index
    @pet_sitters = PetSitter.all
  end

  # GET /pet_sitters/1 or /pet_sitters/1.json
  def show
  end

  # GET /pet_sitters/new
  def new
    @pet_sitter = PetSitter.new
  end

  # GET /pet_sitters/1/edit
  def edit
  end

  # POST /pet_sitters or /pet_sitters.json
  def create
    @pet_sitter = PetSitter.new(pet_sitter_params)

    respond_to do |format|
      if @pet_sitter.save
        format.html { redirect_to pet_sitter_url(@pet_sitter), notice: "Pet sitter was successfully created." }
        format.json { render :show, status: :created, location: @pet_sitter }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pet_sitter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pet_sitters/1 or /pet_sitters/1.json
  def update
    respond_to do |format|
      if @pet_sitter.update(pet_sitter_params)
        format.html { redirect_to pet_sitter_url(@pet_sitter), notice: "Pet sitter was successfully updated." }
        format.json { render :show, status: :ok, location: @pet_sitter }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pet_sitter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pet_sitters/1 or /pet_sitters/1.json
  def destroy
    @pet_sitter.destroy

    respond_to do |format|
      format.html { redirect_to pet_sitters_url, notice: "Pet sitter was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet_sitter
      @pet_sitter = PetSitter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pet_sitter_params
      params.require(:pet_sitter).permit(:name, :email, :description, :cost)
    end
end

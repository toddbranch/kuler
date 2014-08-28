class PalettesController < ApplicationController
  before_action :set_palette, only: [:show, :edit, :update, :destroy]

  # GET /palettes
  # GET /palettes.json
  def index
    @palettes = Palette.all
  end

  # GET /palettes/1
  # GET /palettes/1.json
  def show
  end

  # GET /palettes/new
  def new
    @palette = Palette.new
		initial_colors = ['2','6','A','D','F']
		initial_colors.each do |color|
			@palette.colors.new(hex_value: "##{color * 6}")
		end
  end

  # GET /palettes/1/edit
  def edit
  end

  # POST /palettes
  # POST /palettes.json
  def create
    @palette = Palette.new(palette_params)

    respond_to do |format|
      if @palette.save
				params[:palette][:colors].each do |value|
					@palette.colors.create(hex_value: value)
				end

        format.html { redirect_to @palette, notice: 'Palette was successfully created.' }
        format.json { render :show, status: :created, location: @palette }
      else
        format.html { render :new }
        format.json { render json: @palette.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /palettes/1
  # PATCH/PUT /palettes/1.json
  def update
    respond_to do |format|
      if @palette.update(palette_params)
        format.html { redirect_to @palette, notice: 'Palette was successfully updated.' }
        format.json { render :show, status: :ok, location: @palette }
      else
        format.html { render :edit }
        format.json { render json: @palette.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /palettes/1
  # DELETE /palettes/1.json
  def destroy
    @palette.destroy
    respond_to do |format|
      format.html { redirect_to palettes_url, notice: 'Palette was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_palette
      @palette = Palette.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def palette_params
      params.require(:palette).permit(:name, :slug)
    end
end

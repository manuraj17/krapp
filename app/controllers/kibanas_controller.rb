class KibanasController < ApplicationController
  before_action :set_kibana, only: [:show, :edit, :update, :destroy]

  # GET /kibanas
  def index
    @kibanas = Kibana.all
  end

  # GET /kibanas/1
  def show
  end

  # GET /kibanas/new
  def new
    @kibana = Kibana.new
  end

  # GET /kibanas/1/edit
  def edit
  end

  # POST /kibanas
  def create
    @kibana = Kibana.new(kibana_params)

    if @kibana.save
      redirect_to @kibana, notice: 'Kibana was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /kibanas/1
  def update
    if @kibana.update(kibana_params)
      redirect_to @kibana, notice: 'Kibana was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /kibanas/1
  def destroy
    @kibana.destroy
    redirect_to kibanas_url, notice: 'Kibana was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kibana
      @kibana = Kibana.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def kibana_params
      params.require(:kibana).permit(:url)
    end
end

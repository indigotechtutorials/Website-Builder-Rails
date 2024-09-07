class UiComponentsController < ApplicationController
  before_action :authenticate_user!, :authorized_admin!
  before_action :set_ui_component, only: %i[ show edit update destroy ]

  # GET /ui_components or /ui_components.json
  def index
    @ui_components = UiComponent.all
  end

  # GET /ui_components/1 or /ui_components/1.json
  def show
  end

  # GET /ui_components/new
  def new
    @ui_component = UiComponent.new
  end

  # GET /ui_components/1/edit
  def edit
  end

  # POST /ui_components or /ui_components.json
  def create
    @ui_component = UiComponent.new(ui_component_params)

    respond_to do |format|
      if @ui_component.save
        StoreTmpTailwindJob.perform_later(@ui_component.id)
        format.html { redirect_to ui_component_url(@ui_component), notice: "Ui component was successfully created." }
        format.json { render :show, status: :created, location: @ui_component }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ui_component.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ui_components/1 or /ui_components/1.json
  def update
    respond_to do |format|
      if @ui_component.update(ui_component_params)
        format.html { redirect_to ui_component_url(@ui_component), notice: "Ui component was successfully updated." }
        format.json { render :show, status: :ok, location: @ui_component }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ui_component.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ui_components/1 or /ui_components/1.json
  def destroy
    @ui_component.destroy!

    respond_to do |format|
      format.html { redirect_to ui_components_url, notice: "Ui component was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ui_component
      @ui_component = UiComponent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ui_component_params
      params.require(:ui_component).permit(:name, :html_content)
    end
end

class WebsitesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_website, only: %i[ show edit update destroy ]

  # GET /websites or /websites.json
  def index
    @websites = current_user.websites.all
    redirect_to new_website_path if @websites.size.zero?
  end

  # GET /websites/1 or /websites/1.json
  def show
  end

  # GET /websites/new
  def new
    @website = current_user.websites.new
  end

  # GET /websites/1/edit
  def edit
  end

  # POST /websites or /websites.json
  def create
    @website = current_user.websites.new(website_params)

    respond_to do |format|
      if @website.save
        format.html { redirect_to website_url(@website), notice: "Website was successfully created." }
        format.json { render :show, status: :created, location: @website }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @website.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /websites/1 or /websites/1.json
  def update
    @ui_component = UiComponent.find(params[:ui_component_id])
    @website.html_content = '' if @website.html_content.nil?
    @website.html_content += @ui_component.html_content
    if @website.save
      render turbo_stream: turbo_stream.update("html-content", html: @website.html_content.html_safe)
    end
  end

  # DELETE /websites/1 or /websites/1.json
  def destroy
    @website.destroy!

    respond_to do |format|
      format.html { redirect_to websites_url, notice: "Website was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_website
      @website = current_user.websites.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def website_params
      params.require(:website).permit(:name)
    end
end

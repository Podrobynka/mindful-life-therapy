class AboutPageController < ApplicationController
  before_action :set_about_page, only: [:show, :edit, :update]

  # GET /about_page
  def show
  end

  # GET /about_page/edit
  def edit
  end

  # PATCH/PUT /about_page
  def update
    if @about_page.update(about_page_params)
      redirect_to about_page_url, notice: 'About page was successfully updated.'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_about_page
      @about_page = AboutPage.first
    end

    # Only allow a trusted parameter "white list" through.
    def about_page_params
      params.require(:about_page).permit(:title, :body, :meta_description)
    end
end

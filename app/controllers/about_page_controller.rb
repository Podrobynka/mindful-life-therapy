class AboutPageController < ApplicationController
  before_action :set_about_page, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    if @about_page.update(about_page_params)
      redirect_to about_page_url, notice: 'About page was successfully updated.'
    else
      render :edit
    end
  end

  private

    def set_about_page
      @about_page = AboutPage.first
    end

    def about_page_params
      params.require(:about_page).permit(:body, :photo, :change_photo)
    end
end

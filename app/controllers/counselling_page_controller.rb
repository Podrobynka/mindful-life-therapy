class CounsellingPageController < ApplicationController
  before_action :set_counselling_page, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    if @counselling_page.update(counselling_page_params)
      redirect_to counselling_page_url, notice: 'Counselling page was successfully updated.'
    else
      render :edit
    end
  end

  private

    def set_counselling_page
      @counselling_page = CounsellingPage.first
    end

    def counselling_page_params
      params.require(:counselling_page).permit(:body, :photo)
    end
end

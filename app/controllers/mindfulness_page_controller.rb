class MindfulnessPageController < ApplicationController
  before_action :set_mindfulness_page, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    if @mindfulness_page.update(mindfulness_page_params)
      redirect_to mindfulness_page_url, notice: 'Mindfulness page was successfully updated.'
    else
      render :edit
    end
  end

  private

    def set_mindfulness_page
      @mindfulness_page = MindfulnessPage.first
    end

    def mindfulness_page_params
      params.require(:mindfulness_page).permit(:body, :photo)
    end
end

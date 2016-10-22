class AskersController < ApplicationController


  def create
    @asker = Asker.find_or_initialize_by(asker_params)
    if @asker.save
      redirect_to new_photo_path(asker_id: @asker.id)
    else
      redirect_to :root, alert: "Please insert email."
    end
  end

  private
  def asker_params
    params.require(:asker).permit(:email, :name)
  end
end

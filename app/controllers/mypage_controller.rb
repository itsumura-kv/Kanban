class MypageController < ApplicationController
  def edit
  end

  def update
    current_user.name = params[:inputName]
    save_image params[:inputImage], current_user.uid
    current_user.save!
    raise
    redirect_to mypage_edit_path
  end

  def destroy
  end

  private

  def save_image(new_image, uid)
    puts new_image
    puts uid
    raise
  end
end

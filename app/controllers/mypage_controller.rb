class MypageController < ApplicationController
  def edit
  end

  def update
    current_user.name = params[:inputName]
    unless params[:inputImage] == nil
      save_image params[:inputImage], current_user.uid
    end
    current_user.save!
    redirect_to mypage_edit_path
  end

  def destroy
  end

  private

  def save_image(new_image, uid)
    # 今ある画像を削除
    if File.exists?("public/img/profile/#{current_user.image_path}")
      File.delete("public/img/profile/#{current_user.image_path}")
    end

    # 画像ファイルを保存
    File.binwrite("public/img/profile/#{new_image.original_filename}", new_image.read)
    current_user.image_path = new_image.original_filename
  end
end

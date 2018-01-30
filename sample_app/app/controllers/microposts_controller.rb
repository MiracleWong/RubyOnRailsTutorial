class MicropostsController < ApplicationController
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      # 新建微博提交失败时数组为空
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    
  end

  private
  def micropost_params
    params.require(:micropost).permit(:content)
  end
end

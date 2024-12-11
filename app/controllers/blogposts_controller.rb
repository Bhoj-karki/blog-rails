class BlogpostsController < ApplicationController
  def index
    @blogposts = Blogpost.all
  end

  def show
    @blogpost = Blogpost.find_by(id: params[:id])
  unless @blogpost
    redirect_to blogposts_path, alert: "Blogpost not found."
  end
  end

   def new
     @blogpost = Blogpost.new
   end

   def create
     @blogpost = Blogpost.new(blogpost_params)
     if @blogpost.save
       redirect_to @blogpost
     else
      render :new, ststus: unprocessable_entity
     end
   end

   def edit
     @blogpost = Blogpost.find(params[:id])
   end

   def update
     @blogpost = Blogpost.find(params[:id])
     if @blogpost.update(blogpost_params)
      redirect_to @blogpost, notice: "Blogpost was successfully updated."
     else
       render :edit, status: unprocessable_entity
     end
   end
   def destroy
     @blogpost = Blogpost.find(params[:id])
     @blogpost.destroy
     redirect_to root_path, :see_other
   end

   private
   def blogpost_params
    params.require(:blogpost).permit(:title, :body)
   end
end

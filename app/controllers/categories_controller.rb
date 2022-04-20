class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)
      if @category.saved
        flash[:notice] = "Category was successfully created"
        redirect_to @category
      else
          render 'new'
      end
    end

    def index
      @categories = Category.paginate(page: params[:page], per_page: 8)       
    end

    def show
      @category = Category.find(params[:id])
    end

    private

    def category_params
      params.require(:category).permit(:name)
    end

    def require_admin
        if !(logged_in? && current_user.admin?)
            falsh[:alert] = "Only admins can perform that action"
            redirect_to categories_path
        end
    end
end
module Refinery
  module Blog
    class CategoriesController < BlogController

      def show
        @category = Refinery::Blog::Category.find(params[:id])
        @posts = @category.posts.live.includes(:comments, :categories).with_globalize.page(params[:page])
        @page = Refinery::Page.where(slug: 'portfolio').first
      end

    end
  end
end

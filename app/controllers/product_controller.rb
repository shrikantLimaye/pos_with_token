class ProductController < ApplicationController
      def list
        @products = Product.all
      end
    
      def page
        @products = Product.all
      end
    
      def show
        @product = Product.find(params[:id])
      end
    
      def new
        @product = Product.new
        @categories = Category.all
      end
    
      def product_params
        params.require(:products).permit(:title, :price, :category_id, :description)
      end
    
      def create
        @product = Product.new(product_params)
    
        if @product.save
           redirect_to :action => 'list'
        else
           @categories = Category.all
           render :action => 'new'
        end
      end
     
      def edit
        @product = Product.find(params[:id])
        @categories = Category.all
      end
     
      def update
        @product = Product.find(params[:id])
    
        if @product.update(product_param)
            redirect_to :action => 'show', :id => @product
        else
            @categories = Category.all
            render :action => 'edit'
        end
      end
    
      def product_param
        params.require(:product).permit(:title, :description, :price, :category_id)
      end
     
      def delete
        Product.find(params[:id]).destroy
        redirect_to :action => 'list'
      end
end

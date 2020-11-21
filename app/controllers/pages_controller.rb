class PagesController < ApplicationController

    before_action :set_page, except: [:index, :new, :create]
    # before_action :set_page, only: [:show, :edit, :update, :destroy]

    def index
        @pages = Page.all  #list of pages
    end  
    
    def show
        # @page = Page.find(params[:id])
        # render text: @page.title #page's title gets display
    end  

    def new
        @page = Page.new
    end

    def create
        # it helps to see all params of a new_page like a json file
        # render text: params.to_json 
        # render text: params.class # will show 'ActionController::Parameters' class
        # @page = Page.new(params)
        # render text: params.to_json # ithelps to see content of new_page like a json file
    
        # page_params = params.require(:page).permit(:title, :body, :slug)
        
        @page = Page.new(page_params)
        @page.save
        redirect_to @page # it will redorect to the new created page
    end

    def edit
        # @page = Page.find(params[:id])
    end

    def update
        # @page = Page.find(params[:id])
        # page_params = params.require(:page).permit(:title, :body, :slug)

        @page.update(page_params) # this will update object's parameters on the form. 
        redirect_to @page
    end

    def destroy
        # @page = Page.find(params[:id])
        @page.destroy
        redirect_to pages_path
    end    

    # When Rails handles a request, it creates a new instance of your controller, 
    # and sets an instance variable that params simply returns. 
    # And since params is an instance method, it can be accessed from 
    # within any instance method (public or private) of that controller.
    private 

    def page_params
        page_params = params.require(:page).permit(:title, :body, :slug)
    end

    def set_page
        @page = Page.find(params[:id])
    end
end

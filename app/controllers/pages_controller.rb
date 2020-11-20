class PagesController < ApplicationController
    def index
        @pages = Page.all  #list of pages
    end  
    
    def show
        @page = Page.find(params[:id])
        # render text: @page.title #page's title gets display
    end  
end

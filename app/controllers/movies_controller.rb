class MoviesController < ApplicationController
    def index
        @movies = Movie.all
    end
    def show 
        id = params[:id]
        @movie = Movie.find(id)
    end
    def new
        @movie = Movie.new
        #default render :'new' template
    end
    def create
        #params.require(:movie)
        #params[:movie].permit(:title, :rating, :release_date)
        @movie = Movie.create!(allowparams)
        flash[:warning] = "#{@movie.title} was successfully created"
        redirect_to movie_path (@movie)
        #shortcut: params.require(:movie).permit(:title, :rating, :release_date)
    end
    
    
    def receive_id
        id = params[:id] # receive Id from
        @movie = Movie.find(id)
    end
    
    def edit 
        @movie = Movie.find(params[:id])
    end
    
    def update
        @movie = Movie.find(params[:id])
        @movie.update_attributes!(params[:movie])
        flash[:notice] = "#{@movie.title} was successfully updated "
        redirect_to movie_path(@movie)
    end
    
    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
        flash[:notice] = "Movie '#{@movie.title}' deleted "
        redirect_to movies_path
    end
    
    def allowparams
        params.require(:movie).permit(:title, :rating, :description, :release_date)
    end
end
class MoviesController < ApplicationController
    def index
        @movies = Movie.all
    end
    def show 
        id = params[:id]
        @movie = Movie.find(id)
    end
    def create
        @movie = Movie.new(allowparams)
        if @movie.save
            flash[:notice] = "#{@movie.title} was successfully created."
            redirect_to movies_path
        else
            render 'new' # note, 'new' template can access @movie's field values!
        end
    end
    # replaces the 'update' method in controller:
    def update
        @movie = Movie.find(params[:id])
        if @movie.update_attributes(allowparams)
            flash[:notice] = "#{@movie.title} was successfully updated."
            redirect_to movie_path(@movie)
        else
            render 'edit' # note, 'edit' template can access @movie's field values!
        end
    end
# note, you will also have to update the 'new' method:
    def new
        @movie = Movie.new
    end
    # def new
    #     @movie = Movie.new
    #     #default render :'new' template
    # end
    # def create
    #     @movie = Movie.create!(allowparams)
    #     flash[:warning] = "#{@movie.title} was successfully created"
    #     redirect_to movie_path (@movie)
    #     #shortcut: params.require(:movie).permit(:title, :rating, :release_date)
    # end
        
    # def update
    #     @movie = Movie.find(params[:id])
    #     @movie.update_attributes!(params[:movie])
    #     flash[:notice] = "#{@movie.title} was successfully updated "
    #     redirect_to movie_path(@movie)
    # end
    
    def receive_id
        id = params[:id] # receive Id from
        @movie = Movie.find(id)
    end
    
    def edit 
        @movie = Movie.find(params[:id])
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
    
    # def search_tmdb
    #     # hardwire to simulate failure
    #     flash[:warning] = "'#{params[:search_terms]}' was not found in TMDb."
    #     redirect_to movies_path
    # end
end
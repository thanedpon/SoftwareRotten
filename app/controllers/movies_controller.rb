class MoviesController < ApplicationController
    def index
        @movies = Movie.all
    end
    
    def new
        @movie = Movie.new
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
    def show 
        id = params[:id]
        @movie = Movie.find(id)
        #id = params[:id] # retrieve movie ID from URI route
        render(:partial => 'movie', :object => @movie) if request.xhr?
        # will render app/views/movies/show.<extension> by default
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
    
    def movies_with_good_reviews
        @movies = Movie.joins(:reviews).group(:movie_id).
        having('AVG(reviews.potatoes) > 3')
    end
    def movies_for_kids
        @movies = Movie.where('rating in ?', %w(G PG))
    end
    
    def search_tmdb
        # hardwire to simulate failure
        #flash[:warning] = "'#{params[:search_terms]}' was not found in TMDb."
        @current_user ||= Moviegoer.find_by(id: session[:user_id])
        @movies = Movie.find_in_tmdb(params[:search_terms])
        #redirect_to movies_path
    end
    
    def allowparams
        params.require(:movie).permit(:title, :rating, :description, :release_date)
    end

end
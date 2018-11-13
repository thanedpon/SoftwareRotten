class SessionsController < ApplicationController
    skip_before_action :set_current_user
    def create
        auth= request.env["omniauth.auth"]
        user= Moviegoer.find_by(:provider => auth["provider"], :uid => auth["uid"]) || Moviegoer.create_with_omniauth(auth)
        session[:user_id] = user.id
        #@user = User.find_or_create_from_auth_hash(auth_hash)
        #self.current_user = @user
        #redirect_to '/'
        redirect_to movies_path
    end
    protected
    def auth_hash
        request.env['omniauth.auth']
    end
    
    def destroy
        session.delete(:user_id)
        flash[:notice] = 'Logged out successfully'
        redirect_to '/'
    end
end
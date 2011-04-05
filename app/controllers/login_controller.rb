class LoginController < ApplicationController

def index
	if request.post?
		self.current_user = Alumni.authenticate(params[:email], params[:password])
		if current_user
			redirect_to :controller => 'alumnis', :action => "show", :id => current_user.id
			flash[:notice] = 'Du bist erfolgreich eingeloggt!'
		else
			flash[:notice] = 'Email oder Passwort sind falsch!'
	    end
	end	
end

def logout
	self.current_user = nil
	flash[:notice] = 'Du bist erfolgreich ausgeloggt!'
    redirect_to :controller => 'public', :action => 'index'
end

end

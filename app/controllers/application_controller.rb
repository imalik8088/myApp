class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  protected
  #Überprüft ob ein Benutzer angemeldet ist, wenn nicht wir er zum Login weitergeleitet
  def login_required
	if not current_user
		redirect_to :cotroller => '/login'
		return false
	end
  end
  
 #Erstellt eine Session 
  def current_user=(alumni)
	session[:alumni_id] = alumni ? alumni.id : nil
  end
  
 #Kontrolliert ob der Benutzer eingeloggt ist
  def current_user
	if session[:alumni_id]
		@__alumni__ ||= Alumni.find(session[:alumni_id])
	end	
  end
	
	
end

# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  include AuthenticatedSystem

  # Siempre que haya un xhr (XmlHttpRequest) request (osea ajax) el layout es false
  # caso contrario el layout es application
  layout proc{ |c| c.request.xhr? ? false : "application" }

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'ad497b2a412c01039c99c79c173df1fe'
  
end

module RegistrationsHelper

  def event_sold_out(event, current_user)
      if event.sold_out 
        content_tag(:button,"Sold out" ,class: "btn btn-secondary", disabled: true)
      else
        
        link_to 'Registered', new_event_registration_path(event),class:"btn btn-success"
        
      end
  end

  
end

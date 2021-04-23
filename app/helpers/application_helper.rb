module ApplicationHelper


  def price(event)
    if event.free?
      "Free"
    else 
      number_to_currency(event.price,precision: 0)
    end
  end

  def day_time(event)
    event.starts_at.strftime(" %B %d %Y at %I:%M %P")
  end

  def availability(event)
    if event.available_spot == 0
      content_tag(:span ,"Sold Out", class:"badge rounded-pill bg-danger")
    else
      content_tag(:span ,pluralize(event.available_spot ,"Spot"), class:"badge rounded-pill bg-primary")
      
    end
  end

  
end


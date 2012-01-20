module ProductsHelper

  def display_heading_for_index(name, found)		
		if found 
      render 'search_header', :name => name
    else
      render "no_search_header"
    end
  end
  
end

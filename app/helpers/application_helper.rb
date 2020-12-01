module ApplicationHelper
  # custom message page_entries_info I'm very OC 
  def page_entries_info(collection, options = {})
    entry_name = options[:entry_name] || (collection.empty?? 'item' :
        collection.first.class.name.split('::').last.titleize)
    if collection.total_pages < 2
      case collection.size
      when 0; "No #{entry_name.pluralize} found"
      else; "Displaying all #{entry_name.pluralize}"
      end
    else
      %{%d of %d #{entry_name.pluralize}} % [collection.offset + 1, collection.total_entries]
    end
  end
end

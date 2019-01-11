module ApplicationHelper

    def admin_types
        ['AdminUser']
    end
    

    def nav_items 
        [
            {
              url: root_path,
              title: 'Home'
            },
            {
              url: posts_path,
              title: 'Time Entries'
            },
            {
                url: new_post_path,
                title: 'New Entry'
            }
    
      ]
      end

    def nav_helper tag_type, style

        nav_links = ''
  
        nav_items.each do |item|
  
          nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"  
        end
  
        nav_links.html_safe
    end

    def active? path
        "active" if current_page?(path)
    end   

    def status_label status
        status_span_generator status
      end

    private

        def status_span_generator status
            case status
            when 'submitted'
                content_tag(:span, status.titleize, class: 'badge badge-primary')
            when 'approved'
                content_tag(:span, status.titleize, class: 'badge badge-success')
            when 'rejected'
                content_tag(:span, status.titleize, class: 'badge badge-danger')
            when 'pending'
                content_tag(:span, status.titleize, class: 'badge badge-primary')
            when 'confirmed'
                content_tag(:span, status.titleize, class: 'badge badge-success')
            end
        end
end

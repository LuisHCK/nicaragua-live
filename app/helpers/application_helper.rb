module ApplicationHelper
  def markdown(text)
    options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    @markdown = Redcarpet::Markdown.new(renderer, extensions)

    @markdown.render(text).html_safe
  end

  def youtube_video(url)
   youtube_id = url.split("=").last
   render :partial => 'posts/video_frame', :locals => { :url => youtube_id }
 end

 def show_likes(post)
  if post.hearts.count > 0
    render :partial => 'hearts/counter', :locals => {:post => post}
  end
end


def build_flash(model)
  if model.errors.count > 0
    flash.now[:alert] = model.errors.full_messages.join('<br/>').html_safe
  end
end

def correct_flash_name(name)
  case name
  when 'alert'
    'danger'
  when 'notice'
    'success'
  else
    name
  end
end

def is_active?(link_path)
  current_page?(link_path) ? 'active' : nil
end

def user_form
  common_options = { validate: true, html: { class: 'user-form' } }
  form_options = current_user ? [ current_user, { url: change_user_name_path(current_user.id), method: :post, validate: true }.merge(common_options) ] : [ User.new, { validate: true }.merge(common_options) ]
  form_for *form_options do |f|
    yield f
  end
end

private

def number_of_people_who_also_answered_count option_id
  Survey::Answer.where(option_id: option_id).count
end

def human_date(in_human_date)
    #in_human_date.date.strftime()
    I18n.l(in_human_date, format: "%A %d %B, %Y")
  end

  def human_time(in_human_time)
    in_human_time.time.strftime("%I:%M %p")
  end

  def humanize_date(date)
    if date!= nil
    I18n.l(date, format: "%A %d %B, %Y")
    else
      return "null date"
    end
  end

#common helper methods for clients
def link_to_panel
  if user_signed_in?
    if current_user.user_lvl >=  3
      content_tag(:li) do
        link_to("Panel",admin_panel_path)
      end
    end
  end  
end
#common helper methods for users
def avatar_user(user)
  if user.profile.present?
    image_tag(user.profile.avatar(:thumb),class:'img-circle resposive-img avatar_profile')
  elsif user.clientprofile.present?
    image_tag(user.clientprofile.avatar(:thumb),class:'img-circle resposive-img avatar_profile')
  else
    image_tag('icon-user-default.png', class:"img-circle resposive-img avatar_profile")
  end
end

def link_to_user(user)
  if user.profile.present?
    link_to(user.profile.name, user.profile)
  elsif user.clientprofile.present?
    link_to(user.clientprofile, user.clientprofile.name)
  else
    user.name
  end
end

def user_level(user)
  if user.user_lvl == 1 
    return content_tag(:span, "Básico", class:"label label-primary") 
    elsif user.user_lvl == 2
      return content_tag(:span, "Empresa", class:"label label-primary")
    elsif user.user_lvl == 3
      return content_tag(:span, "Moderador", class:"label label-primary")
    elsif user.user_lvl == 4
      return content_tag(:span, "Admin", class:"label label-primary")
    elsif user.user_lvl == 5
      return content_tag(:span, "Máster", class:"label label-primary")
  end
end
#Icon helper
def icon(icon, text = nil, html_options = {})
  text, html_options = nil, text if text.is_a?(Hash)

  content_class = "fa fa-#{icon}"
  content_class << " #{html_options[:class]}" if html_options.key?(:class)
  html_options[:class] = content_class

  html = content_tag(:i, nil, html_options)
  html << ' ' << text.to_s unless text.blank?
  html
end

def get_user_name(user)
  return name = "#{user.name} #{user.last_name}"
end

end

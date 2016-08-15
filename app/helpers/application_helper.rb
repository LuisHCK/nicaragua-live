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
    I18n.l(date, format: "%A %d %B, %Y")
  end

#common helper methods for clients
  def avatar_client(client)
    if client.clientprofile.present?
      image_tag(client.clientprofile.avatar(:thumb),class:'circle resposive-img avatar_profile')
    else
      image_tag('icon-user-default.png',class:'circle resposive-img avatar_profile')
    end
  end
  def link_to_client(client)
    if client.clientprofile.present?
      link_to(client.clientprofile.name, client.clientprofile)
    else
      client.email
    end
  end
#common helper methods for users
  def avatar_user(user)
    if user.profile.present?
      image_tag(user.profile.avatar(),class:'circle resposive-img avatar_profile')
    else
      image_tag('icon-user-default.png',class:'circle resposive-img avatar_profile')
    end
  end
  def link_to_user(user)
    if user.profile.present?
      link_to(user.profile.name, user.profile)
    else
      user.email
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

  def post_delete(post)
    if user_signed_in?
      if current_user.id == post.profile.user_id
        link_to post_path(post), method: :delete, data: { confirm: '¿Estás seguro de borrar esta publicación?' } do
        icon('trash-o red-text')
    end
      end
    end
  end

  #buttons fror post
  def post_edit(post)
    if user_signed_in?
      if current_user.id == post.profile.user_id
        return link_to edit_post_path(post) do
           icon('pencil-square-o') 
         end
     end
  end
end

end

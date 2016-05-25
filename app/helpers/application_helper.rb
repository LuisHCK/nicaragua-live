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
end

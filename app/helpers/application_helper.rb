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
end

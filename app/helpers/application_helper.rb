module ApplicationHelper

  def admin_user?(user)
    user_signed_in? && current_user.admin_flg == true
  end

  def is_your_article?(article, user)
    article.user_id == current_user.id
  end

  require "redcarpet"
  require "coderay"

  class HTMLwithCoderay < Redcarpet::Render::HTML
    def block_code(code, language)
      language = language.split(':')[0]
      case language.to_s
      when 'rb'
        lang = 'ruby'
      when 'yml'
        lang = 'yaml'
      when 'css'
        lang = 'css'
      when 'html'
        lang = 'html'
      when ''
        lang = 'md'
      else
        lang = language
      end
      CodeRay.scan(code, lang).div
    end
  end

  def markdown(text)
    html_render = HTMLwithCoderay.new(filter_html: true, hard_wrap: true)
    options = {
      autolink: true,
      space_after_headers: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      tables: true,
      hard_wrap: true,
      xhtml: true,
      lax_html_blocks: true,
      strikethrough: true
      }
    markdown = Redcarpet::Markdown.new(html_render, options)
    markdown.render(text)
  end

  def default_meta_tags
    {
      site: 'SUCLE',
      title: 'SUCLE TOP',
      reverse: true,
      charset: 'utf-8',
      description: '女子の生活をもっと豊かにをコンセプトに恋愛、ファション、グルメ、メイク、コスメ、ライフスタイルを中心に記事を集めたwebメディアSUCLEです。インスア映えする写真や恋愛のノウハウなど女子がかわいい、知りたいと思う記事を更新しています。',
      keywords: ['恋愛', 'ファッション', 'メイク・コスメ'],
      canonical: request.original_url,
      separator: '|',
      icon: { href: image_url('cherry.png') },
      og: {
        site_name: 'SUCLE',
        title: 'SUCLE',
        description: 'description',
        type: 'website',
        url: request.original_url,
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary',
        site: ''
      }
    }
  end
end

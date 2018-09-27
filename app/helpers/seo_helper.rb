module SeoHelper
  def title
    content_tag :title do
      [content_for(:page_title), 'Mindful Life Therapy'].reject(&:blank?).join(' | ')
    end
  end

  def meta_description description
    "<meta name='description' content='#{description}' />".html_safe if description.present?
  end

  def canonical_link url
    "<link rel='canonical' href='#{url}' />".html_safe if url.present?
  end

  def no_index no_index
    if no_index.present?
      "<meta name='robots' content='noindex, follow' />".html_safe
    end
  end
end

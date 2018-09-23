module SeoHelper
  def title
    content_tag :title do
      [content_for(:page_title), 'Mindful Life Therapy'].reject(&:blank?).join(' | ')
    end
  end

  def meta_description(meta_description)
    if meta_description.present?
      "<meta name='description' content='#{meta_description}' />".html_safe
    end
  end

  def canonical_link(canonical_url)
    if canonical_url.present?
      "<link rel='canonical' href='#{canonical_url}' />".html_safe
    end
  end

  def no_index(no_index)
    if no_index.present?
      "<meta name='robots' content='noindex, follow' />".html_safe
    end
  end
end

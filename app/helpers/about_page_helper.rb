module AboutPageHelper

  def about_page_image image
    if image.attached?
      responsive_image_tag about_page_large_screen_variant_of(image),
        about_page_medium_screen_variant_of(image),
        about_page_small_screen_variant_of(image),
        about_page_image_title
    else
      about_page_fallback_image
    end
  end

  def about_page_fallback_image
    image_tag 'about/zoe-zalavary-psychotherapist-mindful-life-therapy-glasgow.jpg',
      title: about_page_image_title,
      alt: about_page_image_title,
      class: default_image_css
  end

  def about_page_image_title
    t('zoe.image.caption')
  end

  def about_page_small_screen_variant_of image
    image.variant(resize: '640').processed.service_url
  end

  def about_page_medium_screen_variant_of image
    image.variant(resize: '210').processed.service_url
  end

  def about_page_large_screen_variant_of image
    image.variant(resize: '188')
  end
end

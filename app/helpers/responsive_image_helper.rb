module ResponsiveImageHelper
  def responsive_image_tag large, medium, small, title
    image_tag large,
      srcset: { small => '640w', medium => '1024' },
      sizes: "100vw",
      title: title,
      alt: title,
      class: default_image_css
  end

  def default_image_css
    'full-width border-radius'
  end
end

json.array!(@styles) do |style|
  json.extract! style, :id, :layout, :header_image, :color_theme
  json.url style_url(style, format: :json)
end
